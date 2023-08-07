#START _litmus_P1
	lw a7,0(a5)
	xor s1,a7,a7
	ori s1,s1,1
	sw s1,0(a3)
	sw a6,0(a3)
	lw ra,0(a3)
	bne ra,x0,0f
0:
	sw a0,0(a2)
#START _litmus_P0
	lw a1,0(a5)
	bne a1,x0,0f
0:
	sw a0,0(a4)
