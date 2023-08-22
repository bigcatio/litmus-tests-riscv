	.file	"2+2W+fence.rw.rws.c"
	.option pic
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"%-6lu%c>[x]=%d; [y]=%d;\n"
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
	.string	"2+2W+fence.rw.rws, check_globals failed"
	.text
	.align	1
	.type	check_globals, @function
check_globals:
	ld	a5,80(a0)
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
	bltz	a4,.L10
	sext.w	s0,a5
	slli	a5,a5,32
	srli	a5,a5,32
	sub	s2,s2,a5
	slli	s2,s2,2
	addi	s1,a0,72
	slli	s0,s0,2
	addi	s2,s2,-8
	lla	s6,.LC1
.L9:
	mv	a0,s1
	call	rand_bit@plt
	add	a5,s3,s0
	beqz	a0,.L7
	lw	a5,0(a5)
	bnez	a5,.L25
.L7:
	mv	a0,s1
	call	rand_bit@plt
	add	a5,s4,s0
	addi	s0,s0,-4
	beqz	a0,.L8
	lw	a5,0(a5)
	bnez	a5,.L26
.L8:
	bne	s0,s2,.L9
.L10:
	ld	s0,48(sp)
	ld	a0,16(s5)
	ld	ra,56(sp)
	ld	s1,40(sp)
	ld	s2,32(sp)
	ld	s3,24(sp)
	ld	s4,16(sp)
	ld	s5,8(sp)
	ld	s6,0(sp)
	addi	sp,sp,64
	tail	pb_wait@plt
.L26:
	mv	a0,s6
	call	fatal@plt
	bne	s0,s2,.L9
	j	.L10
.L25:
	mv	a0,s6
	call	fatal@plt
	j	.L7
	.size	check_globals, .-check_globals
	.section	.rodata.str1.8
	.align	3
.LC2:
	.string	"%i: Stabilizing final state!\n"
	.text
	.align	1
	.type	stabilize_globals, @function
stabilize_globals:
	ld	a5,80(a1)
	addi	sp,sp,-112
	sd	s8,32(sp)
	mv	s8,a0
	ld	a0,16(a1)
	sd	s7,40(sp)
	lw	s7,4(a5)
	sd	s0,96(sp)
	sd	s1,88(sp)
	sd	s2,80(sp)
	mv	s1,a1
	sd	s3,72(sp)
	sd	s4,64(sp)
	sd	s5,56(sp)
	sd	s6,48(sp)
	sd	s9,24(sp)
	sd	s10,16(sp)
	sd	s11,8(sp)
	ld	s9,8(a1)
	ld	s11,0(a1)
	sd	ra,104(sp)
	call	pb_wait@plt
	addiw	a4,s7,-1
	slli	s0,a4,32
	addiw	a5,s8,1
	srli	s0,s0,32
	andi	a5,a5,1
	sub	s0,s7,s0
	addi	s6,s1,32
	addi	s5,s1,48
	slli	s3,s8,3
	slli	a5,a5,3
	slli	s0,s0,2
	add	s4,s6,s3
	addi	s10,s0,-8
	add	s3,s5,s3
	add	s6,s6,a5
	add	s5,s5,a5
	slli	s2,a4,2
	addi	s0,s0,-4
.L35:
	ld	a0,24(s1)
	blez	s7,.L28
	ld	a7,0(s4)
	ld	a6,0(s3)
	mv	a5,s2
.L29:
	add	a4,s9,a5
	lw	a1,0(a4)
	add	a3,a7,a5
	add	a4,s11,a5
	sw	a1,0(a3)
	lw	a3,0(a4)
	add	a4,a6,a5
	addi	a5,a5,-4
	sw	a3,0(a4)
	bne	a5,s10,.L29
	call	po_reinit@plt
	ld	a7,0(s4)
	ld	a6,0(s6)
	ld	a0,0(s3)
	ld	a1,0(s5)
	mv	a3,s2
.L33:
	add	a4,a0,a3
	add	a5,a1,a3
	lw	a4,0(a4)
	lw	a5,0(a5)
	beq	a4,a5,.L43
.L31:
	mv	a1,s8
	lla	a0,.LC2
	call	log_error@plt
	li	a1,1
.L34:
	ld	a0,24(s1)
	call	po_wait@plt
	bnez	a0,.L35
	ld	ra,104(sp)
	ld	s0,96(sp)
	ld	s1,88(sp)
	ld	s2,80(sp)
	ld	s3,72(sp)
	ld	s4,64(sp)
	ld	s5,56(sp)
	ld	s6,48(sp)
	ld	s7,40(sp)
	ld	s8,32(sp)
	ld	s9,24(sp)
	ld	s10,16(sp)
	ld	s11,8(sp)
	addi	sp,sp,112
	jr	ra
