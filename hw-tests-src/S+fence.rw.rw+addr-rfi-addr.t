#START _litmus_P1
	lw a6,0(a5)
	xor s3,a6,a6
	add s2,a4,s3
	sw a1,0(s2)
	lw a7,0(a4)
	xor s1,a7,a7
	add ra,a3,s1
	sw a1,0(ra)
#START _litmus_P0
	sw t1,0(a5)
	fence rw,rw
	sw a1,0(a4)
