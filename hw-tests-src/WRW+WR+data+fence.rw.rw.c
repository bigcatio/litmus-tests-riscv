/****************************************************************************/
/*                           the diy toolsuite                              */
/*                                                                          */
/* Jade Alglave, University College London, UK.                             */
/* Luc Maranget, INRIA Paris-Rocquencourt, France.                          */
/*                                                                          */
/* This C source is a product of litmus7 and includes source that is        */
/* governed by the CeCILL-B license.                                        */
/****************************************************************************/
/* Parameters */
#define SIZE_OF_TEST 100
#define NUMBER_OF_RUN 10
#define AVAIL 4
#define STRIDE 1
#define MAX_LOOP 0
#define N 3
#define AFF_INCR (1)
/* Includes */
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include <assert.h>
#include <time.h>
#include <limits.h>
#include <string.h>
#include "utils.h"
#include "outs.h"
#include "affinity.h"

/* params */
typedef struct {
  int verbose;
  int size_of_test,max_run;
  int stride;
  aff_mode_t aff_mode;
  int ncpus, ncpus_used;
  int do_change;
  cpus_t *cm;
} param_t;



/* Full memory barrier */

inline static void mbar(void) {
  asm __volatile__ ("fence rw,rw" ::: "memory");
}

/* Barriers macros */
inline static void barrier_wait(unsigned int id, unsigned int k, int volatile *b) {
  if ((k % N) == id) {
    *b = 1 ;
    mbar();
  } else {
    while (*b == 0) ;
  }
}

/*
 Topology: {{{0, 1}, {2, 3}}}
*/

static int cpu_scan[] = {
// [[1,2],[0]]
0, 2, 3,
// [[0,2],[1]]
2, 0, 3,
// [[0,1],[2]]
0, 1, 2,
};

static const char *group[] = {
"[[1,2],[0]]",
"[[0,2],[1]]",
"[[0,1],[2]]",
};

#define SCANSZ 3
#define SCANLINE 3

static count_t ngroups[SCANSZ];

/**********************/
/* Context definition */
/**********************/


typedef struct {
/* Shared variables */
  int *y;
  int *x;
/* Final content of observed  registers */
  int *out_1_x5;
  int *out_2_x7;
/* Check data */
  pb_t *fst_barrier;
  po_t *s_or;
  int* cpy_y[N] ;
/* Barrier for litmus loop */
  int volatile *barrier;
/* Instance seed */
  st_t seed;
/* Parameters */
  param_t *_p;
} ctx_t;

inline static int final_cond(int _out_1_x5,int _out_2_x7,int _y) {
  switch (_out_1_x5) {
  case 1:
    switch (_out_2_x7) {
    case 0:
      switch (_y) {
      case 2:
        return 1;
      default:
        return 0;
      }
    default:
      return 0;
    }
  default:
    return 0;
  }
}

inline static int final_ok(int cond) {
  return cond;
}

/**********************/
/* Outcome collection */
/**********************/
#define NOUTS 3
typedef intmax_t outcome_t[NOUTS];

static const int out_1_x5_f = 0 ;
static const int out_2_x7_f = 1 ;
static const int y_f = 2 ;


typedef struct hist_t {
  outs_t *outcomes ;
  count_t n_pos,n_neg ;
} hist_t ;

static hist_t *alloc_hist(void) {
  hist_t *p = malloc_check(sizeof(*p)) ;
  p->outcomes = NULL ;
  p->n_pos = p->n_neg = 0 ;
  return p ;
}

static void free_hist(hist_t *h) {
  free_outs(h->outcomes) ;
  free(h) ;
}

static void add_outcome(hist_t *h, count_t v, outcome_t o, int show) {
  h->outcomes = add_outcome_outs(h->outcomes,o,NOUTS,v,show) ;
}

