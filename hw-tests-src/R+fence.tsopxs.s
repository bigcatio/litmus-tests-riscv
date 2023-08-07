	.file	"R+fence.tsopxs.c"
	.option pic
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"%-6lu%c>0:x8=%d; 0:x9=%d; 1:x8=%d; 1:x9=%d; [x]=%d; [y]=%d;\n"
	.text
	.align	1
	.type	do_dump_outcome, @function
do_dump_outcome:
	addi	sp,sp,-48
	sd	ra,40(sp)
	li	a4,58
	beqz	a3,.L2
	li	a4,42
.L2:
	lw	a3,24(a1)
	lw	t3,40(a1)
	lw	t1,32(a1)
	lw	a7,16(a1)
	lw	a6,8(a1)
	lw	a5,0(a1)
	sd	a3,0(sp)
	sd	t3,16(sp)
	sd	t1,8(sp)
	mv	a3,a2
	li	a1,1
	lla	a2,.LC0
	call	__fprintf_chk@plt
	ld	ra,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	do_dump_outcome, .-do_dump_outcome
	.section	.rodata.str1.8
	.align	3
.LC1:
	.string	"R+fence.tsopxs, check_globals failed"
	.text
	.align	1
	.type	check_globals, @function
check_globals:
	ld	a5,112(a0)
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
	addi	s1,a0,104
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
	.string	"%i: Stabilizing final state!\n"
	.text
	.align	1
	.type	stabilize_globals, @function
stabilize_globals:
	ld	a5,112(a1)
	addi	sp,sp,-112
	sd	s8,32(sp)
	mv	s8,a0
	ld	a0,48(a1)
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
	addi	s6,s1,64
	addi	s5,s1,80
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
.L37:
	ld	a0,56(s1)
	blez	s7,.L30
	ld	a7,0(s4)
	ld	a6,0(s3)
	mv	a5,s2
.L31:
	add	a4,s9,a5
	lw	a1,0(a4)
	add	a3,a7,a5
	add	a4,s11,a5
	sw	a1,0(a3)
	lw	a3,0(a4)
	add	a4,a6,a5
	addi	a5,a5,-4
	sw	a3,0(a4)
	bne	a5,s10,.L31
	call	po_reinit@plt
	ld	a7,0(s4)
	ld	a6,0(s6)
	ld	a0,0(s3)
	ld	a1,0(s5)
	mv	a3,s2
.L35:
	add	a4,a0,a3
	add	a5,a1,a3
	lw	a4,0(a4)
	lw	a5,0(a5)
	beq	a4,a5,.L45
.L33:
	mv	a1,s8
	lla	a0,.LC2
	call	log_error@plt
	li	a1,1
.L36:
	ld	a0,56(s1)
	call	po_wait@plt
	bnez	a0,.L37
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
.L45:
	add	a4,a7,a3
	add	a5,a6,a3
	lw	a4,0(a4)
	lw	a5,0(a5)
	beq	s0,a3,.L34
	addi	a3,a3,-4
	beq	a4,a5,.L35
	j	.L33
.L34:
	li	a1,0
	beq	a4,a5,.L36
	j	.L33
.L30:
	call	po_reinit@plt
	li	a1,0
	j	.L36
	.size	stabilize_globals, .-stabilize_globals
	.section	.rodata.str1.8
	.align	3
.LC3:
	.string	"R+fence.tsopxs"
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
# 47 "R+fence.tsopxs.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	ld	s0,16(a0)
	lw	a4,0(a0)
	ld	a5,8(a0)
	ld	a3,112(s0)
	slli	a4,a4,2
	add	a5,a5,a4
	lw	a0,0(a5)
	lw	a2,0(a3)
	li	a1,4
	lla	a3,.LC3
	call	force_one_affinity@plt
	mv	a0,s0
	call	check_globals
	ld	a5,112(s0)
	lw	t3,0(s1)
	ld	t4,96(s0)
	lw	t1,12(a5)
	lw	t0,4(a5)
	blez	t1,.L50
	sub	t6,t0,t1
	negw	a7,t1
	subw	t5,t0,t1
	slli	t6,t6,2
	sext.w	t0,t0
	slli	a7,a7,2
	sext.w	t3,t3
	li	t2,1
	li	a1,2
.L49:
	sext.w	a2,t5
	mv	a3,t6
	bltz	t5,.L54
.L53:
	andi	a5,a2,1
	add	a4,t4,a3
	beq	a5,t3,.L63
.L51:
	lw	a5,0(a4)
	sext.w	a5,a5
	beqz	a5,.L51
.L52:
	ld	a5,0(s0)
	ld	a4,8(s0)
	add	a5,a5,a3
	add	a4,a4,a3
#APP
# 300 "R+fence.tsopxs.c" 1
	
#START _litmus_P1
#_litmus_P1_0
	sw a1,0(a5)
#_litmus_P1_1
	fence.tso
#_litmus_P1_2
	lr.w a0,0(a4)
#_litmus_P1_3
	sc.w a6,a0,0(a4)
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
	bgez	a2,.L53
.L54:
	addiw	t5,t5,1
	addi	t6,t6,4
	bne	t5,t0,.L49
.L50:
	mv	a1,s0
	li	a0,1
	call	stabilize_globals
#APP
# 47 "R+fence.tsopxs.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	li	a0,0
	addi	sp,sp,32
	jr	ra
.L63:
	sw	t2,0(a4)
