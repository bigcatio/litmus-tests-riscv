#START _litmus_P1
	lw a7,0(a5)
	xor s4,a7,a7
	add s3,a4,s4
	sw a1,0(s3)
	sw a0,0(a4)
	lw ra,0(a4)
	xor s2,ra,ra
	add s1,a3,s2
	sw a1,0(s1)
#START _litmus_P0
	lw a1,0(a5)
	bne a1,x0,0f
0:
	sw a0,0(a4)
