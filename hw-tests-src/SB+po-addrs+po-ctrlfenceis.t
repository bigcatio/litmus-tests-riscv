#START _litmus_P1
	sw a1,0(a5)
	lw t4,0(a4)
	bne t4,x0,0f
0:
	fence.i
	lw a0,0(a4)
#START _litmus_P0
	sw a2,0(a5)
	lw s1,0(a4)
	xor t2,s1,s1
	add t4,a4,t2
	lw a0,0(t4)
