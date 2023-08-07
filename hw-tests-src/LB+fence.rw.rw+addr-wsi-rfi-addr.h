static void ass(FILE *out) {
  fprintf(out,"%s\n","#START _litmus_P1");
  fprintf(out,"%s\n","	lw a7,0(a5)");
  fprintf(out,"%s\n","	xor s4,a7,a7");
  fprintf(out,"%s\n","	add s3,a4,s4");
  fprintf(out,"%s\n","	sw a1,0(s3)");
  fprintf(out,"%s\n","	sw a0,0(a4)");
  fprintf(out,"%s\n","	lw ra,0(a4)");
  fprintf(out,"%s\n","	xor s2,ra,ra");
  fprintf(out,"%s\n","	add s1,a3,s2");
  fprintf(out,"%s\n","	sw a1,0(s1)");
  fprintf(out,"%s\n","#START _litmus_P0");
  fprintf(out,"%s\n","	lw a1,0(a5)");
  fprintf(out,"%s\n","	fence rw,rw");
  fprintf(out,"%s\n","	sw a0,0(a4)");
}
