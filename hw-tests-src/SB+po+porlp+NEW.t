#START _litmus_P1
	amoswap.w.rl x0,a0,(a5)
	lw a1,0(a4)
#START _litmus_P0
	sw a0,0(a5)
	lw a1,0(a4)
