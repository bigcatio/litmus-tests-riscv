	.file	"RR+RR+rmw-fence.tsos.c"
	.option pic
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"%-6lu%c>0:x6=%d; 0:x8=%d; 1:x6=%d; 1:x8=%d;\n"
	.text
	.align	1
	.type	do_dump_outcome, @function
do_dump_outcome:
	addi	sp,sp,-32
	sd	ra,24(sp)
	li	a4,58
	beqz	a3,.L2
	li	a4,42
.L2:
	lw	a3,24(a1)
	lw	a7,16(a1)
	lw	a6,8(a1)
	lw	a5,0(a1)
	sd	a3,0(sp)
	li	a1,1
	mv	a3,a2
	lla	a2,.LC0
	call	__fprintf_chk@plt
	ld	ra,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	do_dump_outcome, .-do_dump_outcome
	.section	.rodata.str1.8
	.align	3
.LC1:
	.string	"RR+RR+rmw-fence.tsos, check_globals failed"
	.text
	.align	1
	.type	check_globals, @function
check_globals:
	ld	a5,72(a0)
	addi	sp,sp,-64
	sd	s2,32(sp)
	lw	s2,4(a5)
	sd	s3,24(sp)
	sd	s4,16(sp)
	addiw	a5,s2,-1
	sd	s5,8(sp)
	sd	ra,56(sp)
	sd	s0,48(sp)
	sd	s1,40(sp)
	sd	s6,0(sp)
	slli	a4,a5,32
	ld	s3,0(a0)
	ld	s4,8(a0)
	mv	s5,a0
	bltz	a4,.L12
	sext.w	s0,a5
	slli	a5,a5,32
	srli	a5,a5,32
	sub	s2,s2,a5
	slli	s2,s2,2
	addi	s1,a0,64
	slli	s0,s0,2
	addi	s2,s2,-8
	lla	s6,.LC1
.L11:
	mv	a0,s1
	call	rand_bit@plt
	add	a5,s3,s0
	beqz	a0,.L9
	lw	a5,0(a5)
	bnez	a5,.L27
.L9:
	mv	a0,s1
	call	rand_bit@plt
	add	a5,s4,s0
	addi	s0,s0,-4
	beqz	a0,.L10
	lw	a5,0(a5)
	bnez	a5,.L28
.L10:
	bne	s0,s2,.L11
.L12:
	ld	s0,48(sp)
	ld	a0,48(s5)
	ld	ra,56(sp)
	ld	s1,40(sp)
	ld	s2,32(sp)
	ld	s3,24(sp)
	ld	s4,16(sp)
	ld	s5,8(sp)
	ld	s6,0(sp)
	addi	sp,sp,64
	tail	pb_wait@plt
.L28:
	mv	a0,s6
	call	fatal@plt
	bne	s0,s2,.L11
	j	.L12
.L27:
	mv	a0,s6
	call	fatal@plt
	j	.L9
	.size	check_globals, .-check_globals
	.section	.rodata.str1.8
	.align	3
.LC2:
	.string	"RR+RR+rmw-fence.tsos"
	.text
	.align	1
	.type	P1, @function
P1:
	addi	sp,sp,-32
	sd	s1,8(sp)
	sd	ra,24(sp)
	sd	s0,16(sp)
	mv	s1,a0
#APP
# 47 "RR+RR+rmw-fence.tsos.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	ld	s0,16(a0)
	lw	a4,0(a0)
	ld	a5,8(a0)
	ld	a3,72(s0)
	slli	a4,a4,2
	add	a5,a5,a4
	lw	a0,0(a5)
	lw	a2,0(a3)
	li	a1,4
	lla	a3,.LC2
	call	force_one_affinity@plt
	mv	a0,s0
	call	check_globals
	ld	a5,72(s0)
	lw	t0,0(s1)
	ld	t3,56(s0)
	lw	t1,12(a5)
	lw	t6,4(a5)
	blez	t1,.L33
	sub	t5,t6,t1
	negw	a7,t1
	subw	t4,t6,t1
	slli	t5,t5,2
	sext.w	t6,t6
	slli	a7,a7,2
	sext.w	t0,t0
	li	a1,1
.L32:
	sext.w	a2,t4
	mv	a3,t5
	bltz	t4,.L37
.L36:
	andi	a5,a2,1
	add	a4,t3,a3
	beq	a5,t0,.L46
.L34:
	lw	a5,0(a4)
	sext.w	a5,a5
	beqz	a5,.L34
.L35:
	ld	a5,0(s0)
	ld	a4,8(s0)
	add	a5,a5,a3
	add	a4,a4,a3
#APP
# 254 "RR+RR+rmw-fence.tsos.c" 1
	
#START _litmus_P1
#_litmus_P1_0
	amoswap.w a0,a1,(a5)
#_litmus_P1_1
	fence.tso
#_litmus_P1_2
	lw a6,0(a4)
#END _litmus_P1

# 0 "" 2
#NO_APP
	ld	a4,40(s0)
	ld	a5,32(s0)
	subw	a2,a2,t1
	add	a4,a4,a3
	add	a5,a5,a3
	sw	a6,0(a4)
	sw	a0,0(a5)
	add	a3,a3,a7
	bgez	a2,.L36
.L37:
	addiw	t4,t4,1
	addi	t5,t5,4
	bne	t4,t6,.L32
.L33:
#APP
# 47 "RR+RR+rmw-fence.tsos.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	li	a0,0
	addi	sp,sp,32
	jr	ra
.L46:
	sw	a1,0(a4)
#APP
# 47 "RR+RR+rmw-fence.tsos.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	j	.L35
	.size	P1, .-P1
	.align	1
	.type	P0, @function
