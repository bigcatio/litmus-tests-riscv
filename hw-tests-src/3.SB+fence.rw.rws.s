	.file	"3.SB+fence.rw.rws.c"
	.option pic
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"%-6lu%c>0:x7=%d; 1:x7=%d; 2:x7=%d;\n"
	.text
	.align	1
	.type	do_dump_outcome, @function
do_dump_outcome:
	li	a4,42
	bnez	a3,.L2
	li	a4,58
.L2:
	lw	a7,16(a1)
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
	.string	"3.SB+fence.rw.rws, check_globals failed"
	.text
	.align	1
	.type	check_globals, @function
check_globals:
	ld	a5,72(a0)
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
	bltz	a4,.L11
	sext.w	s0,a5
	slli	a5,a5,32
	srli	a5,a5,32
	sub	s2,s2,a5
	slli	s2,s2,2
	addi	s1,a0,64
	slli	s0,s0,2
	addi	s2,s2,-8
	lla	s7,.LC1
.L10:
	mv	a0,s1
	call	rand_bit@plt
	add	a5,s3,s0
	beqz	a0,.L7
	lw	a5,0(a5)
	bnez	a5,.L32
.L7:
	mv	a0,s1
	call	rand_bit@plt
	add	a5,s4,s0
	beqz	a0,.L8
	lw	a5,0(a5)
	bnez	a5,.L33
.L8:
	mv	a0,s1
	call	rand_bit@plt
	add	a5,s5,s0
	addi	s0,s0,-4
	beqz	a0,.L9
	lw	a5,0(a5)
	bnez	a5,.L34
.L9:
	bne	s0,s2,.L10
.L11:
	ld	s0,64(sp)
	ld	a0,48(s6)
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
.L34:
	mv	a0,s7
	call	fatal@plt
	bne	s0,s2,.L10
	j	.L11
.L32:
	mv	a0,s7
	call	fatal@plt
	j	.L7
.L33:
	mv	a0,s7
	call	fatal@plt
	j	.L8
	.size	check_globals, .-check_globals
	.section	.rodata.str1.8
	.align	3
.LC2:
	.string	"3.SB+fence.rw.rws"
	.text
	.align	1
	.type	P2, @function
P2:
	addi	sp,sp,-32
	sd	s1,8(sp)
	sd	ra,24(sp)
	sd	s0,16(sp)
	mv	s1,a0
#APP
# 47 "3.SB+fence.rw.rws.c" 1
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
	lw	t1,0(s1)
	ld	t4,56(s0)
	lw	a7,12(a5)
	lw	t0,4(a5)
	blez	a7,.L39
	sub	t6,t0,a7
	negw	a6,a7
	subw	t5,t0,a7
	slli	t6,t6,2
	sext.w	t0,t0
	slli	a6,a6,2
	sext.w	t1,t1
	li	t3,3
	li	a0,1
.L38:
	sext.w	a2,t5
	mv	a3,t6
	bltz	t5,.L43
.L42:
	remuw	a5,a2,t3
	add	a4,t4,a3
	beq	a5,t1,.L52
.L40:
	lw	a5,0(a4)
	sext.w	a5,a5
	beqz	a5,.L40
.L41:
	ld	a5,0(s0)
	ld	a4,16(s0)
	add	a5,a5,a3
	add	a4,a4,a3
#APP
# 287 "3.SB+fence.rw.rws.c" 1
	
#START _litmus_P2
#_litmus_P2_0
	sw a0,0(a5)
#_litmus_P2_1
	fence rw,rw
#_litmus_P2_2
	lw a1,0(a4)
#END _litmus_P2

# 0 "" 2
#NO_APP
	ld	a5,40(s0)
	subw	a2,a2,a7
	add	a5,a5,a3
	sw	a1,0(a5)
	add	a3,a3,a6
	bgez	a2,.L42
.L43:
	addiw	t5,t5,1
	addi	t6,t6,4
	bne	t5,t0,.L38
.L39:
#APP
# 47 "3.SB+fence.rw.rws.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	li	a0,0
	addi	sp,sp,32
	jr	ra
.L52:
	sw	a0,0(a4)
#APP
# 47 "3.SB+fence.rw.rws.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	j	.L41
	.size	P2, .-P2
	.align	1
	.type	P1, @function
P1:
	addi	sp,sp,-32
	sd	s1,8(sp)
	sd	ra,24(sp)
	sd	s0,16(sp)
	mv	s1,a0
#APP
# 47 "3.SB+fence.rw.rws.c" 1
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
	lw	t1,0(s1)
	ld	t4,56(s0)
	lw	a7,12(a5)
	lw	t0,4(a5)
	blez	a7,.L57
	sub	t6,t0,a7
	negw	a6,a7
	subw	t5,t0,a7
	slli	t6,t6,2
	sext.w	t0,t0
	slli	a6,a6,2
	sext.w	t1,t1
	li	t3,3
	li	a0,1
.L56:
	sext.w	a2,t5
	mv	a3,t6
	bltz	t5,.L61
.L60:
	remuw	a5,a2,t3
	add	a4,t4,a3
	beq	a5,t1,.L70
.L58:
	lw	a5,0(a4)
	sext.w	a5,a5
	beqz	a5,.L58
.L59:
	ld	a5,8(s0)
	ld	a4,0(s0)
	add	a5,a5,a3
	add	a4,a4,a3
