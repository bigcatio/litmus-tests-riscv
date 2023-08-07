#START _litmus_P1
	amoswap.w.aqrl x0,a0,(a5)
	amoor.w.aqrl a1,x0,(a4)
#START _litmus_P0
	sw a0,0(a5)
	lw a1,0(a4)
