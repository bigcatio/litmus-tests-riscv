static void ass(FILE *out) {
  fprintf(out,"%s\n","#START _litmus_P1");
  fprintf(out,"%s\n","	lw a6,0(a5)");
  fprintf(out,"%s\n","	xor s1,a6,a6");
  fprintf(out,"%s\n","	ori s1,s1,1");
  fprintf(out,"%s\n","	sw s1,0(a3)");
  fprintf(out,"%s\n","	lw t2,0(a3)");
  fprintf(out,"%s\n","	bne t2,x0,0f");
  fprintf(out,"%s\n","0:");
  fprintf(out,"%s\n","	fence.i");
  fprintf(out,"%s\n","	sw a0,0(a2)");
  fprintf(out,"%s\n","#START _litmus_P0");
  fprintf(out,"%s\n","	lw a0,0(a5)");
  fprintf(out,"%s\n","	xor t2,a0,a0");
  fprintf(out,"%s\n","	add t4,a4,t2");
  fprintf(out,"%s\n","	sw a1,0(t4)");
}
