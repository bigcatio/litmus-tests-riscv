#START _litmus_P1
	sw t1,0(a5)
	fence rw,w
	sw a1,0(a4)
#START _litmus_P0
	sw t1,0(a5)
	fence r,rw
	sw a1,0(a4)
