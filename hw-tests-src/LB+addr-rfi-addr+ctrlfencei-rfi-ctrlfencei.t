#START _litmus_P1
	lw a6,0(a5)
	bne a6,x0,0f
0:
	fence.i
	sw a0,0(a3)
	lw t2,0(a3)
	bne t2,x0,1f
1:
	fence.i
	sw a0,0(a2)
#START _litmus_P0
	lw a6,0(a5)
	xor s4,a6,a6
	add s3,a4,s4
	sw a1,0(s3)
	lw t2,0(a4)
	xor s2,t2,t2
	add s1,a3,s2
	sw a1,0(s1)
