#START _litmus_P1
	lw a1,0(a5)
	amoswap.w.aqrl x0,a0,(a4)
#START _litmus_P0
	lw a1,0(a5)
	sw a0,0(a4)
