	.file	"SB+po-addr+po-ctrlfencei.c"
	.option pic
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"%-6lu%c>0:x10=%d; 1:x9=%d;\n"
	.text
	.align	1
	.type	do_dump_outcome, @function
do_dump_outcome:
	li	a4,42
	bnez	a3,.L2
	li	a4,58
.L2:
	lw	a6,8(a1)
	lw	a5,0(a1)
	mv	a3,a2
	li	a1,1
	lla	a2,.LC0
	tail	__fprintf_chk@plt
	.size	do_dump_outcome, .-do_dump_outcome
	.section	.rodata.str1.8
	.align	3
.LC1:
	.string	"SB+po-addr+po-ctrlfencei, check_globals failed"
	.text
	.align	1
	.type	check_globals, @function
check_globals:
	ld	a5,72(a0)
	addi	sp,sp,-80
	sd	s2,48(sp)
	lw	s2,4(a5)
	sd	s3,40(sp)
	sd	s5,24(sp)
	addiw	a5,s2,-1
	sd	s6,16(sp)
	sd	s7,8(sp)
	sd	s8,0(sp)
	sd	ra,72(sp)
	sd	s0,64(sp)
	sd	s1,56(sp)
	sd	s4,32(sp)
	slli	a4,a5,32
	ld	s5,0(a0)
	ld	s6,8(a0)
	ld	s7,16(a0)
	ld	s8,24(a0)
	mv	s3,a0
	bltz	a4,.L12
	sext.w	s0,a5
	slli	a5,a5,32
	srli	a5,a5,32
	sub	s2,s2,a5
	slli	s2,s2,2
	addi	s1,a0,64
	slli	s0,s0,2
	addi	s2,s2,-8
	lla	s4,.LC1
	j	.L11
.L7:
	mv	a0,s1
	call	rand_bit@plt
	beqz	a0,.L8
	add	a5,s6,s0
	lw	a5,0(a5)
	bnez	a5,.L39
.L8:
	mv	a0,s1
	call	rand_bit@plt
	beqz	a0,.L9
	add	a5,s7,s0
	lw	a5,0(a5)
	bnez	a5,.L40
.L9:
	mv	a0,s1
	call	rand_bit@plt
	beqz	a0,.L10
	add	a5,s8,s0
	lw	a5,0(a5)
	bnez	a5,.L41
.L10:
	addi	s0,s0,-4
	beq	s0,s2,.L12
.L11:
	mv	a0,s1
	call	rand_bit@plt
	beqz	a0,.L7
	add	a5,s5,s0
	lw	a5,0(a5)
	beqz	a5,.L7
	mv	a0,s4
	call	fatal@plt
	j	.L7
.L41:
	mv	a0,s4
	addi	s0,s0,-4
	call	fatal@plt
	bne	s0,s2,.L11
.L12:
	ld	s0,64(sp)
	ld	a0,48(s3)
	ld	ra,72(sp)
	ld	s1,56(sp)
	ld	s2,48(sp)
	ld	s3,40(sp)
	ld	s4,32(sp)
	ld	s5,24(sp)
	ld	s6,16(sp)
	ld	s7,8(sp)
	ld	s8,0(sp)
	addi	sp,sp,80
	tail	pb_wait@plt
.L39:
	mv	a0,s4
	call	fatal@plt
	j	.L8
.L40:
	mv	a0,s4
	call	fatal@plt
	j	.L9
	.size	check_globals, .-check_globals
	.section	.rodata.str1.8
	.align	3
.LC2:
	.string	"SB+po-addr+po-ctrlfencei"
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
# 47 "SB+po-addr+po-ctrlfencei.c" 1
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
	lw	t3,0(s1)
	ld	t4,56(s0)
	lw	t1,12(a5)
	lw	t0,4(a5)
	blez	t1,.L46
	sub	t6,t0,t1
	negw	a7,t1
	subw	t5,t0,t1
	slli	t6,t6,2
	sext.w	t0,t0
	slli	a7,a7,2
	sext.w	t3,t3
	li	a0,1
.L45:
	sext.w	a1,t5
	mv	a3,t6
	bltz	t5,.L50
.L49:
	andi	a5,a1,1
	add	a4,t4,a3
	beq	a5,t3,.L59
.L47:
	lw	a5,0(a4)
	sext.w	a5,a5
	beqz	a5,.L47
.L48:
	ld	a5,0(s0)
	ld	a4,24(s0)
	ld	a2,16(s0)
	add	a5,a5,a3
	add	a4,a4,a3
	add	a2,a2,a3
#APP
# 254 "SB+po-addr+po-ctrlfencei.c" 1
	
#START _litmus_P1
#_litmus_P1_0
	sw a0,0(a5)
#_litmus_P1_1
	lw t2,0(a4)
#_litmus_P1_2
	bne t2,x0,0f
#_litmus_P1_3
0:
#_litmus_P1_4
	fence.i
#_litmus_P1_5
	lw a6,0(a2)
#END _litmus_P1

# 0 "" 2
#NO_APP
	ld	a5,40(s0)
	subw	a1,a1,t1
	add	a5,a5,a3
	sw	a6,0(a5)
	add	a3,a3,a7
	bgez	a1,.L49