.L43:
	add	a4,a7,a3
	add	a5,a6,a3
	lw	a4,0(a4)
	lw	a5,0(a5)
	beq	s0,a3,.L32
	addi	a3,a3,-4
	beq	a4,a5,.L33
	j	.L31
.L32:
	li	a1,0
	beq	a4,a5,.L34
	j	.L31
.L28:
	call	po_reinit@plt
	li	a1,0
	j	.L34
	.size	stabilize_globals, .-stabilize_globals
	.section	.rodata.str1.8
	.align	3
.LC3:
	.string	"2+2W+fence.rw.rws"
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
# 47 "2+2W+fence.rw.rws.c" 1
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
	lla	a3,.LC3
	call	force_one_affinity@plt
	mv	a0,s0
	call	check_globals
	ld	a5,80(s0)
	lw	a7,0(s1)
	ld	t3,64(s0)
	lw	a6,12(a5)
	lw	t6,4(a5)
	blez	a6,.L48
	sub	t5,t6,a6
	negw	a0,a6
	subw	t4,t6,a6
	slli	t5,t5,2
	sext.w	t6,t6
	slli	a0,a0,2
	sext.w	a7,a7
	li	a1,1
	li	t1,2
.L47:
	sext.w	a2,t4
	mv	a3,t5
	bltz	t4,.L52
.L51:
	andi	a5,a2,1
	add	a4,t3,a3
	beq	a5,a7,.L61
.L49:
	lw	a5,0(a4)
	sext.w	a5,a5
	beqz	a5,.L49
.L50:
	ld	a5,0(s0)
	ld	a4,8(s0)
	add	a5,a5,a3
	add	a4,a4,a3
#APP
# 270 "2+2W+fence.rw.rws.c" 1
	
#START _litmus_P1
#_litmus_P1_0
	sw t1,0(a5)
#_litmus_P1_1
	fence rw,rw
#_litmus_P1_2
	sw a1,0(a4)
#END _litmus_P1

# 0 "" 2
#NO_APP
	subw	a2,a2,a6
	add	a3,a3,a0
	bgez	a2,.L51
.L52:
	addiw	t4,t4,1
	addi	t5,t5,4
	bne	t4,t6,.L47
.L48:
	mv	a1,s0
	li	a0,1
	call	stabilize_globals
#APP
# 47 "2+2W+fence.rw.rws.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	li	a0,0
	addi	sp,sp,32
	jr	ra
.L61:
	sw	a1,0(a4)
#APP
# 47 "2+2W+fence.rw.rws.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	j	.L50
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
# 47 "2+2W+fence.rw.rws.c" 1
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
	lla	a3,.LC3
	call	force_one_affinity@plt
	mv	a0,s0
	call	check_globals
	ld	a5,80(s0)
	lw	a7,0(s1)
	ld	t3,64(s0)
	lw	a6,12(a5)
	lw	t6,4(a5)
	blez	a6,.L66
	sub	t5,t6,a6
	negw	a0,a6
	subw	t4,t6,a6
	slli	t5,t5,2
	sext.w	t6,t6
	slli	a0,a0,2
	sext.w	a7,a7
	li	a1,1
	li	t1,2
.L65:
	sext.w	a2,t4
	mv	a3,t5
	bltz	t4,.L70
.L69:
	andi	a5,a2,1
	add	a4,t3,a3
	beq	a5,a7,.L79
.L67:
	lw	a5,0(a4)
	sext.w	a5,a5
	beqz	a5,.L67
.L68:
	ld	a5,8(s0)
	ld	a4,0(s0)
	add	a5,a5,a3
	add	a4,a4,a3
#APP
# 235 "2+2W+fence.rw.rws.c" 1
	
#START _litmus_P0
#_litmus_P0_0
	sw t1,0(a5)
#_litmus_P0_1
	fence rw,rw
#_litmus_P0_2
	sw a1,0(a4)
#END _litmus_P0

# 0 "" 2
#NO_APP
	subw	a2,a2,a6
	add	a3,a3,a0
	bgez	a2,.L69
.L70:
	addiw	t4,t4,1
	addi	t5,t5,4
	bne	t4,t6,.L65
.L66:
	mv	a1,s0
	li	a0,0
	call	stabilize_globals
#APP
# 47 "2+2W+fence.rw.rws.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	li	a0,0
	addi	sp,sp,32
	jr	ra
