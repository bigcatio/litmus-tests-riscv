#START _litmus_P1
	sw a1,0(a5)
	lw a0,0(a5)
	xor t4,a0,a0
	ori t4,t4,1
	sw t4,0(a4)
#START _litmus_P0
	sw t1,0(a5)
	fence w,w
	sw a1,0(a4)
