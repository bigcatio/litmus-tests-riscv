#START _litmus_P1
	sw t1,0(a5)
	fence.tso
	lw a1,0(a4)
#START _litmus_P0
	lr.w t2,0(a5)
	sc.w ra,a2,0(a5)
	fence.tso
	lr.w s1,0(a3)
	sc.w s2,a2,0(a3)
