#START _litmus_P1
	sw t1,0(a5)
	fence w,w
	lw a1,0(a4)
#START _litmus_P0
	sw a1,0(a5)
	fence rw,w
	sw a1,0(a4)
