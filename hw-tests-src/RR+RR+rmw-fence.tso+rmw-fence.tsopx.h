static void ass(FILE *out) {
  fprintf(out,"%s\n","#START _litmus_P1");
  fprintf(out,"%s\n","	amoswap.w a6,a0,(a5)");
  fprintf(out,"%s\n","	fence.tso");
  fprintf(out,"%s\n","	lr.w a7,0(a3)");
  fprintf(out,"%s\n","	sc.w ra,a7,0(a3)");
  fprintf(out,"%s\n","#START _litmus_P0");
  fprintf(out,"%s\n","	amoswap.w a0,a1,(a5)");
  fprintf(out,"%s\n","	fence.tso");
  fprintf(out,"%s\n","	lw a6,0(a4)");
}
