static void ass(FILE *out) {
  fprintf(out,"%s\n","#START _litmus_P1");
  fprintf(out,"%s\n","	lw a7,0(a5)");
  fprintf(out,"%s\n","	xor s3,a7,a7");
  fprintf(out,"%s\n","	add s2,a3,s3");
  fprintf(out,"%s\n","	sw a1,0(s2)");
  fprintf(out,"%s\n","	sw a0,0(a3)");
  fprintf(out,"%s\n","	lw ra,0(a3)");
  fprintf(out,"%s\n","	xor s1,ra,ra");
  fprintf(out,"%s\n","	ori s1,s1,1");
  fprintf(out,"%s\n","	sw s1,0(a2)");
  fprintf(out,"%s\n","#START _litmus_P0");
  fprintf(out,"%s\n","	lw a1,0(a5)");
  fprintf(out,"%s\n","	fence rw,rw");
  fprintf(out,"%s\n","	sw a0,0(a4)");
}
