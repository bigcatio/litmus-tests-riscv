	.file	"MP+rfi-ctrlfencei+addr-rfi-addr.c"
	.option pic
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"%-6lu%c>0:x7=%d; 1:x5=%d; 1:x11=%d; 1:x13=%d;\n"
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
	.string	"MP+rfi-ctrlfencei+addr-rfi-addr, check_globals failed"
	.text
	.align	1
	.type	check_globals, @function
check_globals:
	ld	a5,80(a0)
	addi	sp,sp,-80
	sd	s2,48(sp)
	lw	s2,4(a5)
	sd	s3,40(sp)
	sd	s4,32(sp)
	addiw	a5,s2,-1
	sd	s5,24(sp)
	sd	s6,16(sp)
	sd	ra,72(sp)
	sd	s0,64(sp)
	sd	s1,56(sp)
	sd	s7,8(sp)
	slli	a4,a5,32
	ld	s3,0(a0)
	ld	s4,8(a0)
	ld	s5,16(a0)
	mv	s6,a0
	bltz	a4,.L13
	sext.w	s0,a5
	slli	a5,a5,32
	srli	a5,a5,32
	sub	s2,s2,a5
	slli	s2,s2,2
	addi	s1,a0,72
	slli	s0,s0,2
	addi	s2,s2,-8
	lla	s7,.LC1
.L12:
	mv	a0,s1
	call	rand_bit@plt
	add	a5,s3,s0
	beqz	a0,.L9
	lw	a5,0(a5)
	bnez	a5,.L34
.L9:
	mv	a0,s1
	call	rand_bit@plt
	add	a5,s4,s0
	beqz	a0,.L10
	lw	a5,0(a5)
	bnez	a5,.L35
.L10:
	mv	a0,s1
	call	rand_bit@plt
	add	a5,s5,s0
	addi	s0,s0,-4
	beqz	a0,.L11
	lw	a5,0(a5)
	bnez	a5,.L36
.L11:
	bne	s0,s2,.L12
.L13:
	ld	s0,64(sp)
	ld	a0,56(s6)
	ld	ra,72(sp)
	ld	s1,56(sp)
	ld	s2,48(sp)
	ld	s3,40(sp)
	ld	s4,32(sp)
	ld	s5,24(sp)
	ld	s6,16(sp)
	ld	s7,8(sp)
	addi	sp,sp,80
	tail	pb_wait@plt
.L36:
	mv	a0,s7
	call	fatal@plt
	bne	s0,s2,.L12
	j	.L13
.L34:
	mv	a0,s7
	call	fatal@plt
	j	.L9
.L35:
	mv	a0,s7
	call	fatal@plt
	j	.L10
	.size	check_globals, .-check_globals
	.section	.rodata.str1.8
	.align	3
.LC2:
	.string	"MP+rfi-ctrlfencei+addr-rfi-addr"
	.text
	.align	1
	.type	P1, @function
P1:
	addi	sp,sp,-64
	sd	s1,40(sp)
	sd	ra,56(sp)
	sd	s0,48(sp)
	sd	s2,32(sp)
	sd	s3,24(sp)
	sd	s4,16(sp)
	sd	s5,8(sp)
	mv	s1,a0
#APP
# 47 "MP+rfi-ctrlfencei+addr-rfi-addr.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	ld	s0,16(a0)
	lw	a4,0(a0)
	ld	a5,8(a0)
	ld	a3,80(s0)
	slli	a4,a4,2
	add	a5,a5,a4
	lw	a0,0(a5)
	lw	a2,0(a3)
	li	a1,4
	lla	a3,.LC2
	call	force_one_affinity@plt
	mv	a0,s0
	call	check_globals
	ld	a5,80(s0)
	lw	t1,0(s1)
	ld	t3,64(s0)
	lw	a7,12(a5)
	lw	t6,4(a5)
	blez	a7,.L41
	sub	t5,t6,a7
	negw	a6,a7
	subw	t4,t6,a7
	slli	t5,t5,2
	sext.w	t6,t6
	slli	a6,a6,2
	sext.w	t1,t1
	li	a1,1
.L40:
	sext.w	a0,t4
	mv	a2,t5
	bltz	t4,.L45
.L44:
	andi	a5,a0,1
	add	a4,t3,a2
	beq	a5,t1,.L54
.L42:
	lw	a5,0(a4)
	sext.w	a5,a5
	beqz	a5,.L42
.L43:
	ld	a5,8(s0)
	ld	a4,0(s0)
	ld	a3,16(s0)
	add	a5,a5,a2
	add	a4,a4,a2
	add	a3,a3,a2
#APP
# 267 "MP+rfi-ctrlfencei+addr-rfi-addr.c" 1
	
