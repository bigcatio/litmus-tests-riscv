#START _litmus_P2
	sw a1,0(a5)
	fence rw,rw
	lw a4,0(a5)
#START _litmus_P1
	sw t1,0(a5)
	fence rw,rw
	lw a1,0(a4)
#START _litmus_P0
	sw t1,0(a5)
	fence w,w
	sw a1,0(a4)
