#START _litmus_P1
	lw a6,0(a5)
	bne a6,x0,0f
0:
	fence.i
	sw a0,0(a3)
	lw t2,0(a3)
	xor s1,t2,t2
	ori s1,s1,1
	sw s1,0(a2)
#START _litmus_P0
	lw a1,0(a5)
	fence r,rw
	sw a0,0(a4)
