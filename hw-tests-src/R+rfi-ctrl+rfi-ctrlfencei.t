#START _litmus_P1
	sw a1,0(a5)
	lw a0,0(a5)
	bne a0,x0,0f
0:
	fence.i
	lw a6,0(a4)
#START _litmus_P0
	sw a0,0(a5)
	lw a1,0(a5)
	bne a1,x0,0f
0:
	sw a0,0(a4)
