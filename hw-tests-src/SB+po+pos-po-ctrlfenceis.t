#START _litmus_P1
	sw a1,0(a5)
	sw a0,0(a5)
	lw t5,0(a4)
	bne t5,x0,0f
0:
	fence.i
	lw a6,0(a4)
#START _litmus_P0
	sw a0,0(a5)
	lw a1,0(a4)
