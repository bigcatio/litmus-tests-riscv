#START _litmus_P1
	sw a0,0(a5)
	fence.tso
	lr.w a6,0(a4)
	sc.w a7,a1,0(a4)
#START _litmus_P0
	sw a0,0(a5)
	fence.tso
	lr.w a6,0(a4)
	sc.w a7,a1,0(a4)
