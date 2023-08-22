#START _litmus_P1
	lw a0,0(a5)
	xor t5,a0,a0
	add t4,a4,t5
	sw a1,0(t4)
#START _litmus_P0
	sw t3,0(a5)
	lw a1,0(a5)
	bne a1,x0,0f
0:
	fence.i
	sw a0,0(a4)