P0:
	addi	sp,sp,-32
	sd	s1,8(sp)
	sd	ra,24(sp)
	sd	s0,16(sp)
	mv	s1,a0
#APP
# 47 "RR+RR+rmw-fence.tsos.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	ld	s0,16(a0)
	lw	a4,0(a0)
	ld	a5,8(a0)
	ld	a3,72(s0)
	slli	a4,a4,2
	add	a5,a5,a4
	lw	a0,0(a5)
	lw	a2,0(a3)
	li	a1,4
	lla	a3,.LC2
	call	force_one_affinity@plt
	mv	a0,s0
	call	check_globals
	ld	a5,72(s0)
	lw	t0,0(s1)
	ld	t3,56(s0)
	lw	t1,12(a5)
	lw	t6,4(a5)
	blez	t1,.L51
	sub	t5,t6,t1
	negw	a7,t1
	subw	t4,t6,t1
	slli	t5,t5,2
	sext.w	t6,t6
	slli	a7,a7,2
	sext.w	t0,t0
	li	a1,1
.L50:
	sext.w	a2,t4
	mv	a3,t5
	bltz	t4,.L55
.L54:
	andi	a5,a2,1
	add	a4,t3,a3
	beq	a5,t0,.L64
.L52:
	lw	a5,0(a4)
	sext.w	a5,a5
	beqz	a5,.L52
.L53:
	ld	a5,8(s0)
	ld	a4,0(s0)
	add	a5,a5,a3
	add	a4,a4,a3
#APP
# 220 "RR+RR+rmw-fence.tsos.c" 1
	
#START _litmus_P0
#_litmus_P0_0
	amoswap.w a0,a1,(a5)
#_litmus_P0_1
	fence.tso
#_litmus_P0_2
	lw a6,0(a4)
#END _litmus_P0

# 0 "" 2
#NO_APP
	ld	a4,24(s0)
	ld	a5,16(s0)
	subw	a2,a2,t1
	add	a4,a4,a3
	add	a5,a5,a3
	sw	a6,0(a4)
	sw	a0,0(a5)
	add	a3,a3,a7
	bgez	a2,.L54
.L55:
	addiw	t4,t4,1
	addi	t5,t5,4
	bne	t4,t6,.L50
.L51:
#APP
# 47 "RR+RR+rmw-fence.tsos.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	li	a0,0
	addi	sp,sp,32
	jr	ra
.L64:
	sw	a1,0(a4)
#APP
# 47 "RR+RR+rmw-fence.tsos.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	j	.L53
	.size	P0, .-P0
	.section	.rodata.str1.8
	.align	3
.LC3:
	.string	"Run %i of %i\r"
	.text
	.align	1
	.type	zyva, @function
