#START _litmus_P1
	lw t2,0(a5)
	bne t2,x0,0f
0:
	lw s1,0(a3)
	sw a1,0(a3)
	lw s2,0(a3)
	bne s2,x0,1f
1:
	lw s3,0(a2)
#START _litmus_P0
	sw a1,0(a5)
	fence rw,rw
	sw a1,0(a4)
