#START _litmus_P1
	lw t2,0(a5)
	bne t2,x0,0f
0:
	sw a1,0(a3)
	sw a0,0(a3)
	lw ra,0(a3)
	xor s3,ra,ra
	add s2,a2,s3
	lw s1,0(s2)
#START _litmus_P0
	sw a1,0(a5)
	fence rw,rw
	sw a1,0(a4)