static void merge_hists(hist_t *h0, hist_t *h1) {
  h0->n_pos += h1->n_pos ;
  h0->n_neg += h1->n_neg ;
  h0->outcomes = merge_outs(h0->outcomes,h1->outcomes,NOUTS) ;
}


static void do_dump_outcome(FILE *fhist, intmax_t *o, count_t c, int show) {
  fprintf(fhist,"%-6"PCTR"%c>1:x5=%d; 2:x7=%d; [y]=%d;\n",c,show ? '*' : ':',(int)o[out_1_x5_f],(int)o[out_2_x7_f],(int)o[y_f]);
}

static void just_dump_outcomes(FILE *fhist, hist_t *h) {
  outcome_t buff ;
  dump_outs(fhist,do_dump_outcome,h->outcomes,buff,NOUTS) ;
}

/**************************************/
/* Prefetch (and check) global values */
/**************************************/

static void check_globals(ctx_t *_a) {
  int *y = _a->y;
  int *x = _a->x;
  for (int _i = _a->_p->size_of_test-1 ; _i >= 0 ; _i--) {
    if (rand_bit(&(_a->seed)) && y[_i] != 0) fatal("WRW+WR+data+fence.rw.rw, check_globals failed");
    if (rand_bit(&(_a->seed)) && x[_i] != 0) fatal("WRW+WR+data+fence.rw.rw, check_globals failed");
  }
  pb_wait(_a->fst_barrier);
}


static void stabilize_globals(int _id, ctx_t *_a) {
  int size_of_test = _a->_p->size_of_test;

  int *y = _a->y;
  int **cpy_y = _a->cpy_y;

  pb_wait(_a->fst_barrier);
  for ( ; ; ) {
    for (int _i = size_of_test-1 ; _i >= 0 ; _i--) {
      cpy_y[_id][_i] = y[_i];
    }
    po_reinit(_a->s_or);
    int _found;
    int _nxt_id = (_id+1) % N;
    _found = 0;
    for (int _i = size_of_test-1 ; _i >= 0 && !_found ; _i--) {
      if (cpy_y[_id][_i] != cpy_y[_nxt_id][_i]) { _found = 1; }
    }
    if (_found) { log_error("%i: Stabilizing final state!\n",_id); }
    if (!po_wait(_a->s_or,_found)) return ;
  }
}

/***************/
/* Litmus code */
/***************/

typedef struct {
  int th_id; /* I am running on this thread */
  int *cpu; /* On this cpu */
  ctx_t *_a;   /* In this context */
} parg_t;

static void *P0(void *_vb) {
  mbar();
  parg_t *_b = (parg_t *)_vb;
  ctx_t *_a = _b->_a;
  int _ecpu = _b->cpu[_b->th_id];
  force_one_affinity(_ecpu,AVAIL,_a->_p->verbose,"WRW+WR+data+fence.rw.rw");
  check_globals(_a);
  int _th_id = _b->th_id;
  int volatile *barrier = _a->barrier;
  int _size_of_test = _a->_p->size_of_test;
  int _stride = _a->_p->stride;
  for (int _j = _stride ; _j > 0 ; _j--) {
    for (int _i = _size_of_test-_j ; _i >= 0 ; _i -= _stride) {
      barrier_wait(_th_id,_i,&barrier[_i]);
asm __volatile__ (
"\n"
"#START _litmus_P0\n"
"#_litmus_P0_0\n\t"
"sw %[x5],0(%[x6])\n"
"#END _litmus_P0\n"
:
:[x5] "r" ((int)(1)),[x6] "r" (&_a->x[_i])
:"cc","memory"
);
    }
  }
  stabilize_globals(0,_a);
  mbar();
  return NULL;
}

