#START _litmus_P1
	lw a0,0(a5)
	xor s2,a0,a0
	ori s2,s2,1
	sw s2,0(a3)
	lw t2,0(a3)
	xor s1,t2,t2
	ori s1,s1,1
	sw s1,0(a2)
#START _litmus_P0
	lw a6,0(a5)
	xor s4,a6,a6
	add s3,a4,s4
	sw a1,0(s3)
	lw t2,0(a4)
	xor s2,t2,t2
	add s1,a3,s2
	sw a1,0(s1)
