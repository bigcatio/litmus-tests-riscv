#START _litmus_P1
	sw a1,0(a5)
	lw a0,0(a5)
	xor s1,a0,a0
	add t5,a4,s1
	lw a6,0(t5)
#START _litmus_P0
	sw a0,0(a5)
	sw t3,0(a5)
	lw a1,0(a5)
	bne a1,x0,0f
0:
	fence.i
	sw a0,0(a4)