#APP
# 47 "R+fence.tsopxs.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	j	.L52
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
# 47 "R+fence.tsopxs.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	ld	s0,16(a0)
	lw	a4,0(a0)
	ld	a5,8(a0)
	ld	a3,112(s0)
	slli	a4,a4,2
	add	a5,a5,a4
	lw	a0,0(a5)
	lw	a2,0(a3)
	li	a1,4
	lla	a3,.LC3
	call	force_one_affinity@plt
	mv	a0,s0
	call	check_globals
	ld	a5,112(s0)
	lw	t3,0(s1)
	ld	t4,96(s0)
	lw	t1,12(a5)
	lw	t0,4(a5)
	blez	t1,.L68
	sub	t6,t0,t1
	negw	a7,t1
	subw	t5,t0,t1
	slli	t6,t6,2
	sext.w	t0,t0
	slli	a7,a7,2
	sext.w	t3,t3
	li	a1,1
.L67:
	sext.w	a2,t5
	mv	a3,t6
	bltz	t5,.L72
.L71:
	andi	a5,a2,1
	add	a4,t4,a3
	beq	a5,t3,.L81
.L69:
	lw	a5,0(a4)
	sext.w	a5,a5
	beqz	a5,.L69
.L70:
	ld	a5,8(s0)
	ld	a4,0(s0)
	add	a5,a5,a3
	add	a4,a4,a3
#APP
# 263 "R+fence.tsopxs.c" 1
	
#START _litmus_P0
#_litmus_P0_0
	sw a1,0(a5)
#_litmus_P0_1
	fence.tso
#_litmus_P0_2
	lr.w a0,0(a4)
#_litmus_P0_3
	sc.w a6,a1,0(a4)
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
	bgez	a2,.L71
.L72:
	addiw	t5,t5,1
	addi	t6,t6,4
	bne	t5,t0,.L67
.L68:
	mv	a1,s0
	li	a0,0
	call	stabilize_globals
#APP
# 47 "R+fence.tsopxs.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	li	a0,0
	addi	sp,sp,32
	jr	ra
.L81:
	sw	a1,0(a4)
#APP
# 47 "R+fence.tsopxs.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	j	.L70
	.size	P0, .-P0
	.section	.rodata.str1.8
	.align	3
.LC4:
	.string	"Run %i of %i\r"
	.align	3
.LC5:
	.string	"R+fence.tsopxs, global x unstabilized"
	.align	3
.LC6:
	.string	"R+fence.tsopxs, global y unstabilized"
	.text
	.align	1
	.type	zyva, @function
