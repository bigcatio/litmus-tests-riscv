static void ass(FILE *out) {
  fprintf(out,"%s\n","#START _litmus_P1");
  fprintf(out,"%s\n","	lw a1,0(a5)");
  fprintf(out,"%s\n","	xor t0,a1,a1");
  fprintf(out,"%s\n","	ori t0,t0,1");
  fprintf(out,"%s\n","	sw t0,0(a4)");
  fprintf(out,"%s\n","	lw a0,0(a4)");
  fprintf(out,"%s\n","#START _litmus_P0");
  fprintf(out,"%s\n","	sw t3,0(a5)");
  fprintf(out,"%s\n","	lw a1,0(a5)");
  fprintf(out,"%s\n","	bne a1,x0,0f");
  fprintf(out,"%s\n","0:");
  fprintf(out,"%s\n","	sw a0,0(a4)");
}
