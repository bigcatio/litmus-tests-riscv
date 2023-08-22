#START _litmus_P1
	lw a6,0(a5)
	bne a6,x0,0f
0:
	lw a7,0(a3)
	sw a0,0(a3)
	lw ra,0(a3)
#START _litmus_P0
	sw t1,0(a5)
	fence rw,rw
	sw a1,0(a4)
