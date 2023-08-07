#START _litmus_P1
	sw a1,0(a5)
	fence.tso
	lr.w a0,0(a4)
	sc.w a6,a0,0(a4)
#START _litmus_P0
	sw a1,0(a5)
	fence.tso
	sw a1,0(a4)
