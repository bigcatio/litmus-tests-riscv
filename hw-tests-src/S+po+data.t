#START _litmus_P1
	lw a1,0(a5)
	xor t3,a1,a1
	ori t3,t3,1
	sw t3,0(a4)
#START _litmus_P0
	sw t1,0(a5)
	sw a1,0(a4)
