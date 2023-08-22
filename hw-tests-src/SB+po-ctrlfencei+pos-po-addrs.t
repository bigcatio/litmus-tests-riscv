#START _litmus_P1
	sw a2,0(a5)
	sw a0,0(a5)
	lw s1,0(a4)
	xor ra,s1,s1
	add t5,a4,ra
	lw a6,0(t5)
#START _litmus_P0
	sw a0,0(a5)
	lw t2,0(a4)
	bne t2,x0,0f
0:
	fence.i
	lw a6,0(a2)
