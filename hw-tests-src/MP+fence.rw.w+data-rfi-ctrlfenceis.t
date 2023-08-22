#START _litmus_P1
	lw a0,0(a5)
	xor a1,a0,a0
	ori a1,a1,1
	sw a1,0(a3)
	lw a6,0(a3)
	bne a6,x0,0f
0:
	fence.i
	lw ra,0(a3)
#START _litmus_P0
	sw t1,0(a5)
	fence rw,w
	sw a1,0(a4)
