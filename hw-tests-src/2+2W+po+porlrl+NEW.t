#START _litmus_P1
	amoswap.w.rl x0,t1,(a5)
	amoswap.w.rl x0,a1,(a4)
#START _litmus_P0
	sw t1,0(a5)
	sw a1,0(a4)
