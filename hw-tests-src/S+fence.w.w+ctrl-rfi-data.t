#START _litmus_P1
	lw a6,0(a5)
	bne a6,x0,0f
0:
	sw a0,0(a3)
	lw a7,0(a3)
	xor ra,a7,a7
	ori ra,ra,1
	sw ra,0(a2)
#START _litmus_P0
	sw t1,0(a5)
	fence w,w
	sw a1,0(a4)
