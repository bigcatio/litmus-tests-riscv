#START _litmus_P1
	lw a6,0(a5)
	bne a6,x0,0f
0:
	sw a1,0(a3)
	lw t2,0(a3)
	xor s2,t2,t2
	add s1,a2,s2
	sw a1,0(s1)
#START _litmus_P0
	lw a1,0(a5)
	fence r,rw
	sw a0,0(a4)
