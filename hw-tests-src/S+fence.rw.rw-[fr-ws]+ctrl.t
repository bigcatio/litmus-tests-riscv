#START _litmus_P2
	lw a1,0(a5)
	bne a1,x0,0f
0:
	sw a0,0(a4)
#START _litmus_P1
	sw a1,0(a5)
#START _litmus_P0
	sw t1,0(a5)
	fence rw,rw
	lw a1,0(a4)
	sw t1,0(a4)
