static void ass(FILE *out) {
  fprintf(out,"%s\n","#START _litmus_P1");
  fprintf(out,"%s\n","	sw a1,0(a5)");
  fprintf(out,"%s\n","	fence.tso");
  fprintf(out,"%s\n","	lr.w a0,0(a4)");
  fprintf(out,"%s\n","	sc.w a6,a0,0(a4)");
  fprintf(out,"%s\n","#START _litmus_P0");
  fprintf(out,"%s\n","	sw a1,0(a5)");
  fprintf(out,"%s\n","	fence.tso");
  fprintf(out,"%s\n","	lr.w a0,0(a4)");
  fprintf(out,"%s\n","	sc.w a6,a1,0(a4)");
}
