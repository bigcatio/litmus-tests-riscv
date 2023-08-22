#START _litmus_P1
	sw t3,0(a5)
	lw a1,0(a5)
	bne a1,x0,0f
0:
	sw a0,0(a4)
#START _litmus_P0
	sw a0,0(a5)
	lw a6,0(a5)
	xor ra,a6,a6
	add t5,a4,ra
	sw a1,0(t5)
