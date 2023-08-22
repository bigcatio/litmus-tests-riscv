static void ass(FILE *out) {
  fprintf(out,"%s\n","#START _litmus_P1");
  fprintf(out,"%s\n","	lw ra,0(a5)");
  fprintf(out,"%s\n","	sw a1,0(a5)");
  fprintf(out,"%s\n","	lw s1,0(a5)");
  fprintf(out,"%s\n","	xor a7,s1,s1");
  fprintf(out,"%s\n","	add a6,a3,a7");
  fprintf(out,"%s\n","	lw s2,0(a6)");
  fprintf(out,"%s\n","	sw a2,0(a3)");
  fprintf(out,"%s\n","	lw s3,0(a3)");
  fprintf(out,"%s\n","#START _litmus_P0");
  fprintf(out,"%s\n","	sw t1,0(a5)");
  fprintf(out,"%s\n","	fence rw,rw");
  fprintf(out,"%s\n","	sw a1,0(a4)");
}
