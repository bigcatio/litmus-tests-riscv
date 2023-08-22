#START _litmus_P1
	lw t0,0(a5)
	bne t0,x0,0f
0:
	lw t2,0(a3)
	sw a1,0(a3)
	lw ra,0(a3)
	xor s2,ra,ra
	add s1,a2,s2
	sw a1,0(s1)
#START _litmus_P0
	sw t1,0(a5)
	fence rw,rw
	sw a1,0(a4)
