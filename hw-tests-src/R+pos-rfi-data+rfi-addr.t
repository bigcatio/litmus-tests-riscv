#START _litmus_P1
	sw a1,0(a5)
	lw a0,0(a5)
	xor s1,a0,a0
	add t5,a4,s1
	lw a6,0(t5)
#START _litmus_P0
	sw a1,0(a5)
	sw a0,0(a5)
	lw a6,0(a5)
	xor t5,a6,a6
	ori t5,t5,1
	sw t5,0(a4)
