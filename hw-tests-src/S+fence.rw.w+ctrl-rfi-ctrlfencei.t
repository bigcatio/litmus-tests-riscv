#START _litmus_P1
	lw a6,0(a5)
	bne a6,x0,0f
0:
	sw a0,0(a3)
	lw a7,0(a3)
	bne a7,x0,1f
1:
	fence.i
	sw a0,0(a2)
#START _litmus_P0
	sw t1,0(a5)
	fence rw,w
	sw a1,0(a4)
