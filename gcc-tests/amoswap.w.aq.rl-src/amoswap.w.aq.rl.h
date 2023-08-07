static void ass(FILE *out) {
  fprintf(out,"%s\n","#START _litmus_P0");
  fprintf(out,"%s\n","	amoswap.w.aqrl a4,a1,(a5)");
}
