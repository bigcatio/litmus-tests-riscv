#START _litmus_P1
	lw t0,0(a5)
	bne t0,x0,0f
0:
	lw t2,0(a3)
	sw a1,0(a3)
	lw s1,0(a3)
	xor s2,s1,s1
	ori s2,s2,1
	sw s2,0(a2)
#START _litmus_P0
	lw a1,0(a5)
	fence rw,rw
	sw a0,0(a4)
