#START _litmus_P1
	amoswap.w a6,a0,(a5)
	fence.tso
	lr.w a7,0(a3)
	sc.w ra,a7,0(a3)
#START _litmus_P0
	amoswap.w a6,a0,(a5)
	fence.tso
	lr.w a7,0(a3)
	sc.w ra,a7,0(a3)
