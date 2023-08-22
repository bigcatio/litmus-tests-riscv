#START _litmus_P2
	lw a1,0(a5)
	xor t4,a1,a1
	ori t4,t4,1
	sw t4,0(a4)
#START _litmus_P1
	lw a1,0(a5)
	bne a1,x0,0f
0:
	fence.i
	sw a0,0(a4)
#START _litmus_P0
	sw a7,0(a5)
	sw a7,0(a4)
