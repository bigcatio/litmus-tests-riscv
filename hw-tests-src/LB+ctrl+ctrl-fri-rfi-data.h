static void ass(FILE *out) {
  fprintf(out,"%s\n","#START _litmus_P1");
  fprintf(out,"%s\n","	lw t0,0(a5)");
  fprintf(out,"%s\n","	bne t0,x0,0f");
  fprintf(out,"%s\n","0:");
  fprintf(out,"%s\n","	lw t2,0(a3)");
  fprintf(out,"%s\n","	sw a1,0(a3)");
  fprintf(out,"%s\n","	lw s1,0(a3)");
  fprintf(out,"%s\n","	xor s2,s1,s1");
  fprintf(out,"%s\n","	ori s2,s2,1");
  fprintf(out,"%s\n","	sw s2,0(a2)");
  fprintf(out,"%s\n","#START _litmus_P0");
  fprintf(out,"%s\n","	lw a1,0(a5)");
  fprintf(out,"%s\n","	bne a1,x0,0f");
  fprintf(out,"%s\n","0:");
  fprintf(out,"%s\n","	sw a0,0(a4)");
}
