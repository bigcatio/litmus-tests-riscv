#START _litmus_P1
	lw a6,0(a5)
	xor ra,a6,a6
	ori ra,ra,1
	sw ra,0(a3)
	lw a7,0(a3)
	bne a7,x0,0f
0:
	fence.i
	sw a0,0(a2)
#START _litmus_P0
	sw t3,0(a5)
	lw a1,0(a5)
	bne a1,x0,0f
0:
	sw a0,0(a4)
