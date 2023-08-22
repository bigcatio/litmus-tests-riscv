#START _litmus_P1
	sw a0,0(a5)
	sw a6,0(a5)
	lw ra,0(a4)
	bne ra,x0,0f
0:
	fence.i
	lw a7,0(a2)
#START _litmus_P0
	sw a2,0(a5)
	sw a0,0(a5)
	lw s1,0(a4)
	xor ra,s1,s1
	add t5,a4,ra
	lw a6,0(t5)
