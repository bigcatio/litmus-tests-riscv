static void ass(FILE *out) {
  fprintf(out,"%s\n","#START _litmus_P1");
  fprintf(out,"%s\n","	sw a2,0(a5)");
  fprintf(out,"%s\n","	sw a0,0(a5)");
  fprintf(out,"%s\n","	lw s1,0(a5)");
  fprintf(out,"%s\n","	xor ra,s1,s1");
  fprintf(out,"%s\n","	add t5,a4,ra");
  fprintf(out,"%s\n","	lw a6,0(t5)");
  fprintf(out,"%s\n","#START _litmus_P0");
  fprintf(out,"%s\n","	sw a2,0(a5)");
  fprintf(out,"%s\n","	lw ra,0(a5)");
  fprintf(out,"%s\n","	xor t5,ra,ra");
  fprintf(out,"%s\n","	add t4,a4,t5");
  fprintf(out,"%s\n","	lw a0,0(t4)");
}
