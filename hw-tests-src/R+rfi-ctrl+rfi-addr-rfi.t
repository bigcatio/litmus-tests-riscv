#START _litmus_P1
	sw a0,0(a5)
	lw a6,0(a5)
	xor s1,a6,a6
	add t6,a4,s1
	sw a2,0(t6)
	lw a7,0(a4)
#START _litmus_P0
	sw t3,0(a5)
	lw a1,0(a5)
	bne a1,x0,0f
0:
	sw a0,0(a4)
