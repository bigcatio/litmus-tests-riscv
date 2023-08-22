#START _litmus_P1
	lw a1,0(a5)
	bne a1,x0,0f
0:
	sw a0,0(a4)
#START _litmus_P0
	sw a1,0(a5)
	lw a0,0(a5)
	xor t4,a0,a0
	ori t4,t4,1
	sw t4,0(a4)
