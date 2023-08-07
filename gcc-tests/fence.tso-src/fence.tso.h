static void ass(FILE *out) {
  fprintf(out,"%s\n","#START _litmus_P0");
  fprintf(out,"%s\n","	fence.tso");
}
