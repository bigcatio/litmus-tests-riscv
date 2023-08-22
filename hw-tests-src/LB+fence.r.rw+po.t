#START _litmus_P1
	lw a1,0(a5)
	sw a0,0(a4)
#START _litmus_P0
	lw a1,0(a5)
	fence r,rw
	sw a0,0(a4)
