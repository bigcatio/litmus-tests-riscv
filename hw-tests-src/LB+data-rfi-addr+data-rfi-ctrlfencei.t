#START _litmus_P1
	lw a6,0(a5)
	xor s1,a6,a6
	ori s1,s1,1
	sw s1,0(a3)
	lw t2,0(a3)
	bne t2,x0,0f
0:
	fence.i
	sw a0,0(a2)
#START _litmus_P0
	lw a6,0(a5)
	xor s3,a6,a6
	ori s3,s3,1
	sw s3,0(a3)
	lw t2,0(a3)
	xor s2,t2,t2
	add s1,a2,s2
	sw a1,0(s1)
