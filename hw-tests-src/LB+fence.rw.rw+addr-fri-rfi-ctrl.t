#START _litmus_P1
	lw t0,0(a5)
	xor s3,t0,t0
	add s2,a3,s3
	lw t2,0(s2)
	sw a1,0(a3)
	lw s1,0(a3)
	bne s1,x0,0f
0:
	sw a1,0(a2)
#START _litmus_P0
	lw a1,0(a5)
	fence rw,rw
	sw a0,0(a4)
