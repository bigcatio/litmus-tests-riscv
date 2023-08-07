#START _litmus_P1
	lw a7,0(a5)
	bne a7,x0,0f
0:
	sw a1,0(a3)
	sw a6,0(a3)
	lw ra,0(a3)
	xor s2,ra,ra
	add s1,a2,s2
	sw a1,0(s1)
#START _litmus_P0
	lw a1,0(a5)
	bne a1,x0,0f
0:
	sw a0,0(a4)
