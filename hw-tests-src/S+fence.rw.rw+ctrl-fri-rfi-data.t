#START _litmus_P1
	lw t0,0(a5)
	bne t0,x0,0f
0:
	lw t2,0(a3)
	sw a1,0(a3)
	lw ra,0(a3)
	xor s1,ra,ra
	ori s1,s1,1
	sw s1,0(a2)
#START _litmus_P0
	sw t1,0(a5)
	fence rw,rw
	sw a1,0(a4)
