#START _litmus_P1
	lw a7,0(a5)
	bne a7,x0,0f
0:
	sw a0,0(a3)
	sw a6,0(a3)
	lw ra,0(a3)
	bne ra,x0,1f
1:
	sw a0,0(a2)
#START _litmus_P0
	lw a1,0(a5)
	fence rw,rw
	sw a0,0(a4)