#APP
# 253 "3.SB+fence.rw.rws.c" 1
	
#START _litmus_P1
#_litmus_P1_0
	sw a0,0(a5)
#_litmus_P1_1
	fence rw,rw
#_litmus_P1_2
	lw a1,0(a4)
#END _litmus_P1

# 0 "" 2
#NO_APP
	ld	a5,32(s0)
	subw	a2,a2,a7
	add	a5,a5,a3
	sw	a1,0(a5)
	add	a3,a3,a6
	bgez	a2,.L60
.L61:
	addiw	t5,t5,1
	addi	t6,t6,4
	bne	t5,t0,.L56
.L57:
#APP
# 47 "3.SB+fence.rw.rws.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	li	a0,0
	addi	sp,sp,32
	jr	ra
.L70:
	sw	a0,0(a4)
#APP
# 47 "3.SB+fence.rw.rws.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	j	.L59
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
# 47 "3.SB+fence.rw.rws.c" 1
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
	lw	t1,0(s1)
	ld	t4,56(s0)
	lw	a7,12(a5)
	lw	t0,4(a5)
	blez	a7,.L75
	sub	t6,t0,a7
	negw	a6,a7
	subw	t5,t0,a7
	slli	t6,t6,2
	sext.w	t0,t0
	slli	a6,a6,2
	sext.w	t1,t1
	li	t3,3
	li	a0,1
.L74:
	sext.w	a2,t5
	mv	a3,t6
	bltz	t5,.L79
.L78:
	remuw	a5,a2,t3
	add	a4,t4,a3
	beq	a5,t1,.L88
.L76:
	lw	a5,0(a4)
	sext.w	a5,a5
	beqz	a5,.L76
.L77:
	ld	a5,16(s0)
	ld	a4,8(s0)
	add	a5,a5,a3
	add	a4,a4,a3
#APP
# 219 "3.SB+fence.rw.rws.c" 1
	
#START _litmus_P0
#_litmus_P0_0
	sw a0,0(a5)
#_litmus_P0_1
	fence rw,rw
#_litmus_P0_2
	lw a1,0(a4)
#END _litmus_P0

# 0 "" 2
#NO_APP
	ld	a5,24(s0)
	subw	a2,a2,a7
	add	a5,a5,a3
	sw	a1,0(a5)
	add	a3,a3,a6
	bgez	a2,.L78
.L79:
	addiw	t5,t5,1
	addi	t6,t6,4
	bne	t5,t0,.L74
.L75:
#APP
# 47 "3.SB+fence.rw.rws.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	li	a0,0
	addi	sp,sp,32
	jr	ra
.L88:
	sw	a0,0(a4)
#APP
# 47 "3.SB+fence.rw.rws.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	j	.L77
	.size	P0, .-P0
	.section	.rodata.str1.8
	.align	3
.LC3:
	.string	"Run %i of %i\r"
	.text
	.align	1
	.type	zyva, @function
