#START _litmus_P1
	lw a6,0(a5)
	bne a6,x0,0f
0:
	fence.i
	sw a0,0(a3)
	lw a7,0(a3)
	bne a7,x0,1f
1:
	fence.i
	lw ra,0(a3)
#START _litmus_P0
	sw a1,0(a5)
	lw a0,0(a5)
	xor t4,a0,a0
	ori t4,t4,1
	sw t4,0(a4)
