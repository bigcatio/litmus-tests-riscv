#START _litmus_P1
	lw a1,0(a5)
	amoor.w.aqrl a0,x0,(a4)
#START _litmus_P0
	sw a1,0(a5)
	amoswap.w.aqrl x0,a1,(a4)