#START _litmus_P1
#_litmus_P1_0
	lw t0,0(a5)
#_litmus_P1_1
	xor s5,t0,t0
#_litmus_P1_2
	add s4,a4,s5
#_litmus_P1_3
	sw a1,0(s4)
#_litmus_P1_4
	lw t2,0(a4)
#_litmus_P1_5
	xor s3,t2,t2
#_litmus_P1_6
	add s2,a3,s3
#_litmus_P1_7
	lw s1,0(s2)
#END _litmus_P1

# 0 "" 2
#NO_APP
	ld	a3,48(s0)
	ld	a4,40(s0)
	ld	a5,32(s0)
	add	a3,a3,a2
	sw	s1,0(a3)
	add	a4,a4,a2
	add	a5,a5,a2
	sw	t2,0(a4)
	sw	t0,0(a5)
	subw	a0,a0,a7
	add	a2,a2,a6
	bgez	a0,.L44
.L45:
	addiw	t4,t4,1
	addi	t5,t5,4
	bne	t4,t6,.L40
.L41:
#APP
# 47 "MP+rfi-ctrlfencei+addr-rfi-addr.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	ld	ra,56(sp)
	ld	s0,48(sp)
	ld	s1,40(sp)
	ld	s2,32(sp)
	ld	s3,24(sp)
	ld	s4,16(sp)
	ld	s5,8(sp)
	li	a0,0
	addi	sp,sp,64
	jr	ra
.L54:
	sw	a1,0(a4)
#APP
# 47 "MP+rfi-ctrlfencei+addr-rfi-addr.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	j	.L43
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
# 47 "MP+rfi-ctrlfencei+addr-rfi-addr.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	ld	s0,16(a0)
	lw	a4,0(a0)
	ld	a5,8(a0)
	ld	a3,80(s0)
	slli	a4,a4,2
	add	a5,a5,a4
	lw	a0,0(a5)
	lw	a2,0(a3)
	li	a1,4
	lla	a3,.LC2
	call	force_one_affinity@plt
	mv	a0,s0
	call	check_globals
	ld	a5,80(s0)
	lw	t1,0(s1)
	ld	t3,64(s0)
	lw	a7,12(a5)
	lw	t6,4(a5)
	blez	a7,.L59
	sub	t5,t6,a7
	negw	a6,a7
	subw	t4,t6,a7
	slli	t5,t5,2
	sext.w	t6,t6
	slli	a6,a6,2
	sext.w	t1,t1
	li	a0,1
.L58:
	sext.w	a2,t4
	mv	a3,t5
	bltz	t4,.L63
.L62:
	andi	a5,a2,1
	add	a4,t3,a3
	beq	a5,t1,.L72
.L60:
	lw	a5,0(a4)
	sext.w	a5,a5
	beqz	a5,.L60
.L61:
	ld	a5,16(s0)
	ld	a4,8(s0)
	add	a5,a5,a3
	add	a4,a4,a3
#APP
# 223 "MP+rfi-ctrlfencei+addr-rfi-addr.c" 1
	
#START _litmus_P0
#_litmus_P0_0
	sw a0,0(a5)
#_litmus_P0_1
	lw a1,0(a5)
#_litmus_P0_2
	bne a1,x0,0f
#_litmus_P0_3
0:
#_litmus_P0_4
	fence.i
#_litmus_P0_5
	sw a0,0(a4)
#END _litmus_P0

# 0 "" 2
#NO_APP
	ld	a5,24(s0)
	subw	a2,a2,a7
	add	a5,a5,a3
	sw	a1,0(a5)
	add	a3,a3,a6
	bgez	a2,.L62
.L63:
	addiw	t4,t4,1
	addi	t5,t5,4
	bne	t4,t6,.L58
.L59:
#APP
# 47 "MP+rfi-ctrlfencei+addr-rfi-addr.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	li	a0,0
	addi	sp,sp,32
	jr	ra
.L72:
	sw	a0,0(a4)
