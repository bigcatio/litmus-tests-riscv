static void ass(FILE *out) {
  fprintf(out,"%s\n","#START _litmus_P1");
  fprintf(out,"%s\n","	lw a7,0(a5)");
  fprintf(out,"%s\n","	xor s3,a7,a7");
  fprintf(out,"%s\n","	ori s3,s3,1");
  fprintf(out,"%s\n","	sw s3,0(a3)");
  fprintf(out,"%s\n","	sw a0,0(a3)");
  fprintf(out,"%s\n","	lw ra,0(a3)");
  fprintf(out,"%s\n","	xor s2,ra,ra");
  fprintf(out,"%s\n","	add s1,a2,s2");
  fprintf(out,"%s\n","	sw a1,0(s1)");
  fprintf(out,"%s\n","#START _litmus_P0");
  fprintf(out,"%s\n","	lw a1,0(a5)");
  fprintf(out,"%s\n","	fence rw,rw");
  fprintf(out,"%s\n","	sw a0,0(a4)");
}
