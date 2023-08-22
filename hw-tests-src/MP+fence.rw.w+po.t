#START _litmus_P1
	lw a1,0(a5)
	lw a0,0(a4)
#START _litmus_P0
	sw a1,0(a5)
	fence rw,w
	sw a1,0(a4)
