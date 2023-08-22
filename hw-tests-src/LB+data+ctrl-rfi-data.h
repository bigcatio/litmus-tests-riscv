static void ass(FILE *out) {
  fprintf(out,"%s\n","#START _litmus_P1");
  fprintf(out,"%s\n","	lw a6,0(a5)");
  fprintf(out,"%s\n","	bne a6,x0,0f");
  fprintf(out,"%s\n","0:");
  fprintf(out,"%s\n","	sw a0,0(a3)");
  fprintf(out,"%s\n","	lw t2,0(a3)");
  fprintf(out,"%s\n","	xor s1,t2,t2");
  fprintf(out,"%s\n","	ori s1,s1,1");
  fprintf(out,"%s\n","	sw s1,0(a2)");
  fprintf(out,"%s\n","#START _litmus_P0");
  fprintf(out,"%s\n","	lw a1,0(a5)");
  fprintf(out,"%s\n","	xor t3,a1,a1");
  fprintf(out,"%s\n","	ori t3,t3,1");
  fprintf(out,"%s\n","	sw t3,0(a4)");
}
