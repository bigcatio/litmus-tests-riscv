#START _litmus_P1
	lw ra,0(a5)
	sw a0,0(a5)
	lw s1,0(a5)
	bne s1,x0,0f
0:
	lw s2,0(a3)
	sw a2,0(a3)
	lw s3,0(a3)
#START _litmus_P0
	sw t1,0(a5)
	fence rw,rw
	sw a1,0(a4)
