#START _litmus_P1
	lw a6,0(a5)
	xor s2,a6,a6
	ori s2,s2,1
	sw s2,0(a3)
	lw a7,0(a3)
	xor s1,a7,a7
	add ra,a2,s1
	sw a1,0(ra)
#START _litmus_P0
	sw a1,0(a5)
	lw a0,0(a5)
	xor t4,a0,a0
	ori t4,t4,1
	sw t4,0(a4)