#APP
# 47 "MP+rfi-ctrlfencei+addr-rfi-addr.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	j	.L61
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
	sd	s3,328(sp)
	mv	s3,a0
	ld	a0,8(a0)
	sd	ra,360(sp)
	sd	s0,352(sp)
	sd	s1,344(sp)
	sd	s10,272(sp)
	ld	s1,16(s3)
	sd	a5,248(sp)
	sd	s2,336(sp)
	sd	s4,320(sp)
	sd	s5,312(sp)
	sd	s6,304(sp)
	sd	s7,296(sp)
	sd	s8,288(sp)
	sd	s9,280(sp)
	sd	s11,264(sp)
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
	mv	s10,a0
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
	sd	a5,48(sp)
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
	ld	a4,32(s3)
	lw	a3,8(s1)
	li	a5,1
	sw	a5,224(sp)
	addi	a5,sp,48
	sd	a0,112(sp)
	sd	a5,240(sp)
	sd	a4,232(sp)
	sw	zero,200(sp)
	sd	a5,216(sp)
	sd	a4,208(sp)
	blez	a3,.L74
	addi	a5,sp,200
	sd	a5,16(sp)
	addi	a5,sp,224
	sd	a5,24(sp)
	addi	a5,sp,144
	sd	a5,0(sp)
	addi	a5,sp,120
	sd	a5,32(sp)
	li	a7,-237568
	addi	a5,sp,152
	li	s6,0
	addi	s7,sp,136
	addiw	s11,a7,-1919
	sd	a5,40(sp)
.L91:
	lw	a5,16(s1)
	li	a4,2
	beq	a5,a4,.L116
	li	a4,4
	beq	a5,a4,.L117
.L77:
	lw	a4,0(s1)
	li	a5,1
	ble	a4,a5,.L78
	la	a5,stderr
	lw	a4,8(s1)
	ld	a0,0(a5)
	mv	a3,s6
	lla	a2,.LC3
	li	a1,1
	call	__fprintf_chk@plt
.L78:
	ld	a5,128(sp)
	lw	a2,4(a5)
	addiw	a4,a2,-1
	slli	a3,a4,32
	sext.w	a5,a4
	bltz	a3,.L79
	slli	a4,a4,32
	srli	a4,a4,32
	sub	a2,a2,a4
	ld	t0,48(sp)
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
.L80:
	add	a4,t0,a5
	sw	zero,0(a4)
	add	a4,t6,a5
	sw	zero,0(a4)
	add	a4,t5,a5
	sw	zero,0(a4)
	add	a4,t4,a5
	sw	s11,0(a4)
	add	a4,t3,a5
	sw	s11,0(a4)
	add	a4,t1,a5
	sw	s11,0(a4)
	add	a3,a0,a5
	add	a4,a1,a5
	sw	s11,0(a3)
	sw	zero,0(a4)
	addi	a5,a5,-4
	bne	a2,a5,.L80
.L79:
	lw	a5,28(s1)
	bnez	a5,.L118
.L81:
	ld	a1,160(sp)
	ld	a0,0(sp)
	ld	a2,24(sp)
	call	launch@plt
	ld	a2,16(sp)
	ld	a1,152(sp)
	mv	a0,s7
	call	launch@plt
	lw	a5,28(s1)
	bnez	a5,.L119
.L82:
	ld	a0,0(sp)
	call	join@plt
	mv	a0,s7
	call	join@plt
	lw	s0,4(s1)
	addiw	a4,s0,-1
	slli	a3,a4,32
	sext.w	a5,a4
	bltz	a3,.L83
	slli	a4,a4,32
	srli	a4,a4,32
	andi	s4,s6,1
	sub	s0,s0,a4
	slli	s4,s4,3
	slli	s8,a5,2
	lla	a5,.LANCHOR1
	slli	s0,s0,2
	add	a5,a5,s4
	addi	s0,s0,-8
	addi	s9,sp,168
	li	s2,1
	li	s5,5
	sd	a5,8(sp)
	j	.L90
.L123:
	ld	a3,32(s3)
	lw	a3,0(a3)
	bltz	a3,.L86
	bnez	s4,.L120
.L87:
	ld	a4,16(s10)
	addi	s8,s8,-4
	addi	a4,a4,1
	sd	a4,16(s10)
	beq	s0,s8,.L83
.L90:
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
	li	s4,0
	beq	t1,s2,.L121
.L84:
	ld	a0,0(s10)
	li	a3,1
	li	a2,4
	mv	a4,s4
	mv	a1,s9
	sd	t1,168(sp)
	sd	t3,176(sp)
	sd	t4,184(sp)
	sd	t5,192(sp)
	call	add_outcome_outs@plt
	lw	a3,16(s1)
	li	a2,4
	sd	a0,0(s10)
	beq	a3,a2,.L122
	beq	a3,s5,.L123
.L86:
	beqz	s4,.L87
.L88:
	ld	a4,8(s10)
	addi	s8,s8,-4
	addi	a4,a4,1
	sd	a4,8(s10)
	bne	s0,s8,.L90
.L83:
	lw	a5,8(s1)
	addiw	s6,s6,1
	bgt	a5,s6,.L91
.L74:
	ld	a0,48(sp)
	call	free@plt
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
	bne	a4,a5,.L124
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
	ld	s11,264(sp)
	mv	a0,s10
	ld	s10,272(sp)
	addi	sp,sp,368
	jr	ra
