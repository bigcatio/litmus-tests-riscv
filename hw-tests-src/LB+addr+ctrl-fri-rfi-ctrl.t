#START _litmus_P1
	lw t0,0(a5)
	bne t0,x0,0f
0:
	lw t2,0(a3)
	sw a0,0(a3)
	lw s1,0(a3)
	bne s1,x0,1f
1:
	sw a0,0(a2)
#START _litmus_P0
	lw a0,0(a5)
	xor t2,a0,a0
	add t4,a4,t2
	sw a1,0(t4)
