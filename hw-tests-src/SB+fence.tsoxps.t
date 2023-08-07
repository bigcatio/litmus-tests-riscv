#START _litmus_P1
	lr.w a6,0(a5)
	sc.w a7,a0,0(a5)
	fence.tso
	lw ra,0(a3)
#START _litmus_P0
	lr.w a6,0(a5)
	sc.w a7,a0,0(a5)
	fence.tso
	lw ra,0(a3)
