#START _litmus_P1
	sw a1,0(a5)
	lw a0,0(a5)
	xor t2,a0,a0
	ori t2,t2,1
	sw t2,0(a4)
	lw a6,0(a4)
#START _litmus_P0
	sw t1,0(a5)
	fence rw,rw
	lw a1,0(a4)
