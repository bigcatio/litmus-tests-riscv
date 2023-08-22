static void ass(FILE *out) {
  fprintf(out,"%s\n","#START _litmus_P1");
  fprintf(out,"%s\n","	sw a0,0(a5)");
  fprintf(out,"%s\n","	lw s2,0(a4)");
  fprintf(out,"%s\n","	xor t6,s2,s2");
  fprintf(out,"%s\n","	add t5,a2,t6");
  fprintf(out,"%s\n","	lw a6,0(t5)");
  fprintf(out,"%s\n","#START _litmus_P0");
  fprintf(out,"%s\n","	sw a1,0(a5)");
  fprintf(out,"%s\n","	fence rw,rw");
  fprintf(out,"%s\n","	sw a1,0(a4)");
}
