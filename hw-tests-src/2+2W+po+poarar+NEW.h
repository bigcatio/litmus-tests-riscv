static void ass(FILE *out) {
  fprintf(out,"%s\n","#START _litmus_P1");
  fprintf(out,"%s\n","	amoswap.w.aqrl x0,t1,(a5)");
  fprintf(out,"%s\n","	amoswap.w.aqrl x0,a1,(a4)");
  fprintf(out,"%s\n","#START _litmus_P0");
  fprintf(out,"%s\n","	sw t1,0(a5)");
  fprintf(out,"%s\n","	sw a1,0(a4)");
}
