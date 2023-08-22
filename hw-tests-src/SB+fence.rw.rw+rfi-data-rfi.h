static void ass(FILE *out) {
  fprintf(out,"%s\n","#START _litmus_P1");
  fprintf(out,"%s\n","	sw a1,0(a5)");
  fprintf(out,"%s\n","	lw a0,0(a5)");
  fprintf(out,"%s\n","	xor t2,a0,a0");
  fprintf(out,"%s\n","	ori t2,t2,1");
  fprintf(out,"%s\n","	sw t2,0(a4)");
  fprintf(out,"%s\n","	lw a6,0(a4)");
  fprintf(out,"%s\n","#START _litmus_P0");
  fprintf(out,"%s\n","	sw t1,0(a5)");
  fprintf(out,"%s\n","	fence rw,rw");
  fprintf(out,"%s\n","	lw a1,0(a4)");
}
