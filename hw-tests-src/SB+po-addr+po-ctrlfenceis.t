#START _litmus_P1
	sw a1,0(a5)
	lw t4,0(a4)
	bne t4,x0,0f
0:
	fence.i
	lw a0,0(a4)
#START _litmus_P0
	sw a1,0(a5)
	lw s2,0(a4)
	xor t6,s2,s2
	add t5,a2,t6
	lw a6,0(t5)