zyva:
	addi	sp,sp,-416
	la	a5,__stack_chk_guard
	ld	a5,0(a5)
	sd	s3,376(sp)
	mv	s3,a0
	ld	a0,8(a0)
	sd	ra,408(sp)
	sd	s0,400(sp)
	sd	s2,384(sp)
	sd	s11,312(sp)
	ld	s2,16(s3)
	sd	a5,296(sp)
	sd	s1,392(sp)
	sd	s4,368(sp)
	sd	s5,360(sp)
	sd	s6,352(sp)
	sd	s7,344(sp)
	sd	s8,336(sp)
	sd	s9,328(sp)
	sd	s10,320(sp)
	call	pb_wait@plt
	lla	a5,P0
	sd	a5,176(sp)
	lla	a5,P1
	sd	a5,184(sp)
	li	a0,24
	lla	a5,P2
	sd	a5,192(sp)
	call	malloc_check@plt
	lw	s0,4(s2)
	sd	zero,0(a0)
	sd	zero,16(a0)
	sd	zero,8(a0)
	slli	s0,s0,2
	mv	s11,a0
	sd	s2,144(sp)
	call	rand@plt
	mv	a5,a0
	mv	a0,s0
	sw	a5,136(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s0
	sd	a5,96(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s0
	sd	a5,104(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s0
	sd	a5,112(sp)
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
	li	a0,3
	sd	a5,88(sp)
	call	pb_create@plt
	mv	a5,a0
	mv	a0,s0
	sd	a5,120(sp)
	call	malloc_check@plt
	ld	a4,32(s3)
	lw	a3,8(s2)
	li	a5,2
	sw	a5,272(sp)
	li	a2,1
	addi	a5,sp,72
	sd	a0,128(sp)
	sd	a5,288(sp)
	sd	a4,280(sp)
	sw	a2,248(sp)
	sd	a5,264(sp)
	sd	a4,256(sp)
	sw	zero,224(sp)
	sd	a5,240(sp)
	sd	a4,232(sp)
	blez	a3,.L103
	addi	a5,sp,224
	sd	a5,40(sp)
	addi	a5,sp,272
	sd	a5,32(sp)
	addi	a5,sp,168
	sd	a5,8(sp)
	addi	a5,sp,248
	sd	a5,24(sp)
	addi	a5,sp,160
	sd	a5,0(sp)
	addi	a5,sp,136
	sd	a5,48(sp)
	li	s0,-237568
	addi	a5,sp,176
	li	s7,0
	addi	s8,sp,152
	addiw	s0,s0,-1919
	sd	a5,56(sp)
.L90:
	lw	a5,16(s2)
	li	a4,2
	beq	a5,a4,.L136
	li	a4,4
	beq	a5,a4,.L137
.L93:
	lw	a4,0(s2)
	li	a5,1
	ble	a4,a5,.L95
	la	a5,stderr
	lw	a4,8(s2)
	ld	a0,0(a5)
	mv	a3,s7
	lla	a2,.LC3
	li	a1,1
	call	__fprintf_chk@plt
.L95:
	ld	a5,144(sp)
	lw	a2,4(a5)
	addiw	a4,a2,-1
	slli	a3,a4,32
	sext.w	a5,a4
	bltz	a3,.L100
	slli	a4,a4,32
	srli	a4,a4,32
	sub	a2,a2,a4
	ld	t5,72(sp)
	ld	t4,80(sp)
	ld	t3,88(sp)
	ld	t1,96(sp)
	ld	a7,104(sp)
	ld	a0,112(sp)
	ld	a1,128(sp)
	slli	a2,a2,2
	slli	a5,a5,2
	addi	a2,a2,-8
.L99:
	add	a4,t5,a5
	sw	zero,0(a4)
	add	a4,t4,a5
	sw	zero,0(a4)
	add	a4,t3,a5
	sw	zero,0(a4)
	add	a4,t1,a5
	sw	s0,0(a4)
	add	a4,a7,a5
	sw	s0,0(a4)
	add	a3,a0,a5
	add	a4,a1,a5
	sw	s0,0(a3)
	sw	zero,0(a4)
	addi	a5,a5,-4
	bne	a2,a5,.L99
.L100:
	lw	a5,28(s2)
	bnez	a5,.L138
.L98:
	ld	a1,192(sp)
	ld	a0,8(sp)
	ld	a2,32(sp)
	call	launch@plt
	ld	a2,24(sp)
	ld	a1,184(sp)
	ld	a0,0(sp)
	call	launch@plt
	ld	a2,40(sp)
	ld	a1,176(sp)
	mv	a0,s8
	call	launch@plt
	lw	a5,28(s2)
	bnez	a5,.L139
.L101:
	ld	a0,8(sp)
	call	join@plt
	ld	a0,0(sp)
	call	join@plt
	mv	a0,s8
	call	join@plt
	lw	s1,4(s2)
	addiw	a4,s1,-1
	slli	a3,a4,32
	sext.w	a5,a4
	bltz	a3,.L111
	li	s5,3
	remw	s5,s7,s5
	slli	a4,a4,32
	srli	a4,a4,32
	sub	s1,s1,a4
	slli	s10,a5,2
	lla	a5,.LANCHOR1
	slli	s1,s1,2
	addi	s1,s1,-8
	addi	s9,sp,200
	li	s4,4
	li	s6,5
	slli	s5,s5,3
	add	a5,a5,s5
	sd	a5,16(sp)
	j	.L110
.L142:
	ld	a3,32(s3)
	lw	a3,0(a3)
	bltz	a3,.L106
	bnez	s5,.L140
.L107:
	ld	a4,16(s11)
	addi	s10,s10,-4
	addi	a4,a4,1
	sd	a4,16(s11)
	beq	s1,s10,.L111
.L110:
	ld	a4,96(sp)
	ld	a3,104(sp)
	li	s5,0
	add	a4,a4,s10
	lw	a7,0(a4)
	ld	a4,112(sp)
	add	a3,a3,s10
	lw	t1,0(a3)
	add	a4,a4,s10
	lw	t3,0(a4)
	bnez	a7,.L104
	mv	s5,a7
	bnez	t1,.L104
	seqz	s5,t3
.L104:
	ld	a0,0(s11)
	li	a3,1
	mv	a4,s5
	li	a2,3
	mv	a1,s9
	sd	a7,200(sp)
	sd	t1,208(sp)
	sd	t3,216(sp)
	call	add_outcome_outs@plt
	lw	a3,16(s2)
	sd	a0,0(s11)
	beq	a3,s4,.L141
	beq	a3,s6,.L142
.L106:
	beqz	s5,.L107
.L108:
	ld	a4,8(s11)
	addi	s10,s10,-4
	addi	a4,a4,1
	sd	a4,8(s11)
	bne	s1,s10,.L110
.L111:
	lw	a5,8(s2)
	addiw	s7,s7,1
	bgt	a5,s7,.L90
.L103:
	ld	a0,72(sp)
	call	free@plt
	ld	a0,80(sp)
	call	free@plt
	ld	a0,88(sp)
	call	free@plt
	ld	a0,96(sp)
	call	free@plt
	ld	a0,104(sp)
	call	free@plt
	ld	a0,112(sp)
	call	free@plt
	ld	a0,120(sp)
	call	pb_free@plt
	ld	a0,128(sp)
	call	free@plt
	la	a5,__stack_chk_guard
	ld	a4,296(sp)
	ld	a5,0(a5)
	bne	a4,a5,.L143
	ld	ra,408(sp)
	ld	s0,400(sp)
	ld	s1,392(sp)
	ld	s2,384(sp)
	ld	s3,376(sp)
	ld	s4,368(sp)
	ld	s5,360(sp)
	ld	s6,352(sp)
	ld	s7,344(sp)
	ld	s8,336(sp)
	ld	s9,328(sp)
	ld	s10,320(sp)
	mv	a0,s11
	ld	s11,312(sp)
	addi	sp,sp,416
	jr	ra
.L141:
	ld	a3,32(s3)
	lw	a3,0(a3)
	bltz	a3,.L106
	beqz	s5,.L107
	ld	a0,0(s3)
	call	pm_lock@plt
	ld	a5,16(sp)
.L135:
	ld	a4,0(a5)
	ld	a0,0(s3)
	addi	a4,a4,1
	sd	a4,0(a5)
	call	pm_unlock@plt
	j	.L108
.L140:
	ld	a0,0(s3)
	call	pm_lock@plt
	lla	a5,.LANCHOR1
	j	.L135
.L139:
	ld	a0,48(sp)
	li	a2,3
	mv	a1,s8
	call	perm_threads@plt
	j	.L101
.L138:
	ld	a1,56(sp)
	ld	a0,48(sp)
	li	a2,3
	call	perm_funs@plt
	j	.L98
.L136:
	ld	a0,8(s3)
	call	pb_wait@plt
	lw	a5,24(s3)
	beqz	a5,.L144
.L134:
	ld	a0,8(s3)
	call	pb_wait@plt
	j	.L93
.L137:
	ld	a0,8(s3)
	call	pb_wait@plt
	li	a3,3
	remw	a3,s7,a3
	lw	a2,24(s3)
	ld	a4,32(s3)
	slliw	a5,a2,1
	addw	a5,a5,a2
	addi	a2,a4,12
	slliw	a1,a3,1
	addw	a3,a1,a3
	add	a5,a5,a3
	slli	a5,a5,2
	lla	a3,.LANCHOR0
	add	a5,a3,a5
.L94:
	lw	a3,0(a5)
	addi	a4,a4,4
	addi	a5,a5,4
	sw	a3,-4(a4)
	bne	a2,a4,.L94
	j	.L134
.L144:
	lw	a3,20(s2)
	lw	a2,24(s2)
	ld	a1,32(s3)
	ld	a0,48(sp)
	call	perm_prefix_ints@plt
	j	.L134
.L143:
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
	.string	"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
	.align	3
.LC8:
	.string	"%s\n"
	.align	3
.LC9:
	.string	"% Results for tests/non-mixed-size/SAFE/3.SB+fence.rw.rws.litmus %"
	.align	3
.LC10:
	.string	"RISCV 3.SB+fence.rw.rws"
	.align	3
.LC11:
	.string	"\"Fence.rw.rwdWR Fre Fence.rw.rwdWR Fre Fence.rw.rwdWR Fre\""
	.align	3
.LC12:
	.string	"{"
	.align	3
.LC13:
	.string	" 0:x5=1; 0:x6=x; 0:x8=y;"
	.align	3
.LC14:
	.string	" 1:x5=1; 1:x6=y; 1:x8=z;"
	.align	3
.LC15:
	.string	" 2:x5=1; 2:x6=z; 2:x8=x;"
	.align	3
.LC16:
	.string	"}"
	.align	3
.LC17:
	.string	" P0          | P1          | P2          ;"
	.align	3
.LC18:
	.string	" sw x5,0(x6) | sw x5,0(x6) | sw x5,0(x6) ;"
	.align	3
.LC19:
	.string	" fence rw,rw | fence rw,rw | fence rw,rw ;"
	.align	3
.LC20:
	.string	" lw x7,0(x8) | lw x7,0(x8) | lw x7,0(x8) ;"
	.align	3
.LC21:
	.string	""
	.align	3
.LC22:
	.string	"exists (0:x7=0 /\\ 1:x7=0 /\\ 2:x7=0)"
	.align	3
.LC23:
	.string	"Generated assembler"
	.align	3
.LC24:
	.string	"Bad topology %s, reverting to scan affinity\n"
	.align	3
.LC25:
	.string	"Warning: avail=%i, available=%i\n"
	.align	3
.LC26:
	.string	"3.SB+fence.rw.rws: n=%i, r=%i, s=%i"
	.align	3
.LC27:
	.string	", st=%i"
	.align	3
.LC28:
	.string	", i=%i"
	.align	3
.LC29:
	.string	", +ra"
	.align	3
.LC30:
	.string	", +ca"
	.align	3
.LC31:
	.string	", +sa"
	.align	3
.LC32:
	.string	", p='"
	.align	3
.LC33:
	.string	"'"
	.align	3
.LC34:
	.string	"\n"
	.align	3
.LC35:
	.string	"logical proc -> core: "
	.align	3
.LC36:
	.string	"thread allocation: \n"
	.align	3
.LC37:
	.string	"3.SB+fence.rw.rws, sum_hist"
	.align	3
.LC38:
	.string	"Test 3.SB+fence.rw.rws Allowed\n"
	.align	3
.LC39:
	.string	"Histogram (%d states)\n"
	.align	3
.LC40:
	.string	"Observation 3.SB+fence.rw.rws %s %lu %lu\n"
	.align	3
.LC42:
	.string	"Time 3.SB+fence.rw.rws %.2f\n"
	.align	3
.LC43:
	.string	"Ok"
	.align	3
.LC44:
	.string	"\nWitnesses\n"
	.align	3
.LC45:
	.string	"Positive: %lu, Negative: %lu\n"
	.align	3
.LC46:
	.string	"Condition %s is %svalidated\n"
	.align	3
.LC47:
	.string	"Hash=551534090ebfa9fe3dab5da2675032c5\n"
	.align	3
.LC48:
	.string	"Cycle=Fre Fence.rw.rwdWR Fre Fence.rw.rwdWR Fre Fence.rw.rwdWR\n"
	.align	3
.LC49:
	.string	"Relax 3.SB+fence.rw.rws %s %s\n"
	.align	3
.LC50:
	.string	"Safe=Fre Fence.rw.rwdWR\n"
	.align	3
.LC51:
	.string	"Generator=diy7 (version 7.51+4(dev))\n"
	.align	3
.LC52:
	.string	"Com=Fr Fr Fr\n"
	.align	3
.LC53:
	.string	"Orig=Fence.rw.rwdWR Fre Fence.rw.rwdWR Fre Fence.rw.rwdWR Fre\n"
	.align	3
.LC54:
	.string	"No"
	.align	3
.LC55:
	.string	"NOT "
	.align	3
.LC56:
	.string	"Affinity=[1] [2] [0] ; (0,1) (1,2) (2,0)\n"
	.text
	.align	1
	.globl	_X3_2E_SB_2B_fence_2E_rw_2E_rws
	.type	_X3_2E_SB_2B_fence_2E_rw_2E_rws, @function
_X3_2E_SB_2B_fence_2E_rw_2E_rws:
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
	li	a5,2
	ble	a4,a5,.L232
	li	a5,1
	li	a6,5
	slli	a4,a5,32
	mv	s5,a0
	slli	a6,a6,33
	li	a0,-1
	addi	t1,a4,100
	srli	a1,a0,32
	addi	a7,a4,1
	addi	a2,s0,-368
	addi	a3,s0,-256
	sd	a6,-368(s0)
	li	a6,4
	sd	t1,-360(s0)
	sd	a4,-344(s0)
	sw	a5,-328(s0)
	sw	a5,-264(s0)
	sd	a6,-352(s0)
	sd	a7,-336(s0)
	sd	s5,-320(s0)
	sd	zero,-312(s0)
	sd	a1,-304(s0)
	sd	zero,-296(s0)
	sd	zero,-288(s0)
	sd	a0,-280(s0)
	sd	a1,-272(s0)
	mv	a5,a2
	mv	a4,a3
	addi	t1,s0,-272
.L148:
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
	bne	a5,t1,.L148
	ld	a6,0(a5)
	ld	a5,8(a5)
	mv	a1,s2
	mv	a0,s3
	sd	a5,8(a4)
	sd	a6,0(a4)
	call	parse_cmd@plt
	lw	a5,-152(s0)
	sd	sp,-488(s0)
	bnez	a5,.L233
.L149:
	call	timeofday@plt
	lw	a5,-256(s0)
	lw	a4,-244(s0)
	sd	a0,-496(s0)
	sw	a5,-408(s0)
	lw	a5,-248(s0)
	sw	a5,-404(s0)
	lw	a5,-252(s0)
	sw	a5,-400(s0)
	blez	a4,.L234
	lw	a5,-228(s0)
	sw	a4,-396(s0)
	li	a4,5
	beq	a5,a4,.L151
.L249:
	addiw	a5,a5,-3
	li	a4,2
	sgtu	a5,a5,a4
	li	s9,-1
.L152:
	lw	a4,-156(s0)
	sw	a5,-380(s0)
	beqz	a4,.L154
	sw	zero,-380(s0)
.L154:
	lw	a0,0(s5)
	li	a1,2
	call	coremap_seq@plt
	lw	s2,-240(s0)
	sd	a0,-376(s0)
	ld	s4,-208(s0)
	blez	s2,.L235
	lw	a2,0(s4)
	ble	s2,a2,.L156
	mv	a1,s2
	lla	a0,.LC25
	call	log_error@plt
	ld	s4,-208(s0)
.L156:
	lw	s6,-236(s0)
	blez	s6,.L157
.L250:
	slli	s7,s6,2
	addiw	a5,s6,-1
	slliw	s2,s6,1
	add	s7,s7,s6
	sd	a5,-424(s0)
	addw	s2,s2,s6
	slli	s8,a5,3
	sd	s6,-504(s0)
	slli	s7,s7,3
.L158:
	lw	a4,-228(s0)
	li	a5,2
	mv	s3,s2
	beq	a4,a5,.L236
.L159:
	slli	a5,s3,2
	addi	a5,a5,15
	lw	a3,-408(s0)
	andi	a5,a5,-16
	sub	sp,sp,a5
	sw	a4,-392(s0)
	sw	s3,-388(s0)
	sw	s2,-384(s0)
	mv	s10,sp
	bnez	a3,.L237
.L160:
	li	a5,2
	beq	a4,a5,.L238
	li	a5,3
	beq	a4,a5,.L239
	li	a5,5
	beq	a4,a5,.L240
.L169:
	addi	s8,s8,15
	andi	s8,s8,-16
	addi	s7,s7,15
	sub	sp,sp,s8
	andi	s7,s7,-16
	sd	sp,-464(s0)
	sub	sp,sp,s7
	call	pm_create@plt
	mv	s8,a0
	mv	a0,s6
	sd	s8,-440(s0)
	call	pb_create@plt
	lw	a5,-216(s0)
	sd	a0,-448(s0)
	lw	a1,0(s4)
	mv	s3,sp
	blez	a5,.L241
	remw	a5,a5,a1
	sd	a5,-456(s0)
.L176:
	ld	a0,-456(s0)
	addi	s10,s10,12
	li	s2,0
	call	gcd@plt
	ld	s11,-464(s0)
	addi	a5,s0,-408
	sd	a0,-480(s0)
	mv	s7,s11
	sd	zero,-432(s0)
	li	s8,0
	li	s9,0
	sd	a5,-472(s0)
	j	.L183
.L244:
	mv	a2,s3
	mv	a0,s11
	lla	a1,zyva
	addiw	s9,s9,1
	call	launch@plt
	addi	s3,s3,40
	addi	s11,s11,8
	addi	s10,s10,12
	beq	s6,s9,.L242
.L183:
	ld	a4,-472(s0)
	lw	a5,-228(s0)
	addi	a3,s10,-12
	sd	a4,16(s3)
	ld	a4,-440(s0)
	sw	s9,24(s3)
	sd	a3,32(s3)
	sd	a4,0(s3)
	ld	a4,-448(s0)
	sd	a4,8(s3)
	li	a4,1
	beq	a5,a4,.L243
.L178:
	ld	a5,-424(s0)
	bgt	a5,s9,.L244
	mv	a0,s3
	call	zyva
	addiw	s9,s9,1
	mv	s2,a0
	addi	s3,s3,40
	addi	s11,s11,8
	addi	s10,s10,12
	bne	s6,s9,.L183
.L242:
	lw	a5,-404(s0)
	lw	s6,-400(s0)
	mul	s6,s6,a5
	ld	a5,-424(s0)
	beqz	a5,.L190
	ld	a5,-424(s0)
	addiw	s3,a5,-1
	slli	s3,s3,32
	ld	a5,-464(s0)
	srli	s3,s3,32
	addi	s3,s3,1
	slli	s3,s3,3
	add	s11,a5,s3
	lla	s3,.LC37
.L189:
	mv	a0,s7
	call	join@plt
	mv	s8,a0
	ld	a0,0(a0)
	call	sum_outs@plt
	bne	s6,a0,.L187
	ld	a6,8(s8)
	ld	a2,16(s8)
	add	a4,a6,a2
	beq	s6,a4,.L188
.L187:
	mv	a0,s3
	call	fatal@plt
	ld	a6,8(s8)
	ld	a2,16(s8)
.L188:
	ld	a3,8(s2)
	ld	a4,16(s2)
	ld	a1,0(s8)
	ld	a0,0(s2)
	add	a4,a4,a2
	add	a3,a3,a6
	li	a2,3
	sd	a3,8(s2)
	sd	a4,16(s2)
	call	merge_outs@plt
	sd	a0,0(s2)
	ld	a0,0(s8)
	addi	s7,s7,8
	call	free_outs@plt
	mv	a0,s8
	call	free@plt
	bne	s11,s7,.L189
.L190:
	mv	a0,s4
	call	cpus_free@plt
	call	timeofday@plt
	ld	a5,-496(s0)
	mv	s3,a0
	ld	a0,-440(s0)
	sub	s3,s3,a5
	call	pm_free@plt
	ld	a5,-504(s0)
	ld	a0,-448(s0)
	mul	s6,s6,a5
	call	pb_free@plt
	ld	a0,0(s2)
	call	sum_outs@plt
	bne	s6,a0,.L185
	ld	s4,8(s2)
	ld	s7,16(s2)
	add	a5,s4,s7
	beq	s6,a5,.L191
.L185:
	lla	a0,.LC37
	call	fatal@plt
	ld	s4,8(s2)
	ld	s7,16(s2)
.L191:
	li	a2,31
	li	a1,1
	mv	a3,s1
	lla	a0,.LC38
	call	fwrite@plt
	ld	a0,0(s2)
	call	finals_outs@plt
	mv	a3,a0
	lla	a2,.LC39
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	ld	a2,0(s2)
	li	a4,3
	addi	a3,s0,-144
	lla	a1,do_dump_outcome
	mv	a0,s1
	call	dump_outs@plt
	beqz	s4,.L245
	lla	a2,.LC8
	li	a1,1
	lla	a3,.LC43
	mv	a0,s1
	call	__fprintf_chk@plt
	mv	a3,s1
	li	a2,11
	li	a1,1
	lla	a0,.LC44
	call	fwrite@plt
	mv	a4,s7
	mv	a3,s4
	lla	a2,.LC45
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a4,.LC21
	lla	a2,.LC46
	li	a1,1
	lla	a3,.LC22
	mv	a0,s1
	call	__fprintf_chk@plt
	mv	a3,s1
	li	a2,38
	li	a1,1
	lla	a0,.LC47
	call	fwrite@plt
	mv	a3,s1
	li	a2,63
	li	a1,1
	lla	a0,.LC48
	call	fwrite@plt
	lla	a4,.LC21
	lla	a2,.LC49
	li	a1,1
	lla	a3,.LC43
	mv	a0,s1
	call	__fprintf_chk@plt
	mv	a3,s1
	li	a2,24
	li	a1,1
	lla	a0,.LC50
	call	fwrite@plt
	mv	a3,s1
	li	a2,37
	li	a1,1
	lla	a0,.LC51
	call	fwrite@plt
	mv	a3,s1
	li	a2,13
	li	a1,1
	lla	a0,.LC52
	call	fwrite@plt
	mv	a3,s1
	li	a2,62
	li	a1,1
	lla	a0,.LC53
	call	fwrite@plt
	lw	a4,-228(s0)
	li	a5,3
	beq	a4,a5,.L246
.L196:
	lla	s6,.LC5
	bnez	s7,.L247
.L194:
	mv	a5,s7
	mv	a4,s4
	mv	a3,s6
	lla	a2,.LC40
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	fcvt.d.lu	fa4,s3
	fld	fa5,.LC41,a5
	lla	a2,.LC42
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
	ld	a0,-376(s0)
	call	cpus_free@plt
	ld	a5,-208(s0)
	ld	sp,-488(s0)
	beq	a5,s5,.L147
	mv	a0,s5
.L232:
	call	cpus_free@plt
.L147:
	la	a5,__stack_chk_guard
	ld	a4,-120(s0)
	ld	a5,0(a5)
	bne	a4,a5,.L248
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
.L234:
	lw	a5,-228(s0)
	li	a4,3
	sw	a4,-396(s0)
	li	a4,5
	bne	a5,a4,.L249
.L151:
	ld	a2,-200(s0)
	li	a1,3
	lla	a0,.LANCHOR2
	call	find_string@plt
	mv	s9,a0
	bltz	a0,.L153
	lw	a5,-228(s0)
	li	a4,2
	addiw	a5,a5,-3
	sgtu	a5,a5,a4
	j	.L152
.L235:
	lw	s6,-236(s0)
	lw	s2,0(s4)
	bgtz	s6,.L250
.L157:
	li	a5,2
	ble	s2,a5,.L199
	li	a1,3
	divw	s6,s2,a1
	lw	a4,-228(s0)
	addiw	a5,s6,-1
	slli	s7,s6,2
	slliw	s2,s6,1
	sd	a5,-424(s0)
	add	s7,s7,s6
	addw	s2,s2,s6
	slli	s8,a5,3
	sd	s6,-504(s0)
	li	a5,2
	slli	s7,s7,3
	mv	s3,s2
	bne	a4,a5,.L159
.L236:
	lw	a0,0(s4)
	mv	a1,s2
	call	max@plt
	lw	a4,-228(s0)
	mv	s3,a0
	j	.L159
.L233:
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
	j	.L149
.L243:
	ld	a0,8(s4)
.L180:
	slli	a5,s8,2
	add	a5,a0,a5
	lw	a1,0(a5)
	ld	a5,-456(s0)
	addi	a3,a3,4
	sw	a1,-4(a3)
	lw	a4,0(s4)
	addw	a5,a5,s8
	remw	s8,a5,a4
	ld	a4,-432(s0)
	beq	s8,a4,.L251
	bne	a3,s10,.L180
	j	.L178
.L251:
	ld	a4,-480(s0)
	addiw	a5,s8,1
	remw	s8,a5,a4
	sd	s8,-432(s0)
	bne	a3,s10,.L180
	j	.L178
.L245:
	lla	a2,.LC8
	li	a1,1
	lla	a3,.LC54
	mv	a0,s1
	call	__fprintf_chk@plt
	mv	a3,s1
	li	a2,11
	li	a1,1
	lla	a0,.LC44
	call	fwrite@plt
	mv	a4,s7
	li	a3,0
	lla	a2,.LC45
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a4,.LC55
	lla	a2,.LC46
	li	a1,1
	lla	a3,.LC22
	mv	a0,s1
	call	__fprintf_chk@plt
	mv	a3,s1
	li	a2,38
	li	a1,1
	lla	a0,.LC47
	call	fwrite@plt
	mv	a3,s1
	li	a2,63
	li	a1,1
	lla	a0,.LC48
	call	fwrite@plt
	lla	a4,.LC21
	lla	a2,.LC49
	li	a1,1
	lla	a3,.LC54
	mv	a0,s1
	call	__fprintf_chk@plt
	mv	a3,s1
	li	a2,24
	li	a1,1
	lla	a0,.LC50
	call	fwrite@plt
	mv	a3,s1
	li	a2,37
	li	a1,1
	lla	a0,.LC51
	call	fwrite@plt
	mv	a3,s1
	li	a2,13
	li	a1,1
	lla	a0,.LC52
	call	fwrite@plt
	mv	a3,s1
	li	a2,62
	li	a1,1
	lla	a0,.LC53
	call	fwrite@plt
	lw	a4,-228(s0)
	li	a5,3
	lla	s6,.LC4
	bne	a4,a5,.L194
	mv	a3,s1
	li	a2,41
	li	a1,1
	lla	a0,.LC56
	call	fwrite@plt
	j	.L194
.L241:
	blez	a1,.L201
	ld	a4,8(s4)
	li	a5,0
	li	a3,-1
.L177:
	sw	a3,0(a4)
	lw	a1,0(s4)
	addiw	a5,a5,1
	addi	a4,a4,4
	blt	a5,a1,.L177
.L201:
	li	a5,1
	sd	a5,-456(s0)
	j	.L176
.L238:
	blez	s3,.L169
	ld	a2,8(s4)
	mv	a3,s10
	li	a4,0
.L170:
	lw	a5,0(s4)
	addi	a3,a3,4
	remw	a5,a4,a5
	addiw	a4,a4,1
	slli	a5,a5,2
	add	a5,a2,a5
	lw	a5,0(a5)
	sw	a5,-4(a3)
	bne	s3,a4,.L170
	j	.L169
.L237:
	lw	a3,-404(s0)
	lw	a2,-400(s0)
	mv	a1,s6
	lla	a0,.LC26
	call	log_error@plt
	lw	a1,-396(s0)
	lla	a0,.LC27
	call	log_error@plt
	lw	a5,-228(s0)
	li	a4,1
	beq	a5,a4,.L252
	li	a4,2
	beq	a5,a4,.L253
	li	a4,3
	beq	a5,a4,.L254
	li	a4,4
	beq	a5,a4,.L255
.L162:
	lla	a0,.LC32
	call	log_error@plt
	la	s11,stderr
	ld	a1,-208(s0)
	ld	a0,0(s11)
	call	cpus_dump@plt
	lla	a0,.LC33
	call	log_error@plt
	lla	a0,.LC34
	call	log_error@plt
	lw	a4,-408(s0)
	li	a5,1
	ble	a4,a5,.L231
	ld	a5,-376(s0)
	beqz	a5,.L231
	lla	a0,.LC35
	call	log_error@plt
	ld	a0,0(s11)
	ld	a1,-376(s0)
	call	cpus_dump@plt
	lla	a0,.LC34
	call	log_error@plt
.L231:
	lw	a4,-228(s0)
	j	.L160
.L247:
	lla	s6,.LC6
	j	.L194
.L199:
	li	a5,1
	li	s7,40
	sd	a5,-504(s0)
	li	s8,0
	sd	zero,-424(s0)
	li	s2,3
	li	s6,1
	j	.L158
.L240:
	slliw	a0,s9,1
	addw	s9,a0,s9
	slli	a0,s9,2
	lla	s9,.LANCHOR0
	add	s9,s9,a0
	blez	s3,.L169
	addiw	a5,s3,-1
	slli	a5,a5,32
	srli	a5,a5,32
	addi	a5,a5,1
	slli	a5,a5,2
	mv	a4,s10
	add	a5,s9,a5
.L174:
	lw	a3,0(s9)
	addi	s9,s9,4
	addi	a4,a4,4
	sw	a3,-4(a4)
	bne	s9,a5,.L174
	j	.L169
.L239:
	ld	a1,-376(s0)
	mv	a5,s6
	mv	a6,s10
	mv	a4,s4
	lla	a3,.LANCHOR0+40
	lla	a2,.LANCHOR2+24
	addi	a0,s0,-412
	sw	zero,-412(s0)
	call	custom_affinity@plt
	lw	a5,-408(s0)
	beqz	a5,.L169
	lla	a0,.LC36
	call	log_error@plt
	la	a5,stderr
	ld	a3,-376(s0)
	ld	a0,0(a5)
	li	a4,3
	mv	a2,s3
	mv	a1,s10
	call	cpus_dump_test@plt
	j	.L169
.L246:
	mv	a3,s1
	li	a2,41
	li	a1,1
	lla	a0,.LC56
	call	fwrite@plt
	j	.L196
.L252:
	lw	a1,-216(s0)
	lla	a0,.LC28
	call	log_error@plt
	j	.L162
.L253:
	lla	a0,.LC29
	call	log_error@plt
	j	.L162
.L153:
	ld	a1,-200(s0)
	lla	a0,.LC24
	call	log_error@plt
	li	a5,4
	sw	a5,-228(s0)
	sd	zero,-200(s0)
	li	a5,0
	j	.L152
.L254:
	lla	a0,.LC30
	call	log_error@plt
	j	.L162
.L255:
	lla	a0,.LC31
	call	log_error@plt
	j	.L162
.L248:
	call	__stack_chk_fail@plt
	.size	_X3_2E_SB_2B_fence_2E_rw_2E_rws, .-_X3_2E_SB_2B_fence_2E_rw_2E_rws
	.section	.rodata.str1.8
	.align	3
.LC57:
	.string	"[[1,2],[0]]"
	.align	3
.LC58:
	.string	"[[0,2],[1]]"
	.align	3
.LC59:
	.string	"[[0,1],[2]]"
	.section	.rodata.cst8,"aM",@progbits,8
	.align	3
.LC41:
	.word	0
	.word	1093567616
	.data
	.align	3
	.set	.LANCHOR0,. + 0
	.type	cpu_scan, @object
	.size	cpu_scan, 36
cpu_scan:
	.word	0
	.word	2
	.word	3
	.word	2
	.word	0
	.word	3
	.word	0
	.word	1
	.word	2
	.zero	4
	.type	diff, @object
	.size	diff, 28
diff:
	.word	0
	.word	1
	.word	1
	.word	2
	.word	2
	.word	0
	.word	-1
	.zero	4
	.type	color_2, @object
	.size	color_2, 8
color_2:
	.word	0
	.word	-1
	.type	color_1, @object
	.size	color_1, 8
color_1:
	.word	2
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
	.size	ngroups, 24
ngroups:
	.zero	24
	.section	.data.rel.local,"aw"
	.align	3
	.set	.LANCHOR2,. + 0
	.type	group, @object
	.size	group, 24
group:
	.dword	.LC57
	.dword	.LC58
	.dword	.LC59
	.type	color, @object
	.size	color, 32
color:
	.dword	color_0
	.dword	color_1
	.dword	color_2
	.dword	0
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
