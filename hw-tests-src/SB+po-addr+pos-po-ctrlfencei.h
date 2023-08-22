static void ass(FILE *out) {
  fprintf(out,"%s\n","#START _litmus_P1");
  fprintf(out,"%s\n","	sw a0,0(a5)");
  fprintf(out,"%s\n","	sw a6,0(a5)");
  fprintf(out,"%s\n","	lw ra,0(a4)");
  fprintf(out,"%s\n","	bne ra,x0,0f");
  fprintf(out,"%s\n","0:");
  fprintf(out,"%s\n","	fence.i");
  fprintf(out,"%s\n","	lw a7,0(a2)");
  fprintf(out,"%s\n","#START _litmus_P0");
  fprintf(out,"%s\n","	sw a1,0(a5)");
  fprintf(out,"%s\n","	lw s1,0(a4)");
  fprintf(out,"%s\n","	xor t6,s1,s1");
  fprintf(out,"%s\n","	add t5,a2,t6");
  fprintf(out,"%s\n","	lw a6,0(t5)");
}
