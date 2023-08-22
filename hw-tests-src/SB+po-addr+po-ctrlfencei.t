#START _litmus_P1
	sw a0,0(a5)
	lw t2,0(a4)
	bne t2,x0,0f
0:
	fence.i
	lw a6,0(a2)
#START _litmus_P0
	sw a1,0(a5)
	lw s2,0(a4)
	xor t6,s2,s2
	add t5,a2,t6
	lw a6,0(t5)
