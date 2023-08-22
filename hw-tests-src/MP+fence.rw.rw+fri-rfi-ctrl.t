#START _litmus_P1
	lw a6,0(a5)
	sw a0,0(a5)
	lw ra,0(a5)
	bne ra,x0,0f
0:
	lw s1,0(a3)
#START _litmus_P0
	sw a1,0(a5)
	fence rw,rw
	sw a1,0(a4)
