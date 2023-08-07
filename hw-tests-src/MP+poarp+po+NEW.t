#START _litmus_P1
	lw a1,0(a5)
	lw a0,0(a4)
#START _litmus_P0
	amoswap.w.aqrl x0,a1,(a5)
	sw a1,0(a4)