zyva:
	addi	sp,sp,-368
	la	a5,__stack_chk_guard
	ld	a5,0(a5)
	sd	s2,336(sp)
	mv	s2,a0
	ld	a0,8(a0)
	sd	ra,360(sp)
	sd	s0,352(sp)
	sd	s1,344(sp)
	sd	s11,264(sp)
	ld	s1,16(s2)
	sd	a5,248(sp)
	sd	s3,328(sp)
	sd	s4,320(sp)
	sd	s5,312(sp)
	sd	s6,304(sp)
	sd	s7,296(sp)
	sd	s8,288(sp)
	sd	s9,280(sp)
	sd	s10,272(sp)
	call	pb_wait@plt
	lla	a5,P0
	sd	a5,152(sp)
	li	a0,24
	lla	a5,P1
	sd	a5,160(sp)
	call	malloc_check@plt
	lw	s0,4(s1)
	sd	zero,0(a0)
	sd	zero,16(a0)
	sd	zero,8(a0)
	slli	s0,s0,2
	mv	s11,a0
	sd	s1,128(sp)
	call	rand@plt
	mv	a5,a0
	mv	a0,s0
	sw	a5,120(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s0
	sd	a5,72(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s0
	sd	a5,80(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s0
	sd	a5,88(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s0
	sd	a5,96(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s0
	sd	a5,56(sp)
	call	malloc_check@plt
	mv	a5,a0
	li	a0,2
	sd	a5,64(sp)
	call	pb_create@plt
	mv	a5,a0
	mv	a0,s0
	sd	a5,104(sp)
	call	malloc_check@plt
	ld	a4,32(s2)
	lw	a3,8(s1)
	li	a5,1
	sw	a5,224(sp)
	addi	a5,sp,56
	sd	a0,112(sp)
	sd	a5,240(sp)
	sd	a4,232(sp)
	sw	zero,200(sp)
	sd	a5,216(sp)
	sd	a4,208(sp)
	blez	a3,.L66
	addi	a5,sp,200
	sd	a5,24(sp)
	addi	a5,sp,224
	sd	a5,16(sp)
	addi	a5,sp,120
	sd	a5,32(sp)
	li	a7,-237568
	addi	a5,sp,152
	li	s5,0
	addi	s6,sp,136
	addi	s7,sp,144
	addiw	s9,a7,-1919
	sd	a5,40(sp)
.L83:
	lw	a5,16(s1)
	li	a4,2
	beq	a5,a4,.L108
	li	a4,4
	beq	a5,a4,.L109
.L69:
	lw	a4,0(s1)
	li	a5,1
	ble	a4,a5,.L70
	la	a5,stderr
	lw	a4,8(s1)
	ld	a0,0(a5)
	mv	a3,s5
	lla	a2,.LC3
	li	a1,1
	call	__fprintf_chk@plt
.L70:
	ld	a5,128(sp)
	lw	a2,4(a5)
	addiw	a4,a2,-1
	slli	a3,a4,32
	sext.w	a5,a4
	bltz	a3,.L71
	slli	a4,a4,32
	srli	a4,a4,32
	sub	a2,a2,a4
	ld	t6,56(sp)
	ld	t5,64(sp)
	ld	t4,72(sp)
	ld	t3,80(sp)
	ld	t1,88(sp)
	ld	a0,96(sp)
	ld	a1,112(sp)
	slli	a2,a2,2
	slli	a5,a5,2
	addi	a2,a2,-8
.L72:
	add	a4,t6,a5
	sw	zero,0(a4)
	add	a4,t5,a5
	sw	zero,0(a4)
	add	a4,t4,a5
	sw	s9,0(a4)
	add	a4,t3,a5
	sw	s9,0(a4)
	add	a4,t1,a5
	sw	s9,0(a4)
	add	a3,a0,a5
	add	a4,a1,a5
	sw	s9,0(a3)
	sw	zero,0(a4)
	addi	a5,a5,-4
	bne	a2,a5,.L72
.L71:
	lw	a5,28(s1)
	bnez	a5,.L110
.L73:
	ld	a1,160(sp)
	ld	a2,16(sp)
	mv	a0,s7
	call	launch@plt
	ld	a2,24(sp)
	ld	a1,152(sp)
	mv	a0,s6
	call	launch@plt
	lw	a5,28(s1)
	bnez	a5,.L111
.L74:
	mv	a0,s7
	call	join@plt
	mv	a0,s6
	call	join@plt
	lw	s0,4(s1)
	addiw	a4,s0,-1
	slli	a3,a4,32
	sext.w	a5,a4
	bltz	a3,.L75
	slli	a4,a4,32
	srli	a4,a4,32
	andi	s3,s5,1
	sub	s0,s0,a4
	slli	s3,s3,3
	slli	s8,a5,2
	lla	a5,.LANCHOR1
	slli	s0,s0,2
	add	a5,a5,s3
	addi	s0,s0,-8
	addi	s10,sp,168
	li	s4,5
	sd	a5,8(sp)
	j	.L82
.L114:
	ld	a3,32(s2)
	lw	a3,0(a3)
	bltz	a3,.L78
	bnez	s3,.L112
.L79:
	ld	a4,16(s11)
	addi	s8,s8,-4
	addi	a4,a4,1
	sd	a4,16(s11)
	beq	s0,s8,.L75
.L82:
	ld	a4,72(sp)
	ld	a2,80(sp)
	ld	a3,88(sp)
	add	a4,a4,s8
	lw	t1,0(a4)
	ld	a4,96(sp)
	add	a2,a2,s8
	add	a3,a3,s8
	add	a4,a4,s8
	lw	t3,0(a2)
	lw	t4,0(a3)
	lw	t5,0(a4)
	li	s3,0
	bnez	t1,.L76
	mv	s3,t1
	bnez	t3,.L76
	mv	s3,t3
	bnez	t4,.L76
	seqz	s3,t5
.L76:
	ld	a0,0(s11)
	li	a3,1
	li	a2,4
	mv	a4,s3
	mv	a1,s10
	sd	t1,168(sp)
	sd	t3,176(sp)
	sd	t4,184(sp)
	sd	t5,192(sp)
	call	add_outcome_outs@plt
	lw	a3,16(s1)
	li	a2,4
	sd	a0,0(s11)
	beq	a3,a2,.L113
	beq	a3,s4,.L114
.L78:
	beqz	s3,.L79
.L80:
	ld	a4,8(s11)
	addi	s8,s8,-4
	addi	a4,a4,1
	sd	a4,8(s11)
	bne	s0,s8,.L82
.L75:
	lw	a5,8(s1)
	addiw	s5,s5,1
	bgt	a5,s5,.L83
.L66:
	ld	a0,56(sp)
	call	free@plt
	ld	a0,64(sp)
	call	free@plt
	ld	a0,72(sp)
	call	free@plt
	ld	a0,80(sp)
	call	free@plt
	ld	a0,88(sp)
	call	free@plt
	ld	a0,96(sp)
	call	free@plt
	ld	a0,104(sp)
	call	pb_free@plt
	ld	a0,112(sp)
	call	free@plt
	la	a5,__stack_chk_guard
	ld	a4,248(sp)
	ld	a5,0(a5)
	bne	a4,a5,.L115
	ld	ra,360(sp)
	ld	s0,352(sp)
	ld	s1,344(sp)
	ld	s2,336(sp)
	ld	s3,328(sp)
	ld	s4,320(sp)
	ld	s5,312(sp)
	ld	s6,304(sp)
	ld	s7,296(sp)
	ld	s8,288(sp)
	ld	s9,280(sp)
	ld	s10,272(sp)
	mv	a0,s11
	ld	s11,264(sp)
	addi	sp,sp,368
	jr	ra
.L113:
	ld	a3,32(s2)
	lw	a3,0(a3)
	bltz	a3,.L78
	beqz	s3,.L79
	ld	a0,0(s2)
	call	pm_lock@plt
	ld	a5,8(sp)
.L107:
	ld	a4,0(a5)
	ld	a0,0(s2)
	addi	a4,a4,1
	sd	a4,0(a5)
	call	pm_unlock@plt
	j	.L80
.L112:
	ld	a0,0(s2)
	call	pm_lock@plt
	lla	a5,.LANCHOR1
	j	.L107
.L111:
	ld	a0,32(sp)
	li	a2,2
	mv	a1,s6
	call	perm_threads@plt
	j	.L74
.L110:
	ld	a1,40(sp)
	ld	a0,32(sp)
	li	a2,2
	call	perm_funs@plt
	j	.L73
.L108:
	ld	a0,8(s2)
	call	pb_wait@plt
	lw	a5,24(s2)
	beqz	a5,.L116
.L68:
	ld	a0,8(s2)
	call	pb_wait@plt
	j	.L69
.L109:
	ld	a0,8(s2)
	call	pb_wait@plt
	lw	a4,24(s2)
	andi	a5,s5,1
	slliw	a5,a5,2
	slliw	a4,a4,1
	lla	a3,.LANCHOR0
	slli	a5,a5,2
	add	a5,a3,a5
	slli	a3,a4,2
	add	a3,a5,a3
	ld	a2,32(s2)
	lw	a3,0(a3)
	addi	a4,a4,1
	slli	a4,a4,2
	sw	a3,0(a2)
	add	a5,a5,a4
	lw	a5,0(a5)
	ld	a0,8(s2)
	sw	a5,4(a2)
	call	pb_wait@plt
	j	.L69
.L116:
	lw	a3,20(s1)
	lw	a2,24(s1)
	ld	a1,32(s2)
	ld	a0,32(sp)
	call	perm_prefix_ints@plt
	j	.L68
.L115:
	call	__stack_chk_fail@plt
	.size	zyva, .-zyva
	.section	.rodata.str1.8
	.align	3
.LC4:
	.string	"Never"
	.align	3
.LC5:
	.string	"Always"
	.align	3
.LC6:
	.string	"Sometimes"
	.align	3
.LC7:
	.string	"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
	.align	3
.LC8:
	.string	"%s\n"
	.align	3
.LC9:
	.string	"% Results for tests/non-mixed-size/FENCE.TSO/RMW/RR+RR+rmw-fence.tsos.litmus %"
	.align	3
.LC10:
	.string	"RISCV RR+RR+rmw-fence.tsos"
	.align	3
.LC11:
	.string	"\"Rmw Fence.tsodWR Hat Rmw Fence.tsodWR Hat\""
	.align	3
.LC12:
	.string	"{"
	.align	3
.LC13:
	.string	" 0:x5=x; 0:x7=1; 0:x9=y;"
	.align	3
.LC14:
	.string	" 1:x5=y; 1:x7=1; 1:x9=x;"
	.align	3
.LC15:
	.string	"}"
	.align	3
.LC16:
	.string	" P0                   | P1                   ;"
	.align	3
.LC17:
	.string	" amoswap.w x6,x7,(x5) | amoswap.w x6,x7,(x5) ;"
	.align	3
.LC18:
	.string	" fence.tso            | fence.tso            ;"
	.align	3
.LC19:
	.string	" lw x8,0(x9)          | lw x8,0(x9)          ;"
	.align	3
.LC20:
	.string	""
	.align	3
.LC21:
	.string	"exists (0:x6=0 /\\ 0:x8=0 /\\ 1:x6=0 /\\ 1:x8=0)"
	.align	3
.LC22:
	.string	"Generated assembler"
	.align	3
.LC23:
	.string	"Bad topology %s, reverting to scan affinity\n"
	.align	3
.LC24:
	.string	"Warning: avail=%i, available=%i\n"
	.align	3
.LC25:
	.string	"RR+RR+rmw-fence.tsos: n=%i, r=%i, s=%i"
	.align	3
.LC26:
	.string	", st=%i"
	.align	3
.LC27:
	.string	", i=%i"
	.align	3
.LC28:
	.string	", +ra"
	.align	3
.LC29:
	.string	", +ca"
	.align	3
.LC30:
	.string	", +sa"
	.align	3
.LC31:
	.string	", p='"
	.align	3
.LC32:
	.string	"'"
	.align	3
.LC33:
	.string	"\n"
	.align	3
.LC34:
	.string	"logical proc -> core: "
	.align	3
.LC35:
	.string	"thread allocation: \n"
	.align	3
.LC36:
	.string	"RR+RR+rmw-fence.tsos, sum_hist"
	.align	3
.LC37:
	.string	"Test RR+RR+rmw-fence.tsos Allowed\n"
	.align	3
.LC38:
	.string	"Histogram (%d states)\n"
	.align	3
.LC39:
	.string	"Observation RR+RR+rmw-fence.tsos %s %lu %lu\n"
	.align	3
.LC41:
	.string	"Time RR+RR+rmw-fence.tsos %.2f\n"
	.align	3
.LC42:
	.string	"Ok"
	.align	3
.LC43:
	.string	"\nWitnesses\n"
	.align	3
.LC44:
	.string	"Positive: %lu, Negative: %lu\n"
	.align	3
.LC45:
	.string	"Condition %s is %svalidated\n"
	.align	3
.LC46:
	.string	"Hash=9725c080015748d33362d55fa356bcff\n"
	.align	3
.LC47:
	.string	"Cycle=Hat Rmw Fence.tsodWR Hat Rmw Fence.tsodWR\n"
	.align	3
.LC48:
	.string	"[Rmw,Fence.tsodWR]"
	.align	3
.LC49:
	.string	"Relax RR+RR+rmw-fence.tsos %s %s\n"
	.align	3
.LC50:
	.string	"Safe=Hat\n"
	.align	3
.LC51:
	.string	"Generator=diy7 (version 7.51+4(dev))\n"
	.align	3
.LC52:
	.string	"Com=Fr Fr\n"
	.align	3
.LC53:
	.string	"Orig=Rmw Fence.tsodWR Hat Rmw Fence.tsodWR Hat\n"
	.align	3
.LC54:
	.string	"No"
	.align	3
.LC55:
	.string	"NOT "
	.align	3
.LC56:
	.string	"Affinity=[1] [0] ; (0,1) (1,0)\n"
	.text
	.align	1
	.globl	RR_2B_RR_2B_rmw_2D_fence_2E_tsos
	.type	RR_2B_RR_2B_rmw_2D_fence_2E_tsos, @function
RR_2B_RR_2B_rmw_2D_fence_2E_tsos:
	addi	sp,sp,-528
	sd	s0,512(sp)
	sd	s1,504(sp)
	sd	s2,496(sp)
	sd	s3,488(sp)
	sd	ra,520(sp)
	sd	s4,480(sp)
	sd	s5,472(sp)
	sd	s6,464(sp)
	sd	s7,456(sp)
	sd	s8,448(sp)
	sd	s9,440(sp)
	sd	s10,432(sp)
	sd	s11,424(sp)
	addi	s0,sp,528
	la	a5,__stack_chk_guard
	ld	a5,0(a5)
	mv	s3,a0
	mv	s2,a1
	li	a0,4
	li	a1,0
	sd	a5,-120(s0)
	mv	s1,a2
	call	read_force_affinity@plt
	lw	a4,0(a0)
	li	a5,1
	ble	a4,a5,.L203
	slli	a4,a5,32
	li	t1,-1
	mv	s5,a0
	li	a6,5
	addi	a0,a4,100
	srli	a7,t1,32
	addi	a1,a4,1
	addi	a2,s0,-376
	addi	a3,s0,-264
	slli	a6,a6,33
	sd	a0,-368(s0)
	li	a0,4
	sd	a4,-352(s0)
	sw	a5,-336(s0)
	sd	t1,-288(s0)
	sw	a5,-272(s0)
	sd	a6,-376(s0)
	sd	a0,-360(s0)
	sd	a1,-344(s0)
	sd	s5,-328(s0)
	sd	zero,-320(s0)
	sd	a7,-312(s0)
	sd	zero,-304(s0)
	sd	zero,-296(s0)
	sd	a7,-280(s0)
	mv	a5,a2
	mv	a4,a3
	addi	t1,s0,-280
.L120:
	ld	a7,0(a5)
	ld	a6,8(a5)
	ld	a0,16(a5)
	ld	a1,24(a5)
	sd	a7,0(a4)
	sd	a6,8(a4)
	sd	a0,16(a4)
	sd	a1,24(a4)
	addi	a5,a5,32
	addi	a4,a4,32
	bne	a5,t1,.L120
	ld	a6,0(a5)
	ld	a5,8(a5)
	mv	a1,s2
	mv	a0,s3
	sd	a5,8(a4)
	sd	a6,0(a4)
	call	parse_cmd@plt
	lw	a5,-160(s0)
	sd	sp,-496(s0)
	bnez	a5,.L204
.L121:
	call	timeofday@plt
	lw	a5,-264(s0)
	lw	a4,-252(s0)
	sd	a0,-504(s0)
	sw	a5,-416(s0)
	lw	a5,-256(s0)
	sw	a5,-412(s0)
	lw	a5,-260(s0)
	sw	a5,-408(s0)
	blez	a4,.L205
	lw	a5,-236(s0)
	sw	a4,-404(s0)
	li	a4,5
	beq	a5,a4,.L123
.L220:
	addiw	a5,a5,-3
	li	a4,2
	sgtu	a5,a5,a4
	li	s9,-1
.L124:
	lw	a4,-164(s0)
	sw	a5,-388(s0)
	beqz	a4,.L126
	sw	zero,-388(s0)
.L126:
	lw	a0,0(s5)
	li	a1,2
	call	coremap_seq@plt
	lw	s2,-248(s0)
	sd	a0,-384(s0)
	ld	s4,-216(s0)
	blez	s2,.L206
	lw	a2,0(s4)
	ble	s2,a2,.L128
	mv	a1,s2
	lla	a0,.LC24
	call	log_error@plt
	ld	s4,-216(s0)
.L128:
	lw	s6,-244(s0)
	blez	s6,.L129
.L221:
	slli	s7,s6,2
	addiw	a5,s6,-1
	add	s7,s7,s6
	slliw	s2,s6,1
	sd	a5,-448(s0)
	slli	s8,a5,3
	sd	s6,-512(s0)
	slli	s7,s7,3
.L130:
	lw	a4,-236(s0)
	li	a5,2
	mv	s11,s2
	beq	a4,a5,.L207
.L131:
	slli	a5,s11,2
	addi	a5,a5,15
	lw	a3,-416(s0)
	andi	a5,a5,-16
	sub	sp,sp,a5
	sw	s2,-392(s0)
	sw	a4,-400(s0)
	sw	s11,-396(s0)
	mv	s2,sp
	bnez	a3,.L208
.L132:
	li	a5,2
	beq	a4,a5,.L209
	li	a5,3
	beq	a4,a5,.L210
	li	a5,5
	beq	a4,a5,.L211
.L141:
	addi	s8,s8,15
	andi	s8,s8,-16
	addi	s7,s7,15
	sub	sp,sp,s8
	andi	s7,s7,-16
	sd	sp,-472(s0)
	sub	sp,sp,s7
	call	pm_create@plt
	mv	s9,a0
	mv	a0,s6
	sd	s9,-456(s0)
	call	pb_create@plt
	lw	s7,-224(s0)
	sd	a0,-464(s0)
	lw	a1,0(s4)
	mv	s8,sp
	blez	s7,.L212
	remw	a5,s7,a1
	sd	a5,-440(s0)
.L148:
	ld	a0,-440(s0)
	addi	s7,s2,8
	li	s11,0
	call	gcd@plt
	ld	s3,-472(s0)
	addi	a5,s0,-416
	mv	a2,s8
	sd	a0,-520(s0)
	mv	s8,s3
	li	s2,0
	li	s9,0
	li	s10,0
	sd	a5,-488(s0)
	j	.L155
.L215:
	mv	a0,s3
	lla	a1,zyva
	sd	a2,-480(s0)
	call	launch@plt
	ld	a2,-480(s0)
	addiw	s10,s10,1
	addi	s3,s3,8
	addi	a2,a2,40
	addi	s7,s7,8
	beq	s6,s10,.L213
.L155:
	ld	a5,-488(s0)
	lw	a1,-236(s0)
	addi	a0,s7,-8
	sd	a5,16(a2)
	ld	a5,-456(s0)
	sw	s10,24(a2)
	sd	a0,32(a2)
	sd	a5,0(a2)
	ld	a5,-464(s0)
	sd	a5,8(a2)
	li	a5,1
	beq	a1,a5,.L214
.L150:
	ld	a5,-448(s0)
	bgt	a5,s10,.L215
	mv	a0,a2
	sd	a2,-480(s0)
	call	zyva
	ld	a2,-480(s0)
	addiw	s10,s10,1
	mv	s2,a0
	addi	a2,a2,40
	addi	s3,s3,8
	addi	s7,s7,8
	bne	s6,s10,.L155
.L213:
	lw	a5,-412(s0)
	lw	s6,-408(s0)
	mul	s6,s6,a5
	ld	a5,-448(s0)
	beqz	a5,.L162
	ld	a5,-448(s0)
	addiw	s3,a5,-1
	slli	s3,s3,32
	ld	a5,-472(s0)
	srli	s3,s3,32
	addi	s3,s3,1
	slli	s3,s3,3
	add	s11,a5,s3
	lla	s3,.LC36
.L161:
	mv	a0,s8
	call	join@plt
	mv	s7,a0
	ld	a0,0(a0)
	call	sum_outs@plt
	bne	s6,a0,.L159
	ld	a2,8(s7)
	ld	a3,16(s7)
	add	a5,a2,a3
	beq	s6,a5,.L160
.L159:
	mv	a0,s3
	call	fatal@plt
	ld	a2,8(s7)
	ld	a3,16(s7)
.L160:
	ld	a4,8(s2)
	ld	a5,16(s2)
	ld	a1,0(s7)
	ld	a0,0(s2)
	add	a4,a4,a2
	add	a5,a5,a3
	li	a2,4
	sd	a4,8(s2)
	sd	a5,16(s2)
	call	merge_outs@plt
	sd	a0,0(s2)
	ld	a0,0(s7)
	addi	s8,s8,8
	call	free_outs@plt
	mv	a0,s7
	call	free@plt
	bne	s8,s11,.L161
.L162:
	mv	a0,s4
	call	cpus_free@plt
	call	timeofday@plt
	ld	a5,-504(s0)
	mv	s3,a0
	ld	a0,-456(s0)
	sub	s3,s3,a5
	call	pm_free@plt
	ld	a5,-512(s0)
	ld	a0,-464(s0)
	mul	s6,s6,a5
	call	pb_free@plt
	ld	a0,0(s2)
	call	sum_outs@plt
	bne	s6,a0,.L157
	ld	s4,8(s2)
	ld	s7,16(s2)
	add	a5,s4,s7
	beq	s6,a5,.L163
.L157:
	lla	a0,.LC36
	call	fatal@plt
	ld	s4,8(s2)
	ld	s7,16(s2)
.L163:
	li	a2,34
	li	a1,1
	mv	a3,s1
	lla	a0,.LC37
	call	fwrite@plt
	ld	a0,0(s2)
	call	finals_outs@plt
	mv	a3,a0
	lla	a2,.LC38
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	ld	a2,0(s2)
	li	a4,4
	addi	a3,s0,-152
	lla	a1,do_dump_outcome
	mv	a0,s1
	call	dump_outs@plt
	beqz	s4,.L216
	lla	a2,.LC8
	li	a1,1
	lla	a3,.LC42
	mv	a0,s1
	call	__fprintf_chk@plt
	mv	a3,s1
	li	a2,11
	li	a1,1
	lla	a0,.LC43
	call	fwrite@plt
	mv	a4,s7
	mv	a3,s4
	lla	a2,.LC44
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a4,.LC20
	lla	a2,.LC45
	li	a1,1
	lla	a3,.LC21
	mv	a0,s1
	call	__fprintf_chk@plt
	mv	a3,s1
	li	a2,38
	li	a1,1
	lla	a0,.LC46
	call	fwrite@plt
	mv	a3,s1
	li	a2,48
	li	a1,1
	lla	a0,.LC47
	call	fwrite@plt
	lla	a4,.LC48
	lla	a2,.LC49
	li	a1,1
	lla	a3,.LC42
	mv	a0,s1
	call	__fprintf_chk@plt
	mv	a3,s1
	li	a2,9
	li	a1,1
	lla	a0,.LC50
	call	fwrite@plt
	mv	a3,s1
	li	a2,37
	li	a1,1
	lla	a0,.LC51
	call	fwrite@plt
	mv	a3,s1
	li	a2,10
	li	a1,1
	lla	a0,.LC52
	call	fwrite@plt
	mv	a3,s1
	li	a2,47
	li	a1,1
	lla	a0,.LC53
	call	fwrite@plt
	lw	a4,-236(s0)
	li	a5,3
	beq	a4,a5,.L217
.L168:
	lla	s6,.LC5
	bnez	s7,.L218
.L166:
	mv	a5,s7
	mv	a4,s4
	mv	a3,s6
	lla	a2,.LC39
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	fcvt.d.lu	fa4,s3
	fld	fa5,.LC40,a5
	lla	a2,.LC41
	fdiv.d	fa5,fa4,fa5
	li	a1,1
	mv	a0,s1
	fmv.x.d	a3,fa5
	call	__fprintf_chk@plt
	mv	a0,s1
	call	fflush@plt
	ld	a0,0(s2)
	call	free_outs@plt
	mv	a0,s2
	call	free@plt
	ld	a0,-384(s0)
	call	cpus_free@plt
	ld	a5,-216(s0)
	ld	sp,-496(s0)
	beq	a5,s5,.L119
	mv	a0,s5
.L203:
	call	cpus_free@plt
.L119:
	la	a5,__stack_chk_guard
	ld	a4,-120(s0)
	ld	a5,0(a5)
	bne	a4,a5,.L219
	addi	sp,s0,-528
	ld	ra,520(sp)
	ld	s0,512(sp)
	ld	s1,504(sp)
	ld	s2,496(sp)
	ld	s3,488(sp)
	ld	s4,480(sp)
	ld	s5,472(sp)
	ld	s6,464(sp)
	ld	s7,456(sp)
	ld	s8,448(sp)
	ld	s9,440(sp)
	ld	s10,432(sp)
	ld	s11,424(sp)
	li	a0,0
	addi	sp,sp,528
	jr	ra
.L205:
	lw	a5,-236(s0)
	li	a4,2
	sw	a4,-404(s0)
	li	a4,5
	bne	a5,a4,.L220
.L123:
	ld	a2,-208(s0)
	li	a1,2
	lla	a0,.LANCHOR2
	call	find_string@plt
	mv	s9,a0
	bltz	a0,.L125
	lw	a5,-236(s0)
	li	a4,2
	addiw	a5,a5,-3
	sgtu	a5,a5,a4
	j	.L124
.L206:
	lw	s6,-244(s0)
	lw	s2,0(s4)
	bgtz	s6,.L221
.L129:
	li	a5,1
	ble	s2,a5,.L171
	srai	s6,s2,1
	sraiw	s3,s2,1
	lw	a4,-236(s0)
	addiw	a5,s3,-1
	slli	s7,s6,2
	sd	a5,-448(s0)
	add	s7,s7,s6
	andi	s2,s2,-2
	slli	s8,a5,3
	sd	s6,-512(s0)
	li	a5,2
	slli	s7,s7,3
	mv	s11,s2
	bne	a4,a5,.L131
.L207:
	lw	a0,0(s4)
	mv	a1,s2
	call	max@plt
	lw	a4,-236(s0)
	mv	s11,a0
	j	.L131
.L214:
	ld	a1,8(s4)
	slli	a0,s9,2
	ld	a5,-440(s0)
	add	a0,a1,a0
	lw	a0,0(a0)
	addw	a5,a5,s9
	sw	a0,-8(s7)
	lw	a0,0(s4)
	remw	a5,a5,a0
	bne	a5,s11,.L151
	ld	a5,-520(s0)
	addiw	a4,s11,1
	remw	s11,a4,a5
	mv	a5,s11
.L151:
	slli	a0,a5,2
	add	a1,a1,a0
	lw	a1,0(a1)
	ld	a4,-440(s0)
	sw	a1,-4(s7)
	lw	a1,0(s4)
	addw	a5,a4,a5
	remw	s9,a5,a1
	bne	s9,s11,.L150
	ld	a5,-520(s0)
	addiw	a4,s11,1
	remw	s11,a4,a5
	mv	s9,s11
	j	.L150
.L216:
	lla	a2,.LC8
	li	a1,1
	lla	a3,.LC54
	mv	a0,s1
	call	__fprintf_chk@plt
	mv	a3,s1
	li	a2,11
	li	a1,1
	lla	a0,.LC43
	call	fwrite@plt
	mv	a4,s7
	li	a3,0
	lla	a2,.LC44
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a4,.LC55
	lla	a2,.LC45
	li	a1,1
	lla	a3,.LC21
	mv	a0,s1
	call	__fprintf_chk@plt
	mv	a3,s1
	li	a2,38
	li	a1,1
	lla	a0,.LC46
	call	fwrite@plt
	mv	a3,s1
	li	a2,48
	li	a1,1
	lla	a0,.LC47
	call	fwrite@plt
	lla	a4,.LC48
	lla	a2,.LC49
	li	a1,1
	lla	a3,.LC54
	mv	a0,s1
	call	__fprintf_chk@plt
	mv	a3,s1
	li	a2,9
	li	a1,1
	lla	a0,.LC50
	call	fwrite@plt
	mv	a3,s1
	li	a2,37
	li	a1,1
	lla	a0,.LC51
	call	fwrite@plt
	mv	a3,s1
	li	a2,10
	li	a1,1
	lla	a0,.LC52
	call	fwrite@plt
	mv	a3,s1
	li	a2,47
	li	a1,1
	lla	a0,.LC53
	call	fwrite@plt
	lw	a4,-236(s0)
	li	a5,3
	lla	s6,.LC4
	bne	a4,a5,.L166
	mv	a3,s1
	li	a2,31
	li	a1,1
	lla	a0,.LC56
	call	fwrite@plt
	j	.L166
.L212:
	blez	a1,.L173
	ld	a4,8(s4)
	li	a5,0
	li	a3,-1
.L149:
	sw	a3,0(a4)
	lw	a1,0(s4)
	addiw	a5,a5,1
	addi	a4,a4,4
	blt	a5,a1,.L149
.L173:
	li	a5,1
	sd	a5,-440(s0)
	j	.L148
.L209:
	blez	s11,.L141
	ld	a2,8(s4)
	mv	a3,s2
	li	a4,0
.L142:
	lw	a5,0(s4)
	addi	a3,a3,4
	remw	a5,a4,a5
	addiw	a4,a4,1
	slli	a5,a5,2
	add	a5,a2,a5
	lw	a5,0(a5)
	sw	a5,-4(a3)
	bne	s11,a4,.L142
	j	.L141
.L208:
	lw	a3,-412(s0)
	lw	a2,-408(s0)
	mv	a1,s6
	lla	a0,.LC25
	call	log_error@plt
	lw	a1,-404(s0)
	lla	a0,.LC26
	call	log_error@plt
	lw	a5,-236(s0)
	li	a4,1
	beq	a5,a4,.L222
	li	a4,2
	beq	a5,a4,.L223
	li	a4,3
	beq	a5,a4,.L224
	li	a4,4
	beq	a5,a4,.L225
.L134:
	lla	a0,.LC31
	call	log_error@plt
	la	s10,stderr
	ld	a1,-216(s0)
	ld	a0,0(s10)
	call	cpus_dump@plt
	lla	a0,.LC32
	call	log_error@plt
	lla	a0,.LC33
	call	log_error@plt
	lw	a4,-416(s0)
	li	a5,1
	ble	a4,a5,.L202
	ld	a5,-384(s0)
	beqz	a5,.L202
	lla	a0,.LC34
	call	log_error@plt
	ld	a0,0(s10)
	ld	a1,-384(s0)
	call	cpus_dump@plt
	lla	a0,.LC33
	call	log_error@plt
.L202:
	lw	a4,-236(s0)
	j	.L132
.L204:
	lla	a3,.LC7
	lla	a2,.LC8
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC9
	lla	a2,.LC8
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC7
	lla	a2,.LC8
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC10
	lla	a2,.LC8
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC11
	lla	a2,.LC8
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC12
	lla	a2,.LC8
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC13
	lla	a2,.LC8
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC14
	lla	a2,.LC8
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC15
	lla	a2,.LC8
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC16
	lla	a2,.LC8
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC17
	lla	a2,.LC8
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC18
	lla	a2,.LC8
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC19
	lla	a2,.LC8
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC20
	lla	a2,.LC8
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC21
	lla	a2,.LC8
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC22
	lla	a2,.LC8
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	j	.L121
.L218:
	lla	s6,.LC6
	j	.L166
.L171:
	li	a5,1
	li	s7,40
	sd	a5,-512(s0)
	li	s8,0
	sd	zero,-448(s0)
	li	s2,2
	li	s6,1
	j	.L130
.L211:
	slliw	s9,s9,2
	slli	s9,s9,2
	lla	a4,.LANCHOR0
	add	a4,a4,s9
	blez	s11,.L141
	addiw	a5,s11,-1
	slli	a5,a5,32
	srli	a5,a5,32
	addi	a5,a5,1
	slli	a5,a5,2
	mv	a3,s2
	add	a5,a4,a5
.L146:
	lw	a2,0(a4)
	addi	a4,a4,4
	addi	a3,a3,4
	sw	a2,-4(a3)
	bne	a4,a5,.L146
	j	.L141
.L210:
	ld	a1,-384(s0)
	mv	a5,s6
	mv	a6,s2
	mv	a4,s4
	lla	a3,.LANCHOR0+32
	lla	a2,.LANCHOR2+16
	addi	a0,s0,-420
	sw	zero,-420(s0)
	call	custom_affinity@plt
	lw	a5,-416(s0)
	beqz	a5,.L141
	lla	a0,.LC35
	call	log_error@plt
	la	a5,stderr
	ld	a3,-384(s0)
	ld	a0,0(a5)
	li	a4,2
	mv	a2,s11
	mv	a1,s2
	call	cpus_dump_test@plt
	j	.L141
.L217:
	mv	a3,s1
	li	a2,31
	li	a1,1
	lla	a0,.LC56
	call	fwrite@plt
	j	.L168
.L222:
	lw	a1,-224(s0)
	lla	a0,.LC27
	call	log_error@plt
	j	.L134
.L223:
	lla	a0,.LC28
	call	log_error@plt
	j	.L134
.L125:
	ld	a1,-208(s0)
	lla	a0,.LC23
	call	log_error@plt
	li	a5,4
	sw	a5,-236(s0)
	sd	zero,-208(s0)
	li	a5,0
	j	.L124
.L224:
	lla	a0,.LC29
	call	log_error@plt
	j	.L134
.L225:
	lla	a0,.LC30
	call	log_error@plt
	j	.L134
.L219:
	call	__stack_chk_fail@plt
	.size	RR_2B_RR_2B_rmw_2D_fence_2E_tsos, .-RR_2B_RR_2B_rmw_2D_fence_2E_tsos
	.section	.rodata.str1.8
	.align	3
.LC57:
	.string	"[[0],[1]]"
	.align	3
.LC58:
	.string	"[[0,1]]"
	.section	.rodata.cst8,"aM",@progbits,8
	.align	3
.LC40:
	.word	0
	.word	1093567616
	.data
	.align	3
	.set	.LANCHOR0,. + 0
	.type	cpu_scan, @object
	.size	cpu_scan, 32
cpu_scan:
	.word	2
	.word	0
	.word	3
	.word	1
	.word	2
	.word	3
	.word	0
	.word	1
	.type	diff, @object
	.size	diff, 20
diff:
	.word	0
	.word	1
	.word	1
	.word	0
	.word	-1
	.zero	4
	.type	color_1, @object
	.size	color_1, 8
color_1:
	.word	0
	.word	-1
	.type	color_0, @object
	.size	color_0, 8
color_0:
	.word	1
	.word	-1
	.bss
	.align	3
	.set	.LANCHOR1,. + 0
	.type	ngroups, @object
	.size	ngroups, 16
ngroups:
	.zero	16
	.section	.data.rel.local,"aw"
	.align	3
	.set	.LANCHOR2,. + 0
	.type	group, @object
	.size	group, 16
group:
	.dword	.LC57
	.dword	.LC58
	.type	color, @object
	.size	color, 24
color:
	.dword	color_0
	.dword	color_1
	.dword	0
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
