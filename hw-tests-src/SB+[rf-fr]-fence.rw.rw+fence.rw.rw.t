#START _litmus_P2
	sw a0,0(a5)
	fence rw,rw
	lw a1,0(a4)
#START _litmus_P1
	lw a4,0(a5)
#START _litmus_P0
	sw a0,0(a5)
	sw t3,0(a5)
	fence rw,rw
	lw a1,0(a4)