.L122:
	ld	a3,32(s3)
	lw	a3,0(a3)
	bltz	a3,.L86
	beqz	s4,.L87
	ld	a0,0(s3)
	call	pm_lock@plt
	ld	a5,8(sp)
.L115:
	ld	a4,0(a5)
	ld	a0,0(s3)
	addi	a4,a4,1
	sd	a4,0(a5)
	call	pm_unlock@plt
	j	.L88
.L121:
	bne	t3,s2,.L84
	bne	t4,s2,.L84
	seqz	s4,t5
	j	.L84
.L120:
	ld	a0,0(s3)
	call	pm_lock@plt
	lla	a5,.LANCHOR1
	j	.L115
.L119:
	ld	a0,32(sp)
	li	a2,2
	mv	a1,s7
	call	perm_threads@plt
	j	.L82
.L118:
	ld	a1,40(sp)
	ld	a0,32(sp)
	li	a2,2
	call	perm_funs@plt
	j	.L81
.L116:
	ld	a0,8(s3)
	call	pb_wait@plt
	lw	a5,24(s3)
	beqz	a5,.L125
.L76:
	ld	a0,8(s3)
	call	pb_wait@plt
	j	.L77
.L117:
	ld	a0,8(s3)
	call	pb_wait@plt
	lw	a4,24(s3)
	andi	a5,s6,1
	slliw	a5,a5,2
	slliw	a4,a4,1
	lla	a3,.LANCHOR0
	slli	a5,a5,2
	add	a5,a3,a5
	slli	a3,a4,2
	add	a3,a5,a3
	ld	a2,32(s3)
	lw	a3,0(a3)
	addi	a4,a4,1
	slli	a4,a4,2
	sw	a3,0(a2)
	add	a5,a5,a4
	lw	a5,0(a5)
	ld	a0,8(s3)
	sw	a5,4(a2)
	call	pb_wait@plt
	j	.L77
.L125:
	lw	a3,20(s1)
	lw	a2,24(s1)
	ld	a1,32(s3)
	ld	a0,32(sp)
	call	perm_prefix_ints@plt
	j	.L76
.L124:
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
	.string	"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
	.align	3
.LC8:
	.string	"%s\n"
	.align	3
.LC9:
	.string	"% Results for tests/non-mixed-size/RELAX/Rfi/MP+rfi-ctrlfencei+addr-rfi-addr.litmus %"
	.align	3
.LC10:
	.string	"RISCV MP+rfi-ctrlfencei+addr-rfi-addr"
	.align	3
.LC11:
	.string	"\"Rfi DpCtrlFenceIdW Rfe DpAddrdW Rfi DpAddrdR Fre\""
	.align	3
.LC12:
	.string	"{"
	.align	3
.LC13:
	.string	" 0:x5=1; 0:x6=x; 0:x8=y;"
	.align	3
.LC14:
	.string	" 1:x6=y; 1:x8=1; 1:x9=z; 1:x14=x;"
	.align	3
.LC15:
	.string	"}"
	.align	3
.LC16:
	.string	" P0             | P1              ;"
	.align	3
.LC17:
	.string	" sw x5,0(x6)    | lw x5,0(x6)     ;"
	.align	3
.LC18:
	.string	" lw x7,0(x6)    | xor x7,x5,x5    ;"
	.align	3
.LC19:
	.string	" bne x7,x0,LC00 | add x10,x9,x7   ;"
	.align	3
.LC20:
	.string	" LC00:          | sw x8,0(x10)    ;"
	.align	3
.LC21:
	.string	" fence.i        | lw x11,0(x9)    ;"
	.align	3
.LC22:
	.string	" sw x5,0(x8)    | xor x12,x11,x11 ;"
	.align	3
.LC23:
	.string	"                | add x15,x14,x12 ;"
	.align	3
.LC24:
	.string	"                | lw x13,0(x15)   ;"
	.align	3
.LC25:
	.string	""
	.align	3
.LC26:
	.string	"exists (0:x7=1 /\\ 1:x5=1 /\\ 1:x11=1 /\\ 1:x13=0)"
	.align	3
.LC27:
	.string	"Generated assembler"
	.align	3
.LC28:
	.string	"Bad topology %s, reverting to scan affinity\n"
	.align	3
.LC29:
	.string	"Warning: avail=%i, available=%i\n"
	.align	3
.LC30:
	.string	"MP+rfi-ctrlfencei+addr-rfi-addr: n=%i, r=%i, s=%i"
	.align	3
.LC31:
	.string	", st=%i"
	.align	3
.LC32:
	.string	", i=%i"
	.align	3
.LC33:
	.string	", +ra"
	.align	3
.LC34:
	.string	", +ca"
	.align	3
