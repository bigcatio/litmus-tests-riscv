#START _litmus_P1
	sw a1,0(a5)
	lw a0,0(a5)
	bne a0,x0,0f
0:
	fence.i
	sw a1,0(a4)
	lw a6,0(a4)
#START _litmus_P0
	sw a1,0(a5)
	lw a0,0(a5)
	xor s1,a0,a0
	add t5,a4,s1
	lw a6,0(t5)