static void *P1(void *_vb) {
  mbar();
  parg_t *_b = (parg_t *)_vb;
  ctx_t *_a = _b->_a;
  int _ecpu = _b->cpu[_b->th_id];
  force_one_affinity(_ecpu,AVAIL,_a->_p->verbose,"WRW+WR+data+fence.rw.rw");
  check_globals(_a);
  int _th_id = _b->th_id;
  int volatile *barrier = _a->barrier;
  int _size_of_test = _a->_p->size_of_test;
  int _stride = _a->_p->stride;
  for (int _j = _stride ; _j > 0 ; _j--) {
    for (int _i = _size_of_test-_j ; _i >= 0 ; _i -= _stride) {
      barrier_wait(_th_id,_i,&barrier[_i]);
      int trashed_x7;
asm __volatile__ (
"\n"
"#START _litmus_P1\n"
"#_litmus_P1_0\n\t"
"lw %[x5],0(%[x6])\n"
"#_litmus_P1_1\n\t"
"xor %[x7],%[x5],%[x5]\n"
"#_litmus_P1_2\n\t"
"ori %[x7],%[x7],1\n"
"#_litmus_P1_3\n\t"
"sw %[x7],0(%[x8])\n"
"#END _litmus_P1\n"
:[x5] "=&r" (_a->out_1_x5[_i]),[x7] "=&r" (trashed_x7)
:[x6] "r" (&_a->x[_i]),[x8] "r" (&_a->y[_i])
:"cc","memory"
);
    }
  }
  stabilize_globals(1,_a);
  mbar();
  return NULL;
}

static void *P2(void *_vb) {
  mbar();
  parg_t *_b = (parg_t *)_vb;
  ctx_t *_a = _b->_a;
  int _ecpu = _b->cpu[_b->th_id];
  force_one_affinity(_ecpu,AVAIL,_a->_p->verbose,"WRW+WR+data+fence.rw.rw");
  check_globals(_a);
  int _th_id = _b->th_id;
  int volatile *barrier = _a->barrier;
  int _size_of_test = _a->_p->size_of_test;
  int _stride = _a->_p->stride;
  for (int _j = _stride ; _j > 0 ; _j--) {
    for (int _i = _size_of_test-_j ; _i >= 0 ; _i -= _stride) {
      barrier_wait(_th_id,_i,&barrier[_i]);
asm __volatile__ (
"\n"
"#START _litmus_P2\n"
"#_litmus_P2_0\n\t"
"sw %[x5],0(%[x6])\n"
"#_litmus_P2_1\n\t"
"fence rw,rw\n"
"#_litmus_P2_2\n\t"
"lw %[x7],0(%[x8])\n"
"#END _litmus_P2\n"
:[x7] "=&r" (_a->out_2_x7[_i])
:[x5] "r" ((int)(2)),[x6] "r" (&_a->y[_i]),[x8] "r" (&_a->x[_i])
:"cc","memory"
);
    }
  }
  stabilize_globals(2,_a);
  mbar();
  return NULL;
}

/*******************************************************/
/* Context allocation, freeing and reinitialization    */
/*******************************************************/

static void init_getinstrs(void) {
}

static void init(ctx_t *_a) {
  int size_of_test = _a->_p->size_of_test;

  _a->seed = rand();
  _a->out_1_x5 = malloc_check(size_of_test*sizeof(*(_a->out_1_x5)));
  _a->out_2_x7 = malloc_check(size_of_test*sizeof(*(_a->out_2_x7)));
  _a->y = malloc_check(size_of_test*sizeof(*(_a->y)));
  _a->x = malloc_check(size_of_test*sizeof(*(_a->x)));
  _a->fst_barrier = pb_create(N);
  _a->s_or = po_create(N);
  for (int _p = N-1 ; _p >= 0 ; _p--) {
    _a->cpy_y[_p] = malloc_check(size_of_test*sizeof(*(_a->cpy_y[_p])));
  }
  _a->barrier = malloc_check(size_of_test*sizeof(*(_a->barrier)));
}

