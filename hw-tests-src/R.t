#START _litmus_P1
	sw t1,0(a5)
	lw a1,0(a4)
#START _litmus_P0
	sw a1,0(a5)
	sw a1,0(a4)
