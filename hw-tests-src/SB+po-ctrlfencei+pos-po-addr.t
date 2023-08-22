#START _litmus_P1
	sw a1,0(a5)
	sw a6,0(a5)
	lw s2,0(a4)
	xor t0,s2,s2
	add t6,a2,t0
	lw a7,0(t6)
#START _litmus_P0
	sw a0,0(a5)
	lw t2,0(a4)
	bne t2,x0,0f
0:
	fence.i
	lw a6,0(a2)