static void finalize(ctx_t *_a) {
  free((void *)_a->y);
  free((void *)_a->x);
  free((void *)_a->out_1_x5);
  free((void *)_a->out_2_x7);
  pb_free(_a->fst_barrier);
  po_free(_a->s_or);
  for (int _p = N-1 ; _p >= 0 ; _p--) {
    free((void *)_a->cpy_y[_p]);
  }
  free((void *)_a->barrier);
}

static void reinit(ctx_t *_a) {
  for (int _i = _a->_p->size_of_test-1 ; _i >= 0 ; _i--) {
    _a->y[_i] = 0;
    _a->x[_i] = 0;
    _a->out_1_x5[_i] = -239487;
    _a->out_2_x7[_i] = -239487;
    _a->barrier[_i] = 0;
  }
}

typedef struct {
  pm_t *p_mutex;
  pb_t *p_barrier;
  param_t *_p;
  int z_id;
  int *cpus;
} zyva_t;

#define NT N

static void *zyva(void *_va) {
  zyva_t *_a = (zyva_t *) _va;
  param_t *_b = _a->_p;
  pb_wait(_a->p_barrier);
  pthread_t thread[NT];
  parg_t parg[N];
  f_t *fun[] = {&P0,&P1,&P2};
  hist_t *hist = alloc_hist();
  ctx_t ctx;
  ctx._p = _b;

  init(&ctx);
  for (int _p = N-1 ; _p >= 0 ; _p--) {
    parg[_p].th_id = _p; parg[_p]._a = &ctx;
    parg[_p].cpu = &(_a->cpus[0]);
  }

  for (int n_run = 0 ; n_run < _b->max_run ; n_run++) {
    if (_b->aff_mode == aff_random) {
      pb_wait(_a->p_barrier);
      if (_a->z_id == 0) perm_prefix_ints(&ctx.seed,_a->cpus,_b->ncpus_used,_b->ncpus);
      pb_wait(_a->p_barrier);
    } else if (_b->aff_mode == aff_scan) {
      pb_wait(_a->p_barrier);
      int idx_scan = n_run % SCANSZ;
      int *from =  &cpu_scan[SCANLINE*idx_scan];
      from += N*_a->z_id;
      for (int k = 0 ; k < N ; k++) _a->cpus[k] = from[k];
      pb_wait(_a->p_barrier);
    } else {
    }
    if (_b->verbose>1) fprintf(stderr,"Run %i of %i\r", n_run, _b->max_run);
    reinit(&ctx);
    if (_b->do_change) perm_funs(&ctx.seed,fun,N);
    for (int _p = NT-1 ; _p >= 0 ; _p--) {
      launch(&thread[_p],fun[_p],&parg[_p]);
    }
    if (_b->do_change) perm_threads(&ctx.seed,thread,NT);
    for (int _p = NT-1 ; _p >= 0 ; _p--) {
      join(&thread[_p]);
    }
    /* Log final states */
    for (int _i = _b->size_of_test-1 ; _i >= 0 ; _i--) {
      int _out_1_x5_i = ctx.out_1_x5[_i];
      int _out_2_x7_i = ctx.out_2_x7[_i];
      int _y_i = ctx.y[_i];
      outcome_t o;
      int cond;

      for (int _p = N-1 ; _p >= 0 ; _p--) {
        if (_y_i != ctx.cpy_y[_p][_i]) fatal("WRW+WR+data+fence.rw.rw, global y unstabilized") ;
      }
      cond = final_ok(final_cond(_out_1_x5_i,_out_2_x7_i,_y_i));
      o[out_1_x5_f] = _out_1_x5_i;
      o[out_2_x7_f] = _out_2_x7_i;
      o[y_f] = _y_i;
      add_outcome(hist,1,o,cond);
      if (_b->aff_mode == aff_scan && _a->cpus[0] >= 0 && cond) {
        pm_lock(_a->p_mutex);
        ngroups[n_run % SCANSZ]++;
        pm_unlock(_a->p_mutex);
      } else if (_b->aff_mode == aff_topo && _a->cpus[0] >= 0 && cond) {
        pm_lock(_a->p_mutex);
        ngroups[0]++;
        pm_unlock(_a->p_mutex);
      }
      if (cond) { hist->n_pos++; } else { hist->n_neg++; }
    }
  }

  finalize(&ctx);
  return hist;
}

