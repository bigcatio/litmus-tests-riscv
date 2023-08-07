#START _litmus_P1
	amoor.w.aqrl a1,x0,(a5)
	sw a0,0(a4)
#START _litmus_P0
	sw t1,0(a5)
	amoswap.w.aqrl x0,a1,(a4)
