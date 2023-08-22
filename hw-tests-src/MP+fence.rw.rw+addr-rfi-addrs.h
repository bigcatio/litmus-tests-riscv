static void ass(FILE *out) {
  fprintf(out,"%s\n","#START _litmus_P1");
  fprintf(out,"%s\n","	lw a6,0(a5)");
  fprintf(out,"%s\n","	xor s3,a6,a6");
  fprintf(out,"%s\n","	add s2,a4,s3");
  fprintf(out,"%s\n","	sw a2,0(s2)");
  fprintf(out,"%s\n","	lw a7,0(a4)");
  fprintf(out,"%s\n","	xor s1,a7,a7");
  fprintf(out,"%s\n","	add a0,a4,s1");
  fprintf(out,"%s\n","	lw ra,0(a0)");
  fprintf(out,"%s\n","#START _litmus_P0");
  fprintf(out,"%s\n","	sw t1,0(a5)");
  fprintf(out,"%s\n","	fence rw,rw");
  fprintf(out,"%s\n","	sw a1,0(a4)");
}
