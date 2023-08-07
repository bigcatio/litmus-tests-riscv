#START _litmus_P1
	lr.w ra,0(a5)
	sc.w s1,a1,0(a5)
	fence.tso
	lr.w s2,0(a3)
	sc.w s3,s2,0(a3)
#START _litmus_P0
	lr.w t2,0(a5)
	sc.w ra,a2,0(a5)
	fence.tso
	lr.w s1,0(a3)
	sc.w s2,a2,0(a3)