.LC35:
	.string	", +sa"
	.align	3
.LC36:
	.string	", p='"
	.align	3
.LC37:
	.string	"'"
	.align	3
.LC38:
	.string	"\n"
	.align	3
.LC39:
	.string	"logical proc -> core: "
	.align	3
.LC40:
	.string	"thread allocation: \n"
	.align	3
.LC41:
	.string	"MP+rfi-ctrlfencei+addr-rfi-addr, sum_hist"
	.align	3
.LC42:
	.string	"Test MP+rfi-ctrlfencei+addr-rfi-addr Allowed\n"
	.align	3
.LC43:
	.string	"Histogram (%d states)\n"
	.align	3
.LC44:
	.string	"Observation MP+rfi-ctrlfencei+addr-rfi-addr %s %lu %lu\n"
	.align	3
.LC46:
	.string	"Time MP+rfi-ctrlfencei+addr-rfi-addr %.2f\n"
	.align	3
.LC47:
	.string	"Ok"
	.align	3
.LC48:
	.string	"\nWitnesses\n"
	.align	3
.LC49:
	.string	"Positive: %lu, Negative: %lu\n"
	.align	3
.LC50:
	.string	"Condition %s is %svalidated\n"
	.align	3
.LC51:
	.string	"Hash=e1bf64e4bdde35d55cca9669e2f06e16\n"
	.align	3
.LC52:
	.string	"Cycle=Rfi DpAddrdR Fre Rfi DpCtrlFenceIdW Rfe DpAddrdW\n"
	.align	3
.LC53:
	.string	"Rfi"
	.align	3
.LC54:
	.string	"Relax MP+rfi-ctrlfencei+addr-rfi-addr %s %s\n"
	.align	3
.LC55:
	.string	"Safe=Rfe Fre DpAddrdW DpAddrdR DpCtrlFenceIdW\n"
	.align	3
.LC56:
	.string	"Generator=diy7 (version 7.51+4(dev))\n"
	.align	3
.LC57:
	.string	"Com=Rf Fr\n"
	.align	3
.LC58:
	.string	"Orig=Rfi DpCtrlFenceIdW Rfe DpAddrdW Rfi DpAddrdR Fre\n"
	.align	3
.LC59:
	.string	"No"
	.align	3
.LC60:
	.string	"NOT "
	.align	3
.LC61:
	.string	"Affinity=[0] [1] ; (1,0)\n"
	.text
	.align	1
	.globl	MP_2B_rfi_2D_ctrlfencei_2B_addr_2D_rfi_2D_addr
	.type	MP_2B_rfi_2D_ctrlfencei_2B_addr_2D_rfi_2D_addr, @function
MP_2B_rfi_2D_ctrlfencei_2B_addr_2D_rfi_2D_addr:
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
	ble	a4,a5,.L212
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
.L129:
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
	bne	a5,t1,.L129
	ld	a6,0(a5)
	ld	a5,8(a5)
	mv	a1,s2
	mv	a0,s3
	sd	a5,8(a4)
	sd	a6,0(a4)
	call	parse_cmd@plt
	lw	a5,-160(s0)
	sd	sp,-496(s0)
	bnez	a5,.L213
.L130:
	call	timeofday@plt
	lw	a5,-264(s0)
	lw	a4,-252(s0)
	sd	a0,-504(s0)
	sw	a5,-416(s0)
	lw	a5,-256(s0)
	sw	a5,-412(s0)
	lw	a5,-260(s0)
	sw	a5,-408(s0)
	blez	a4,.L214
	lw	a5,-236(s0)
	sw	a4,-404(s0)
	li	a4,5
	beq	a5,a4,.L132
.L229:
	addiw	a5,a5,-3
	li	a4,2
	sgtu	a5,a5,a4
	li	s9,-1
.L133:
	lw	a4,-164(s0)
	sw	a5,-388(s0)
	beqz	a4,.L135
	sw	zero,-388(s0)
.L135:
	lw	a0,0(s5)
	li	a1,2
	call	coremap_seq@plt
	lw	s2,-248(s0)
	sd	a0,-384(s0)
	ld	s4,-216(s0)
	blez	s2,.L215
	lw	a2,0(s4)
	ble	s2,a2,.L137
	mv	a1,s2
	lla	a0,.LC29
	call	log_error@plt
	ld	s4,-216(s0)
.L137:
	lw	s6,-244(s0)
	blez	s6,.L138
.L230:
	slli	s7,s6,2
	addiw	a5,s6,-1
	add	s7,s7,s6
	slliw	s2,s6,1
	sd	a5,-448(s0)
	slli	s8,a5,3
	sd	s6,-512(s0)
	slli	s7,s7,3
