static void ass(FILE *out) {
  fprintf(out,"%s\n","#START _litmus_P0");
  fprintf(out,"%s\n","	lr.w.aqrl a4,0(a5)");
}
