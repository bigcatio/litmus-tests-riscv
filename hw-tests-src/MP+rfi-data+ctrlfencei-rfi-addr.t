#START _litmus_P1
	lw t0,0(a5)
	bne t0,x0,0f
0:
	fence.i
	sw a1,0(a3)
	lw t2,0(a3)
	xor s3,t2,t2
	add s2,a2,s3
	lw s1,0(s2)
#START _litmus_P0
	sw a1,0(a5)
	lw a0,0(a5)
	xor t4,a0,a0
	ori t4,t4,1
	sw t4,0(a4)
