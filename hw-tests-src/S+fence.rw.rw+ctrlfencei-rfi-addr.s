	.file	"S+fence.rw.rw+ctrlfencei-rfi-addr.c"
	.option pic
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"%-6lu%c>1:x5=%d; 1:x9=%d; [x]=%d;\n"
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
	.string	"S+fence.rw.rw+ctrlfencei-rfi-addr, check_globals failed"
	.text
	.align	1
	.type	check_globals, @function
check_globals:
	ld	a5,88(a0)
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
	addi	s1,a0,80
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
	ld	a0,40(s6)
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
	.string	"%i: Stabilizing final state!\n"
	.text
	.align	1
	.type	stabilize_globals, @function
stabilize_globals:
	ld	a5,88(a1)
	addi	sp,sp,-80
	sd	s2,48(sp)
	mv	s2,a0
	ld	a0,40(a1)
	sd	s8,0(sp)
	lw	s8,4(a5)
	sd	s0,64(sp)
	sd	s1,56(sp)
	sd	s3,40(sp)
	sd	s4,32(sp)
	sd	s5,24(sp)
	sd	s6,16(sp)
	sd	s7,8(sp)
	mv	s4,a1
	ld	s1,16(a1)
	sd	ra,72(sp)
	call	pb_wait@plt
	addiw	a4,s8,-1
	slli	s0,a4,32
	addiw	a5,s2,1
	srli	s0,s0,32
	andi	a5,a5,1
	sub	s0,s8,s0
	addi	s7,s4,56
	slli	s6,s2,3
	slli	a5,a5,3
	slli	s0,s0,2
	add	s6,s7,s6
	slli	s5,a4,2
	add	s7,s7,a5
	addi	s0,s0,-8
	lla	s3,.LC2
.L42:
	ld	a0,48(s4)
	blez	s8,.L36
	ld	a2,0(s6)
	mv	a5,s5
.L37:
	add	a4,s1,a5
	lw	a3,0(a4)
	add	a4,a2,a5
	addi	a5,a5,-4
	sw	a3,0(a4)
	bne	a5,s0,.L37
	call	po_reinit@plt
	ld	a1,0(s6)
	ld	a2,0(s7)
	mv	a3,s5
.L40:
	add	a4,a1,a3
	add	a5,a2,a3
	lw	a4,0(a4)
	lw	a5,0(a5)
	beq	a4,a5,.L50
	mv	a1,s2
	mv	a0,s3
	call	log_error@plt
	li	a1,1
.L41:
	ld	a0,48(s4)
	call	po_wait@plt
	bnez	a0,.L42
	ld	ra,72(sp)
	ld	s0,64(sp)
	ld	s1,56(sp)
	ld	s2,48(sp)
	ld	s3,40(sp)
	ld	s4,32(sp)
	ld	s5,24(sp)
	ld	s6,16(sp)
	ld	s7,8(sp)
	ld	s8,0(sp)
	addi	sp,sp,80
	jr	ra
.L50:
	addi	a3,a3,-4
	bne	a3,s0,.L40
	li	a1,0
	j	.L41
.L36:
	call	po_reinit@plt
	li	a1,0
	j	.L41
	.size	stabilize_globals, .-stabilize_globals
	.section	.rodata.str1.8
	.align	3
.LC3:
	.string	"S+fence.rw.rw+ctrlfencei-rfi-addr"
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
# 47 "S+fence.rw.rw+ctrlfencei-rfi-addr.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	ld	s0,16(a0)
	lw	a4,0(a0)
	ld	a5,8(a0)
	ld	a3,88(s0)
	slli	a4,a4,2
	add	a5,a5,a4
	lw	a0,0(a5)
	lw	a2,0(a3)
	li	a1,4
	lla	a3,.LC3
	call	force_one_affinity@plt
	mv	a0,s0
	call	check_globals
	ld	a5,88(s0)
	lw	t4,0(s1)
	ld	t5,72(s0)
	lw	t3,12(a5)
	lw	t2,4(a5)
	blez	t3,.L55
	sub	t0,t2,t3
	negw	t1,t3
	subw	t6,t2,t3
	slli	t0,t0,2
	sext.w	t2,t2
	slli	t1,t1,2
	sext.w	t4,t4
	li	a1,1
.L54:
	sext.w	a0,t6
	mv	a4,t0
	bltz	t6,.L59
.L58:
	andi	a5,a0,1
	add	a3,t5,a4
	beq	a5,t4,.L68
.L56:
	lw	a5,0(a3)
	sext.w	a5,a5
	beqz	a5,.L56
.L57:
	ld	a5,8(s0)
	ld	a3,0(s0)
	ld	a2,16(s0)
	add	a5,a5,a4
	add	a3,a3,a4
	add	a2,a2,a4
#APP
# 278 "S+fence.rw.rw+ctrlfencei-rfi-addr.c" 1
	
#START _litmus_P1
#_litmus_P1_0
	lw a6,0(a5)
#_litmus_P1_1
	bne a6,x0,0f
#_litmus_P1_2
0:
#_litmus_P1_3
	fence.i
#_litmus_P1_4
	sw a1,0(a3)
#_litmus_P1_5
	lw a7,0(a3)
#_litmus_P1_6
	xor s1,a7,a7
#_litmus_P1_7
	add ra,a2,s1
#_litmus_P1_8
	sw a1,0(ra)
#END _litmus_P1

