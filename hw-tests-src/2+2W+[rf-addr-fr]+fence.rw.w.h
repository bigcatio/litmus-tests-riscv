static void ass(FILE *out) {
  fprintf(out,"%s\n","#START _litmus_P2");
  fprintf(out,"%s\n","	sw t1,0(a5)");
  fprintf(out,"%s\n","	fence rw,w");
  fprintf(out,"%s\n","	sw a1,0(a4)");
  fprintf(out,"%s\n","#START _litmus_P1");
  fprintf(out,"%s\n","	lw a1,0(a5)");
  fprintf(out,"%s\n","	xor s1,a1,a1");
  fprintf(out,"%s\n","	add t5,a4,s1");
  fprintf(out,"%s\n","	lw a0,0(t5)");
  fprintf(out,"%s\n","#START _litmus_P0");
  fprintf(out,"%s\n","	sw t1,0(a5)");
  fprintf(out,"%s\n","	sw a1,0(a4)");
}
