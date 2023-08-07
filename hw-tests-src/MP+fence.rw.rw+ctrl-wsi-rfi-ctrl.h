static void ass(FILE *out) {
  fprintf(out,"%s\n","#START _litmus_P1");
  fprintf(out,"%s\n","	lw t2,0(a5)");
  fprintf(out,"%s\n","	bne t2,x0,0f");
  fprintf(out,"%s\n","0:");
  fprintf(out,"%s\n","	sw a0,0(a3)");
  fprintf(out,"%s\n","	sw a6,0(a3)");
  fprintf(out,"%s\n","	lw ra,0(a3)");
  fprintf(out,"%s\n","	bne ra,x0,1f");
  fprintf(out,"%s\n","1:");
  fprintf(out,"%s\n","	lw s1,0(a2)");
  fprintf(out,"%s\n","#START _litmus_P0");
  fprintf(out,"%s\n","	sw a1,0(a5)");
  fprintf(out,"%s\n","	fence rw,rw");
  fprintf(out,"%s\n","	sw a1,0(a4)");
}
