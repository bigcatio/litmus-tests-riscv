#START _litmus_P1
	sw a1,0(a5)
	lw a0,0(a5)
	xor t5,a0,a0
	ori t5,t5,1
	sw t5,0(a4)
	lw a6,0(a4)
#START _litmus_P0
	sw t3,0(a5)
	lw a1,0(a5)
	bne a1,x0,0f
0:
	fence.i
	sw a0,0(a4)
