#START _litmus_P1
	lw a1,0(a5)
	sw a0,0(a4)
#START _litmus_P0
	amoswap.w.rl x0,t1,(a5)
	sw a1,0(a4)
