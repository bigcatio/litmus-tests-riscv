static void ass(FILE *out) {
  fprintf(out,"%s\n","#START _litmus_P1");
  fprintf(out,"%s\n","	lw ra,0(a5)");
  fprintf(out,"%s\n","	sw a0,0(a5)");
  fprintf(out,"%s\n","	lw s1,0(a5)");
  fprintf(out,"%s\n","	bne s1,x0,0f");
  fprintf(out,"%s\n","0:");
  fprintf(out,"%s\n","	lw s2,0(a3)");
  fprintf(out,"%s\n","	sw a2,0(a3)");
  fprintf(out,"%s\n","	lw s3,0(a3)");
  fprintf(out,"%s\n","#START _litmus_P0");
  fprintf(out,"%s\n","	sw t1,0(a5)");
  fprintf(out,"%s\n","	fence rw,rw");
  fprintf(out,"%s\n","	sw a1,0(a4)");
}
