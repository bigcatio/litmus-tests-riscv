#START _litmus_P1
	lw t0,0(a5)
	bne t0,x0,0f
0:
	fence.i
	sw a0,0(a3)
	lw t2,0(a3)
	bne t2,x0,1f
1:
	fence.i
	lw s1,0(a2)
#START _litmus_P0
	sw a1,0(a5)
	lw a0,0(a5)
	xor t4,a0,a0
	ori t4,t4,1
	sw t4,0(a4)
