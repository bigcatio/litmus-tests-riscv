#START _litmus_P1
	lw a1,0(a5)
	xor s1,a1,a1
	add t4,a4,s1
	lw a0,0(t4)
#START _litmus_P0
	sw a1,0(a5)
	lw a0,0(a5)
	xor t2,a0,a0
	add t4,a4,t2
	sw a1,0(t4)