.L139:
	lw	a4,-236(s0)
	li	a5,2
	mv	s11,s2
	beq	a4,a5,.L216
.L140:
	slli	a5,s11,2
	addi	a5,a5,15
	lw	a3,-416(s0)
	andi	a5,a5,-16
	sub	sp,sp,a5
	sw	s2,-392(s0)
	sw	a4,-400(s0)
	sw	s11,-396(s0)
	mv	s2,sp
	bnez	a3,.L217
.L141:
	li	a5,2
	beq	a4,a5,.L218
	li	a5,3
	beq	a4,a5,.L219
	li	a5,5
	beq	a4,a5,.L220
.L150:
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
	blez	s7,.L221
	remw	a5,s7,a1
	sd	a5,-440(s0)
.L157:
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
	j	.L164
.L224:
	mv	a0,s3
	lla	a1,zyva
	sd	a2,-480(s0)
	call	launch@plt
	ld	a2,-480(s0)
	addiw	s10,s10,1
	addi	s3,s3,8
	addi	a2,a2,40
	addi	s7,s7,8
	beq	s6,s10,.L222
.L164:
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
	beq	a1,a5,.L223
.L159:
	ld	a5,-448(s0)
	bgt	a5,s10,.L224
	mv	a0,a2
	sd	a2,-480(s0)
	call	zyva
	ld	a2,-480(s0)
	addiw	s10,s10,1
	mv	s2,a0
	addi	a2,a2,40
	addi	s3,s3,8
	addi	s7,s7,8
	bne	s6,s10,.L164
.L222:
	lw	a5,-412(s0)
	lw	s6,-408(s0)
	mul	s6,s6,a5
	ld	a5,-448(s0)
	beqz	a5,.L171
	ld	a5,-448(s0)
	addiw	s3,a5,-1
	slli	s3,s3,32
	ld	a5,-472(s0)
	srli	s3,s3,32
	addi	s3,s3,1
	slli	s3,s3,3
	add	s11,a5,s3
	lla	s3,.LC41
.L170:
	mv	a0,s8
	call	join@plt
	mv	s7,a0
	ld	a0,0(a0)
	call	sum_outs@plt
	bne	s6,a0,.L168
	ld	a2,8(s7)
	ld	a3,16(s7)
	add	a5,a2,a3
	beq	s6,a5,.L169
.L168:
	mv	a0,s3
	call	fatal@plt
	ld	a2,8(s7)
	ld	a3,16(s7)
.L169:
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
	bne	s8,s11,.L170
.L171:
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
	bne	s6,a0,.L166
	ld	s4,8(s2)
	ld	s7,16(s2)
	add	a5,s4,s7
	beq	s6,a5,.L172
.L166:
	lla	a0,.LC41
	call	fatal@plt
	ld	s4,8(s2)
	ld	s7,16(s2)
.L172:
	li	a2,45
	li	a1,1
	mv	a3,s1
	lla	a0,.LC42
	call	fwrite@plt
	ld	a0,0(s2)
	call	finals_outs@plt
	mv	a3,a0
	lla	a2,.LC43
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	ld	a2,0(s2)
	li	a4,4
	addi	a3,s0,-152
	lla	a1,do_dump_outcome
	mv	a0,s1
	call	dump_outs@plt
	beqz	s4,.L225
	lla	a2,.LC8
	li	a1,1
	lla	a3,.LC47
	mv	a0,s1
	call	__fprintf_chk@plt
	mv	a3,s1
	li	a2,11
	li	a1,1
	lla	a0,.LC48
	call	fwrite@plt
	mv	a4,s7
	mv	a3,s4
	lla	a2,.LC49
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a4,.LC25
	lla	a2,.LC50
	li	a1,1
	lla	a3,.LC26
	mv	a0,s1
	call	__fprintf_chk@plt
	mv	a3,s1
	li	a2,38
	li	a1,1
	lla	a0,.LC51
	call	fwrite@plt
	mv	a3,s1
	li	a2,55
	li	a1,1
	lla	a0,.LC52
	call	fwrite@plt
	lla	a4,.LC53
	lla	a2,.LC54
	li	a1,1
	lla	a3,.LC47
	mv	a0,s1
	call	__fprintf_chk@plt
	mv	a3,s1
	li	a2,46
	li	a1,1
	lla	a0,.LC55
	call	fwrite@plt
	mv	a3,s1
	li	a2,37
	li	a1,1
	lla	a0,.LC56
	call	fwrite@plt
	mv	a3,s1
	li	a2,10
	li	a1,1
	lla	a0,.LC57
	call	fwrite@plt
	mv	a3,s1
	li	a2,54
	li	a1,1
	lla	a0,.LC58
	call	fwrite@plt
	lw	a4,-236(s0)
	li	a5,3
	beq	a4,a5,.L226
