#START _litmus_P1
	lw a0,0(a5)
	xor s1,a0,a0
	ori s1,s1,1
	sw s1,0(a3)
	lw a6,0(a3)
	xor ra,a6,a6
	ori ra,ra,1
	sw ra,0(a2)
#START _litmus_P0
	sw t3,0(a5)
	lw a1,0(a5)
	bne a1,x0,0f
0:
	sw a0,0(a4)
