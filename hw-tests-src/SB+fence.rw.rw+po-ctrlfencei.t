#START _litmus_P1
	sw a0,0(a5)
	lw t2,0(a4)
	bne t2,x0,0f
0:
	fence.i
	lw a6,0(a2)
#START _litmus_P0
	sw a0,0(a5)
	fence rw,rw
	lw a1,0(a4)
