#START _litmus_P1
	lw a6,0(a5)
	xor s2,a6,a6
	add s1,a3,s2
	sw a1,0(s1)
	lw t2,0(a3)
	bne t2,x0,0f
0:
	sw a1,0(a2)
#START _litmus_P0
	lw a1,0(a5)
	xor t3,a1,a1
	ori t3,t3,1
	sw t3,0(a4)
