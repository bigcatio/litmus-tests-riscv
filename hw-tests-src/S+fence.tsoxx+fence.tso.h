static void ass(FILE *out) {
  fprintf(out,"%s\n","#START _litmus_P1");
  fprintf(out,"%s\n","	lw a1,0(a5)");
  fprintf(out,"%s\n","	fence.tso");
  fprintf(out,"%s\n","	sw a0,0(a4)");
  fprintf(out,"%s\n","#START _litmus_P0");
  fprintf(out,"%s\n","	lr.w ra,0(a5)");
  fprintf(out,"%s\n","	sc.w s1,a0,0(a5)");
  fprintf(out,"%s\n","	fence.tso");
  fprintf(out,"%s\n","	lr.w s2,0(a3)");
  fprintf(out,"%s\n","	sc.w s3,a2,0(a3)");
}
