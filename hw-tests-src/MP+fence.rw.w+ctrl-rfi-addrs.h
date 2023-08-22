static void ass(FILE *out) {
  fprintf(out,"%s\n","#START _litmus_P1");
  fprintf(out,"%s\n","	lw a6,0(a5)");
  fprintf(out,"%s\n","	bne a6,x0,0f");
  fprintf(out,"%s\n","0:");
  fprintf(out,"%s\n","	sw a2,0(a3)");
  fprintf(out,"%s\n","	lw a7,0(a3)");
  fprintf(out,"%s\n","	xor s1,a7,a7");
  fprintf(out,"%s\n","	add a0,a3,s1");
  fprintf(out,"%s\n","	lw ra,0(a0)");
  fprintf(out,"%s\n","#START _litmus_P0");
  fprintf(out,"%s\n","	sw t1,0(a5)");
  fprintf(out,"%s\n","	fence rw,w");
  fprintf(out,"%s\n","	sw a1,0(a4)");
}
