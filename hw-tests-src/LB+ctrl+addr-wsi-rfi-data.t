#START _litmus_P1
	lw a7,0(a5)
	xor s3,a7,a7
	add s2,a3,s3
	sw a1,0(s2)
	sw a0,0(a3)
	lw ra,0(a3)
	xor s1,ra,ra
	ori s1,s1,1
	sw s1,0(a2)
#START _litmus_P0
	lw a1,0(a5)
	bne a1,x0,0f
0:
	sw a0,0(a4)
