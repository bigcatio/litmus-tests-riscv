static void ass(FILE *out) {
  fprintf(out,"%s\n","#START _litmus_P1");
  fprintf(out,"%s\n","	lw a6,0(a5)");
  fprintf(out,"%s\n","	sw a0,0(a5)");
  fprintf(out,"%s\n","	lw a7,0(a5)");
  fprintf(out,"%s\n","	xor s1,a7,a7");
  fprintf(out,"%s\n","	add t6,a4,s1");
  fprintf(out,"%s\n","	sw a2,0(t6)");
  fprintf(out,"%s\n","#START _litmus_P0");
  fprintf(out,"%s\n","	lw a0,0(a5)");
  fprintf(out,"%s\n","	xor t5,a0,a0");
  fprintf(out,"%s\n","	add t4,a4,t5");
  fprintf(out,"%s\n","	sw a1,0(t4)");
}
