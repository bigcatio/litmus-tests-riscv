#START _litmus_P1
	lw t0,0(a5)
	xor s3,t0,t0
	ori s3,s3,1
	sw s3,0(a3)
	lw t2,0(a3)
	xor s2,t2,t2
	add s1,a2,s2
	lw ra,0(s1)
#START _litmus_P0
	sw a0,0(a5)
	sw t3,0(a5)
	lw a1,0(a5)
	bne a1,x0,0f
0:
	sw a0,0(a4)
