static void ass(FILE *out) {
  fprintf(out,"%s\n","#START _litmus_P1");
  fprintf(out,"%s\n","	lw a1,0(a5)");
  fprintf(out,"%s\n","	amoswap.w.rl x0,a0,(a4)");
  fprintf(out,"%s\n","#START _litmus_P0");
  fprintf(out,"%s\n","	amoswap.w.rl x0,t1,(a5)");
  fprintf(out,"%s\n","	amoswap.w.rl x0,a1,(a4)");
}
