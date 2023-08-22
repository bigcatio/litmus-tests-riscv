static void ass(FILE *out) {
  fprintf(out,"%s\n","#START _litmus_P1");
  fprintf(out,"%s\n","	lw a6,0(a5)");
  fprintf(out,"%s\n","	xor s1,a6,a6");
  fprintf(out,"%s\n","	add ra,a3,s1");
  fprintf(out,"%s\n","	sw a1,0(ra)");
  fprintf(out,"%s\n","	lw a7,0(a3)");
  fprintf(out,"%s\n","	bne a7,x0,0f");
  fprintf(out,"%s\n","0:");
  fprintf(out,"%s\n","	fence.i");
  fprintf(out,"%s\n","	sw a1,0(a2)");
  fprintf(out,"%s\n","#START _litmus_P0");
  fprintf(out,"%s\n","	sw t3,0(a5)");
  fprintf(out,"%s\n","	lw a1,0(a5)");
  fprintf(out,"%s\n","	bne a1,x0,0f");
  fprintf(out,"%s\n","0:");
  fprintf(out,"%s\n","	fence.i");
  fprintf(out,"%s\n","	sw a0,0(a4)");
}
