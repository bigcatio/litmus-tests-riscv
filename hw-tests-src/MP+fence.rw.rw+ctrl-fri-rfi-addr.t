#START _litmus_P1
	lw t2,0(a5)
	bne t2,x0,0f
0:
	lw s1,0(a3)
	sw a1,0(a3)
	lw s2,0(a3)
	xor s4,s2,s2
	add a6,a2,s4
	lw s3,0(a6)
#START _litmus_P0
	sw a1,0(a5)
	fence rw,rw
	sw a1,0(a4)
