#START _litmus_P1
	lw a6,0(a5)
	sw a2,0(a5)
	lw ra,0(a5)
	xor s2,ra,ra
	add a0,a3,s2
	lw s1,0(a0)
#START _litmus_P0
	sw a1,0(a5)
	fence rw,rw
	sw a1,0(a4)
