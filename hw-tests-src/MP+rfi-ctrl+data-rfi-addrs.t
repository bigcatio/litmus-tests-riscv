#START _litmus_P1
	lw a0,0(a5)
	xor s2,a0,a0
	ori s2,s2,1
	sw s2,0(a4)
	lw a6,0(a4)
	xor s1,a6,a6
	add a1,a4,s1
	lw ra,0(a1)
#START _litmus_P0
	sw t3,0(a5)
	lw a1,0(a5)
	bne a1,x0,0f
0:
	sw a0,0(a4)
