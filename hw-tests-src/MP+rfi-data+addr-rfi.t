#START _litmus_P1
	lw a0,0(a5)
	xor ra,a0,a0
	add t5,a4,ra
	sw a2,0(t5)
	lw a6,0(a4)
#START _litmus_P0
	sw a1,0(a5)
	lw a0,0(a5)
	xor t4,a0,a0
	ori t4,t4,1
	sw t4,0(a4)
