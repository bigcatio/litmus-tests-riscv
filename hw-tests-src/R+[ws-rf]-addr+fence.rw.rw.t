#START _litmus_P2
	sw t1,0(a5)
	fence rw,rw
	lw a1,0(a4)
#START _litmus_P1
	sw a7,0(a5)
#START _litmus_P0
	sw a1,0(a5)
	lw a0,0(a5)
	xor ra,a0,a0
	add t5,a4,ra
	sw a1,0(t5)
