#START _litmus_P2
	lw a1,0(a5)
	xor t4,a1,a1
	ori t4,t4,1
	sw t4,0(a4)
#START _litmus_P1
	sw a1,0(a5)
#START _litmus_P0
	sw t1,0(a5)
	fence rw,rw
	lw a1,0(a4)
	sw t1,0(a4)
