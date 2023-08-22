#START _litmus_P1
	lw t0,0(a5)
	xor s3,t0,t0
	add s2,a3,s3
	sw a1,0(s2)
	lw t2,0(a3)
	bne t2,x0,0f
0:
	fence.i
	lw s1,0(a2)
#START _litmus_P0
	sw a1,0(a5)
	fence rw,w
	sw a1,0(a4)
