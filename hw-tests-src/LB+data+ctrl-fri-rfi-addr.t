#START _litmus_P1
	lw t0,0(a5)
	bne t0,x0,0f
0:
	lw t2,0(a3)
	sw a1,0(a3)
	lw s1,0(a3)
	xor s3,s1,s1
	add s2,a2,s3
	sw a1,0(s2)
#START _litmus_P0
	lw a1,0(a5)
	xor t3,a1,a1
	ori t3,t3,1
	sw t3,0(a4)
