#START _litmus_P2
	sw a1,0(a5)
#START _litmus_P1
	sw a1,0(a5)
	fence rw,rw
	lw a0,0(a4)
	lw a6,0(a4)
#START _litmus_P0
	sw t1,0(a5)
	fence rw,w
	sw a1,0(a4)
