#START _litmus_P1
	sw a1,0(a5)
	lw a0,0(a5)
	xor t2,a0,a0
	ori t2,t2,1
	sw t2,0(a4)
	lw a6,0(a4)
#START _litmus_P0
	sw a1,0(a5)
	lw a0,0(a5)
	xor s1,a0,a0
	add t5,a4,s1
	lw a6,0(t5)