# 0 "" 2
#NO_APP
	ld	a3,32(s0)
	ld	a5,24(s0)
	subw	a0,a0,t3
	add	a3,a3,a4
	add	a5,a5,a4
	sw	a7,0(a3)
	sw	a6,0(a5)
	add	a4,a4,t1
	bgez	a0,.L58
.L59:
	addiw	t6,t6,1
	addi	t0,t0,4
	bne	t6,t2,.L54
.L55:
	mv	a1,s0
	li	a0,1
	call	stabilize_globals
#APP
# 47 "S+fence.rw.rw+ctrlfencei-rfi-addr.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	li	a0,0
	addi	sp,sp,32
	jr	ra
.L68:
	sw	a1,0(a3)
#APP
# 47 "S+fence.rw.rw+ctrlfencei-rfi-addr.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	j	.L57
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
# 47 "S+fence.rw.rw+ctrlfencei-rfi-addr.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	ld	s0,16(a0)
	lw	a4,0(a0)
	ld	a5,8(a0)
	ld	a3,88(s0)
	slli	a4,a4,2
	add	a5,a5,a4
	lw	a0,0(a5)
	lw	a2,0(a3)
	li	a1,4
	lla	a3,.LC3
	call	force_one_affinity@plt
	mv	a0,s0
	call	check_globals
	ld	a5,88(s0)
	lw	a7,0(s1)
	ld	t3,72(s0)
	lw	a6,12(a5)
	lw	t6,4(a5)
	blez	a6,.L73
	sub	t5,t6,a6
	negw	a0,a6
	subw	t4,t6,a6
	slli	t5,t5,2
	sext.w	t6,t6
	slli	a0,a0,2
	sext.w	a7,a7
	li	a1,1
	li	t1,2
.L72:
	sext.w	a2,t4
	mv	a3,t5
	bltz	t4,.L77
.L76:
	andi	a5,a2,1
	add	a4,t3,a3
	beq	a5,a7,.L86
.L74:
	lw	a5,0(a4)
	sext.w	a5,a5
	beqz	a5,.L74
.L75:
	ld	a5,16(s0)
	ld	a4,8(s0)
	add	a5,a5,a3
	add	a4,a4,a3
#APP
# 241 "S+fence.rw.rw+ctrlfencei-rfi-addr.c" 1
	
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
	bgez	a2,.L76
.L77:
	addiw	t4,t4,1
	addi	t5,t5,4
	bne	t4,t6,.L72
.L73:
	mv	a1,s0
	li	a0,0
	call	stabilize_globals
#APP
# 47 "S+fence.rw.rw+ctrlfencei-rfi-addr.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	li	a0,0
	addi	sp,sp,32
	jr	ra
.L86:
	sw	a1,0(a4)
#APP
# 47 "S+fence.rw.rw+ctrlfencei-rfi-addr.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	j	.L75
	.size	P0, .-P0
	.section	.rodata.str1.8
	.align	3
.LC4:
	.string	"Run %i of %i\r"
	.align	3
.LC5:
	.string	"S+fence.rw.rw+ctrlfencei-rfi-addr, global x unstabilized"
	.text
	.align	1
	.type	zyva, @function