.L50:
	addiw	t5,t5,1
	addi	t6,t6,4
	bne	t5,t0,.L45
.L46:
#APP
# 47 "SB+po-addr+po-ctrlfencei.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	li	a0,0
	addi	sp,sp,32
	jr	ra
.L59:
	sw	a0,0(a4)
#APP
# 47 "SB+po-addr+po-ctrlfencei.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	j	.L48
	.size	P1, .-P1
	.align	1
	.type	P0, @function
P0:
	addi	sp,sp,-32
	sd	s1,8(sp)
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s2,0(sp)
	mv	s1,a0
#APP
# 47 "SB+po-addr+po-ctrlfencei.c" 1
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
	lw	t3,0(s1)
	ld	t4,56(s0)
	lw	t1,12(a5)
	lw	s1,4(a5)
	blez	t1,.L64
	sub	t2,s1,t1
	negw	a7,t1
	subw	t0,s1,t1
	slli	t2,t2,2
	sext.w	s1,s1
	slli	a7,a7,2
	sext.w	t3,t3
	li	a1,1
.L63:
	sext.w	a0,t0
	mv	a3,t2
	bltz	t0,.L68
.L67:
	andi	a5,a0,1
	add	a4,t4,a3
	beq	a5,t3,.L77
.L65:
	lw	a5,0(a4)
	sext.w	a5,a5
	beqz	a5,.L65
.L66:
	ld	a5,16(s0)
	ld	a4,8(s0)
	ld	a2,0(s0)
	add	a5,a5,a3
	add	a4,a4,a3
	add	a2,a2,a3
#APP
# 215 "SB+po-addr+po-ctrlfencei.c" 1
	
#START _litmus_P0
#_litmus_P0_0
	sw a1,0(a5)
#_litmus_P0_1
	lw s2,0(a4)
#_litmus_P0_2
	xor t6,s2,s2
#_litmus_P0_3
	add t5,a2,t6
#_litmus_P0_4
	lw a6,0(t5)
#END _litmus_P0

# 0 "" 2
#NO_APP
	ld	a5,32(s0)
	subw	a0,a0,t1
	add	a5,a5,a3
	sw	a6,0(a5)
	add	a3,a3,a7
	bgez	a0,.L67
.L68:
	addiw	t0,t0,1
	addi	t2,t2,4
	bne	t0,s1,.L63
.L64:
#APP
# 47 "SB+po-addr+po-ctrlfencei.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	ld	s2,0(sp)
	li	a0,0
	addi	sp,sp,32
	jr	ra
.L77:
	sw	a1,0(a4)
#APP
# 47 "SB+po-addr+po-ctrlfencei.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	j	.L66
	.size	P0, .-P0
	.section	.rodata.str1.8
	.align	3
.LC3:
	.string	"Run %i of %i\r"
	.text
	.align	1
	.type	zyva, @function
