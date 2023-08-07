#START _litmus_P1
	lr.w ra,0(a5)
	sc.w s1,a1,0(a5)
	fence.tso
	lr.w s2,0(a3)
	sc.w s3,s2,0(a3)
#START _litmus_P0
	sw a1,0(a5)
	fence.tso
	sw a1,0(a4)
