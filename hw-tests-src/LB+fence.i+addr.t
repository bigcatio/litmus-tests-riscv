#START _litmus_P1
	lw a0,0(a5)
	xor t2,a0,a0
	add t4,a4,t2
	sw a1,0(t4)
#START _litmus_P0
	lw a1,0(a5)
	fence.i
	sw a0,0(a4)
