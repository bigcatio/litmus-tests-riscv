#START _litmus_P1
	lw t2,0(a5)
	xor s3,t2,t2
	add s2,a3,s3
	sw a1,0(s2)
	sw a0,0(a3)
	lw ra,0(a3)
	bne ra,x0,0f
0:
	lw s1,0(a2)
#START _litmus_P0
	sw a1,0(a5)
	fence rw,rw
	sw a1,0(a4)
