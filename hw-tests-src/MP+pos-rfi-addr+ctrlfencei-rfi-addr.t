#START _litmus_P1
	lw t0,0(a5)
	bne t0,x0,0f
0:
	fence.i
	sw a1,0(a3)
	lw t2,0(a3)
	xor s2,t2,t2
	add s1,a2,s2
	lw ra,0(s1)
#START _litmus_P0
	sw a1,0(a5)
	sw a0,0(a5)
	lw a6,0(a5)
	xor ra,a6,a6
	add t5,a4,ra
	sw a1,0(t5)
