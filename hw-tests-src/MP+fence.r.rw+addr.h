static void ass(FILE *out) {
  fprintf(out,"%s\n","#START _litmus_P1");
  fprintf(out,"%s\n","	lw a1,0(a5)");
  fprintf(out,"%s\n","	xor s1,a1,a1");
  fprintf(out,"%s\n","	add t4,a4,s1");
  fprintf(out,"%s\n","	lw a0,0(t4)");
  fprintf(out,"%s\n","#START _litmus_P0");
  fprintf(out,"%s\n","	sw a1,0(a5)");
  fprintf(out,"%s\n","	fence r,rw");
  fprintf(out,"%s\n","	sw a1,0(a4)");
}
