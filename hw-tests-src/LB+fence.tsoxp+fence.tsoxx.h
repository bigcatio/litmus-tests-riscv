static void ass(FILE *out) {
  fprintf(out,"%s\n","#START _litmus_P1");
  fprintf(out,"%s\n","	lr.w t2,0(a5)");
  fprintf(out,"%s\n","	sc.w ra,t2,0(a5)");
  fprintf(out,"%s\n","	fence.tso");
  fprintf(out,"%s\n","	lr.w s1,0(a3)");
  fprintf(out,"%s\n","	sc.w s2,a2,0(a3)");
  fprintf(out,"%s\n","#START _litmus_P0");
  fprintf(out,"%s\n","	lr.w a0,0(a5)");
  fprintf(out,"%s\n","	sc.w a6,a0,0(a5)");
  fprintf(out,"%s\n","	fence.tso");
  fprintf(out,"%s\n","	sw a1,0(a4)");
}
