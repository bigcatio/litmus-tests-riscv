#START _litmus_P1
	lw a6,0(a5)
	xor s2,a6,a6
	add s1,a3,s2
	sw a1,0(s1)
	lw t2,0(a3)
	bne t2,x0,0f
0:
	fence.i
	sw a1,0(a2)
#START _litmus_P0
	lw a1,0(a5)
	fence r,rw
	sw a0,0(a4)
