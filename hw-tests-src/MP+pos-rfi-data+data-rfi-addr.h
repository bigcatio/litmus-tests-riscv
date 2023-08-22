static void ass(FILE *out) {
  fprintf(out,"%s\n","#START _litmus_P1");
  fprintf(out,"%s\n","	lw t0,0(a5)");
  fprintf(out,"%s\n","	xor s3,t0,t0");
  fprintf(out,"%s\n","	ori s3,s3,1");
  fprintf(out,"%s\n","	sw s3,0(a3)");
  fprintf(out,"%s\n","	lw t2,0(a3)");
  fprintf(out,"%s\n","	xor s2,t2,t2");
  fprintf(out,"%s\n","	add s1,a2,s2");
  fprintf(out,"%s\n","	lw ra,0(s1)");
  fprintf(out,"%s\n","#START _litmus_P0");
  fprintf(out,"%s\n","	sw a1,0(a5)");
  fprintf(out,"%s\n","	sw a0,0(a5)");
  fprintf(out,"%s\n","	lw a6,0(a5)");
  fprintf(out,"%s\n","	xor t5,a6,a6");
  fprintf(out,"%s\n","	ori t5,t5,1");
  fprintf(out,"%s\n","	sw t5,0(a4)");
}
