#START _litmus_P1
	lw a1,0(a5)
	xor t0,a1,a1
	ori t0,t0,1
	sw t0,0(a4)
	lw a0,0(a4)
#START _litmus_P0
	sw a1,0(a5)
	lw a0,0(a5)
	xor t4,a0,a0
	ori t4,t4,1
	sw t4,0(a4)
