#START _litmus_P1
	amoswap.w a0,a1,(a5)
	fence.tso
	lw a6,0(a4)
#START _litmus_P0
	amoswap.w a0,a1,(a5)
	fence.tso
	lw a6,0(a4)
