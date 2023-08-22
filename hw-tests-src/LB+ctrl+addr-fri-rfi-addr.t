#START _litmus_P1
	lw t0,0(a5)
	xor s5,t0,t0
	add s4,a4,s5
	lw t2,0(s4)
	sw a1,0(a4)
	lw s1,0(a4)
	xor s3,s1,s1
	add s2,a3,s3
	sw a1,0(s2)
#START _litmus_P0
	lw a1,0(a5)
	bne a1,x0,0f
0:
	sw a0,0(a4)
