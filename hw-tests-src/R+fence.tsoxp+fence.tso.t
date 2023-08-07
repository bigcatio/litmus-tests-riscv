#START _litmus_P1
	sw t1,0(a5)
	fence.tso
	lw a1,0(a4)
#START _litmus_P0
	lr.w a0,0(a5)
	sc.w a6,a1,0(a5)
	fence.tso
	sw a1,0(a4)
