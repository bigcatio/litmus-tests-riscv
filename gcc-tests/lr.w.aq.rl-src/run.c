#include <stdlib.h>
#include <stdio.h>

/* Declarations of tests entry points */
extern int lr_2E_w_2E_aq_2E_rl(int argc,char **argv,FILE *out);

/* Date function */
#include <time.h>
static void my_date(FILE *out) {
  time_t t = time(NULL);
  fprintf(out,"%s",ctime(&t));
}

/* Postlude */
static void end_report(int argc,char **argv,FILE *out) {
  fprintf(out,"%s\n","Revision exported, version 7.56+03");
  fprintf(out,"%s\n","Command line: litmus7 -mach ./riscv.cfg -avail 4 -o gcc-tests/lr.w.aq.rl-src tests/non-mixed-size/SINGLE_INST/lr.w.aq.rl.litmus");
  fprintf(out,"%s\n","Parameters");
  fprintf(out,"%s\n","#define SIZE_OF_TEST 100");
  fprintf(out,"%s\n","#define NUMBER_OF_RUN 10");
  fprintf(out,"%s\n","#define AVAIL 4");
  fprintf(out,"%s\n","#define STRIDE 1");
  fprintf(out,"%s\n","#define MAX_LOOP 0");
  fprintf(out,"%s\n","/* gcc options: -D_GNU_SOURCE -DFORCE_AFFINITY -Wall -std=gnu99 -O2 -pthread */");
  fprintf(out,"%s\n","/* gcc link options: -static */");
  fprintf(out,"%s\n","/* barrier: userfence */");
  fprintf(out,"%s\n","/* launch: changing */");
  fprintf(out,"%s\n","/* affinity: incr1 */");
  fprintf(out,"%s\n","/* memory: direct */");
  fprintf(out,"%s\n","/* stride: 1 */");
  fprintf(out,"%s\n","/* safer: write */");
  fprintf(out,"%s\n","/* preload: random */");
  fprintf(out,"%s\n","/* speedcheck: no */");
  fprintf(out,"%s\n","/* alloc: dynamic */");
  fprintf(out,"%s\n","/* proc used: 4 */");
/* Command line options */
  fprintf(out,"%s","Command:");
  for ( ; *argv ; argv++) {
    fprintf(out," %s",*argv);
  }
  fprintf(out,"%s","\n");
}

/* Run all tests */
static void run(int argc,char **argv,FILE *out) {
  my_date(out);
  lr_2E_w_2E_aq_2E_rl(argc,argv,out);
  end_report(argc,argv,out);
  my_date(out);
}

int main(int argc,char **argv) {
  run(argc,argv,stdout);
  return 0;
}
