#START _litmus_P1
	lw t0,0(a5)
	xor s2,t0,t0
	add s1,a3,s2
	sw a1,0(s1)
	lw t2,0(a3)
	bne t2,x0,0f
0:
	fence.i
	lw ra,0(a2)
#START _litmus_P0
	sw a1,0(a5)
	sw a0,0(a5)
	lw a6,0(a5)
	xor t5,a6,a6
	ori t5,t5,1
	sw t5,0(a4)
