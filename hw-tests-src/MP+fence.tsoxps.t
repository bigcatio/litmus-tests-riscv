#START _litmus_P1
	lr.w a0,0(a5)
	sc.w a6,a0,0(a5)
	fence.tso
	lw ra,0(a3)
#START _litmus_P0
	lr.w a0,0(a5)
	sc.w a6,a1,0(a5)
	fence.tso
	sw a1,0(a4)
