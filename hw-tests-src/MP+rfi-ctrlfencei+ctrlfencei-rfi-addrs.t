#START _litmus_P1
	lw a6,0(a5)
	bne a6,x0,0f
0:
	fence.i
	sw a2,0(a3)
	lw a7,0(a3)
	xor s1,a7,a7
	add a0,a3,s1
	lw ra,0(a0)
#START _litmus_P0
	sw t3,0(a5)
	lw a1,0(a5)
	bne a1,x0,0f
0:
	fence.i
	sw a0,0(a4)
