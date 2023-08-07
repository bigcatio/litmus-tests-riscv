#START _litmus_P1
	lr.w ra,0(a5)
	sc.w s1,a0,0(a5)
	fence.tso
	lr.w s2,0(a3)
	sc.w s3,a2,0(a3)
#START _litmus_P0
	sw a0,0(a5)
	fence.tso
	lr.w a6,0(a4)
	sc.w a7,a1,0(a4)
