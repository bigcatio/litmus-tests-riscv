#START _litmus_P1
	lr.w t2,0(a5)
	sc.w ra,t2,0(a5)
	fence.tso
	lr.w s1,0(a3)
	sc.w s2,s1,0(a3)
#START _litmus_P0
	lr.w t2,0(a5)
	sc.w ra,a2,0(a5)
	fence.tso
	lr.w s1,0(a3)
	sc.w s2,a2,0(a3)
