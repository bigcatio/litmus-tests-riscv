static void ass(FILE *out) {
  fprintf(out,"%s\n","#START _litmus_P1");
  fprintf(out,"%s\n","	lw a1,0(a5)");
  fprintf(out,"%s\n","	xor t5,a1,a1");
  fprintf(out,"%s\n","	add t4,a4,t5");
  fprintf(out,"%s\n","	lw a0,0(t4)");
  fprintf(out,"%s\n","#START _litmus_P0");
  fprintf(out,"%s\n","	sw a1,0(a5)");
  fprintf(out,"%s\n","	sw a0,0(a5)");
  fprintf(out,"%s\n","	lw a6,0(a5)");
  fprintf(out,"%s\n","	xor t5,a6,a6");
  fprintf(out,"%s\n","	ori t5,t5,1");
  fprintf(out,"%s\n","	sw t5,0(a4)");
}
