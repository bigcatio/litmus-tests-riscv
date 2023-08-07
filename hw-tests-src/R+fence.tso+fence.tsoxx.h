static void ass(FILE *out) {
  fprintf(out,"%s\n","#START _litmus_P1");
  fprintf(out,"%s\n","	lr.w ra,0(a5)");
  fprintf(out,"%s\n","	sc.w s1,a1,0(a5)");
  fprintf(out,"%s\n","	fence.tso");
  fprintf(out,"%s\n","	lr.w s2,0(a3)");
  fprintf(out,"%s\n","	sc.w s3,s2,0(a3)");
  fprintf(out,"%s\n","#START _litmus_P0");
  fprintf(out,"%s\n","	sw a1,0(a5)");
  fprintf(out,"%s\n","	fence.tso");
  fprintf(out,"%s\n","	sw a1,0(a4)");
}
