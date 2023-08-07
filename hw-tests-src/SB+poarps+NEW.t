#START _litmus_P1
	amoswap.w.aqrl x0,a0,(a5)
	lw a1,0(a4)
#START _litmus_P0
	amoswap.w.aqrl x0,a0,(a5)
	lw a1,0(a4)
