#START _litmus_P1
	amoor.w.aqrl a1,x0,(a5)
	sw a0,0(a4)
#START _litmus_P0
	amoswap.w.aqrl x0,t1,(a5)
	sw a1,0(a4)
