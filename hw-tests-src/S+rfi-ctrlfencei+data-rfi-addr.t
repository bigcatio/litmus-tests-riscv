#START _litmus_P1
	lw a6,0(a5)
	xor s2,a6,a6
	ori s2,s2,1
	sw s2,0(a3)
	lw a7,0(a3)
	xor s1,a7,a7
	add ra,a2,s1
	sw a1,0(ra)
#START _litmus_P0
	sw t3,0(a5)
	lw a1,0(a5)
	bne a1,x0,0f
0:
	fence.i
	sw a0,0(a4)
