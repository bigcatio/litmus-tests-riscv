#START _litmus_P2
	lw a1,0(a5)
	fence r,rw
	lw a0,0(a4)
#START _litmus_P1
	lw a1,0(a5)
	bne a1,x0,0f
0:
	fence.i
	sw a0,0(a4)
#START _litmus_P0
	sw a1,0(a5)
	sw t1,0(a4)
