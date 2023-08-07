#START _litmus_P1
	lw a0,0(a5)
	fence.tso
	lr.w a6,0(a3)
	sc.w ra,a6,0(a3)
#START _litmus_P0
	sw a1,0(a5)
	fence.tso
	sw a1,0(a4)