.L79:
	sw	a1,0(a4)
#APP
# 47 "2+2W+fence.rw.rws.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	j	.L68
	.size	P0, .-P0
	.section	.rodata.str1.8
	.align	3
.LC4:
	.string	"Run %i of %i\r"
	.align	3
.LC5:
	.string	"2+2W+fence.rw.rws, global x unstabilized"
	.align	3
.LC6:
	.string	"2+2W+fence.rw.rws, global y unstabilized"
	.text
	.align	1
	.type	zyva, @function
zyva:
	addi	sp,sp,-368
	la	a5,__stack_chk_guard
	ld	a5,0(a5)
	sd	s4,320(sp)
	mv	s4,a0
	ld	a0,8(a0)
	sd	ra,360(sp)
	sd	s0,352(sp)
	sd	s1,344(sp)
	sd	s2,336(sp)
	sd	a5,248(sp)
	ld	s2,16(s4)
	sd	s3,328(sp)
	sd	s5,312(sp)
	sd	s6,304(sp)
	sd	s7,296(sp)
	sd	s8,288(sp)
	sd	s9,280(sp)
	sd	s10,272(sp)
	sd	s11,264(sp)
	call	pb_wait@plt
	lla	a5,P0
	sd	a5,80(sp)
	li	a0,24
	lla	a5,P1
	sd	a5,88(sp)
	call	malloc_check@plt
	lw	s1,4(s2)
	sd	zero,0(a0)
	sd	zero,16(a0)
	sd	zero,8(a0)
	slli	s1,s1,2
	mv	s0,a0
	sd	s2,240(sp)
	call	rand@plt
	mv	a5,a0
	mv	a0,s1
	sw	a5,232(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s1
	sd	a5,160(sp)
	call	malloc_check@plt
	mv	a5,a0
	li	a0,2
	sd	a5,168(sp)
	call	pb_create@plt
	mv	a5,a0
	li	a0,2
	sd	a5,176(sp)
	call	po_create@plt
	mv	a5,a0
	mv	a0,s1
	sd	a5,184(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s1
	sd	a5,200(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s1
	sd	a5,216(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s1
	sd	a5,192(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s1
	sd	a5,208(sp)
	call	malloc_check@plt
	ld	a4,32(s4)
	lw	a3,8(s2)
	li	a5,1
	sw	a5,136(sp)
	addi	a5,sp,160
	sd	a0,224(sp)
	sd	a5,152(sp)
	sd	a4,144(sp)
	sw	zero,112(sp)
	sd	a5,128(sp)
	sd	a4,120(sp)
	blez	a3,.L81
	addi	a5,sp,112
	sd	a5,32(sp)
	addi	a5,sp,136
	sd	a5,40(sp)
	addi	a5,sp,64
	sd	a5,8(sp)
	addi	a5,sp,72
	sd	a5,16(sp)
	addi	a5,sp,232
	sd	a5,48(sp)
	addi	a5,sp,80
	sd	zero,0(sp)
	sd	a5,56(sp)
	addi	s6,sp,96
	lla	s7,.LC5
.L102:
	lw	a5,16(s2)
	li	a4,2
	beq	a5,a4,.L125
	li	a4,4
	beq	a5,a4,.L126
.L84:
	lw	a4,0(s2)
	li	a5,1
	ble	a4,a5,.L85
	la	a5,stderr
	lw	a4,8(s2)
	ld	a0,0(a5)
	ld	a3,0(sp)
	lla	a2,.LC4
	li	a1,1
	call	__fprintf_chk@plt
.L85:
	ld	a5,240(sp)
	lw	a4,4(a5)
	addiw	a2,a4,-1
	slli	a3,a2,32
	sext.w	a5,a2
	bltz	a3,.L86
	slli	a2,a2,32
	srli	a2,a2,32
	sub	a2,a4,a2
	ld	a6,160(sp)
	ld	a0,168(sp)
	ld	a1,224(sp)
	slli	a2,a2,2
	slli	a5,a5,2
	addi	a2,a2,-8
.L87:
	add	a4,a6,a5
	sw	zero,0(a4)
	add	a3,a0,a5
	add	a4,a1,a5
	sw	zero,0(a3)
	sw	zero,0(a4)
	addi	a5,a5,-4
	bne	a2,a5,.L87
.L86:
	lw	a5,28(s2)
	bnez	a5,.L127
.L88:
	ld	a1,88(sp)
	ld	a0,16(sp)
	ld	a2,40(sp)
	call	launch@plt
	ld	a2,32(sp)
	ld	a1,80(sp)
	ld	a0,8(sp)
	call	launch@plt
	lw	a5,28(s2)
	bnez	a5,.L128
.L89:
	ld	a0,16(sp)
	call	join@plt
	ld	a0,8(sp)
	call	join@plt
	lw	a4,4(s2)
	addiw	s1,a4,-1
	slli	a3,s1,32
	sext.w	a5,s1
	bltz	a3,.L90
	slli	s1,s1,32
	srli	s1,s1,32
	sub	s1,a4,s1
	ld	a4,0(sp)
	slli	s11,a5,2
	lla	a5,.LANCHOR1
	andi	s8,a4,1
	slli	s8,s8,3
	slli	s1,s1,2
	add	a5,a5,s8
	addi	s1,s1,-8
	lla	s5,.LC6
	li	s3,2
	sd	a5,24(sp)
	j	.L101
.L131:
	ld	a3,32(s4)
	lw	a3,0(a3)
	bltz	a3,.L97
	bnez	s8,.L129
.L98:
	ld	a4,16(s0)
	addi	s11,s11,-4
	addi	a4,a4,1
	sd	a4,16(s0)
	beq	s11,s1,.L90
.L101:
	ld	a3,168(sp)
	ld	a4,200(sp)
	add	a3,a3,s11
	add	a4,a4,s11
	lw	s9,0(a3)
	lw	a3,0(a4)
	ld	a4,160(sp)
	add	a4,a4,s11
	lw	s10,0(a4)
	beq	a3,s9,.L91
	mv	a0,s7
	call	fatal@plt
.L91:
	ld	a4,192(sp)
	add	a4,a4,s11
	lw	a4,0(a4)
	beq	a4,s9,.L92
	mv	a0,s7
	call	fatal@plt
.L92:
	ld	a4,216(sp)
	add	a4,a4,s11
	lw	a4,0(a4)
	beq	a4,s10,.L93
	mv	a0,s5
	call	fatal@plt
.L93:
	ld	a4,208(sp)
	add	a4,a4,s11
	lw	a4,0(a4)
	beq	a4,s10,.L94
	mv	a0,s5
	call	fatal@plt
.L94:
	li	s8,0
	bne	s9,s3,.L95
	addi	a4,s10,-2
	seqz	s8,a4
.L95:
	ld	a0,0(s0)
	li	a3,1
	li	a2,2
	mv	a4,s8
	mv	a1,s6
	sd	s9,96(sp)
	sd	s10,104(sp)
	call	add_outcome_outs@plt
	lw	a3,16(s2)
	li	a2,4
	sd	a0,0(s0)
	beq	a3,a2,.L130
	li	a2,5
	beq	a3,a2,.L131
.L97:
	beqz	s8,.L98
.L99:
	ld	a4,8(s0)
	addi	s11,s11,-4
	addi	a4,a4,1
	sd	a4,8(s0)
	bne	s11,s1,.L101
.L90:
	ld	a4,0(sp)
	lw	a5,8(s2)
	addiw	a4,a4,1
	sd	a4,0(sp)
	bgt	a5,a4,.L102
.L81:
	ld	a0,160(sp)
	call	free@plt
	ld	a0,168(sp)
	call	free@plt
	ld	a0,176(sp)
	call	pb_free@plt
	ld	a0,184(sp)
	call	po_free@plt
	ld	a0,200(sp)
	call	free@plt
	ld	a0,216(sp)
	call	free@plt
	ld	a0,192(sp)
	call	free@plt
	ld	a0,208(sp)
	call	free@plt
	ld	a0,224(sp)
	call	free@plt
	la	a5,__stack_chk_guard
	ld	a4,248(sp)
	ld	a5,0(a5)
	bne	a4,a5,.L132
	ld	ra,360(sp)
	mv	a0,s0
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
	ld	s11,264(sp)
	addi	sp,sp,368
	jr	ra
.L130:
	ld	a3,32(s4)
	lw	a3,0(a3)
	bltz	a3,.L97
	beqz	s8,.L98
	ld	a0,0(s4)
	call	pm_lock@plt
	ld	a5,24(sp)
.L124:
	ld	a4,0(a5)
	ld	a0,0(s4)
	addi	a4,a4,1
	sd	a4,0(a5)
	call	pm_unlock@plt
	j	.L99
.L129:
	ld	a0,0(s4)
	call	pm_lock@plt
	lla	a5,.LANCHOR1
	j	.L124
.L128:
	ld	a1,8(sp)
	ld	a0,48(sp)
	li	a2,2
	call	perm_threads@plt
	j	.L89
.L127:
	ld	a1,56(sp)
	ld	a0,48(sp)
	li	a2,2
	call	perm_funs@plt
	j	.L88
.L125:
	ld	a0,8(s4)
	call	pb_wait@plt
	lw	a5,24(s4)
	beqz	a5,.L133
.L83:
	ld	a0,8(s4)
	call	pb_wait@plt
	j	.L84
.L126:
	ld	a0,8(s4)
	call	pb_wait@plt
	ld	a5,0(sp)
	lw	a4,24(s4)
	lla	a3,.LANCHOR0
	andi	a5,a5,1
	slliw	a5,a5,2
	slliw	a4,a4,1
	slli	a5,a5,2
	add	a5,a3,a5
	slli	a3,a4,2
	add	a3,a5,a3
	ld	a2,32(s4)
	lw	a3,0(a3)
	addi	a4,a4,1
	slli	a4,a4,2
	sw	a3,0(a2)
	add	a5,a5,a4
	lw	a5,0(a5)
	ld	a0,8(s4)
	sw	a5,4(a2)
	call	pb_wait@plt
	j	.L84
.L133:
	lw	a3,20(s2)
	lw	a2,24(s2)
	ld	a1,32(s4)
	ld	a0,48(sp)
	call	perm_prefix_ints@plt
	j	.L83
.L132:
	call	__stack_chk_fail@plt
	.size	zyva, .-zyva
	.section	.rodata.str1.8
	.align	3
.LC7:
	.string	"Never"
	.align	3
.LC8:
	.string	"Always"
	.align	3
.LC9:
	.string	"Sometimes"
	.align	3
.LC10:
	.string	"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
	.align	3
.LC11:
	.string	"%s\n"
	.align	3
.LC12:
	.string	"% Results for tests/non-mixed-size/SAFE/2+2W+fence.rw.rws.litmus %"
	.align	3
.LC13:
	.string	"RISCV 2+2W+fence.rw.rws"
	.align	3
.LC14:
	.string	"\"Fence.rw.rwdWW Wse Fence.rw.rwdWW Wse\""
	.align	3
.LC15:
	.string	"{"
	.align	3
.LC16:
	.string	" 0:x5=2; 0:x6=x; 0:x7=1; 0:x8=y;"
	.align	3
.LC17:
	.string	" 1:x5=2; 1:x6=y; 1:x7=1; 1:x8=x;"
	.align	3
.LC18:
	.string	"}"
	.align	3
.LC19:
	.string	" P0          | P1          ;"
	.align	3
.LC20:
	.string	" sw x5,0(x6) | sw x5,0(x6) ;"
	.align	3
.LC21:
	.string	" fence rw,rw | fence rw,rw ;"
	.align	3
.LC22:
	.string	" sw x7,0(x8) | sw x7,0(x8) ;"
	.align	3
.LC23:
	.string	""
	.align	3
.LC24:
	.string	"exists ([x]=2 /\\ [y]=2)"
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
	.string	"2+2W+fence.rw.rws: n=%i, r=%i, s=%i"
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
	.string	"2+2W+fence.rw.rws, sum_hist"
	.align	3
.LC40:
	.string	"Test 2+2W+fence.rw.rws Allowed\n"
	.align	3
.LC41:
	.string	"Histogram (%d states)\n"
	.align	3
.LC42:
	.string	"Observation 2+2W+fence.rw.rws %s %lu %lu\n"
	.align	3
.LC44:
	.string	"Time 2+2W+fence.rw.rws %.2f\n"
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
	.string	"Hash=27f8f5fc72384aa640b218d931fa73d7\n"
	.align	3
.LC50:
	.string	"Cycle=Wse Fence.rw.rwdWW Wse Fence.rw.rwdWW\n"
	.align	3
.LC51:
	.string	"Relax 2+2W+fence.rw.rws %s %s\n"
	.align	3
.LC52:
	.string	"Safe=Wse Fence.rw.rwdWW\n"
	.align	3
.LC53:
	.string	"Generator=diy7 (version 7.51+4(dev))\n"
	.align	3
.LC54:
	.string	"Com=Ws Ws\n"
	.align	3
.LC55:
	.string	"Orig=Fence.rw.rwdWW Wse Fence.rw.rwdWW Wse\n"
	.align	3
.LC56:
	.string	"No"
	.align	3
.LC57:
	.string	"NOT "
	.align	3
.LC58:
	.string	"Affinity=[1] [0] ; \n"
	.text
	.align	1
	.globl	_X2_2B_2W_2B_fence_2E_rw_2E_rws
	.type	_X2_2B_2W_2B_fence_2E_rw_2E_rws, @function
_X2_2B_2W_2B_fence_2E_rw_2E_rws:
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
	ble	a4,a5,.L220
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
.L137:
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
	bne	a5,t1,.L137
	ld	a6,0(a5)
	ld	a5,8(a5)
	mv	a1,s2
	mv	a0,s3
	sd	a5,8(a4)
	sd	a6,0(a4)
	call	parse_cmd@plt
	lw	a5,-144(s0)
	sd	sp,-480(s0)
	bnez	a5,.L221
.L138:
	call	timeofday@plt
	lw	a5,-248(s0)
	lw	a4,-236(s0)
	sd	a0,-488(s0)
	sw	a5,-400(s0)
	lw	a5,-240(s0)
	sw	a5,-396(s0)
	lw	a5,-244(s0)
	sw	a5,-392(s0)
	blez	a4,.L222
	lw	a5,-220(s0)
	sw	a4,-388(s0)
	li	a4,5
	beq	a5,a4,.L140
.L237:
	addiw	a5,a5,-3
	li	a4,2
	sgtu	a5,a5,a4
	li	s9,-1
.L141:
	lw	a4,-148(s0)
	sw	a5,-372(s0)
	beqz	a4,.L143
	sw	zero,-372(s0)
.L143:
	lw	a0,0(s5)
	li	a1,2
	call	coremap_seq@plt
	lw	s2,-232(s0)
	sd	a0,-368(s0)
	ld	s4,-200(s0)
	blez	s2,.L223
	lw	a2,0(s4)
	ble	s2,a2,.L145
	mv	a1,s2
	lla	a0,.LC27
	call	log_error@plt
	ld	s4,-200(s0)
.L145:
	lw	s6,-228(s0)
	blez	s6,.L146
.L238:
	slli	s7,s6,2
	addiw	a5,s6,-1
	add	s7,s7,s6
	slliw	s2,s6,1
	sd	a5,-432(s0)
	slli	s8,a5,3
	sd	s6,-496(s0)
	slli	s7,s7,3
.L147:
	lw	a4,-220(s0)
	li	a5,2
	mv	s11,s2
	beq	a4,a5,.L224
.L148:
	slli	a5,s11,2
	addi	a5,a5,15
	lw	a3,-400(s0)
	andi	a5,a5,-16
	sub	sp,sp,a5
	sw	s2,-376(s0)
	sw	a4,-384(s0)
	sw	s11,-380(s0)
	mv	s2,sp
	bnez	a3,.L225
.L149:
	li	a5,2
	beq	a4,a5,.L226
	li	a5,3
	beq	a4,a5,.L227
	li	a5,5
	beq	a4,a5,.L228
.L158:
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
	blez	s7,.L229
	remw	a5,s7,a1
	sd	a5,-424(s0)
.L165:
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
	j	.L172
.L232:
	mv	a0,s3
	lla	a1,zyva
	sd	a2,-464(s0)
	call	launch@plt
	ld	a2,-464(s0)
	addiw	s10,s10,1
	addi	s3,s3,8
	addi	a2,a2,40
	addi	s7,s7,8
	beq	s6,s10,.L230
.L172:
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
	beq	a1,a5,.L231
.L167:
	ld	a5,-432(s0)
	bgt	a5,s10,.L232
	mv	a0,a2
	sd	a2,-464(s0)
	call	zyva
	ld	a2,-464(s0)
	addiw	s10,s10,1
	mv	s2,a0
	addi	a2,a2,40
	addi	s3,s3,8
	addi	s7,s7,8
	bne	s6,s10,.L172
.L230:
	lw	a5,-396(s0)
	lw	s6,-392(s0)
	mul	s6,s6,a5
	ld	a5,-432(s0)
	beqz	a5,.L179
	ld	a5,-432(s0)
	addiw	s3,a5,-1
	slli	s3,s3,32
	ld	a5,-456(s0)
	srli	s3,s3,32
	addi	s3,s3,1
	slli	s3,s3,3
	add	s11,a5,s3
	lla	s3,.LC39
.L178:
	mv	a0,s8
	call	join@plt
	mv	s7,a0
	ld	a0,0(a0)
	call	sum_outs@plt
	bne	s6,a0,.L176
	ld	a2,8(s7)
	ld	a3,16(s7)
	add	a5,a2,a3
	beq	s6,a5,.L177
.L176:
	mv	a0,s3
	call	fatal@plt
	ld	a2,8(s7)
	ld	a3,16(s7)
.L177:
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
	bne	s8,s11,.L178
.L179:
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
	bne	s6,a0,.L174
	ld	s4,8(s2)
	ld	s7,16(s2)
	add	a5,s4,s7
	beq	s6,a5,.L180
.L174:
	lla	a0,.LC39
	call	fatal@plt
	ld	s4,8(s2)
	ld	s7,16(s2)
.L180:
	li	a2,31
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
	beqz	s4,.L233
	lla	a2,.LC11
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
	li	a2,44
	li	a1,1
	lla	a0,.LC50
	call	fwrite@plt
	lla	a4,.LC23
	lla	a2,.LC51
	li	a1,1
	lla	a3,.LC45
	mv	a0,s1
	call	__fprintf_chk@plt
	mv	a3,s1
	li	a2,24
	li	a1,1
	lla	a0,.LC52
	call	fwrite@plt
	mv	a3,s1
	li	a2,37
	li	a1,1
	lla	a0,.LC53
	call	fwrite@plt
	mv	a3,s1
	li	a2,10
	li	a1,1
	lla	a0,.LC54
	call	fwrite@plt
	mv	a3,s1
	li	a2,43
	li	a1,1
	lla	a0,.LC55
	call	fwrite@plt
	lw	a4,-220(s0)
	li	a5,3
	beq	a4,a5,.L234
.L185:
	lla	s6,.LC8
	bnez	s7,.L235
.L183:
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
	beq	a5,s5,.L136
	mv	a0,s5
.L220:
	call	cpus_free@plt
.L136:
	la	a5,__stack_chk_guard
	ld	a4,-120(s0)
	ld	a5,0(a5)
	bne	a4,a5,.L236
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
.L222:
	lw	a5,-220(s0)
	li	a4,2
	sw	a4,-388(s0)
	li	a4,5
	bne	a5,a4,.L237
.L140:
	ld	a2,-192(s0)
	li	a1,2
	lla	a0,.LANCHOR2
	call	find_string@plt
	mv	s9,a0
	bltz	a0,.L142
	lw	a5,-220(s0)
	li	a4,2
	addiw	a5,a5,-3
	sgtu	a5,a5,a4
	j	.L141
.L223:
	lw	s6,-228(s0)
	lw	s2,0(s4)
	bgtz	s6,.L238
.L146:
	li	a5,1
	ble	s2,a5,.L188
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
	bne	a4,a5,.L148
.L224:
	lw	a0,0(s4)
	mv	a1,s2
	call	max@plt
	lw	a4,-220(s0)
	mv	s11,a0
	j	.L148
.L231:
	ld	a1,8(s4)
	slli	a0,s9,2
	ld	a5,-424(s0)
	add	a0,a1,a0
	lw	a0,0(a0)
	addw	a5,a5,s9
	sw	a0,-8(s7)
	lw	a0,0(s4)
	remw	a5,a5,a0
	bne	a5,s11,.L168
	ld	a5,-504(s0)
	addiw	a4,s11,1
	remw	s11,a4,a5
	mv	a5,s11
.L168:
	slli	a0,a5,2
	add	a1,a1,a0
	lw	a1,0(a1)
	ld	a4,-424(s0)
	sw	a1,-4(s7)
	lw	a1,0(s4)
	addw	a5,a4,a5
	remw	s9,a5,a1
	bne	s9,s11,.L167
	ld	a5,-504(s0)
	addiw	a4,s11,1
	remw	s11,a4,a5
	mv	s9,s11
	j	.L167
.L233:
	lla	a2,.LC11
	li	a1,1
	lla	a3,.LC56
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
	lla	a4,.LC57
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
	li	a2,44
	li	a1,1
	lla	a0,.LC50
	call	fwrite@plt
	lla	a4,.LC23
	lla	a2,.LC51
	li	a1,1
	lla	a3,.LC56
	mv	a0,s1
	call	__fprintf_chk@plt
	mv	a3,s1
	li	a2,24
	li	a1,1
	lla	a0,.LC52
	call	fwrite@plt
	mv	a3,s1
	li	a2,37
	li	a1,1
	lla	a0,.LC53
	call	fwrite@plt
	mv	a3,s1
	li	a2,10
	li	a1,1
	lla	a0,.LC54
	call	fwrite@plt
	mv	a3,s1
	li	a2,43
	li	a1,1
	lla	a0,.LC55
	call	fwrite@plt
	lw	a4,-220(s0)
	li	a5,3
	lla	s6,.LC7
	bne	a4,a5,.L183
	mv	a3,s1
	li	a2,20
	li	a1,1
	lla	a0,.LC58
	call	fwrite@plt
	j	.L183
.L229:
	blez	a1,.L190
	ld	a4,8(s4)
	li	a5,0
	li	a3,-1
.L166:
	sw	a3,0(a4)
	lw	a1,0(s4)
	addiw	a5,a5,1
	addi	a4,a4,4
	blt	a5,a1,.L166
.L190:
	li	a5,1
	sd	a5,-424(s0)
	j	.L165
.L226:
	blez	s11,.L158
	ld	a2,8(s4)
	mv	a3,s2
	li	a4,0
.L159:
	lw	a5,0(s4)
	addi	a3,a3,4
	remw	a5,a4,a5
	addiw	a4,a4,1
	slli	a5,a5,2
	add	a5,a2,a5
	lw	a5,0(a5)
	sw	a5,-4(a3)
	bne	s11,a4,.L159
	j	.L158
.L225:
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
	beq	a5,a4,.L239
	li	a4,2
	beq	a5,a4,.L240
	li	a4,3
	beq	a5,a4,.L241
	li	a4,4
	beq	a5,a4,.L242
.L151:
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
	ble	a4,a5,.L219
	ld	a5,-368(s0)
	beqz	a5,.L219
	lla	a0,.LC37
	call	log_error@plt
	ld	a0,0(s10)
	ld	a1,-368(s0)
	call	cpus_dump@plt
	lla	a0,.LC36
	call	log_error@plt
.L219:
	lw	a4,-220(s0)
	j	.L149
.L221:
	lla	a3,.LC10
	lla	a2,.LC11
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC12
	lla	a2,.LC11
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC10
	lla	a2,.LC11
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC13
	lla	a2,.LC11
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC14
	lla	a2,.LC11
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC15
	lla	a2,.LC11
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC16
	lla	a2,.LC11
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC17
	lla	a2,.LC11
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC18
	lla	a2,.LC11
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC19
	lla	a2,.LC11
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC20
	lla	a2,.LC11
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC21
	lla	a2,.LC11
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC22
	lla	a2,.LC11
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC23
	lla	a2,.LC11
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC24
	lla	a2,.LC11
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC25
	lla	a2,.LC11
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	j	.L138
.L235:
	lla	s6,.LC9
	j	.L183
.L188:
	li	a5,1
	li	s7,40
	sd	a5,-496(s0)
	li	s8,0
	sd	zero,-432(s0)
	li	s2,2
	li	s6,1
	j	.L147
.L228:
	slliw	s9,s9,2
	slli	s9,s9,2
	lla	a4,.LANCHOR0
	add	a4,a4,s9
	blez	s11,.L158
	addiw	a5,s11,-1
	slli	a5,a5,32
	srli	a5,a5,32
	addi	a5,a5,1
	slli	a5,a5,2
	mv	a3,s2
	add	a5,a4,a5
.L163:
	lw	a2,0(a4)
	addi	a4,a4,4
	addi	a3,a3,4
	sw	a2,-4(a3)
	bne	a4,a5,.L163
	j	.L158
.L227:
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
	beqz	a5,.L158
	lla	a0,.LC38
	call	log_error@plt
	la	a5,stderr
	ld	a3,-368(s0)
	ld	a0,0(a5)
	li	a4,2
	mv	a2,s11
	mv	a1,s2
	call	cpus_dump_test@plt
	j	.L158
.L234:
	mv	a3,s1
	li	a2,20
	li	a1,1
	lla	a0,.LC58
	call	fwrite@plt
	j	.L185
.L239:
	lw	a1,-208(s0)
	lla	a0,.LC30
	call	log_error@plt
	j	.L151
.L240:
	lla	a0,.LC31
	call	log_error@plt
	j	.L151
.L142:
	ld	a1,-192(s0)
	lla	a0,.LC26
	call	log_error@plt
	li	a5,4
	sw	a5,-220(s0)
	sd	zero,-192(s0)
	li	a5,0
	j	.L141
.L241:
	lla	a0,.LC32
	call	log_error@plt
	j	.L151
.L242:
	lla	a0,.LC33
	call	log_error@plt
	j	.L151
.L236:
	call	__stack_chk_fail@plt
	.size	_X2_2B_2W_2B_fence_2E_rw_2E_rws, .-_X2_2B_2W_2B_fence_2E_rw_2E_rws
	.section	.rodata.str1.8
	.align	3
.LC59:
	.string	"[[0],[1]]"
	.align	3
.LC60:
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
	.size	diff, 4
diff:
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
	.dword	.LC59
	.dword	.LC60
	.type	color, @object
	.size	color, 24
color:
	.dword	color_0
	.dword	color_1
	.dword	0
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
