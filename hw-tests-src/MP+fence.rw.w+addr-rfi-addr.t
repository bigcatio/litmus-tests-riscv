#START _litmus_P1
	lw t0,0(a5)
	xor s5,t0,t0
	add s4,a4,s5
	sw a1,0(s4)
	lw t2,0(a4)
	xor s3,t2,t2
	add s2,a3,s3
	lw s1,0(s2)
#START _litmus_P0
	sw a1,0(a5)
	fence rw,w
	sw a1,0(a4)
