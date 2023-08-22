static void ass(FILE *out) {
  fprintf(out,"%s\n","#START _litmus_P1");
  fprintf(out,"%s\n","	lw t0,0(a5)");
  fprintf(out,"%s\n","	bne t0,x0,0f");
  fprintf(out,"%s\n","0:");
  fprintf(out,"%s\n","	fence.i");
  fprintf(out,"%s\n","	sw a1,0(a3)");
  fprintf(out,"%s\n","	lw t2,0(a3)");
  fprintf(out,"%s\n","	xor s3,t2,t2");
  fprintf(out,"%s\n","	add s2,a2,s3");
  fprintf(out,"%s\n","	lw s1,0(s2)");
  fprintf(out,"%s\n","#START _litmus_P0");
  fprintf(out,"%s\n","	sw a1,0(a5)");
  fprintf(out,"%s\n","	lw a0,0(a5)");
  fprintf(out,"%s\n","	xor t2,a0,a0");
  fprintf(out,"%s\n","	add t4,a4,t2");
  fprintf(out,"%s\n","	sw a1,0(t4)");
}
