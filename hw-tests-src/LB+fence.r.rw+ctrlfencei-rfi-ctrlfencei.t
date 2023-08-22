#START _litmus_P1
	lw a6,0(a5)
	bne a6,x0,0f
0:
	fence.i
	sw a0,0(a3)
	lw t2,0(a3)
	bne t2,x0,1f
1:
	fence.i
	sw a0,0(a2)
#START _litmus_P0
	lw a1,0(a5)
	fence r,rw
	sw a0,0(a4)