#ifdef ASS
static void ass(FILE *out) { }
#else
#include "WRW+WR+data+fence.rw.rw.h"
#endif

static void prelude(FILE *out) {
  fprintf(out,"%s\n","%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
  fprintf(out,"%s\n","% Results for tests/non-mixed-size/SAFE/WRW+WR+data+fence.rw.rw.litmus %");
  fprintf(out,"%s\n","%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
  fprintf(out,"%s\n","RISCV WRW+WR+data+fence.rw.rw");
  fprintf(out,"%s\n","\"Rfe DpDatadW Wse Fence.rw.rwdWR Fre\"");
  fprintf(out,"%s\n","{");
  fprintf(out,"%s\n"," 0:x5=1; 0:x6=x;");
  fprintf(out,"%s\n"," 1:x6=x; 1:x8=y;");
  fprintf(out,"%s\n"," 2:x5=2; 2:x6=y; 2:x8=x;");
  fprintf(out,"%s\n","}");
  fprintf(out,"%s\n"," P0          | P1           | P2          ;");
  fprintf(out,"%s\n"," sw x5,0(x6) | lw x5,0(x6)  | sw x5,0(x6) ;");
  fprintf(out,"%s\n","             | xor x7,x5,x5 | fence rw,rw ;");
  fprintf(out,"%s\n","             | ori x7,x7,1  | lw x7,0(x8) ;");
  fprintf(out,"%s\n","             | sw x7,0(x8)  |             ;");
  fprintf(out,"%s\n","");
  fprintf(out,"%s\n","exists ([y]=2 /\\ 1:x5=1 /\\ 2:x7=0)");
  fprintf(out,"%s\n","Generated assembler");
  ass(out);
}

static int color_0[] = {0, 1, -1};
static int color_1[] = {2, -1};
static int *color[] = {color_0, color_1, NULL};
static int diff[] = {2, 0, -1};

#define ENOUGH 10

static void postlude(FILE *out,cmd_t *cmd,hist_t *hist,count_t p_true,count_t p_false,tsc_t total) {
  fprintf(out,"Test WRW+WR+data+fence.rw.rw Allowed\n");
  fprintf(out,"Histogram (%d states)\n",finals_outs(hist->outcomes));
  just_dump_outcomes(out,hist);
  int cond = p_true > 0;
  fprintf(out,"%s\n",cond?"Ok":"No");
  fprintf(out,"\nWitnesses\n");
  fprintf(out,"Positive: %" PCTR ", Negative: %" PCTR "\n",p_true,p_false);
  fprintf(out,"Condition %s is %svalidated\n","exists ([y]=2 /\\ 1:x5=1 /\\ 2:x7=0)",cond ? "" : "NOT ");
  fprintf(out,"Hash=3f9e627fb9e66da8da29b76d470a6d4c\n");
  fprintf(out,"Cycle=Rfe DpDatadW Wse Fence.rw.rwdWR Fre\n");
  fprintf(out,"Relax WRW+WR+data+fence.rw.rw %s %s\n",p_true > 0 ? "Ok" : "No","");
  fprintf(out,"Safe=Rfe Fre Wse Fence.rw.rwdWR DpDatadW\n");
  fprintf(out,"Generator=diy7 (version 7.51+4(dev))\n");
  fprintf(out,"Com=Rf Ws Fr\n");
  fprintf(out,"Orig=Rfe DpDatadW Wse Fence.rw.rwdWR Fre\n");
  if (cmd->aff_mode == aff_custom) {
    fprintf(out,"Affinity=[0, 1] [2] ; (2,0)\n");
  }
  count_t cond_true = p_true;
  count_t cond_false = p_false;
  fprintf(out,"Observation WRW+WR+data+fence.rw.rw %s %" PCTR " %" PCTR "\n",!cond_true ? "Never" : !cond_false ? "Always" : "Sometimes",cond_true,cond_false);
  fprintf(out,"Time WRW+WR+data+fence.rw.rw %.2f\n",total / 1000000.0);
  fflush(out);
}

static void run(cmd_t *cmd,cpus_t *def_all_cpus,FILE *out) {
  if (cmd->prelude) prelude(out);
  tsc_t start = timeofday();
  init_getinstrs();
  param_t prm ;
/* Set some parameters */
  prm.verbose = cmd->verbose;
  prm.size_of_test = cmd->size_of_test;
  prm.max_run = cmd->max_run;
  prm.stride = cmd->stride > 0 ? cmd->stride : N ;
  int ntopo = -1;
  if (cmd->aff_mode == aff_topo) {
    ntopo = find_string(group,SCANSZ,cmd->aff_topo);
    if (ntopo < 0) {
      log_error("Bad topology %s, reverting to scan affinity\n",cmd->aff_topo);
      cmd->aff_mode = aff_scan; cmd->aff_topo = NULL;
    }
  }
  prm.do_change = cmd->aff_mode != aff_custom && cmd->aff_mode != aff_scan && cmd->aff_mode != aff_topo;
  if (cmd->fix) prm.do_change = 0;
  prm.cm = coremap_seq(def_all_cpus->sz,2);
/* Computes number of test concurrent instances */
  int n_avail = cmd->avail > 0 ? cmd->avail : cmd->aff_cpus->sz;
  if (n_avail >  cmd->aff_cpus->sz) log_error("Warning: avail=%i, available=%i\n",n_avail, cmd->aff_cpus->sz);
  int n_exe;
  if (cmd->n_exe > 0) {
    n_exe = cmd->n_exe;
  } else {
    n_exe = n_avail < N ? 1 : n_avail / N;
  }
/* Set affinity parameters */
  cpus_t *all_cpus = cmd->aff_cpus;
  int aff_cpus_sz = cmd->aff_mode == aff_random ? max(all_cpus->sz,N*n_exe) : N*n_exe;
  int aff_cpus[aff_cpus_sz];
  prm.aff_mode = cmd->aff_mode;
  prm.ncpus = aff_cpus_sz;
  prm.ncpus_used = N*n_exe;
/* Show parameters to user */
  if (prm.verbose) {
    log_error( "WRW+WR+data+fence.rw.rw: n=%i, r=%i, s=%i",n_exe,prm.max_run,prm.size_of_test);
    log_error(", st=%i",prm.stride);
    if (cmd->aff_mode == aff_incr) {
      log_error( ", i=%i",cmd->aff_incr);
    } else if (cmd->aff_mode == aff_random) {
      log_error(", +ra");
    } else if (cmd->aff_mode == aff_custom) {
      log_error(", +ca");
    } else if (cmd->aff_mode == aff_scan) {
      log_error(", +sa");
    }
    log_error(", p='");
    cpus_dump(stderr,cmd->aff_cpus);
    log_error("'");
    log_error("\n");
    if (prm.verbose > 1 && prm.cm) {
      log_error("logical proc -> core: ");
      cpus_dump(stderr,prm.cm);
      log_error("\n");
    }
  }
  if (cmd->aff_mode == aff_random) {
    for (int k = 0 ; k < aff_cpus_sz ; k++) {
      aff_cpus[k] = all_cpus->cpu[k % all_cpus->sz];
    }
  } else if (cmd->aff_mode == aff_custom) {
    st_t seed = 0;
    custom_affinity(&seed,prm.cm,color,diff,all_cpus,n_exe,aff_cpus);
    if (prm.verbose) {
      log_error("thread allocation: \n");
      cpus_dump_test(stderr,aff_cpus,aff_cpus_sz,prm.cm,N);
    }
  } else if (cmd->aff_mode == aff_topo) {
    int *from = &cpu_scan[ntopo * SCANLINE];
    for (int k = 0 ; k < aff_cpus_sz ; k++) {
      aff_cpus[k] = *from++;
    }
  }
  hist_t *hist = NULL;
  int n_th = n_exe-1;
  pthread_t th[n_th];
  zyva_t zarg[n_exe];
  pm_t *p_mutex = pm_create();
  pb_t *p_barrier = pb_create(n_exe);
  int next_cpu = 0;
  int delta = cmd->aff_incr;
  if (delta <= 0) {
    for (int k=0 ; k < all_cpus->sz ; k++) all_cpus->cpu[k] = -1;
    delta = 1;
  } else {
    delta %= all_cpus->sz;
  }
  int start_scan=0, max_start=gcd(delta,all_cpus->sz);
  int *aff_p = aff_cpus;
  for (int k=0 ; k < n_exe ; k++) {
    zyva_t *p = &zarg[k];
    p->_p = &prm;
    p->p_mutex = p_mutex; p->p_barrier = p_barrier;
    p->z_id = k;
    p->cpus = aff_p;
    if (cmd->aff_mode != aff_incr) {
      aff_p += N;
    } else {
      for (int i=0 ; i < N ; i++) {
        *aff_p = all_cpus->cpu[next_cpu]; aff_p++;
        next_cpu += delta; next_cpu %= all_cpus->sz;
        if (next_cpu == start_scan) {
          start_scan++ ; start_scan %= max_start;
          next_cpu = start_scan;
        }
      }
    }
    if (k < n_th) {
      launch(&th[k],zyva,p);
    } else {
      hist = (hist_t *)zyva(p);
    }
  }

  count_t n_outs = prm.size_of_test; n_outs *= prm.max_run;
  for (int k=0 ; k < n_th ; k++) {
    hist_t *hk = (hist_t *)join(&th[k]);
    if (sum_outs(hk->outcomes) != n_outs || hk->n_pos + hk->n_neg != n_outs) {
      fatal("WRW+WR+data+fence.rw.rw, sum_hist");
    }
    merge_hists(hist,hk);
    free_hist(hk);
  }
  cpus_free(all_cpus);
  tsc_t total = timeofday() - start;
  pm_free(p_mutex);
  pb_free(p_barrier);

  n_outs *= n_exe ;
  if (sum_outs(hist->outcomes) != n_outs || hist->n_pos + hist->n_neg != n_outs) {
    fatal("WRW+WR+data+fence.rw.rw, sum_hist") ;
  }
  count_t p_true = hist->n_pos, p_false = hist->n_neg;
  postlude(out,cmd,hist,p_true,p_false,total);
  free_hist(hist);
  cpus_free(prm.cm);
}


int WRW_2B_WR_2B_data_2B_fence_2E_rw_2E_rw(int argc, char **argv, FILE *out) {
  cpus_t *def_all_cpus = read_force_affinity(AVAIL,0);
  if (def_all_cpus->sz < N) {
    cpus_free(def_all_cpus);
    return EXIT_SUCCESS;
  }
  cmd_t def = { 0, NUMBER_OF_RUN, SIZE_OF_TEST, STRIDE, AVAIL, 0, 0, aff_incr, 1, 1, AFF_INCR, def_all_cpus, NULL, -1, MAX_LOOP, NULL, NULL, -1, -1, -1, 0, 1};
  cmd_t cmd = def;
  parse_cmd(argc,argv,&def,&cmd);
  run(&cmd,def_all_cpus,out);
  if (def_all_cpus != cmd.aff_cpus) cpus_free(def_all_cpus);
  return EXIT_SUCCESS;
}
