#START _litmus_P1
	lw a7,0(a5)
	xor s2,a7,a7
	add s1,a3,s2
	sw a1,0(s1)
	sw a6,0(a3)
	lw ra,0(a3)
	bne ra,x0,0f
0:
	sw a1,0(a2)
#START _litmus_P0
	lw a0,0(a5)
	xor t5,a0,a0
	add t4,a4,t5
	sw a1,0(t4)
