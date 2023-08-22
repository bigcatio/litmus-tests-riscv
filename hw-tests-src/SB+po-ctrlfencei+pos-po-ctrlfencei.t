#START _litmus_P1
	sw a0,0(a5)
	sw a6,0(a5)
	lw ra,0(a4)
	bne ra,x0,0f
0:
	fence.i
	lw a7,0(a2)
#START _litmus_P0
	sw a0,0(a5)
	lw t2,0(a4)
	bne t2,x0,0f
0:
	fence.i
	lw a6,0(a2)
