static void ass(FILE *out) {
  fprintf(out,"%s\n","#START _litmus_P1");
  fprintf(out,"%s\n","	sw a0,0(a5)");
  fprintf(out,"%s\n","	lw a6,0(a5)");
  fprintf(out,"%s\n","	xor s1,a6,a6");
  fprintf(out,"%s\n","	add t6,a4,s1");
  fprintf(out,"%s\n","	sw a2,0(t6)");
  fprintf(out,"%s\n","	lw a7,0(a4)");
  fprintf(out,"%s\n","#START _litmus_P0");
  fprintf(out,"%s\n","	sw a0,0(a5)");
  fprintf(out,"%s\n","	lw a6,0(a5)");
  fprintf(out,"%s\n","	xor s1,a6,a6");
  fprintf(out,"%s\n","	add t6,a4,s1");
  fprintf(out,"%s\n","	sw a2,0(t6)");
  fprintf(out,"%s\n","	lw a7,0(a4)");
}
