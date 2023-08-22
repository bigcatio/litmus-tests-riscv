static void ass(FILE *out) {
  fprintf(out,"%s\n","#START _litmus_P1");
  fprintf(out,"%s\n","	lw a6,0(a5)");
  fprintf(out,"%s\n","	xor s2,a6,a6");
  fprintf(out,"%s\n","	add s1,a3,s2");
  fprintf(out,"%s\n","	sw a1,0(s1)");
  fprintf(out,"%s\n","	lw a7,0(a3)");
  fprintf(out,"%s\n","	xor ra,a7,a7");
  fprintf(out,"%s\n","	ori ra,ra,1");
  fprintf(out,"%s\n","	sw ra,0(a2)");
  fprintf(out,"%s\n","#START _litmus_P0");
  fprintf(out,"%s\n","	sw t1,0(a5)");
  fprintf(out,"%s\n","	fence w,w");
  fprintf(out,"%s\n","	sw a1,0(a4)");
}
