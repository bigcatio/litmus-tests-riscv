#START _litmus_P1
	lw a6,0(a5)
	bne a6,x0,0f
0:
	sw a1,0(a3)
	lw a7,0(a3)
	xor s1,a7,a7
	add ra,a2,s1
	sw a1,0(ra)
#START _litmus_P0
	sw a0,0(a5)
	lw a6,0(a5)
	xor ra,a6,a6
	add t5,a4,ra
	sw a1,0(t5)