zyva:
	addi	sp,sp,-352
	la	a5,__stack_chk_guard
	ld	a5,0(a5)
	sd	s3,312(sp)
	mv	s3,a0
	ld	a0,8(a0)
	sd	ra,344(sp)
	sd	s0,336(sp)
	sd	s2,320(sp)
	sd	s11,248(sp)
	ld	s2,16(s3)
	sd	a5,232(sp)
	sd	s1,328(sp)
	sd	s4,304(sp)
	sd	s5,296(sp)
	sd	s6,288(sp)
	sd	s7,280(sp)
	sd	s8,272(sp)
	sd	s9,264(sp)
	sd	s10,256(sp)
	call	pb_wait@plt
	lla	a5,P0
	sd	a5,152(sp)
	li	a0,24
	lla	a5,P1
	sd	a5,160(sp)
	call	malloc_check@plt
	lw	s0,4(s2)
	sd	zero,0(a0)
	sd	zero,16(a0)
	sd	zero,8(a0)
	slli	s0,s0,2
	mv	s11,a0
	sd	s2,128(sp)
	call	rand@plt
	mv	a5,a0
	mv	a0,s0
	sw	a5,120(sp)
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
	mv	a0,s0
	sd	a5,64(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s0
	sd	a5,72(sp)
	call	malloc_check@plt
	mv	a5,a0
	li	a0,2
	sd	a5,80(sp)
	call	pb_create@plt
	mv	a5,a0
	mv	a0,s0
	sd	a5,104(sp)
	call	malloc_check@plt
	ld	a4,32(s3)
	lw	a3,8(s2)
	li	a5,1
	sw	a5,208(sp)
	addi	a5,sp,56
	sd	a0,112(sp)
	sd	a5,224(sp)
	sd	a4,216(sp)
	sw	zero,184(sp)
	sd	a5,200(sp)
	sd	a4,192(sp)
	blez	a3,.L79
	addi	a5,sp,184
	sd	a5,16(sp)
	addi	a5,sp,208
	sd	a5,24(sp)
	addi	a5,sp,144
	sd	a5,0(sp)
	addi	a5,sp,120
	sd	a5,32(sp)
	li	s0,-237568
	addi	a5,sp,152
	li	s7,0
	addi	s8,sp,136
	addiw	s0,s0,-1919
	sd	a5,40(sp)
.L96:
	lw	a5,16(s2)
	li	a4,2
	beq	a5,a4,.L119
	li	a4,4
	beq	a5,a4,.L120
.L82:
	lw	a4,0(s2)
	li	a5,1
	ble	a4,a5,.L83
	la	a5,stderr
	lw	a4,8(s2)
	ld	a0,0(a5)
	mv	a3,s7
	lla	a2,.LC3
	li	a1,1
	call	__fprintf_chk@plt
.L83:
	ld	a5,128(sp)
	lw	a2,4(a5)
	addiw	a4,a2,-1
	slli	a3,a4,32
	sext.w	a5,a4
	bltz	a3,.L84
	slli	a4,a4,32
	srli	a4,a4,32
	sub	a2,a2,a4
	ld	t5,56(sp)
	ld	t4,64(sp)
	ld	t3,72(sp)
	ld	t1,80(sp)
	ld	a7,88(sp)
	ld	a0,96(sp)
	ld	a1,112(sp)
	slli	a2,a2,2
	slli	a5,a5,2
	addi	a2,a2,-8
.L85:
	add	a4,t5,a5
	sw	zero,0(a4)
	add	a4,t4,a5
	sw	zero,0(a4)
	add	a4,t3,a5
	sw	zero,0(a4)
	add	a4,t1,a5
	sw	zero,0(a4)
	add	a4,a7,a5
	sw	s0,0(a4)
	add	a3,a0,a5
	add	a4,a1,a5
	sw	s0,0(a3)
	sw	zero,0(a4)
	addi	a5,a5,-4
	bne	a2,a5,.L85
.L84:
	lw	a5,28(s2)
	bnez	a5,.L121
.L86:
	ld	a1,160(sp)
	ld	a0,0(sp)
	ld	a2,24(sp)
	call	launch@plt
	ld	a2,16(sp)
	ld	a1,152(sp)
	mv	a0,s8
	call	launch@plt
	lw	a5,28(s2)
	bnez	a5,.L122
.L87:
	ld	a0,0(sp)
	call	join@plt
	mv	a0,s8
	call	join@plt
	lw	s1,4(s2)
	addiw	a4,s1,-1
	slli	a3,a4,32
	sext.w	a5,a4
	bltz	a3,.L88
	slli	a4,a4,32
	srli	a4,a4,32
	andi	s5,s7,1
	sub	s1,s1,a4
	slli	s5,s5,3
	slli	s9,a5,2
	lla	a5,.LANCHOR1
	slli	s1,s1,2
	add	a5,a5,s5
	addi	s1,s1,-8
	addi	s10,sp,168
	li	s4,4
	li	s6,5
	sd	a5,8(sp)
	j	.L95
.L125:
	ld	a3,32(s3)
	lw	a3,0(a3)
	bltz	a3,.L91
	bnez	s5,.L123
.L92:
	ld	a4,16(s11)
	addi	s9,s9,-4
	addi	a4,a4,1
	sd	a4,16(s11)
	beq	s1,s9,.L88
.L95:
	ld	a3,88(sp)
	li	s5,0
	add	a3,a3,s9
	lw	a7,0(a3)
	ld	a3,96(sp)
	add	a3,a3,s9
	lw	t1,0(a3)
	bnez	a7,.L89
	seqz	s5,t1
.L89:
	ld	a0,0(s11)
	li	a3,1
	mv	a4,s5
	li	a2,2
	mv	a1,s10
	sd	a7,168(sp)
	sd	t1,176(sp)
	call	add_outcome_outs@plt
	lw	a3,16(s2)
	sd	a0,0(s11)
	beq	a3,s4,.L124
	beq	a3,s6,.L125
.L91:
	beqz	s5,.L92
.L93:
	ld	a4,8(s11)
	addi	s9,s9,-4
	addi	a4,a4,1
	sd	a4,8(s11)
	bne	s1,s9,.L95
.L88:
	lw	a5,8(s2)
	addiw	s7,s7,1
	bgt	a5,s7,.L96
.L79:
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
	ld	a4,232(sp)
	ld	a5,0(a5)
	bne	a4,a5,.L126
	ld	ra,344(sp)
	ld	s0,336(sp)
	ld	s1,328(sp)
	ld	s2,320(sp)
	ld	s3,312(sp)
	ld	s4,304(sp)
	ld	s5,296(sp)
	ld	s6,288(sp)
	ld	s7,280(sp)
	ld	s8,272(sp)
	ld	s9,264(sp)
	ld	s10,256(sp)
	mv	a0,s11
	ld	s11,248(sp)
	addi	sp,sp,352
	jr	ra
.L124:
	ld	a3,32(s3)
	lw	a3,0(a3)
	bltz	a3,.L91
	beqz	s5,.L92
	ld	a0,0(s3)
	call	pm_lock@plt
	ld	a5,8(sp)
.L118:
	ld	a4,0(a5)
	ld	a0,0(s3)
	addi	a4,a4,1
	sd	a4,0(a5)
	call	pm_unlock@plt
	j	.L93
.L123:
	ld	a0,0(s3)
	call	pm_lock@plt
	lla	a5,.LANCHOR1
	j	.L118
.L122:
	ld	a0,32(sp)
	li	a2,2
	mv	a1,s8
	call	perm_threads@plt
	j	.L87
.L121:
	ld	a1,40(sp)
	ld	a0,32(sp)
	li	a2,2
	call	perm_funs@plt
	j	.L86
.L119:
	ld	a0,8(s3)
	call	pb_wait@plt
	lw	a5,24(s3)
	beqz	a5,.L127
.L81:
	ld	a0,8(s3)
	call	pb_wait@plt
	j	.L82
.L120:
	ld	a0,8(s3)
	call	pb_wait@plt
	lw	a4,24(s3)
	andi	a5,s7,1
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
	j	.L82
.L127:
	lw	a3,20(s2)
	lw	a2,24(s2)
	ld	a1,32(s3)
	ld	a0,32(sp)
	call	perm_prefix_ints@plt
	j	.L81
.L126:
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
	.string	"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
	.align	3
.LC8:
	.string	"%s\n"
	.align	3
.LC9:
	.string	"% Results for tests/non-mixed-size/RELAX/PodWR/SB+po-addr+po-ctrlfencei.litmus %"
	.align	3
.LC10:
	.string	"RISCV SB+po-addr+po-ctrlfencei"
	.align	3
.LC11:
	.string	"\"PodWR DpAddrdR Fre PodWR DpCtrlFenceIdR Fre\""
	.align	3
.LC12:
	.string	"{"
	.align	3
.LC13:
	.string	" 0:x5=1; 0:x6=x; 0:x8=y; 0:x11=z;"
	.align	3
.LC14:
	.string	" 1:x5=1; 1:x6=z; 1:x8=a; 1:x10=x;"
	.align	3
.LC15:
	.string	"}"
	.align	3
.LC16:
	.string	" P0             | P1             ;"
	.align	3
.LC17:
	.string	" sw x5,0(x6)    | sw x5,0(x6)    ;"
	.align	3
.LC18:
	.string	" lw x7,0(x8)    | lw x7,0(x8)    ;"
	.align	3
.LC19:
	.string	" xor x9,x7,x7   | bne x7,x0,LC00 ;"
	.align	3
.LC20:
	.string	" add x12,x11,x9 | LC00:          ;"
	.align	3
.LC21:
	.string	" lw x10,0(x12)  | fence.i        ;"
	.align	3
.LC22:
	.string	"                | lw x9,0(x10)   ;"
	.align	3
.LC23:
	.string	""
	.align	3
.LC24:
	.string	"exists (0:x10=0 /\\ 1:x9=0)"
	.align	3
.LC25:
	.string	"Generated assembler"
	.align	3
.LC26:
	.string	"Bad topology %s, reverting to scan affinity\n"
	.align	3
.LC27:
	.string	"Warning: avail=%i, available=%i\n"
	.align	3
.LC28:
	.string	"SB+po-addr+po-ctrlfencei: n=%i, r=%i, s=%i"
	.align	3
.LC29:
	.string	", st=%i"
	.align	3
.LC30:
	.string	", i=%i"
	.align	3
.LC31:
	.string	", +ra"
	.align	3
.LC32:
	.string	", +ca"
	.align	3
.LC33:
	.string	", +sa"
	.align	3
.LC34:
	.string	", p='"
	.align	3
.LC35:
	.string	"'"
	.align	3
.LC36:
	.string	"\n"
	.align	3
.LC37:
	.string	"logical proc -> core: "
	.align	3
.LC38:
	.string	"thread allocation: \n"
	.align	3
.LC39:
	.string	"SB+po-addr+po-ctrlfencei, sum_hist"
	.align	3
.LC40:
	.string	"Test SB+po-addr+po-ctrlfencei Allowed\n"
	.align	3
.LC41:
	.string	"Histogram (%d states)\n"
	.align	3
.LC42:
	.string	"Observation SB+po-addr+po-ctrlfencei %s %lu %lu\n"
	.align	3
.LC44:
	.string	"Time SB+po-addr+po-ctrlfencei %.2f\n"
	.align	3
.LC45:
	.string	"Ok"
	.align	3
.LC46:
	.string	"\nWitnesses\n"
	.align	3
.LC47:
	.string	"Positive: %lu, Negative: %lu\n"
	.align	3
.LC48:
	.string	"Condition %s is %svalidated\n"
	.align	3
.LC49:
	.string	"Hash=1f6e6c1f172593dc2c91cdd9d39272bd\n"
	.align	3
.LC50:
	.string	"Cycle=Fre PodWR DpAddrdR Fre PodWR DpCtrlFenceIdR\n"
	.align	3
.LC51:
	.string	"PodWR"
	.align	3
.LC52:
	.string	"Relax SB+po-addr+po-ctrlfencei %s %s\n"
	.align	3
.LC53:
	.string	"Safe=Fre DpAddrdR DpCtrlFenceIdR\n"
	.align	3
.LC54:
	.string	"Generator=diy7 (version 7.51+4(dev))\n"
	.align	3
.LC55:
	.string	"Com=Fr Fr\n"
	.align	3
.LC56:
	.string	"Orig=PodWR DpAddrdR Fre PodWR DpCtrlFenceIdR Fre\n"
	.align	3
.LC57:
	.string	"No"
	.align	3
.LC58:
	.string	"NOT "
	.align	3
.LC59:
	.string	"Affinity=[1] [0] ; (0,1) (1,0)\n"
	.text
	.align	1
	.globl	SB_2B_po_2D_addr_2B_po_2D_ctrlfencei
	.type	SB_2B_po_2D_addr_2B_po_2D_ctrlfencei, @function
SB_2B_po_2D_addr_2B_po_2D_ctrlfencei:
	addi	sp,sp,-512
	sd	s0,496(sp)
	sd	s1,488(sp)
	sd	s2,480(sp)
	sd	s3,472(sp)
	sd	ra,504(sp)
	sd	s4,464(sp)
	sd	s5,456(sp)
	sd	s6,448(sp)
	sd	s7,440(sp)
	sd	s8,432(sp)
	sd	s9,424(sp)
	sd	s10,416(sp)
	sd	s11,408(sp)
	addi	s0,sp,512
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
	ble	a4,a5,.L214
	slli	a4,a5,32
	li	t1,-1
	mv	s5,a0
	li	a6,5
	addi	a0,a4,100
	srli	a7,t1,32
	addi	a1,a4,1
	addi	a2,s0,-360
	addi	a3,s0,-248
	slli	a6,a6,33
	sd	a0,-352(s0)
	li	a0,4
	sd	a4,-336(s0)
	sw	a5,-320(s0)
	sd	t1,-272(s0)
	sw	a5,-256(s0)
	sd	a6,-360(s0)
	sd	a0,-344(s0)
	sd	a1,-328(s0)
	sd	s5,-312(s0)
	sd	zero,-304(s0)
	sd	a7,-296(s0)
	sd	zero,-288(s0)
	sd	zero,-280(s0)
	sd	a7,-264(s0)
	mv	a5,a2
	mv	a4,a3
	addi	t1,s0,-264
.L131:
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
	bne	a5,t1,.L131
	ld	a6,0(a5)
	ld	a5,8(a5)
	mv	a1,s2
	mv	a0,s3
	sd	a5,8(a4)
	sd	a6,0(a4)
	call	parse_cmd@plt
	lw	a5,-144(s0)
	sd	sp,-480(s0)
	bnez	a5,.L215
.L132:
	call	timeofday@plt
	lw	a5,-248(s0)
	lw	a4,-236(s0)
	sd	a0,-488(s0)
	sw	a5,-400(s0)
	lw	a5,-240(s0)
	sw	a5,-396(s0)
	lw	a5,-244(s0)
	sw	a5,-392(s0)
	blez	a4,.L216
	lw	a5,-220(s0)
	sw	a4,-388(s0)
	li	a4,5
	beq	a5,a4,.L134
.L231:
	addiw	a5,a5,-3
	li	a4,2
	sgtu	a5,a5,a4
	li	s9,-1
.L135:
	lw	a4,-148(s0)
	sw	a5,-372(s0)
	beqz	a4,.L137
	sw	zero,-372(s0)
.L137:
	lw	a0,0(s5)
	li	a1,2
	call	coremap_seq@plt
	lw	s2,-232(s0)
	sd	a0,-368(s0)
	ld	s4,-200(s0)
	blez	s2,.L217
	lw	a2,0(s4)
	ble	s2,a2,.L139
	mv	a1,s2
	lla	a0,.LC27
	call	log_error@plt
	ld	s4,-200(s0)
.L139:
	lw	s6,-228(s0)
	blez	s6,.L140
.L232:
	slli	s7,s6,2
	addiw	a5,s6,-1
	add	s7,s7,s6
	slliw	s2,s6,1
	sd	a5,-432(s0)
	slli	s8,a5,3
	sd	s6,-496(s0)
	slli	s7,s7,3
.L141:
	lw	a4,-220(s0)
	li	a5,2
	mv	s11,s2
	beq	a4,a5,.L218
.L142:
	slli	a5,s11,2
	addi	a5,a5,15
	lw	a3,-400(s0)
	andi	a5,a5,-16
	sub	sp,sp,a5
	sw	s2,-376(s0)
	sw	a4,-384(s0)
	sw	s11,-380(s0)
	mv	s2,sp
	bnez	a3,.L219
.L143:
	li	a5,2
	beq	a4,a5,.L220
	li	a5,3
	beq	a4,a5,.L221
	li	a5,5
	beq	a4,a5,.L222
.L152:
	addi	s8,s8,15
	andi	s8,s8,-16
	addi	s7,s7,15
	sub	sp,sp,s8
	andi	s7,s7,-16
	sd	sp,-456(s0)
	sub	sp,sp,s7
	call	pm_create@plt
	mv	s9,a0
	mv	a0,s6
	sd	s9,-440(s0)
	call	pb_create@plt
	lw	s7,-208(s0)
	sd	a0,-448(s0)
	lw	a1,0(s4)
	mv	s8,sp
	blez	s7,.L223
	remw	a5,s7,a1
	sd	a5,-424(s0)
.L159:
	ld	a0,-424(s0)
	addi	s7,s2,8
	li	s11,0
	call	gcd@plt
	ld	s3,-456(s0)
	addi	a5,s0,-400
	mv	a2,s8
	sd	a0,-504(s0)
	mv	s8,s3
	li	s2,0
	li	s9,0
	li	s10,0
	sd	a5,-472(s0)
	j	.L166
.L226:
	mv	a0,s3
	lla	a1,zyva
	sd	a2,-464(s0)
	call	launch@plt
	ld	a2,-464(s0)
	addiw	s10,s10,1
	addi	s3,s3,8
	addi	a2,a2,40
	addi	s7,s7,8
	beq	s6,s10,.L224
.L166:
	ld	a5,-472(s0)
	lw	a1,-220(s0)
	addi	a0,s7,-8
	sd	a5,16(a2)
	ld	a5,-440(s0)
	sw	s10,24(a2)
	sd	a0,32(a2)
	sd	a5,0(a2)
	ld	a5,-448(s0)
	sd	a5,8(a2)
	li	a5,1
	beq	a1,a5,.L225
.L161:
	ld	a5,-432(s0)
	bgt	a5,s10,.L226
	mv	a0,a2
	sd	a2,-464(s0)
	call	zyva
	ld	a2,-464(s0)
	addiw	s10,s10,1
	mv	s2,a0
	addi	a2,a2,40
	addi	s3,s3,8
	addi	s7,s7,8
	bne	s6,s10,.L166
.L224:
	lw	a5,-396(s0)
	lw	s6,-392(s0)
	mul	s6,s6,a5
	ld	a5,-432(s0)
	beqz	a5,.L173
	ld	a5,-432(s0)
	addiw	s3,a5,-1
	slli	s3,s3,32
	ld	a5,-456(s0)
	srli	s3,s3,32
	addi	s3,s3,1
	slli	s3,s3,3
	add	s11,a5,s3
	lla	s3,.LC39
.L172:
	mv	a0,s8
	call	join@plt
	mv	s7,a0
	ld	a0,0(a0)
	call	sum_outs@plt
	bne	s6,a0,.L170
	ld	a2,8(s7)
	ld	a3,16(s7)
	add	a5,a2,a3
	beq	s6,a5,.L171
.L170:
	mv	a0,s3
	call	fatal@plt
	ld	a2,8(s7)
	ld	a3,16(s7)
.L171:
	ld	a4,8(s2)
	ld	a5,16(s2)
	ld	a1,0(s7)
	ld	a0,0(s2)
	add	a4,a4,a2
	add	a5,a5,a3
	li	a2,2
	sd	a4,8(s2)
	sd	a5,16(s2)
	call	merge_outs@plt
	sd	a0,0(s2)
	ld	a0,0(s7)
	addi	s8,s8,8
	call	free_outs@plt
	mv	a0,s7
	call	free@plt
	bne	s8,s11,.L172
.L173:
	mv	a0,s4
	call	cpus_free@plt
	call	timeofday@plt
	ld	a5,-488(s0)
	mv	s3,a0
	ld	a0,-440(s0)
	sub	s3,s3,a5
	call	pm_free@plt
	ld	a5,-496(s0)
	ld	a0,-448(s0)
	mul	s6,s6,a5
	call	pb_free@plt
	ld	a0,0(s2)
	call	sum_outs@plt
	bne	s6,a0,.L168
	ld	s4,8(s2)
	ld	s7,16(s2)
	add	a5,s4,s7
	beq	s6,a5,.L174
.L168:
	lla	a0,.LC39
	call	fatal@plt
	ld	s4,8(s2)
	ld	s7,16(s2)
.L174:
	li	a2,38
	li	a1,1
	mv	a3,s1
	lla	a0,.LC40
	call	fwrite@plt
	ld	a0,0(s2)
	call	finals_outs@plt
	mv	a3,a0
	lla	a2,.LC41
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	ld	a2,0(s2)
	li	a4,2
	addi	a3,s0,-136
	lla	a1,do_dump_outcome
	mv	a0,s1
	call	dump_outs@plt
	beqz	s4,.L227
	lla	a2,.LC8
	li	a1,1
	lla	a3,.LC45
	mv	a0,s1
	call	__fprintf_chk@plt
	mv	a3,s1
	li	a2,11
	li	a1,1
	lla	a0,.LC46
	call	fwrite@plt
	mv	a4,s7
	mv	a3,s4
	lla	a2,.LC47
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a4,.LC23
	lla	a2,.LC48
	li	a1,1
	lla	a3,.LC24
	mv	a0,s1
	call	__fprintf_chk@plt
	mv	a3,s1
	li	a2,38
	li	a1,1
	lla	a0,.LC49
	call	fwrite@plt
	mv	a3,s1
	li	a2,50
	li	a1,1
	lla	a0,.LC50
	call	fwrite@plt
	lla	a4,.LC51
	lla	a2,.LC52
	li	a1,1
	lla	a3,.LC45
	mv	a0,s1
	call	__fprintf_chk@plt
	mv	a3,s1
	li	a2,33
	li	a1,1
	lla	a0,.LC53
	call	fwrite@plt
	mv	a3,s1
	li	a2,37
	li	a1,1
	lla	a0,.LC54
	call	fwrite@plt
	mv	a3,s1
	li	a2,10
	li	a1,1
	lla	a0,.LC55
	call	fwrite@plt
	mv	a3,s1
	li	a2,49
	li	a1,1
	lla	a0,.LC56
	call	fwrite@plt
	lw	a4,-220(s0)
	li	a5,3
	beq	a4,a5,.L228
.L179:
	lla	s6,.LC5
	bnez	s7,.L229
.L177:
	mv	a5,s7
	mv	a4,s4
	mv	a3,s6
	lla	a2,.LC42
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	fcvt.d.lu	fa4,s3
	fld	fa5,.LC43,a5
	lla	a2,.LC44
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
	ld	a0,-368(s0)
	call	cpus_free@plt
	ld	a5,-200(s0)
	ld	sp,-480(s0)
	beq	a5,s5,.L130
	mv	a0,s5
.L214:
	call	cpus_free@plt
.L130:
	la	a5,__stack_chk_guard
	ld	a4,-120(s0)
	ld	a5,0(a5)
	bne	a4,a5,.L230
	addi	sp,s0,-512
	ld	ra,504(sp)
	ld	s0,496(sp)
	ld	s1,488(sp)
	ld	s2,480(sp)
	ld	s3,472(sp)
	ld	s4,464(sp)
	ld	s5,456(sp)
	ld	s6,448(sp)
	ld	s7,440(sp)
	ld	s8,432(sp)
	ld	s9,424(sp)
	ld	s10,416(sp)
	ld	s11,408(sp)
	li	a0,0
	addi	sp,sp,512
	jr	ra
.L216:
	lw	a5,-220(s0)
	li	a4,2
	sw	a4,-388(s0)
	li	a4,5
	bne	a5,a4,.L231
.L134:
	ld	a2,-192(s0)
	li	a1,2
	lla	a0,.LANCHOR2
	call	find_string@plt
	mv	s9,a0
	bltz	a0,.L136
	lw	a5,-220(s0)
	li	a4,2
	addiw	a5,a5,-3
	sgtu	a5,a5,a4
	j	.L135
.L217:
	lw	s6,-228(s0)
	lw	s2,0(s4)
	bgtz	s6,.L232
.L140:
	li	a5,1
	ble	s2,a5,.L182
	srai	s6,s2,1
	sraiw	s3,s2,1
	lw	a4,-220(s0)
	addiw	a5,s3,-1
	slli	s7,s6,2
	sd	a5,-432(s0)
	add	s7,s7,s6
	andi	s2,s2,-2
	slli	s8,a5,3
	sd	s6,-496(s0)
	li	a5,2
	slli	s7,s7,3
	mv	s11,s2
	bne	a4,a5,.L142
.L218:
	lw	a0,0(s4)
	mv	a1,s2
	call	max@plt
	lw	a4,-220(s0)
	mv	s11,a0
	j	.L142
.L225:
	ld	a1,8(s4)
	slli	a0,s9,2
	ld	a5,-424(s0)
	add	a0,a1,a0
	lw	a0,0(a0)
	addw	a5,a5,s9
	sw	a0,-8(s7)
	lw	a0,0(s4)
	remw	a5,a5,a0
	bne	a5,s11,.L162
	ld	a5,-504(s0)
	addiw	a4,s11,1
	remw	s11,a4,a5
	mv	a5,s11
.L162:
	slli	a0,a5,2
	add	a1,a1,a0
	lw	a1,0(a1)
	ld	a4,-424(s0)
	sw	a1,-4(s7)
	lw	a1,0(s4)
	addw	a5,a4,a5
	remw	s9,a5,a1
	bne	s9,s11,.L161
	ld	a5,-504(s0)
	addiw	a4,s11,1
	remw	s11,a4,a5
	mv	s9,s11
	j	.L161
.L227:
	lla	a2,.LC8
	li	a1,1
	lla	a3,.LC57
	mv	a0,s1
	call	__fprintf_chk@plt
	mv	a3,s1
	li	a2,11
	li	a1,1
	lla	a0,.LC46
	call	fwrite@plt
	mv	a4,s7
	li	a3,0
	lla	a2,.LC47
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a4,.LC58
	lla	a2,.LC48
	li	a1,1
	lla	a3,.LC24
	mv	a0,s1
	call	__fprintf_chk@plt
	mv	a3,s1
	li	a2,38
	li	a1,1
	lla	a0,.LC49
	call	fwrite@plt
	mv	a3,s1
	li	a2,50
	li	a1,1
	lla	a0,.LC50
	call	fwrite@plt
	lla	a4,.LC51
	lla	a2,.LC52
	li	a1,1
	lla	a3,.LC57
	mv	a0,s1
	call	__fprintf_chk@plt
	mv	a3,s1
	li	a2,33
	li	a1,1
	lla	a0,.LC53
	call	fwrite@plt
	mv	a3,s1
	li	a2,37
	li	a1,1
	lla	a0,.LC54
	call	fwrite@plt
	mv	a3,s1
	li	a2,10
	li	a1,1
	lla	a0,.LC55
	call	fwrite@plt
	mv	a3,s1
	li	a2,49
	li	a1,1
	lla	a0,.LC56
	call	fwrite@plt
	lw	a4,-220(s0)
	li	a5,3
	lla	s6,.LC4
	bne	a4,a5,.L177
	mv	a3,s1
	li	a2,31
	li	a1,1
	lla	a0,.LC59
	call	fwrite@plt
	j	.L177
.L223:
	blez	a1,.L184
	ld	a4,8(s4)
	li	a5,0
	li	a3,-1
.L160:
	sw	a3,0(a4)
	lw	a1,0(s4)
	addiw	a5,a5,1
	addi	a4,a4,4
	blt	a5,a1,.L160
.L184:
	li	a5,1
	sd	a5,-424(s0)
	j	.L159
.L220:
	blez	s11,.L152
	ld	a2,8(s4)
	mv	a3,s2
	li	a4,0
.L153:
	lw	a5,0(s4)
	addi	a3,a3,4
	remw	a5,a4,a5
	addiw	a4,a4,1
	slli	a5,a5,2
	add	a5,a2,a5
	lw	a5,0(a5)
	sw	a5,-4(a3)
	bne	s11,a4,.L153
	j	.L152
.L219:
	lw	a3,-396(s0)
	lw	a2,-392(s0)
	mv	a1,s6
	lla	a0,.LC28
	call	log_error@plt
	lw	a1,-388(s0)
	lla	a0,.LC29
	call	log_error@plt
	lw	a5,-220(s0)
	li	a4,1
	beq	a5,a4,.L233
	li	a4,2
	beq	a5,a4,.L234
	li	a4,3
	beq	a5,a4,.L235
	li	a4,4
	beq	a5,a4,.L236
.L145:
	lla	a0,.LC34
	call	log_error@plt
	la	s10,stderr
	ld	a1,-200(s0)
	ld	a0,0(s10)
	call	cpus_dump@plt
	lla	a0,.LC35
	call	log_error@plt
	lla	a0,.LC36
	call	log_error@plt
	lw	a4,-400(s0)
	li	a5,1
	ble	a4,a5,.L213
	ld	a5,-368(s0)
	beqz	a5,.L213
	lla	a0,.LC37
	call	log_error@plt
	ld	a0,0(s10)
	ld	a1,-368(s0)
	call	cpus_dump@plt
	lla	a0,.LC36
	call	log_error@plt
.L213:
	lw	a4,-220(s0)
	j	.L143
.L215:
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
	j	.L132
.L229:
	lla	s6,.LC6
	j	.L177
.L182:
	li	a5,1
	li	s7,40
	sd	a5,-496(s0)
	li	s8,0
	sd	zero,-432(s0)
	li	s2,2
	li	s6,1
	j	.L141
.L222:
	slliw	s9,s9,2
	slli	s9,s9,2
	lla	a4,.LANCHOR0
	add	a4,a4,s9
	blez	s11,.L152
	addiw	a5,s11,-1
	slli	a5,a5,32
	srli	a5,a5,32
	addi	a5,a5,1
	slli	a5,a5,2
	mv	a3,s2
	add	a5,a4,a5
.L157:
	lw	a2,0(a4)
	addi	a4,a4,4
	addi	a3,a3,4
	sw	a2,-4(a3)
	bne	a4,a5,.L157
	j	.L152
.L221:
	ld	a1,-368(s0)
	mv	a5,s6
	mv	a6,s2
	mv	a4,s4
	lla	a3,.LANCHOR0+32
	lla	a2,.LANCHOR2+16
	addi	a0,s0,-404
	sw	zero,-404(s0)
	call	custom_affinity@plt
	lw	a5,-400(s0)
	beqz	a5,.L152
	lla	a0,.LC38
	call	log_error@plt
	la	a5,stderr
	ld	a3,-368(s0)
	ld	a0,0(a5)
	li	a4,2
	mv	a2,s11
	mv	a1,s2
	call	cpus_dump_test@plt
	j	.L152
.L228:
	mv	a3,s1
	li	a2,31
	li	a1,1
	lla	a0,.LC59
	call	fwrite@plt
	j	.L179
.L233:
	lw	a1,-208(s0)
	lla	a0,.LC30
	call	log_error@plt
	j	.L145
.L234:
	lla	a0,.LC31
	call	log_error@plt
	j	.L145
.L136:
	ld	a1,-192(s0)
	lla	a0,.LC26
	call	log_error@plt
	li	a5,4
	sw	a5,-220(s0)
	sd	zero,-192(s0)
	li	a5,0
	j	.L135
.L235:
	lla	a0,.LC32
	call	log_error@plt
	j	.L145
.L236:
	lla	a0,.LC33
	call	log_error@plt
	j	.L145
.L230:
	call	__stack_chk_fail@plt
	.size	SB_2B_po_2D_addr_2B_po_2D_ctrlfencei, .-SB_2B_po_2D_addr_2B_po_2D_ctrlfencei
	.section	.rodata.str1.8
	.align	3
.LC60:
	.string	"[[0],[1]]"
	.align	3
.LC61:
	.string	"[[0,1]]"
	.section	.rodata.cst8,"aM",@progbits,8
	.align	3
.LC43:
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
	.dword	.LC60
	.dword	.LC61
	.type	color, @object
	.size	color, 24
color:
	.dword	color_0
	.dword	color_1
	.dword	0
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
