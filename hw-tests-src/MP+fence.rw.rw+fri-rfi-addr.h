static void ass(FILE *out) {
  fprintf(out,"%s\n","#START _litmus_P1");
  fprintf(out,"%s\n","	lw a6,0(a5)");
  fprintf(out,"%s\n","	sw a2,0(a5)");
  fprintf(out,"%s\n","	lw ra,0(a5)");
  fprintf(out,"%s\n","	xor s2,ra,ra");
  fprintf(out,"%s\n","	add a0,a3,s2");
  fprintf(out,"%s\n","	lw s1,0(a0)");
  fprintf(out,"%s\n","#START _litmus_P0");
  fprintf(out,"%s\n","	sw a1,0(a5)");
  fprintf(out,"%s\n","	fence rw,rw");
  fprintf(out,"%s\n","	sw a1,0(a4)");
}
