static void ass(FILE *out) {
  fprintf(out,"%s\n","#START _litmus_P1");
  fprintf(out,"%s\n","	lw t2,0(a5)");
  fprintf(out,"%s\n","	xor s4,t2,t2");
  fprintf(out,"%s\n","	add a6,a3,s4");
  fprintf(out,"%s\n","	lw s1,0(a6)");
  fprintf(out,"%s\n","	sw a1,0(a3)");
  fprintf(out,"%s\n","	lw s2,0(a3)");
  fprintf(out,"%s\n","	bne s2,x0,0f");
  fprintf(out,"%s\n","0:");
  fprintf(out,"%s\n","	lw s3,0(a2)");
  fprintf(out,"%s\n","#START _litmus_P0");
  fprintf(out,"%s\n","	sw a1,0(a5)");
  fprintf(out,"%s\n","	fence rw,rw");
  fprintf(out,"%s\n","	sw a1,0(a4)");
}
