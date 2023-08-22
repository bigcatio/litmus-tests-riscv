static void ass(FILE *out) {
  fprintf(out,"%s\n","#START _litmus_P1");
  fprintf(out,"%s\n","	sw a1,0(a5)");
  fprintf(out,"%s\n","	sw a6,0(a5)");
  fprintf(out,"%s\n","	lw s2,0(a4)");
  fprintf(out,"%s\n","	xor t0,s2,s2");
  fprintf(out,"%s\n","	add t6,a2,t0");
  fprintf(out,"%s\n","	lw a7,0(t6)");
  fprintf(out,"%s\n","#START _litmus_P0");
  fprintf(out,"%s\n","	sw a0,0(a5)");
  fprintf(out,"%s\n","	lw a1,0(a4)");
}