.L177:
	lla	s6,.LC5
	bnez	s7,.L227
.L175:
	mv	a5,s7
	mv	a4,s4
	mv	a3,s6
	lla	a2,.LC44
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	fcvt.d.lu	fa4,s3
	fld	fa5,.LC45,a5
	lla	a2,.LC46
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
	beq	a5,s5,.L128
	mv	a0,s5
.L212:
	call	cpus_free@plt
.L128:
	la	a5,__stack_chk_guard
	ld	a4,-120(s0)
	ld	a5,0(a5)
	bne	a4,a5,.L228
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
.L214:
	lw	a5,-236(s0)
	li	a4,2
	sw	a4,-404(s0)
	li	a4,5
	bne	a5,a4,.L229
.L132:
	ld	a2,-208(s0)
	li	a1,2
	lla	a0,.LANCHOR2
	call	find_string@plt
	mv	s9,a0
	bltz	a0,.L134
	lw	a5,-236(s0)
	li	a4,2
	addiw	a5,a5,-3
	sgtu	a5,a5,a4
	j	.L133
.L215:
	lw	s6,-244(s0)
	lw	s2,0(s4)
	bgtz	s6,.L230
.L138:
	li	a5,1
	ble	s2,a5,.L180
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
	bne	a4,a5,.L140
.L216:
	lw	a0,0(s4)
	mv	a1,s2
	call	max@plt
	lw	a4,-236(s0)
	mv	s11,a0
	j	.L140
.L223:
	ld	a1,8(s4)
	slli	a0,s9,2
	ld	a5,-440(s0)
	add	a0,a1,a0
	lw	a0,0(a0)
	addw	a5,a5,s9
	sw	a0,-8(s7)
	lw	a0,0(s4)
	remw	a5,a5,a0
	bne	a5,s11,.L160
	ld	a5,-520(s0)
	addiw	a4,s11,1
	remw	s11,a4,a5
	mv	a5,s11
.L160:
	slli	a0,a5,2
	add	a1,a1,a0
	lw	a1,0(a1)
	ld	a4,-440(s0)
	sw	a1,-4(s7)
	lw	a1,0(s4)
	addw	a5,a4,a5
	remw	s9,a5,a1
	bne	s9,s11,.L159
	ld	a5,-520(s0)
	addiw	a4,s11,1
	remw	s11,a4,a5
	mv	s9,s11
	j	.L159
.L225:
	lla	a2,.LC8
	li	a1,1
	lla	a3,.LC59
	mv	a0,s1
	call	__fprintf_chk@plt
	mv	a3,s1
	li	a2,11
	li	a1,1
	lla	a0,.LC48
	call	fwrite@plt
	mv	a4,s7
	li	a3,0
	lla	a2,.LC49
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a4,.LC60
	lla	a2,.LC50
	li	a1,1
	lla	a3,.LC26
	mv	a0,s1
	call	__fprintf_chk@plt
	mv	a3,s1
	li	a2,38
	li	a1,1
	lla	a0,.LC51
	call	fwrite@plt
	mv	a3,s1
	li	a2,55
	li	a1,1
	lla	a0,.LC52
	call	fwrite@plt
	lla	a4,.LC53
	lla	a2,.LC54
	li	a1,1
	lla	a3,.LC59
	mv	a0,s1
	call	__fprintf_chk@plt
	mv	a3,s1
	li	a2,46
	li	a1,1
	lla	a0,.LC55
	call	fwrite@plt
	mv	a3,s1
	li	a2,37
	li	a1,1
	lla	a0,.LC56
	call	fwrite@plt
	mv	a3,s1
	li	a2,10
	li	a1,1
	lla	a0,.LC57
	call	fwrite@plt
	mv	a3,s1
	li	a2,54
	li	a1,1
	lla	a0,.LC58
	call	fwrite@plt
	lw	a4,-236(s0)
	li	a5,3
	lla	s6,.LC4
	bne	a4,a5,.L175
	mv	a3,s1
	li	a2,25
	li	a1,1
	lla	a0,.LC61
	call	fwrite@plt
	j	.L175
.L221:
	blez	a1,.L182
	ld	a4,8(s4)
	li	a5,0
	li	a3,-1
.L158:
	sw	a3,0(a4)
	lw	a1,0(s4)
	addiw	a5,a5,1
	addi	a4,a4,4
	blt	a5,a1,.L158
.L182:
	li	a5,1
	sd	a5,-440(s0)
	j	.L157
.L218:
	blez	s11,.L150
	ld	a2,8(s4)
	mv	a3,s2
	li	a4,0
