#START _litmus_P1
	lw a6,0(a5)
	bne a6,x0,0f
0:
	sw a0,0(a3)
	lw t2,0(a3)
	bne t2,x0,1f
1:
	sw a0,0(a2)
#START _litmus_P0
	lw a6,0(a5)
	xor s3,a6,a6
	add s2,a3,s3
	sw a1,0(s2)
	lw t2,0(a3)
	xor s1,t2,t2
	ori s1,s1,1
	sw s1,0(a2)