zyva:
	addi	sp,sp,-384
	la	a5,__stack_chk_guard
	ld	a5,0(a5)
	sd	s6,320(sp)
	mv	s6,a0
	ld	a0,8(a0)
	sd	ra,376(sp)
	sd	s0,368(sp)
	sd	s1,360(sp)
	sd	s3,344(sp)
	sd	a5,264(sp)
	ld	s3,16(s6)
	sd	s2,352(sp)
	sd	s4,336(sp)
	sd	s5,328(sp)
	sd	s7,312(sp)
	sd	s8,304(sp)
	sd	s9,296(sp)
	sd	s10,288(sp)
	sd	s11,280(sp)
	call	pb_wait@plt
	lla	a5,P0
	sd	a5,80(sp)
	li	a0,24
	lla	a5,P1
	sd	a5,88(sp)
	call	malloc_check@plt
	lw	s1,4(s3)
	sd	zero,0(a0)
	sd	zero,16(a0)
	sd	zero,8(a0)
	slli	s1,s1,2
	mv	s0,a0
	sd	s3,256(sp)
	call	rand@plt
	mv	a5,a0
	mv	a0,s1
	sw	a5,248(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s1
	sd	a5,192(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s1
	sd	a5,200(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s1
	sd	a5,168(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s1
	sd	a5,176(sp)
	call	malloc_check@plt
	mv	a5,a0
	li	a0,2
	sd	a5,184(sp)
	call	pb_create@plt
	mv	a5,a0
	li	a0,2
	sd	a5,208(sp)
	call	po_create@plt
	mv	a5,a0
	mv	a0,s1
	sd	a5,216(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s1
	sd	a5,232(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s1
	sd	a5,224(sp)
	call	malloc_check@plt
	ld	a4,32(s6)
	lw	a3,8(s3)
	li	a5,1
	sw	a5,144(sp)
	addi	a5,sp,168
	sd	a0,240(sp)
	sd	a5,160(sp)
	sd	a4,152(sp)
	sw	zero,120(sp)
	sd	a5,136(sp)
	sd	a4,128(sp)
	blez	a3,.L88
	addi	a5,sp,120
	sd	a5,40(sp)
	addi	a5,sp,144
	sd	a5,32(sp)
	addi	a5,sp,64
	sd	a5,8(sp)
	addi	a5,sp,72
	sd	a5,16(sp)
	addi	a5,sp,248
	sd	a5,48(sp)
	li	s1,-237568
	addi	a5,sp,80
	sd	zero,0(sp)
	addiw	s1,s1,-1919
	sd	a5,56(sp)
.L107:
	lw	a5,16(s3)
	li	a4,2
	beq	a5,a4,.L131
	li	a4,4
	beq	a5,a4,.L132
.L91:
	lw	a4,0(s3)
	li	a5,1
	ble	a4,a5,.L92
	la	a5,stderr
	lw	a4,8(s3)
	ld	a0,0(a5)
	ld	a3,0(sp)
	lla	a2,.LC4
	li	a1,1
	call	__fprintf_chk@plt
.L92:
	ld	a5,256(sp)
	lw	a4,4(a5)
	addiw	a2,a4,-1
	slli	a3,a2,32
	sext.w	a5,a2
	bltz	a3,.L93
	slli	a2,a2,32
	srli	a2,a2,32
	sub	a2,a4,a2
	ld	t3,168(sp)
	ld	t1,176(sp)
	ld	a7,184(sp)
	ld	a6,192(sp)
	ld	a0,200(sp)
	ld	a1,240(sp)
	slli	a2,a2,2
	slli	a5,a5,2
	addi	a2,a2,-8
.L94:
	add	a4,t3,a5
	sw	zero,0(a4)
	add	a4,t1,a5
	sw	zero,0(a4)
	add	a4,a7,a5
	sw	zero,0(a4)
	add	a4,a6,a5
	sw	s1,0(a4)
	add	a3,a0,a5
	add	a4,a1,a5
	sw	s1,0(a3)
	sw	zero,0(a4)
	addi	a5,a5,-4
	bne	a2,a5,.L94
.L93:
	lw	a5,28(s3)
	bnez	a5,.L133
.L95:
	ld	a1,88(sp)
	ld	a0,16(sp)
	ld	a2,32(sp)
	call	launch@plt
	ld	a2,40(sp)
	ld	a1,80(sp)
	ld	a0,8(sp)
	call	launch@plt
	lw	a5,28(s3)
	bnez	a5,.L134
.L96:
	ld	a0,16(sp)
	call	join@plt
	ld	a0,8(sp)
	call	join@plt
	lw	a4,4(s3)
	addiw	s2,a4,-1
	slli	a3,s2,32
	sext.w	a5,s2
	bltz	a3,.L97
	slli	s2,s2,32
	srli	s2,s2,32
	sub	s2,a4,s2
	ld	a4,0(sp)
	slli	s11,a5,2
	lla	a5,.LANCHOR1
	andi	s8,a4,1
	slli	s8,s8,3
	slli	s2,s2,2
	add	a5,a5,s8
	addi	s2,s2,-8
	addi	s5,sp,96
	lla	s7,.LC5
	sd	a5,24(sp)
	j	.L106
.L138:
	ld	a3,32(s6)
	lw	a3,0(a3)
	bltz	a3,.L102
	bnez	s8,.L135
.L103:
	ld	a4,16(s0)
	addi	s11,s11,-4
	addi	a4,a4,1
	sd	a4,16(s0)
	beq	s11,s2,.L97
.L106:
	ld	a3,184(sp)
	ld	a4,232(sp)
	add	a3,a3,s11
	add	a4,a4,s11
	lw	s10,0(a3)
	lw	a2,0(a4)
	ld	a3,192(sp)
	ld	a4,200(sp)
	add	a3,a3,s11
	add	a4,a4,s11
	lw	s4,0(a3)
	lw	s9,0(a4)
	beq	a2,s10,.L98
	mv	a0,s7
	call	fatal@plt
.L98:
	ld	a4,224(sp)
	add	a4,a4,s11
	lw	a4,0(a4)
	beq	a4,s10,.L99
	mv	a0,s7
	call	fatal@plt
.L99:
	li	a5,1
	li	s8,0
	beq	s4,a5,.L136
.L100:
	ld	a0,0(s0)
	li	a3,1
	li	a2,3
	mv	a4,s8
	mv	a1,s5
	sd	s4,96(sp)
	sd	s9,104(sp)
	sd	s10,112(sp)
	call	add_outcome_outs@plt
	lw	a3,16(s3)
	li	a2,4
	sd	a0,0(s0)
	beq	a3,a2,.L137
	li	a2,5
	beq	a3,a2,.L138
.L102:
	beqz	s8,.L103
.L104:
	ld	a4,8(s0)
	addi	s11,s11,-4
	addi	a4,a4,1
	sd	a4,8(s0)
	bne	s11,s2,.L106
.L97:
	ld	a4,0(sp)
	lw	a5,8(s3)
	addiw	a4,a4,1
	sd	a4,0(sp)
	bgt	a5,a4,.L107
.L88:
	ld	a0,168(sp)
	call	free@plt
	ld	a0,176(sp)
	call	free@plt
	ld	a0,184(sp)
	call	free@plt
	ld	a0,192(sp)
	call	free@plt
	ld	a0,200(sp)
	call	free@plt
	ld	a0,208(sp)
	call	pb_free@plt
	ld	a0,216(sp)
	call	po_free@plt
	ld	a0,232(sp)
	call	free@plt
	ld	a0,224(sp)
	call	free@plt
	ld	a0,240(sp)
	call	free@plt
	la	a5,__stack_chk_guard
	ld	a4,264(sp)
	ld	a5,0(a5)
	bne	a4,a5,.L139
	ld	ra,376(sp)
	mv	a0,s0
	ld	s0,368(sp)
	ld	s1,360(sp)
	ld	s2,352(sp)
	ld	s3,344(sp)
	ld	s4,336(sp)
	ld	s5,328(sp)
	ld	s6,320(sp)
	ld	s7,312(sp)
	ld	s8,304(sp)
	ld	s9,296(sp)
	ld	s10,288(sp)
	ld	s11,280(sp)
	addi	sp,sp,384
	jr	ra
.L137:
	ld	a3,32(s6)
	lw	a3,0(a3)
	bltz	a3,.L102
	beqz	s8,.L103
	ld	a0,0(s6)
	call	pm_lock@plt
	ld	a5,24(sp)
.L130:
	ld	a4,0(a5)
	ld	a0,0(s6)
	addi	a4,a4,1
	sd	a4,0(a5)
	call	pm_unlock@plt
	j	.L104
.L136:
	bne	s9,s4,.L100
	addi	a4,s10,-2
	seqz	s8,a4
	j	.L100
.L135:
	ld	a0,0(s6)
	call	pm_lock@plt
	lla	a5,.LANCHOR1
	j	.L130
.L134:
	ld	a1,8(sp)
	ld	a0,48(sp)
	li	a2,2
	call	perm_threads@plt
	j	.L96
.L133:
	ld	a1,56(sp)
	ld	a0,48(sp)
	li	a2,2
	call	perm_funs@plt
	j	.L95
.L131:
	ld	a0,8(s6)
	call	pb_wait@plt
	lw	a5,24(s6)
	beqz	a5,.L140
.L90:
	ld	a0,8(s6)
	call	pb_wait@plt
	j	.L91
.L132:
	ld	a0,8(s6)
	call	pb_wait@plt
	ld	a5,0(sp)
	lw	a4,24(s6)
	lla	a3,.LANCHOR0
	andi	a5,a5,1
	slliw	a5,a5,2
	slliw	a4,a4,1
	slli	a5,a5,2
	add	a5,a3,a5
	slli	a3,a4,2
	add	a3,a5,a3
	ld	a2,32(s6)
	lw	a3,0(a3)
	addi	a4,a4,1
	slli	a4,a4,2
	sw	a3,0(a2)
	add	a5,a5,a4
	lw	a5,0(a5)
	ld	a0,8(s6)
	sw	a5,4(a2)
	call	pb_wait@plt
	j	.L91
.L140:
	lw	a3,20(s3)
	lw	a2,24(s3)
	ld	a1,32(s6)
	ld	a0,48(sp)
	call	perm_prefix_ints@plt
	j	.L90
.L139:
	call	__stack_chk_fail@plt
	.size	zyva, .-zyva
	.section	.rodata.str1.8
	.align	3
.LC6:
	.string	"Never"
	.align	3
.LC7:
	.string	"Always"
	.align	3
.LC8:
	.string	"Sometimes"
	.align	3
.LC9:
	.string	"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
	.align	3
.LC10:
	.string	"%s\n"
	.align	3
.LC11:
	.string	"% Results for tests/non-mixed-size/RELAX/Rfi/S+fence.rw.rw+ctrlfencei-rfi-addr.litmus %"
	.align	3
.LC12:
	.string	"RISCV S+fence.rw.rw+ctrlfencei-rfi-addr"
	.align	3
.LC13:
	.string	"\"Fence.rw.rwdWW Rfe DpCtrlFenceIdW Rfi DpAddrdW Wse\""
	.align	3
.LC14:
	.string	"{"
	.align	3
.LC15:
	.string	" 0:x5=2; 0:x6=x; 0:x7=1; 0:x8=y;"
	.align	3
.LC16:
	.string	" 1:x6=y; 1:x7=1; 1:x8=z; 1:x11=x;"
	.align	3
.LC17:
	.string	"}"
	.align	3
.LC18:
	.string	" P0          | P1              ;"
	.align	3
.LC19:
	.string	" sw x5,0(x6) | lw x5,0(x6)     ;"
	.align	3
.LC20:
	.string	" fence rw,rw | bne x5,x0,LC00  ;"
	.align	3
.LC21:
	.string	" sw x7,0(x8) | LC00:           ;"
	.align	3
.LC22:
	.string	"             | fence.i         ;"
	.align	3
.LC23:
	.string	"             | sw x7,0(x8)     ;"
	.align	3
.LC24:
	.string	"             | lw x9,0(x8)     ;"
	.align	3
.LC25:
	.string	"             | xor x10,x9,x9   ;"
	.align	3
.LC26:
	.string	"             | add x12,x11,x10 ;"
	.align	3
.LC27:
	.string	"             | sw x7,0(x12)    ;"
	.align	3
.LC28:
	.string	""
	.align	3
.LC29:
	.string	"exists ([x]=2 /\\ 1:x5=1 /\\ 1:x9=1)"
	.align	3
.LC30:
	.string	"Generated assembler"
	.align	3
.LC31:
	.string	"Bad topology %s, reverting to scan affinity\n"
	.align	3
.LC32:
	.string	"Warning: avail=%i, available=%i\n"
	.align	3
.LC33:
	.string	"S+fence.rw.rw+ctrlfencei-rfi-addr: n=%i, r=%i, s=%i"
	.align	3
.LC34:
	.string	", st=%i"
	.align	3
.LC35:
	.string	", i=%i"
	.align	3
.LC36:
	.string	", +ra"
	.align	3
.LC37:
	.string	", +ca"
	.align	3
.LC38:
	.string	", +sa"
	.align	3
.LC39:
	.string	", p='"
	.align	3
.LC40:
	.string	"'"
	.align	3
.LC41:
	.string	"\n"
	.align	3
.LC42:
	.string	"logical proc -> core: "
	.align	3
.LC43:
	.string	"thread allocation: \n"
	.align	3
.LC44:
	.string	"S+fence.rw.rw+ctrlfencei-rfi-addr, sum_hist"
	.align	3
.LC45:
	.string	"Test S+fence.rw.rw+ctrlfencei-rfi-addr Allowed\n"
	.align	3
.LC46:
	.string	"Histogram (%d states)\n"
	.align	3
.LC47:
	.string	"Observation S+fence.rw.rw+ctrlfencei-rfi-addr %s %lu %lu\n"
	.align	3
.LC49:
	.string	"Time S+fence.rw.rw+ctrlfencei-rfi-addr %.2f\n"
	.align	3
.LC50:
	.string	"Ok"
	.align	3
.LC51:
	.string	"\nWitnesses\n"
	.align	3
.LC52:
	.string	"Positive: %lu, Negative: %lu\n"
	.align	3
.LC53:
	.string	"Condition %s is %svalidated\n"
	.align	3
.LC54:
	.string	"Hash=a76d077094cd52b173a4ef96c2610bda\n"
	.align	3
.LC55:
	.string	"Cycle=Rfi DpAddrdW Wse Fence.rw.rwdWW Rfe DpCtrlFenceIdW\n"
	.align	3
.LC56:
	.string	"Rfi"
	.align	3
.LC57:
	.string	"Relax S+fence.rw.rw+ctrlfencei-rfi-addr %s %s\n"
	.align	3
.LC58:
	.string	"Safe=Rfe Wse Fence.rw.rwdWW DpAddrdW DpCtrlFenceIdW\n"
	.align	3
.LC59:
	.string	"Generator=diy7 (version 7.51+4(dev))\n"
	.align	3
.LC60:
	.string	"Com=Rf Ws\n"
	.align	3
.LC61:
	.string	"Orig=Fence.rw.rwdWW Rfe DpCtrlFenceIdW Rfi DpAddrdW Wse\n"
	.align	3
.LC62:
	.string	"No"
	.align	3
.LC63:
	.string	"NOT "
	.align	3
.LC64:
	.string	"Affinity=[0] [1] ; \n"
	.text
	.align	1
	.globl	S_2B_fence_2E_rw_2E_rw_2B_ctrlfencei_2D_rfi_2D_addr
	.type	S_2B_fence_2E_rw_2E_rw_2B_ctrlfencei_2D_rfi_2D_addr, @function
S_2B_fence_2E_rw_2E_rw_2B_ctrlfencei_2D_rfi_2D_addr:
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
	ble	a4,a5,.L227
	slli	a4,a5,32
	li	t1,-1
	mv	s5,a0
	li	a6,5
	addi	a0,a4,100
	srli	a7,t1,32
	addi	a1,a4,1
	addi	a2,s0,-368
	addi	a3,s0,-256
	slli	a6,a6,33
	sd	a0,-360(s0)
	li	a0,4
	sd	a4,-344(s0)
	sw	a5,-328(s0)
	sd	t1,-280(s0)
	sw	a5,-264(s0)
	sd	a6,-368(s0)
	sd	a0,-352(s0)
	sd	a1,-336(s0)
	sd	s5,-320(s0)
	sd	zero,-312(s0)
	sd	a7,-304(s0)
	sd	zero,-296(s0)
	sd	zero,-288(s0)
	sd	a7,-272(s0)
	mv	a5,a2
	mv	a4,a3
	addi	t1,s0,-272
.L144:
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
	bne	a5,t1,.L144
	ld	a6,0(a5)
	ld	a5,8(a5)
	mv	a1,s2
	mv	a0,s3
	sd	a5,8(a4)
	sd	a6,0(a4)
	call	parse_cmd@plt
	lw	a5,-152(s0)
	sd	sp,-480(s0)
	bnez	a5,.L228
.L145:
	call	timeofday@plt
	lw	a5,-256(s0)
	lw	a4,-244(s0)
	sd	a0,-488(s0)
	sw	a5,-408(s0)
	lw	a5,-248(s0)
	sw	a5,-404(s0)
	lw	a5,-252(s0)
	sw	a5,-400(s0)
	blez	a4,.L229
	lw	a5,-228(s0)
	sw	a4,-396(s0)
	li	a4,5
	beq	a5,a4,.L147
.L244:
	addiw	a5,a5,-3
	li	a4,2
	sgtu	a5,a5,a4
	li	s9,-1
.L148:
	lw	a4,-156(s0)
	sw	a5,-380(s0)
	beqz	a4,.L150
	sw	zero,-380(s0)
.L150:
	lw	a0,0(s5)
	li	a1,2
	call	coremap_seq@plt
	lw	s2,-240(s0)
	sd	a0,-376(s0)
	ld	s4,-208(s0)
	blez	s2,.L230
	lw	a2,0(s4)
	ble	s2,a2,.L152
	mv	a1,s2
	lla	a0,.LC32
	call	log_error@plt
	ld	s4,-208(s0)
.L152:
	lw	s6,-236(s0)
	blez	s6,.L153
.L245:
	slli	s7,s6,2
	addiw	a5,s6,-1
	add	s7,s7,s6
	slliw	s2,s6,1
	sd	a5,-432(s0)
	slli	s8,a5,3
	sd	s6,-496(s0)
	slli	s7,s7,3
.L154:
	lw	a4,-228(s0)
	li	a5,2
	mv	s11,s2
	beq	a4,a5,.L231
.L155:
	slli	a5,s11,2
	addi	a5,a5,15
	lw	a3,-408(s0)
	andi	a5,a5,-16
	sub	sp,sp,a5
	sw	s2,-384(s0)
	sw	a4,-392(s0)
	sw	s11,-388(s0)
	mv	s2,sp
	bnez	a3,.L232
.L156:
	li	a5,2
	beq	a4,a5,.L233
	li	a5,3
	beq	a4,a5,.L234
	li	a5,5
	beq	a4,a5,.L235
.L165:
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
	lw	s7,-216(s0)
	sd	a0,-448(s0)
	lw	a1,0(s4)
	mv	s8,sp
	blez	s7,.L236
	remw	a5,s7,a1
	sd	a5,-424(s0)
.L172:
	ld	a0,-424(s0)
	addi	s7,s2,8
	li	s11,0
	call	gcd@plt
	ld	s3,-456(s0)
	addi	a5,s0,-408
	mv	a2,s8
	sd	a0,-504(s0)
	mv	s8,s3
	li	s2,0
	li	s9,0
	li	s10,0
	sd	a5,-472(s0)
	j	.L179
.L239:
	mv	a0,s3
	lla	a1,zyva
	sd	a2,-464(s0)
	call	launch@plt
	ld	a2,-464(s0)
	addiw	s10,s10,1
	addi	s3,s3,8
	addi	a2,a2,40
	addi	s7,s7,8
	beq	s6,s10,.L237
.L179:
	ld	a5,-472(s0)
	lw	a1,-228(s0)
	addi	a0,s7,-8
	sd	a5,16(a2)
	ld	a5,-440(s0)
	sw	s10,24(a2)
	sd	a0,32(a2)
	sd	a5,0(a2)
	ld	a5,-448(s0)
	sd	a5,8(a2)
	li	a5,1
	beq	a1,a5,.L238
.L174:
	ld	a5,-432(s0)
	bgt	a5,s10,.L239
	mv	a0,a2
	sd	a2,-464(s0)
	call	zyva
	ld	a2,-464(s0)
	addiw	s10,s10,1
	mv	s2,a0
	addi	a2,a2,40
	addi	s3,s3,8
	addi	s7,s7,8
	bne	s6,s10,.L179
.L237:
	lw	a5,-404(s0)
	lw	s6,-400(s0)
	mul	s6,s6,a5
	ld	a5,-432(s0)
	beqz	a5,.L186
	ld	a5,-432(s0)
	addiw	s3,a5,-1
	slli	s3,s3,32
	ld	a5,-456(s0)
	srli	s3,s3,32
	addi	s3,s3,1
	slli	s3,s3,3
	add	s11,a5,s3
	lla	s3,.LC44
.L185:
	mv	a0,s8
	call	join@plt
	mv	s7,a0
	ld	a0,0(a0)
	call	sum_outs@plt
	bne	s6,a0,.L183
	ld	a2,8(s7)
	ld	a3,16(s7)
	add	a5,a2,a3
	beq	s6,a5,.L184
.L183:
	mv	a0,s3
	call	fatal@plt
	ld	a2,8(s7)
	ld	a3,16(s7)
.L184:
	ld	a4,8(s2)
	ld	a5,16(s2)
	ld	a1,0(s7)
	ld	a0,0(s2)
	add	a4,a4,a2
	add	a5,a5,a3
	li	a2,3
	sd	a4,8(s2)
	sd	a5,16(s2)
	call	merge_outs@plt
	sd	a0,0(s2)
	ld	a0,0(s7)
	addi	s8,s8,8
	call	free_outs@plt
	mv	a0,s7
	call	free@plt
	bne	s8,s11,.L185
.L186:
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
	bne	s6,a0,.L181
	ld	s4,8(s2)
	ld	s7,16(s2)
	add	a5,s4,s7
	beq	s6,a5,.L187
.L181:
	lla	a0,.LC44
	call	fatal@plt
	ld	s4,8(s2)
	ld	s7,16(s2)
.L187:
	li	a2,47
	li	a1,1
	mv	a3,s1
	lla	a0,.LC45
	call	fwrite@plt
	ld	a0,0(s2)
	call	finals_outs@plt
	mv	a3,a0
	lla	a2,.LC46
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	ld	a2,0(s2)
	li	a4,3
	addi	a3,s0,-144
	lla	a1,do_dump_outcome
	mv	a0,s1
	call	dump_outs@plt
	beqz	s4,.L240
	lla	a2,.LC10
	li	a1,1
	lla	a3,.LC50
	mv	a0,s1
	call	__fprintf_chk@plt
	mv	a3,s1
	li	a2,11
	li	a1,1
	lla	a0,.LC51
	call	fwrite@plt
	mv	a4,s7
	mv	a3,s4
	lla	a2,.LC52
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a4,.LC28
	lla	a2,.LC53
	li	a1,1
	lla	a3,.LC29
	mv	a0,s1
	call	__fprintf_chk@plt
	mv	a3,s1
	li	a2,38
	li	a1,1
	lla	a0,.LC54
	call	fwrite@plt
	mv	a3,s1
	li	a2,57
	li	a1,1
	lla	a0,.LC55
	call	fwrite@plt
	lla	a4,.LC56
	lla	a2,.LC57
	li	a1,1
	lla	a3,.LC50
	mv	a0,s1
	call	__fprintf_chk@plt
	mv	a3,s1
	li	a2,52
	li	a1,1
	lla	a0,.LC58
	call	fwrite@plt
	mv	a3,s1
	li	a2,37
	li	a1,1
	lla	a0,.LC59
	call	fwrite@plt
	mv	a3,s1
	li	a2,10
	li	a1,1
	lla	a0,.LC60
	call	fwrite@plt
	mv	a3,s1
	li	a2,56
	li	a1,1
	lla	a0,.LC61
	call	fwrite@plt
	lw	a4,-228(s0)
	li	a5,3
	beq	a4,a5,.L241
.L192:
	lla	s6,.LC7
	bnez	s7,.L242
.L190:
	mv	a5,s7
	mv	a4,s4
	mv	a3,s6
	lla	a2,.LC47
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	fcvt.d.lu	fa4,s3
	fld	fa5,.LC48,a5
	lla	a2,.LC49
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
	ld	sp,-480(s0)
	beq	a5,s5,.L143
	mv	a0,s5
.L227:
	call	cpus_free@plt
.L143:
	la	a5,__stack_chk_guard
	ld	a4,-120(s0)
	ld	a5,0(a5)
	bne	a4,a5,.L243
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
.L229:
	lw	a5,-228(s0)
	li	a4,2
	sw	a4,-396(s0)
	li	a4,5
	bne	a5,a4,.L244
.L147:
	ld	a2,-200(s0)
	li	a1,2
	lla	a0,.LANCHOR2
	call	find_string@plt
	mv	s9,a0
	bltz	a0,.L149
	lw	a5,-228(s0)
	li	a4,2
	addiw	a5,a5,-3
	sgtu	a5,a5,a4
	j	.L148
.L230:
	lw	s6,-236(s0)
	lw	s2,0(s4)
	bgtz	s6,.L245
.L153:
	li	a5,1
	ble	s2,a5,.L195
	srai	s6,s2,1
	sraiw	s3,s2,1
	lw	a4,-228(s0)
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
	bne	a4,a5,.L155
.L231:
	lw	a0,0(s4)
	mv	a1,s2
	call	max@plt
	lw	a4,-228(s0)
	mv	s11,a0
	j	.L155
.L238:
	ld	a1,8(s4)
	slli	a0,s9,2
	ld	a5,-424(s0)
	add	a0,a1,a0
	lw	a0,0(a0)
	addw	a5,a5,s9
	sw	a0,-8(s7)
	lw	a0,0(s4)
	remw	a5,a5,a0
	bne	a5,s11,.L175
	ld	a5,-504(s0)
	addiw	a4,s11,1
	remw	s11,a4,a5
	mv	a5,s11
.L175:
	slli	a0,a5,2
	add	a1,a1,a0
	lw	a1,0(a1)
	ld	a4,-424(s0)
	sw	a1,-4(s7)
	lw	a1,0(s4)
	addw	a5,a4,a5
	remw	s9,a5,a1
	bne	s9,s11,.L174
	ld	a5,-504(s0)
	addiw	a4,s11,1
	remw	s11,a4,a5
	mv	s9,s11
	j	.L174
.L240:
	lla	a2,.LC10
	li	a1,1
	lla	a3,.LC62
	mv	a0,s1
	call	__fprintf_chk@plt
	mv	a3,s1
	li	a2,11
	li	a1,1
	lla	a0,.LC51
	call	fwrite@plt
	mv	a4,s7
	li	a3,0
	lla	a2,.LC52
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a4,.LC63
	lla	a2,.LC53
	li	a1,1
	lla	a3,.LC29
	mv	a0,s1
	call	__fprintf_chk@plt
	mv	a3,s1
	li	a2,38
	li	a1,1
	lla	a0,.LC54
	call	fwrite@plt
	mv	a3,s1
	li	a2,57
	li	a1,1
	lla	a0,.LC55
	call	fwrite@plt
	lla	a4,.LC56
	lla	a2,.LC57
	li	a1,1
	lla	a3,.LC62
	mv	a0,s1
	call	__fprintf_chk@plt
	mv	a3,s1
	li	a2,52
	li	a1,1
	lla	a0,.LC58
	call	fwrite@plt
	mv	a3,s1
	li	a2,37
	li	a1,1
	lla	a0,.LC59
	call	fwrite@plt
	mv	a3,s1
	li	a2,10
	li	a1,1
	lla	a0,.LC60
	call	fwrite@plt
	mv	a3,s1
	li	a2,56
	li	a1,1
	lla	a0,.LC61
	call	fwrite@plt
	lw	a4,-228(s0)
	li	a5,3
	lla	s6,.LC6
	bne	a4,a5,.L190
	mv	a3,s1
	li	a2,20
	li	a1,1
	lla	a0,.LC64
	call	fwrite@plt
	j	.L190
.L236:
	blez	a1,.L197
	ld	a4,8(s4)
	li	a5,0
	li	a3,-1
.L173:
	sw	a3,0(a4)
	lw	a1,0(s4)
	addiw	a5,a5,1
	addi	a4,a4,4
	blt	a5,a1,.L173
.L197:
	li	a5,1
	sd	a5,-424(s0)
	j	.L172
.L233:
	blez	s11,.L165
	ld	a2,8(s4)
	mv	a3,s2
	li	a4,0
.L166:
	lw	a5,0(s4)
	addi	a3,a3,4
	remw	a5,a4,a5
	addiw	a4,a4,1
	slli	a5,a5,2
	add	a5,a2,a5
	lw	a5,0(a5)
	sw	a5,-4(a3)
	bne	s11,a4,.L166
	j	.L165
.L232:
	lw	a3,-404(s0)
	lw	a2,-400(s0)
	mv	a1,s6
	lla	a0,.LC33
	call	log_error@plt
	lw	a1,-396(s0)
	lla	a0,.LC34
	call	log_error@plt
	lw	a5,-228(s0)
	li	a4,1
	beq	a5,a4,.L246
	li	a4,2
	beq	a5,a4,.L247
	li	a4,3
	beq	a5,a4,.L248
	li	a4,4
	beq	a5,a4,.L249
.L158:
	lla	a0,.LC39
	call	log_error@plt
	la	s10,stderr
	ld	a1,-208(s0)
	ld	a0,0(s10)
	call	cpus_dump@plt
	lla	a0,.LC40
	call	log_error@plt
	lla	a0,.LC41
	call	log_error@plt
	lw	a4,-408(s0)
	li	a5,1
	ble	a4,a5,.L226
	ld	a5,-376(s0)
	beqz	a5,.L226
	lla	a0,.LC42
	call	log_error@plt
	ld	a0,0(s10)
	ld	a1,-376(s0)
	call	cpus_dump@plt
	lla	a0,.LC41
	call	log_error@plt
.L226:
	lw	a4,-228(s0)
	j	.L156
.L228:
	lla	a3,.LC9
	lla	a2,.LC10
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC11
	lla	a2,.LC10
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC9
	lla	a2,.LC10
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC12
	lla	a2,.LC10
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC13
	lla	a2,.LC10
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC14
	lla	a2,.LC10
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC15
	lla	a2,.LC10
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC16
	lla	a2,.LC10
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC17
	lla	a2,.LC10
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC18
	lla	a2,.LC10
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC19
	lla	a2,.LC10
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC20
	lla	a2,.LC10
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC21
	lla	a2,.LC10
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC22
	lla	a2,.LC10
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC23
	lla	a2,.LC10
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC24
	lla	a2,.LC10
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC25
	lla	a2,.LC10
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC26
	lla	a2,.LC10
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC27
	lla	a2,.LC10
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC28
	lla	a2,.LC10
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC29
	lla	a2,.LC10
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC30
	lla	a2,.LC10
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	j	.L145
.L242:
	lla	s6,.LC8
	j	.L190
.L195:
	li	a5,1
	li	s7,40
	sd	a5,-496(s0)
	li	s8,0
	sd	zero,-432(s0)
	li	s2,2
	li	s6,1
	j	.L154
.L235:
	slliw	s9,s9,2
	slli	s9,s9,2
	lla	a4,.LANCHOR0
	add	a4,a4,s9
	blez	s11,.L165
	addiw	a5,s11,-1
	slli	a5,a5,32
	srli	a5,a5,32
	addi	a5,a5,1
	slli	a5,a5,2
	mv	a3,s2
	add	a5,a4,a5
.L170:
	lw	a2,0(a4)
	addi	a4,a4,4
	addi	a3,a3,4
	sw	a2,-4(a3)
	bne	a4,a5,.L170
	j	.L165
.L234:
	ld	a1,-376(s0)
	mv	a5,s6
	mv	a6,s2
	mv	a4,s4
	lla	a3,.LANCHOR0+32
	lla	a2,.LANCHOR2+16
	addi	a0,s0,-412
	sw	zero,-412(s0)
	call	custom_affinity@plt
	lw	a5,-408(s0)
	beqz	a5,.L165
	lla	a0,.LC43
	call	log_error@plt
	la	a5,stderr
	ld	a3,-376(s0)
	ld	a0,0(a5)
	li	a4,2
	mv	a2,s11
	mv	a1,s2
	call	cpus_dump_test@plt
	j	.L165
.L241:
	mv	a3,s1
	li	a2,20
	li	a1,1
	lla	a0,.LC64
	call	fwrite@plt
	j	.L192
.L246:
	lw	a1,-216(s0)
	lla	a0,.LC35
	call	log_error@plt
	j	.L158
.L247:
	lla	a0,.LC36
	call	log_error@plt
	j	.L158
.L149:
	ld	a1,-200(s0)
	lla	a0,.LC31
	call	log_error@plt
	li	a5,4
	sw	a5,-228(s0)
	sd	zero,-200(s0)
	li	a5,0
	j	.L148
.L248:
	lla	a0,.LC37
	call	log_error@plt
	j	.L158
.L249:
	lla	a0,.LC38
	call	log_error@plt
	j	.L158
.L243:
	call	__stack_chk_fail@plt
	.size	S_2B_fence_2E_rw_2E_rw_2B_ctrlfencei_2D_rfi_2D_addr, .-S_2B_fence_2E_rw_2E_rw_2B_ctrlfencei_2D_rfi_2D_addr
	.section	.rodata.str1.8
	.align	3
.LC65:
	.string	"[[0],[1]]"
	.align	3
.LC66:
	.string	"[[0,1]]"
	.section	.rodata.cst8,"aM",@progbits,8
	.align	3
.LC48:
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
	.dword	.LC65
	.dword	.LC66
	.type	color, @object
	.size	color, 24
color:
	.dword	color_0
	.dword	color_1
	.dword	0
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