.L151:
	lw	a5,0(s4)
	addi	a3,a3,4
	remw	a5,a4,a5
	addiw	a4,a4,1
	slli	a5,a5,2
	add	a5,a2,a5
	lw	a5,0(a5)
	sw	a5,-4(a3)
	bne	s11,a4,.L151
	j	.L150
.L217:
	lw	a3,-412(s0)
	lw	a2,-408(s0)
	mv	a1,s6
	lla	a0,.LC30
	call	log_error@plt
	lw	a1,-404(s0)
	lla	a0,.LC31
	call	log_error@plt
	lw	a5,-236(s0)
	li	a4,1
	beq	a5,a4,.L231
	li	a4,2
	beq	a5,a4,.L232
	li	a4,3
	beq	a5,a4,.L233
	li	a4,4
	beq	a5,a4,.L234
.L143:
	lla	a0,.LC36
	call	log_error@plt
	la	s10,stderr
	ld	a1,-216(s0)
	ld	a0,0(s10)
	call	cpus_dump@plt
	lla	a0,.LC37
	call	log_error@plt
	lla	a0,.LC38
	call	log_error@plt
	lw	a4,-416(s0)
	li	a5,1
	ble	a4,a5,.L211
	ld	a5,-384(s0)
	beqz	a5,.L211
	lla	a0,.LC39
	call	log_error@plt
	ld	a0,0(s10)
	ld	a1,-384(s0)
	call	cpus_dump@plt
	lla	a0,.LC38
	call	log_error@plt
.L211:
	lw	a4,-236(s0)
	j	.L141
.L213:
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
	lla	a3,.LC23
	lla	a2,.LC8
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC24
	lla	a2,.LC8
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC25
	lla	a2,.LC8
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC26
	lla	a2,.LC8
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC27
	lla	a2,.LC8
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	j	.L130
.L227:
	lla	s6,.LC6
	j	.L175
.L180:
	li	a5,1
	li	s7,40
	sd	a5,-512(s0)
	li	s8,0
	sd	zero,-448(s0)
	li	s2,2
	li	s6,1
	j	.L139
.L220:
	slliw	s9,s9,2
	slli	s9,s9,2
	lla	a4,.LANCHOR0
	add	a4,a4,s9
	blez	s11,.L150
	addiw	a5,s11,-1
	slli	a5,a5,32
	srli	a5,a5,32
	addi	a5,a5,1
	slli	a5,a5,2
	mv	a3,s2
	add	a5,a4,a5
.L155:
	lw	a2,0(a4)
	addi	a4,a4,4
	addi	a3,a3,4
	sw	a2,-4(a3)
	bne	a4,a5,.L155
	j	.L150
.L219:
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
	beqz	a5,.L150
	lla	a0,.LC40
	call	log_error@plt
	la	a5,stderr
	ld	a3,-384(s0)
	ld	a0,0(a5)
	li	a4,2
	mv	a2,s11
	mv	a1,s2
	call	cpus_dump_test@plt
	j	.L150
.L226:
	mv	a3,s1
	li	a2,25
	li	a1,1
	lla	a0,.LC61
	call	fwrite@plt
	j	.L177
.L231:
	lw	a1,-224(s0)
	lla	a0,.LC32
	call	log_error@plt
	j	.L143
.L232:
	lla	a0,.LC33
	call	log_error@plt
	j	.L143
.L134:
	ld	a1,-208(s0)
	lla	a0,.LC28
	call	log_error@plt
	li	a5,4
	sw	a5,-236(s0)
	sd	zero,-208(s0)
	li	a5,0
	j	.L133
.L233:
	lla	a0,.LC34
	call	log_error@plt
	j	.L143
.L234:
	lla	a0,.LC35
	call	log_error@plt
	j	.L143
.L228:
	call	__stack_chk_fail@plt
	.size	MP_2B_rfi_2D_ctrlfencei_2B_addr_2D_rfi_2D_addr, .-MP_2B_rfi_2D_ctrlfencei_2B_addr_2D_rfi_2D_addr
	.section	.rodata.str1.8
	.align	3
.LC62:
	.string	"[[0],[1]]"
	.align	3
.LC63:
	.string	"[[0,1]]"
	.section	.rodata.cst8,"aM",@progbits,8
	.align	3
.LC45:
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
	.size	diff, 12
diff:
	.word	1
	.word	0
	.word	-1
	.zero	4
	.type	color_1, @object
	.size	color_1, 8
color_1:
	.word	1
	.word	-1
	.type	color_0, @object
	.size	color_0, 8
color_0:
	.word	0
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
	.dword	.LC62
	.dword	.LC63
	.type	color, @object
	.size	color, 24
color:
	.dword	color_0
	.dword	color_1
	.dword	0
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
