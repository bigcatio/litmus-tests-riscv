#START _litmus_P1
	lw t0,0(a5)
	bne t0,x0,0f
0:
	lw t2,0(a3)
	sw a0,0(a3)
	lw ra,0(a3)
	bne ra,x0,1f
1:
	sw a0,0(a2)
#START _litmus_P0
	sw t1,0(a5)
	fence rw,rw
	sw a1,0(a4)