zyva:
	addi	sp,sp,-448
	la	a5,__stack_chk_guard
	ld	a5,0(a5)
	sd	s9,360(sp)
	mv	s9,a0
	ld	a0,8(a0)
	sd	ra,440(sp)
	sd	s0,432(sp)
	sd	s1,424(sp)
	sd	s7,376(sp)
	sd	a5,328(sp)
	ld	s7,16(s9)
	sd	s2,416(sp)
	sd	s3,408(sp)
	sd	s4,400(sp)
	sd	s5,392(sp)
	sd	s6,384(sp)
	sd	s8,368(sp)
	sd	s10,352(sp)
	sd	s11,344(sp)
	call	pb_wait@plt
	lla	a5,P0
	sd	a5,96(sp)
	li	a0,24
	lla	a5,P1
	sd	a5,104(sp)
	call	malloc_check@plt
	lw	s1,4(s7)
	sd	zero,0(a0)
	sd	zero,16(a0)
	sd	zero,8(a0)
	slli	s1,s1,2
	mv	s0,a0
	sd	s7,320(sp)
	call	rand@plt
	mv	a5,a0
	mv	a0,s1
	sw	a5,312(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s1
	sd	a5,224(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s1
	sd	a5,232(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s1
	sd	a5,240(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s1
	sd	a5,248(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s1
	sd	a5,208(sp)
	call	malloc_check@plt
	mv	a5,a0
	li	a0,2
	sd	a5,216(sp)
	call	pb_create@plt
	mv	a5,a0
	li	a0,2
	sd	a5,256(sp)
	call	po_create@plt
	mv	a5,a0
	mv	a0,s1
	sd	a5,264(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s1
	sd	a5,280(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s1
	sd	a5,296(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s1
	sd	a5,272(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s1
	sd	a5,288(sp)
	call	malloc_check@plt
	ld	a4,32(s9)
	lw	a3,8(s7)
	li	a5,1
	sw	a5,136(sp)
	addi	a5,sp,208
	sd	a0,304(sp)
	sd	a5,152(sp)
	sd	a4,144(sp)
	sw	zero,112(sp)
	sd	a5,128(sp)
	sd	a4,120(sp)
	blez	a3,.L83
	addi	a5,sp,112
	sd	a5,48(sp)
	addi	a5,sp,136
	sd	a5,56(sp)
	addi	a5,sp,80
	sd	a5,24(sp)
	addi	a5,sp,88
	sd	a5,32(sp)
	addi	a5,sp,312
	sd	a5,64(sp)
	li	s1,-237568
	addi	a5,sp,96
	sd	zero,16(sp)
	addiw	s1,s1,-1919
	sd	a5,72(sp)
.L104:
	lw	a5,16(s7)
	li	a4,2
	beq	a5,a4,.L131
	li	a4,4
	beq	a5,a4,.L132
.L86:
	lw	a4,0(s7)
	li	a5,1
	ble	a4,a5,.L87
	la	a5,stderr
	lw	a4,8(s7)
	ld	a0,0(a5)
	ld	a3,16(sp)
	lla	a2,.LC4
	li	a1,1
	call	__fprintf_chk@plt
.L87:
	ld	a5,320(sp)
	lw	a4,4(a5)
	addiw	a2,a4,-1
	slli	a3,a2,32
	sext.w	a5,a2
	bltz	a3,.L88
	slli	a2,a2,32
	srli	a2,a2,32
	sub	a2,a4,a2
	ld	t4,208(sp)
	ld	t3,216(sp)
	ld	t1,224(sp)
	ld	a7,232(sp)
	ld	a6,240(sp)
	ld	a0,248(sp)
	ld	a1,304(sp)
	slli	a2,a2,2
	slli	a5,a5,2
	addi	a2,a2,-8
.L89:
	add	a4,t4,a5
	sw	zero,0(a4)
	add	a4,t3,a5
	sw	zero,0(a4)
	add	a4,t1,a5
	sw	s1,0(a4)
	add	a4,a7,a5
	sw	s1,0(a4)
	add	a4,a6,a5
	sw	s1,0(a4)
	add	a3,a0,a5
	add	a4,a1,a5
	sw	s1,0(a3)
	sw	zero,0(a4)
	addi	a5,a5,-4
	bne	a2,a5,.L89
.L88:
	lw	a5,28(s7)
	bnez	a5,.L133
.L90:
	ld	a1,104(sp)
	ld	a0,32(sp)
	ld	a2,56(sp)
	call	launch@plt
	ld	a2,48(sp)
	ld	a1,96(sp)
	ld	a0,24(sp)
	call	launch@plt
	lw	a5,28(s7)
	bnez	a5,.L134
.L91:
	ld	a0,32(sp)
	call	join@plt
	ld	a0,24(sp)
	call	join@plt
	lw	a4,4(s7)
	addiw	s6,a4,-1
	slli	a3,s6,32
	sext.w	a5,s6
	bltz	a3,.L92
	slli	s6,s6,32
	srli	s6,s6,32
	sub	s6,a4,s6
	ld	a4,16(sp)
	slli	a3,s6,2
	slli	s6,a5,2
	andi	a4,a4,1
	addi	a5,a3,-8
	slli	a4,a4,3
	sd	a5,8(sp)
	lla	a5,.LANCHOR1
	add	a5,a5,a4
	addi	s8,sp,160
	sd	a5,40(sp)
	j	.L103
.L137:
	ld	a3,32(s9)
	lw	a3,0(a3)
	bltz	a3,.L99
	bnez	a4,.L135
.L100:
	ld	a4,16(s0)
	ld	a5,8(sp)
	addi	s6,s6,-4
	addi	a4,a4,1
	sd	a4,16(s0)
	beq	s6,a5,.L92
.L103:
	ld	a3,216(sp)
	ld	a4,280(sp)
	ld	a0,224(sp)
	add	a3,a3,s6
	add	a4,a4,s6
	lw	s11,0(a3)
	lw	t1,0(a4)
	ld	a1,232(sp)
	ld	a2,240(sp)
	ld	a3,248(sp)
	ld	a4,208(sp)
	add	a0,a0,s6
	add	a1,a1,s6
	add	a2,a2,s6
	add	a3,a3,s6
	add	a4,a4,s6
	lw	s2,0(a0)
	lw	s3,0(a1)
	lw	s4,0(a2)
	lw	s5,0(a3)
	lw	s10,0(a4)
	beq	t1,s11,.L93
	lla	a0,.LC5
	call	fatal@plt
.L93:
	ld	a4,272(sp)
	add	a4,a4,s6
	lw	a4,0(a4)
	beq	a4,s11,.L94
	lla	a0,.LC5
	call	fatal@plt
.L94:
	ld	a4,296(sp)
	add	a4,a4,s6
	lw	a4,0(a4)
	beq	a4,s10,.L95
	lla	a0,.LC6
	call	fatal@plt
.L95:
	ld	a4,288(sp)
	add	a4,a4,s6
	lw	a4,0(a4)
	beq	a4,s10,.L96
	lla	a0,.LC6
	call	fatal@plt
.L96:
	li	a4,0
	bnez	s2,.L97
	mv	a4,s2
	bnez	s3,.L97
	mv	a4,s3
	bnez	s4,.L97
	mv	a4,s4
	bnez	s5,.L97
	li	a5,1
	mv	a4,s5
	bne	s11,a5,.L97
	addi	a4,s10,-2
	seqz	a4,a4
.L97:
	ld	a0,0(s0)
	li	a3,1
	li	a2,6
	mv	a1,s8
	sd	a4,0(sp)
	sd	s2,160(sp)
	sd	s3,168(sp)
	sd	s4,176(sp)
	sd	s5,184(sp)
	sd	s11,192(sp)
	sd	s10,200(sp)
	call	add_outcome_outs@plt
	lw	a3,16(s7)
	li	a2,4
	sd	a0,0(s0)
	ld	a4,0(sp)
	beq	a3,a2,.L136
	li	a2,5
	beq	a3,a2,.L137
.L99:
	beqz	a4,.L100
.L101:
	ld	a4,8(s0)
	ld	a5,8(sp)
	addi	s6,s6,-4
	addi	a4,a4,1
	sd	a4,8(s0)
	bne	s6,a5,.L103
.L92:
	ld	a4,16(sp)
	lw	a5,8(s7)
	addiw	a4,a4,1
	sd	a4,16(sp)
	bgt	a5,a4,.L104
.L83:
	ld	a0,208(sp)
	call	free@plt
	ld	a0,216(sp)
	call	free@plt
	ld	a0,224(sp)
	call	free@plt
	ld	a0,232(sp)
	call	free@plt
	ld	a0,240(sp)
	call	free@plt
	ld	a0,248(sp)
	call	free@plt
	ld	a0,256(sp)
	call	pb_free@plt
	ld	a0,264(sp)
	call	po_free@plt
	ld	a0,280(sp)
	call	free@plt
	ld	a0,296(sp)
	call	free@plt
	ld	a0,272(sp)
	call	free@plt
	ld	a0,288(sp)
	call	free@plt
	ld	a0,304(sp)
	call	free@plt
	la	a5,__stack_chk_guard
	ld	a4,328(sp)
	ld	a5,0(a5)
	bne	a4,a5,.L138
	ld	ra,440(sp)
	mv	a0,s0
	ld	s0,432(sp)
	ld	s1,424(sp)
	ld	s2,416(sp)
	ld	s3,408(sp)
	ld	s4,400(sp)
	ld	s5,392(sp)
	ld	s6,384(sp)
	ld	s7,376(sp)
	ld	s8,368(sp)
	ld	s9,360(sp)
	ld	s10,352(sp)
	ld	s11,344(sp)
	addi	sp,sp,448
	jr	ra
.L136:
	ld	a3,32(s9)
	lw	a3,0(a3)
	bltz	a3,.L99
	beqz	a4,.L100
	ld	a0,0(s9)
	call	pm_lock@plt
	ld	a5,40(sp)
.L130:
	ld	a4,0(a5)
	ld	a0,0(s9)
	addi	a4,a4,1
	sd	a4,0(a5)
	call	pm_unlock@plt
	j	.L101
.L135:
	ld	a0,0(s9)
	call	pm_lock@plt
	lla	a5,.LANCHOR1
	j	.L130
.L134:
	ld	a1,24(sp)
	ld	a0,64(sp)
	li	a2,2
	call	perm_threads@plt
	j	.L91
.L133:
	ld	a1,72(sp)
	ld	a0,64(sp)
	li	a2,2
	call	perm_funs@plt
	j	.L90
.L131:
	ld	a0,8(s9)
	call	pb_wait@plt
	lw	a5,24(s9)
	beqz	a5,.L139
.L85:
	ld	a0,8(s9)
	call	pb_wait@plt
	j	.L86
.L132:
	ld	a0,8(s9)
	call	pb_wait@plt
	ld	a5,16(sp)
	lw	a4,24(s9)
	lla	a3,.LANCHOR0
	andi	a5,a5,1
	slliw	a5,a5,2
	slliw	a4,a4,1
	slli	a5,a5,2
	add	a5,a3,a5
	slli	a3,a4,2
	add	a3,a5,a3
	ld	a2,32(s9)
	lw	a3,0(a3)
	addi	a4,a4,1
	slli	a4,a4,2
	sw	a3,0(a2)
	add	a5,a5,a4
	lw	a5,0(a5)
	ld	a0,8(s9)
	sw	a5,4(a2)
	call	pb_wait@plt
	j	.L86
.L139:
	lw	a3,20(s7)
	lw	a2,24(s7)
	ld	a1,32(s9)
	ld	a0,64(sp)
	call	perm_prefix_ints@plt
	j	.L85
.L138:
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
	.string	"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
	.align	3
.LC11:
	.string	"%s\n"
	.align	3
.LC12:
	.string	"% Results for tests/non-mixed-size/FENCE.TSO/2/R+fence.tsopxs.litmus %"
	.align	3
.LC13:
	.string	"RISCV R+fence.tsopxs"
	.align	3
.LC14:
	.string	"\"Fence.tsodWWPX WseXP Fence.tsodWRPX FreXP\""
	.align	3
.LC15:
	.string	"{"
	.align	3
.LC16:
	.string	" 0:x5=1; 0:x6=x; 0:x7=y;"
	.align	3
.LC17:
	.string	" 1:x5=2; 1:x6=y; 1:x7=x;"
	.align	3
.LC18:
	.string	"}"
	.align	3
.LC19:
	.string	" P0               | P1               ;"
	.align	3
.LC20:
	.string	" sw x5,0(x6)      | sw x5,0(x6)      ;"
	.align	3
.LC21:
	.string	" fence.tso        | fence.tso        ;"
	.align	3
.LC22:
	.string	" lr.w x8,0(x7)    | lr.w x8,0(x7)    ;"
	.align	3
.LC23:
	.string	" sc.w x9,x5,0(x7) | sc.w x9,x8,0(x7) ;"
	.align	3
.LC24:
	.string	""
	.align	3
.LC25:
	.string	"exists ([x]=1 /\\ [y]=2 /\\ 0:x9=0 /\\ 0:x8=0 /\\ 1:x9=0 /\\ 1:x8=0)"
	.align	3
.LC26:
	.string	"Generated assembler"
	.align	3
.LC27:
	.string	"Bad topology %s, reverting to scan affinity\n"
	.align	3
.LC28:
	.string	"Warning: avail=%i, available=%i\n"
	.align	3
.LC29:
	.string	"R+fence.tsopxs: n=%i, r=%i, s=%i"
	.align	3
.LC30:
	.string	", st=%i"
	.align	3
.LC31:
	.string	", i=%i"
	.align	3
.LC32:
	.string	", +ra"
	.align	3
.LC33:
	.string	", +ca"
	.align	3
.LC34:
	.string	", +sa"
	.align	3
.LC35:
	.string	", p='"
	.align	3
.LC36:
	.string	"'"
	.align	3
.LC37:
	.string	"\n"
	.align	3
.LC38:
	.string	"logical proc -> core: "
	.align	3
.LC39:
	.string	"thread allocation: \n"
	.align	3
.LC40:
	.string	"R+fence.tsopxs, sum_hist"
	.align	3
.LC41:
	.string	"Test R+fence.tsopxs Allowed\n"
	.align	3
.LC42:
	.string	"Histogram (%d states)\n"
	.align	3
.LC43:
	.string	"Observation R+fence.tsopxs %s %lu %lu\n"
	.align	3
.LC45:
	.string	"Time R+fence.tsopxs %.2f\n"
	.align	3
.LC46:
	.string	"Ok"
	.align	3
.LC47:
	.string	"\nWitnesses\n"
	.align	3
.LC48:
	.string	"Positive: %lu, Negative: %lu\n"
	.align	3
.LC49:
	.string	"Condition %s is %svalidated\n"
	.align	3
.LC50:
	.string	"Hash=1296b82275859fc8d533a0e3fd64dd82\n"
	.align	3
.LC51:
	.string	"Cycle=Fence.tsodWWPX WseXP Fence.tsodWRPX FreXP\n"
	.align	3
.LC52:
	.string	"Relax R+fence.tsopxs %s %s\n"
	.align	3
.LC53:
	.string	"Safe=Fre Wse Fence.tsodWW Fence.tsodWR X\n"
	.align	3
.LC54:
	.string	"Generator=diy7 (version 7.51+4(dev))\n"
	.align	3
.LC55:
	.string	"Com=Ws Fr\n"
	.align	3
.LC56:
	.string	"Orig=Fence.tsodWWPX WseXP Fence.tsodWRPX FreXP\n"
	.align	3
.LC57:
	.string	"No"
	.align	3
.LC58:
	.string	"NOT "
	.align	3
.LC59:
	.string	"Affinity=[0] [1] ; (1,0)\n"
	.text
	.align	1
	.globl	R_2B_fence_2E_tsopxs
	.type	R_2B_fence_2E_tsopxs, @function
R_2B_fence_2E_tsopxs:
	addi	sp,sp,-544
	sd	s0,528(sp)
	sd	s1,520(sp)
	sd	s2,512(sp)
	sd	s3,504(sp)
	sd	ra,536(sp)
	sd	s4,496(sp)
	sd	s5,488(sp)
	sd	s6,480(sp)
	sd	s7,472(sp)
	sd	s8,464(sp)
	sd	s9,456(sp)
	sd	s10,448(sp)
	sd	s11,440(sp)
	addi	s0,sp,544
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
	ble	a4,a5,.L226
	slli	a4,a5,32
	li	t1,-1
	mv	s5,a0
	li	a6,5
	addi	a0,a4,100
	srli	a7,t1,32
	addi	a1,a4,1
	addi	a2,s0,-392
	addi	a3,s0,-280
	slli	a6,a6,33
	sd	a0,-384(s0)
	li	a0,4
	sd	a4,-368(s0)
	sw	a5,-352(s0)
	sd	t1,-304(s0)
	sw	a5,-288(s0)
	sd	a6,-392(s0)
	sd	a0,-376(s0)
	sd	a1,-360(s0)
	sd	s5,-344(s0)
	sd	zero,-336(s0)
	sd	a7,-328(s0)
	sd	zero,-320(s0)
	sd	zero,-312(s0)
	sd	a7,-296(s0)
	mv	a5,a2
	mv	a4,a3
	addi	t1,s0,-296
.L143:
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
	bne	a5,t1,.L143
	ld	a6,0(a5)
	ld	a5,8(a5)
	mv	a1,s2
	mv	a0,s3
	sd	a5,8(a4)
	sd	a6,0(a4)
	call	parse_cmd@plt
	lw	a5,-176(s0)
	sd	sp,-512(s0)
	bnez	a5,.L227
.L144:
	call	timeofday@plt
	lw	a5,-280(s0)
	lw	a4,-268(s0)
	sd	a0,-520(s0)
	sw	a5,-432(s0)
	lw	a5,-272(s0)
	sw	a5,-428(s0)
	lw	a5,-276(s0)
	sw	a5,-424(s0)
	blez	a4,.L228
	lw	a5,-252(s0)
	sw	a4,-420(s0)
	li	a4,5
	beq	a5,a4,.L146
.L243:
	addiw	a5,a5,-3
	li	a4,2
	sgtu	a5,a5,a4
	li	s9,-1
.L147:
	lw	a4,-180(s0)
	sw	a5,-404(s0)
	beqz	a4,.L149
	sw	zero,-404(s0)
.L149:
	lw	a0,0(s5)
	li	a1,2
	call	coremap_seq@plt
	lw	s2,-264(s0)
	sd	a0,-400(s0)
	ld	s4,-232(s0)
	blez	s2,.L229
	lw	a2,0(s4)
	ble	s2,a2,.L151
	mv	a1,s2
	lla	a0,.LC28
	call	log_error@plt
	ld	s4,-232(s0)
.L151:
	lw	s6,-260(s0)
	blez	s6,.L152
.L244:
	slli	s7,s6,2
	addiw	a5,s6,-1
	add	s7,s7,s6
	slliw	s2,s6,1
	sd	a5,-464(s0)
	slli	s8,a5,3
	sd	s6,-528(s0)
	slli	s7,s7,3
.L153:
	lw	a4,-252(s0)
	li	a5,2
	mv	s11,s2
	beq	a4,a5,.L230
.L154:
	slli	a5,s11,2
	addi	a5,a5,15
	lw	a3,-432(s0)
	andi	a5,a5,-16
	sub	sp,sp,a5
	sw	s2,-408(s0)
	sw	a4,-416(s0)
	sw	s11,-412(s0)
	mv	s2,sp
	bnez	a3,.L231
.L155:
	li	a5,2
	beq	a4,a5,.L232
	li	a5,3
	beq	a4,a5,.L233
	li	a5,5
	beq	a4,a5,.L234
.L164:
	addi	s8,s8,15
	andi	s8,s8,-16
	addi	s7,s7,15
	sub	sp,sp,s8
	andi	s7,s7,-16
	sd	sp,-488(s0)
	sub	sp,sp,s7
	call	pm_create@plt
	mv	s9,a0
	mv	a0,s6
	sd	s9,-472(s0)
	call	pb_create@plt
	lw	s7,-240(s0)
	sd	a0,-480(s0)
	lw	a1,0(s4)
	mv	s8,sp
	blez	s7,.L235
	remw	a5,s7,a1
	sd	a5,-456(s0)
.L171:
	ld	a0,-456(s0)
	addi	s7,s2,8
	li	s11,0
	call	gcd@plt
	ld	s3,-488(s0)
	addi	a5,s0,-432
	mv	a2,s8
	sd	a0,-536(s0)
	mv	s8,s3
	li	s2,0
	li	s9,0
	li	s10,0
	sd	a5,-504(s0)
	j	.L178
.L238:
	mv	a0,s3
	lla	a1,zyva
	sd	a2,-496(s0)
	call	launch@plt
	ld	a2,-496(s0)
	addiw	s10,s10,1
	addi	s3,s3,8
	addi	a2,a2,40
	addi	s7,s7,8
	beq	s6,s10,.L236
.L178:
	ld	a5,-504(s0)
	lw	a1,-252(s0)
	addi	a0,s7,-8
	sd	a5,16(a2)
	ld	a5,-472(s0)
	sw	s10,24(a2)
	sd	a0,32(a2)
	sd	a5,0(a2)
	ld	a5,-480(s0)
	sd	a5,8(a2)
	li	a5,1
	beq	a1,a5,.L237
.L173:
	ld	a5,-464(s0)
	bgt	a5,s10,.L238
	mv	a0,a2
	sd	a2,-496(s0)
	call	zyva
	ld	a2,-496(s0)
	addiw	s10,s10,1
	mv	s2,a0
	addi	a2,a2,40
	addi	s3,s3,8
	addi	s7,s7,8
	bne	s6,s10,.L178
.L236:
	lw	a5,-428(s0)
	lw	s6,-424(s0)
	mul	s6,s6,a5
	ld	a5,-464(s0)
	beqz	a5,.L185
	ld	a5,-464(s0)
	addiw	s3,a5,-1
	slli	s3,s3,32
	ld	a5,-488(s0)
	srli	s3,s3,32
	addi	s3,s3,1
	slli	s3,s3,3
	add	s11,a5,s3
	lla	s3,.LC40
.L184:
	mv	a0,s8
	call	join@plt
	mv	s7,a0
	ld	a0,0(a0)
	call	sum_outs@plt
	bne	s6,a0,.L182
	ld	a2,8(s7)
	ld	a3,16(s7)
	add	a5,a2,a3
	beq	s6,a5,.L183
.L182:
	mv	a0,s3
	call	fatal@plt
	ld	a2,8(s7)
	ld	a3,16(s7)
.L183:
	ld	a4,8(s2)
	ld	a5,16(s2)
	ld	a1,0(s7)
	ld	a0,0(s2)
	add	a4,a4,a2
	add	a5,a5,a3
	li	a2,6
	sd	a4,8(s2)
	sd	a5,16(s2)
	call	merge_outs@plt
	sd	a0,0(s2)
	ld	a0,0(s7)
	addi	s8,s8,8
	call	free_outs@plt
	mv	a0,s7
	call	free@plt
	bne	s8,s11,.L184
.L185:
	mv	a0,s4
	call	cpus_free@plt
	call	timeofday@plt
	ld	a5,-520(s0)
	mv	s3,a0
	ld	a0,-472(s0)
	sub	s3,s3,a5
	call	pm_free@plt
	ld	a5,-528(s0)
	ld	a0,-480(s0)
	mul	s6,s6,a5
	call	pb_free@plt
	ld	a0,0(s2)
	call	sum_outs@plt
	bne	s6,a0,.L180
	ld	s4,8(s2)
	ld	s7,16(s2)
	add	a5,s4,s7
	beq	s6,a5,.L186
.L180:
	lla	a0,.LC40
	call	fatal@plt
	ld	s4,8(s2)
	ld	s7,16(s2)
.L186:
	li	a2,28
	li	a1,1
	mv	a3,s1
	lla	a0,.LC41
	call	fwrite@plt
	ld	a0,0(s2)
	call	finals_outs@plt
	mv	a3,a0
	lla	a2,.LC42
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	ld	a2,0(s2)
	li	a4,6
	addi	a3,s0,-168
	lla	a1,do_dump_outcome
	mv	a0,s1
	call	dump_outs@plt
	beqz	s4,.L239
	lla	a2,.LC11
	li	a1,1
	lla	a3,.LC46
	mv	a0,s1
	call	__fprintf_chk@plt
	mv	a3,s1
	li	a2,11
	li	a1,1
	lla	a0,.LC47
	call	fwrite@plt
	mv	a4,s7
	mv	a3,s4
	lla	a2,.LC48
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a4,.LC24
	lla	a2,.LC49
	li	a1,1
	lla	a3,.LC25
	mv	a0,s1
	call	__fprintf_chk@plt
	mv	a3,s1
	li	a2,38
	li	a1,1
	lla	a0,.LC50
	call	fwrite@plt
	mv	a3,s1
	li	a2,48
	li	a1,1
	lla	a0,.LC51
	call	fwrite@plt
	lla	a4,.LC24
	lla	a2,.LC52
	li	a1,1
	lla	a3,.LC46
	mv	a0,s1
	call	__fprintf_chk@plt
	mv	a3,s1
	li	a2,41
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
	li	a2,47
	li	a1,1
	lla	a0,.LC56
	call	fwrite@plt
	lw	a4,-252(s0)
	li	a5,3
	beq	a4,a5,.L240
.L191:
	lla	s6,.LC8
	bnez	s7,.L241
.L189:
	mv	a5,s7
	mv	a4,s4
	mv	a3,s6
	lla	a2,.LC43
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	fcvt.d.lu	fa4,s3
	fld	fa5,.LC44,a5
	lla	a2,.LC45
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
	ld	a0,-400(s0)
	call	cpus_free@plt
	ld	a5,-232(s0)
	ld	sp,-512(s0)
	beq	a5,s5,.L142
	mv	a0,s5
.L226:
	call	cpus_free@plt
.L142:
	la	a5,__stack_chk_guard
	ld	a4,-120(s0)
	ld	a5,0(a5)
	bne	a4,a5,.L242
	addi	sp,s0,-544
	ld	ra,536(sp)
	ld	s0,528(sp)
	ld	s1,520(sp)
	ld	s2,512(sp)
	ld	s3,504(sp)
	ld	s4,496(sp)
	ld	s5,488(sp)
	ld	s6,480(sp)
	ld	s7,472(sp)
	ld	s8,464(sp)
	ld	s9,456(sp)
	ld	s10,448(sp)
	ld	s11,440(sp)
	li	a0,0
	addi	sp,sp,544
	jr	ra
.L228:
	lw	a5,-252(s0)
	li	a4,2
	sw	a4,-420(s0)
	li	a4,5
	bne	a5,a4,.L243
.L146:
	ld	a2,-224(s0)
	li	a1,2
	lla	a0,.LANCHOR2
	call	find_string@plt
	mv	s9,a0
	bltz	a0,.L148
	lw	a5,-252(s0)
	li	a4,2
	addiw	a5,a5,-3
	sgtu	a5,a5,a4
	j	.L147
.L229:
	lw	s6,-260(s0)
	lw	s2,0(s4)
	bgtz	s6,.L244
.L152:
	li	a5,1
	ble	s2,a5,.L194
	srai	s6,s2,1
	sraiw	s3,s2,1
	lw	a4,-252(s0)
	addiw	a5,s3,-1
	slli	s7,s6,2
	sd	a5,-464(s0)
	add	s7,s7,s6
	andi	s2,s2,-2
	slli	s8,a5,3
	sd	s6,-528(s0)
	li	a5,2
	slli	s7,s7,3
	mv	s11,s2
	bne	a4,a5,.L154
.L230:
	lw	a0,0(s4)
	mv	a1,s2
	call	max@plt
	lw	a4,-252(s0)
	mv	s11,a0
	j	.L154
.L237:
	ld	a1,8(s4)
	slli	a0,s9,2
	ld	a5,-456(s0)
	add	a0,a1,a0
	lw	a0,0(a0)
	addw	a5,a5,s9
	sw	a0,-8(s7)
	lw	a0,0(s4)
	remw	a5,a5,a0
	bne	a5,s11,.L174
	ld	a5,-536(s0)
	addiw	a4,s11,1
	remw	s11,a4,a5
	mv	a5,s11
.L174:
	slli	a0,a5,2
	add	a1,a1,a0
	lw	a1,0(a1)
	ld	a4,-456(s0)
	sw	a1,-4(s7)
	lw	a1,0(s4)
	addw	a5,a4,a5
	remw	s9,a5,a1
	bne	s9,s11,.L173
	ld	a5,-536(s0)
	addiw	a4,s11,1
	remw	s11,a4,a5
	mv	s9,s11
	j	.L173
.L239:
	lla	a2,.LC11
	li	a1,1
	lla	a3,.LC57
	mv	a0,s1
	call	__fprintf_chk@plt
	mv	a3,s1
	li	a2,11
	li	a1,1
	lla	a0,.LC47
	call	fwrite@plt
	mv	a4,s7
	li	a3,0
	lla	a2,.LC48
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a4,.LC58
	lla	a2,.LC49
	li	a1,1
	lla	a3,.LC25
	mv	a0,s1
	call	__fprintf_chk@plt
	mv	a3,s1
	li	a2,38
	li	a1,1
	lla	a0,.LC50
	call	fwrite@plt
	mv	a3,s1
	li	a2,48
	li	a1,1
	lla	a0,.LC51
	call	fwrite@plt
	lla	a4,.LC24
	lla	a2,.LC52
	li	a1,1
	lla	a3,.LC57
	mv	a0,s1
	call	__fprintf_chk@plt
	mv	a3,s1
	li	a2,41
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
	li	a2,47
	li	a1,1
	lla	a0,.LC56
	call	fwrite@plt
	lw	a4,-252(s0)
	li	a5,3
	lla	s6,.LC7
	bne	a4,a5,.L189
	mv	a3,s1
	li	a2,25
	li	a1,1
	lla	a0,.LC59
	call	fwrite@plt
	j	.L189
.L235:
	blez	a1,.L196
	ld	a4,8(s4)
	li	a5,0
	li	a3,-1
.L172:
	sw	a3,0(a4)
	lw	a1,0(s4)
	addiw	a5,a5,1
	addi	a4,a4,4
	blt	a5,a1,.L172
.L196:
	li	a5,1
	sd	a5,-456(s0)
	j	.L171
.L232:
	blez	s11,.L164
	ld	a2,8(s4)
	mv	a3,s2
	li	a4,0
.L165:
	lw	a5,0(s4)
	addi	a3,a3,4
	remw	a5,a4,a5
	addiw	a4,a4,1
	slli	a5,a5,2
	add	a5,a2,a5
	lw	a5,0(a5)
	sw	a5,-4(a3)
	bne	s11,a4,.L165
	j	.L164
.L231:
	lw	a3,-428(s0)
	lw	a2,-424(s0)
	mv	a1,s6
	lla	a0,.LC29
	call	log_error@plt
	lw	a1,-420(s0)
	lla	a0,.LC30
	call	log_error@plt
	lw	a5,-252(s0)
	li	a4,1
	beq	a5,a4,.L245
	li	a4,2
	beq	a5,a4,.L246
	li	a4,3
	beq	a5,a4,.L247
	li	a4,4
	beq	a5,a4,.L248
.L157:
	lla	a0,.LC35
	call	log_error@plt
	la	s10,stderr
	ld	a1,-232(s0)
	ld	a0,0(s10)
	call	cpus_dump@plt
	lla	a0,.LC36
	call	log_error@plt
	lla	a0,.LC37
	call	log_error@plt
	lw	a4,-432(s0)
	li	a5,1
	ble	a4,a5,.L225
	ld	a5,-400(s0)
	beqz	a5,.L225
	lla	a0,.LC38
	call	log_error@plt
	ld	a0,0(s10)
	ld	a1,-400(s0)
	call	cpus_dump@plt
	lla	a0,.LC37
	call	log_error@plt
.L225:
	lw	a4,-252(s0)
	j	.L155
.L227:
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
	lla	a3,.LC26
	lla	a2,.LC11
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	j	.L144
.L241:
	lla	s6,.LC9
	j	.L189
.L194:
	li	a5,1
	li	s7,40
	sd	a5,-528(s0)
	li	s8,0
	sd	zero,-464(s0)
	li	s2,2
	li	s6,1
	j	.L153
.L234:
	slliw	s9,s9,2
	slli	s9,s9,2
	lla	a4,.LANCHOR0
	add	a4,a4,s9
	blez	s11,.L164
	addiw	a5,s11,-1
	slli	a5,a5,32
	srli	a5,a5,32
	addi	a5,a5,1
	slli	a5,a5,2
	mv	a3,s2
	add	a5,a4,a5
.L169:
	lw	a2,0(a4)
	addi	a4,a4,4
	addi	a3,a3,4
	sw	a2,-4(a3)
	bne	a4,a5,.L169
	j	.L164
.L233:
	ld	a1,-400(s0)
	mv	a5,s6
	mv	a6,s2
	mv	a4,s4
	lla	a3,.LANCHOR0+32
	lla	a2,.LANCHOR2+16
	addi	a0,s0,-436
	sw	zero,-436(s0)
	call	custom_affinity@plt
	lw	a5,-432(s0)
	beqz	a5,.L164
	lla	a0,.LC39
	call	log_error@plt
	la	a5,stderr
	ld	a3,-400(s0)
	ld	a0,0(a5)
	li	a4,2
	mv	a2,s11
	mv	a1,s2
	call	cpus_dump_test@plt
	j	.L164
.L240:
	mv	a3,s1
	li	a2,25
	li	a1,1
	lla	a0,.LC59
	call	fwrite@plt
	j	.L191
.L245:
	lw	a1,-240(s0)
	lla	a0,.LC31
	call	log_error@plt
	j	.L157
.L246:
	lla	a0,.LC32
	call	log_error@plt
	j	.L157
.L148:
	ld	a1,-224(s0)
	lla	a0,.LC27
	call	log_error@plt
	li	a5,4
	sw	a5,-252(s0)
	sd	zero,-224(s0)
	li	a5,0
	j	.L147
.L247:
	lla	a0,.LC33
	call	log_error@plt
	j	.L157
.L248:
	lla	a0,.LC34
	call	log_error@plt
	j	.L157
.L242:
	call	__stack_chk_fail@plt
	.size	R_2B_fence_2E_tsopxs, .-R_2B_fence_2E_tsopxs
	.section	.rodata.str1.8
	.align	3
.LC60:
	.string	"[[0],[1]]"
	.align	3
.LC61:
	.string	"[[0,1]]"
	.section	.rodata.cst8,"aM",@progbits,8
	.align	3
.LC44:
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
