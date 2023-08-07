#START _litmus_P1
	amoswap.w.aqrl x0,t1,(a5)
	amoor.w.aqrl a1,x0,(a4)
#START _litmus_P0
	amoswap.w.aqrl x0,a1,(a5)
	amoswap.w.aqrl x0,a1,(a4)
