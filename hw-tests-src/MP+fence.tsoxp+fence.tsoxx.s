	.file	"MP+fence.tsoxp+fence.tsoxx.c"
	.option pic
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"%-6lu%c>0:x7=%d; 0:x8=%d; 1:x6=%d; 1:x7=%d; 1:x9=%d; 1:x10=%d; [x]=%d; [y]=%d;\n"
	.text
	.align	1
	.type	do_dump_outcome, @function
do_dump_outcome:
	addi	sp,sp,-64
	sd	ra,56(sp)
	li	a4,58
	beqz	a3,.L2
	li	a4,42
.L2:
	lw	a3,24(a1)
	lw	t5,56(a1)
	lw	t4,48(a1)
	lw	t3,40(a1)
	lw	t1,32(a1)
	lw	a7,16(a1)
	lw	a6,8(a1)
	lw	a5,0(a1)
	sd	a3,0(sp)
	sd	t5,32(sp)
	sd	t4,24(sp)
	sd	t3,16(sp)
	sd	t1,8(sp)
	mv	a3,a2
	li	a1,1
	lla	a2,.LC0
	call	__fprintf_chk@plt
	ld	ra,56(sp)
	addi	sp,sp,64
	jr	ra
	.size	do_dump_outcome, .-do_dump_outcome
	.section	.rodata.str1.8
	.align	3
.LC1:
	.string	"MP+fence.tsoxp+fence.tsoxx, check_globals failed"
	.text
	.align	1
	.type	check_globals, @function
check_globals:
	ld	a5,128(a0)
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
	addi	s1,a0,120
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
	ld	a0,64(s5)
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
	ld	a5,128(a1)
	addi	sp,sp,-112
	sd	s8,32(sp)
	mv	s8,a0
	ld	a0,64(a1)
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
	addi	s6,s1,80
	addi	s5,s1,96
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
	ld	a0,72(s1)
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
	ld	a0,72(s1)
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
	.string	"MP+fence.tsoxp+fence.tsoxx"
	.text
	.align	1
	.type	P1, @function
P1:
	addi	sp,sp,-32
	sd	s1,8(sp)
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s2,0(sp)
	mv	s1,a0
#APP
# 47 "MP+fence.tsoxp+fence.tsoxx.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	ld	s0,16(a0)
	lw	a4,0(a0)
	ld	a5,8(a0)
	ld	a3,128(s0)
	slli	a4,a4,2
	add	a5,a5,a4
	lw	a0,0(a5)
	lw	a2,0(a3)
	li	a1,4
	lla	a3,.LC3
	call	force_one_affinity@plt
	mv	a0,s0
	call	check_globals
	ld	a5,128(s0)
	lw	t1,0(s1)
	ld	t3,112(s0)
	lw	a7,12(a5)
	lw	t0,4(a5)
	blez	a7,.L50
	sub	t5,t0,a7
	negw	a6,a7
	subw	t4,t0,a7
	slli	t5,t5,2
	sext.w	t0,t0
	slli	a6,a6,2
	sext.w	t1,t1
	li	t6,1
.L49:
	sext.w	a2,t4
	mv	a4,t5
	bltz	t4,.L54
.L53:
	andi	a5,a2,1
	add	a3,t3,a4
	beq	a5,t1,.L63
.L51:
	lw	a5,0(a3)
	sext.w	a5,a5
	beqz	a5,.L51
.L52:
	ld	a5,0(s0)
	ld	a3,8(s0)
	add	a5,a5,a4
	add	a3,a3,a4
#APP
# 314 "MP+fence.tsoxp+fence.tsoxx.c" 1
	
#START _litmus_P1
#_litmus_P1_0
	lr.w t2,0(a5)
#_litmus_P1_1
	sc.w ra,t2,0(a5)
#_litmus_P1_2
	fence.tso
#_litmus_P1_3
	lr.w s1,0(a3)
#_litmus_P1_4
	sc.w s2,s1,0(a3)
#END _litmus_P1

# 0 "" 2
#NO_APP
	ld	a0,56(s0)
	ld	a1,48(s0)
	ld	a3,40(s0)
	ld	a5,32(s0)
	add	a0,a0,a4
	sw	s2,0(a0)
	add	a1,a1,a4
	sw	s1,0(a1)
	add	a3,a3,a4
	add	a5,a5,a4
	sw	ra,0(a3)
	sw	t2,0(a5)
	subw	a2,a2,a7
	add	a4,a4,a6
	bgez	a2,.L53
.L54:
	addiw	t4,t4,1
	addi	t5,t5,4
	bne	t4,t0,.L49
.L50:
	mv	a1,s0
	li	a0,1
	call	stabilize_globals
#APP
# 47 "MP+fence.tsoxp+fence.tsoxx.c" 1
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
.L63:
	sw	t6,0(a3)
#APP
# 47 "MP+fence.tsoxp+fence.tsoxx.c" 1
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
# 47 "MP+fence.tsoxp+fence.tsoxx.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	ld	s0,16(a0)
	lw	a4,0(a0)
	ld	a5,8(a0)
	ld	a3,128(s0)
	slli	a4,a4,2
	add	a5,a5,a4
	lw	a0,0(a5)
	lw	a2,0(a3)
	li	a1,4
	lla	a3,.LC3
	call	force_one_affinity@plt
	mv	a0,s0
	call	check_globals
	ld	a5,128(s0)
	lw	t3,0(s1)
	ld	t4,112(s0)
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
# 277 "MP+fence.tsoxp+fence.tsoxx.c" 1
	
#START _litmus_P0
#_litmus_P0_0
	lr.w a0,0(a5)
#_litmus_P0_1
	sc.w a6,a1,0(a5)
#_litmus_P0_2
	fence.tso
#_litmus_P0_3
	sw a1,0(a4)
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
# 47 "MP+fence.tsoxp+fence.tsoxx.c" 1
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
# 47 "MP+fence.tsoxp+fence.tsoxx.c" 1
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
	.string	"MP+fence.tsoxp+fence.tsoxx, global x unstabilized"
	.align	3
.LC6:
	.string	"MP+fence.tsoxp+fence.tsoxx, global y unstabilized"
	.text
	.align	1
	.type	zyva, @function
zyva:
	addi	sp,sp,-496
	sd	s2,464(sp)
	la	a5,__stack_chk_guard
	mv	s2,a0
	ld	a5,0(a5)
	sd	s3,456(sp)
	sd	a0,24(sp)
	ld	s3,16(s2)
	ld	a0,8(a0)
	sd	ra,488(sp)
	sd	s0,480(sp)
	sd	s1,472(sp)
	sd	a5,376(sp)
	sd	s4,448(sp)
	sd	s5,440(sp)
	sd	s6,432(sp)
	sd	s7,424(sp)
	sd	s8,416(sp)
	sd	s9,408(sp)
	sd	s10,400(sp)
	sd	s11,392(sp)
	sd	s3,8(sp)
	call	pb_wait@plt
	lla	a5,P0
	sd	a5,112(sp)
	li	a0,24
	lla	a5,P1
	sd	a5,120(sp)
	call	malloc_check@plt
	lw	s0,4(s3)
	sd	zero,0(a0)
	sd	zero,16(a0)
	sd	zero,8(a0)
	slli	s0,s0,2
	mv	s1,a0
	sd	s3,368(sp)
	call	rand@plt
	mv	a5,a0
	mv	a0,s0
	sw	a5,360(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s0
	sd	a5,256(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s0
	sd	a5,264(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s0
	sd	a5,272(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s0
	sd	a5,280(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s0
	sd	a5,288(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s0
	sd	a5,296(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s0
	sd	a5,240(sp)
	call	malloc_check@plt
	mv	a5,a0
	li	a0,2
	sd	a5,248(sp)
	call	pb_create@plt
	mv	a5,a0
	li	a0,2
	sd	a5,304(sp)
	call	po_create@plt
	mv	a5,a0
	mv	a0,s0
	sd	a5,312(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s0
	sd	a5,328(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s0
	sd	a5,344(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s0
	sd	a5,320(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s0
	sd	a5,336(sp)
	call	malloc_check@plt
	ld	a4,32(s2)
	lw	a3,8(s3)
	li	a5,1
	sw	a5,152(sp)
	addi	a5,sp,240
	sd	a0,352(sp)
	sd	a5,168(sp)
	sd	a4,160(sp)
	sw	zero,128(sp)
	sd	a5,144(sp)
	sd	a4,136(sp)
	blez	a3,.L83
	addi	a5,sp,128
	sd	a5,64(sp)
	addi	a5,sp,152
	sd	a5,72(sp)
	addi	a5,sp,96
	sd	a5,40(sp)
	addi	a5,sp,104
	sd	a5,48(sp)
	addi	a5,sp,360
	sd	a5,80(sp)
	li	s0,-237568
	addi	a5,sp,112
	sd	zero,32(sp)
	addiw	s0,s0,-1919
	sd	a5,88(sp)
.L104:
	ld	a5,8(sp)
	li	a4,2
	lw	a5,16(a5)
	beq	a5,a4,.L133
	li	a4,4
	beq	a5,a4,.L134
.L86:
	ld	a3,8(sp)
	li	a5,1
	lw	a4,0(a3)
	ble	a4,a5,.L87
	la	a5,stderr
	lw	a4,8(a3)
	ld	a0,0(a5)
	ld	a3,32(sp)
	lla	a2,.LC4
	li	a1,1
	call	__fprintf_chk@plt
.L87:
	ld	a5,368(sp)
	lw	a4,4(a5)
	addiw	a2,a4,-1
	slli	a3,a2,32
	sext.w	a5,a2
	bltz	a3,.L88
	slli	a2,a2,32
	srli	a2,a2,32
	sub	a2,a4,a2
	ld	t6,240(sp)
	ld	t5,248(sp)
	ld	t4,256(sp)
	ld	t3,264(sp)
	ld	t1,272(sp)
	ld	a7,280(sp)
	ld	a6,288(sp)
	ld	a0,296(sp)
	ld	a1,352(sp)
	slli	a2,a2,2
	slli	a5,a5,2
	addi	a2,a2,-8
.L89:
	add	a4,t6,a5
	sw	zero,0(a4)
	add	a4,t5,a5
	sw	zero,0(a4)
	add	a4,t4,a5
	sw	s0,0(a4)
	add	a4,t3,a5
	sw	s0,0(a4)
	add	a4,t1,a5
	sw	s0,0(a4)
	add	a4,a7,a5
	sw	s0,0(a4)
	add	a4,a6,a5
	sw	s0,0(a4)
	add	a3,a0,a5
	add	a4,a1,a5
	sw	s0,0(a3)
	sw	zero,0(a4)
	addi	a5,a5,-4
	bne	a2,a5,.L89
.L88:
	ld	a5,8(sp)
	lw	a5,28(a5)
	bnez	a5,.L135
.L90:
	ld	a1,120(sp)
	ld	a0,48(sp)
	ld	a2,72(sp)
	call	launch@plt
	ld	a2,64(sp)
	ld	a1,112(sp)
	ld	a0,40(sp)
	call	launch@plt
	ld	a5,8(sp)
	lw	a5,28(a5)
	bnez	a5,.L136
.L91:
	ld	a0,48(sp)
	call	join@plt
	ld	a0,40(sp)
	call	join@plt
	ld	a5,8(sp)
	lw	a4,4(a5)
	addiw	a3,a4,-1
	slli	a2,a3,32
	sext.w	a5,a3
	bltz	a2,.L92
	slli	a3,a3,32
	srli	a3,a3,32
	sub	a4,a4,a3
	ld	a3,32(sp)
	slli	a4,a4,2
	slli	s11,a5,2
	andi	a3,a3,1
	addi	a5,a4,-8
	slli	a3,a3,3
	sd	a5,16(sp)
	lla	a5,.LANCHOR1
	add	a5,a5,a3
	addi	s9,sp,176
	sd	a5,56(sp)
	j	.L103
.L140:
	ld	a5,24(sp)
	ld	a3,32(a5)
	lw	a3,0(a3)
	bltz	a3,.L99
	bnez	a4,.L137
.L100:
	ld	a4,16(s1)
	ld	a5,16(sp)
	addi	s11,s11,-4
	addi	a4,a4,1
	sd	a4,16(s1)
	beq	s11,a5,.L92
.L103:
	ld	a3,248(sp)
	ld	a4,328(sp)
	ld	t3,256(sp)
	add	a3,a3,s11
	add	a4,a4,s11
	lw	s8,0(a3)
	lw	t1,0(a4)
	ld	a7,264(sp)
	ld	a0,272(sp)
	ld	a1,280(sp)
	ld	a2,288(sp)
	ld	a3,296(sp)
	ld	a4,240(sp)
	add	t3,t3,s11
	add	a7,a7,s11
	add	a0,a0,s11
	add	a1,a1,s11
	add	a2,a2,s11
	add	a3,a3,s11
	add	a4,a4,s11
	lw	s2,0(t3)
	lw	s3,0(a7)
	lw	s4,0(a0)
	lw	s5,0(a1)
	lw	s6,0(a2)
	lw	s7,0(a3)
	lw	s10,0(a4)
	beq	t1,s8,.L93
	lla	a0,.LC5
	call	fatal@plt
.L93:
	ld	a4,320(sp)
	add	a4,a4,s11
	lw	a4,0(a4)
	beq	a4,s8,.L94
	lla	a0,.LC5
	call	fatal@plt
.L94:
	ld	a4,344(sp)
	add	a4,a4,s11
	lw	a4,0(a4)
	beq	a4,s10,.L95
	lla	a0,.LC6
	call	fatal@plt
.L95:
	ld	a4,336(sp)
	add	a4,a4,s11
	lw	a4,0(a4)
	beq	a4,s10,.L96
	lla	a0,.LC6
	call	fatal@plt
.L96:
	li	a4,0
	bnez	s2,.L97
	mv	a4,s2
	bnez	s3,.L97
	li	a5,1
	mv	a4,s3
	beq	s4,a5,.L138
.L97:
	ld	a0,0(s1)
	li	a3,1
	li	a2,8
	mv	a1,s9
	sd	a4,0(sp)
	sd	s2,176(sp)
	sd	s3,184(sp)
	sd	s4,192(sp)
	sd	s5,200(sp)
	sd	s6,208(sp)
	sd	s7,216(sp)
	sd	s8,224(sp)
	sd	s10,232(sp)
	call	add_outcome_outs@plt
	ld	a5,8(sp)
	li	a2,4
	ld	a4,0(sp)
	lw	a3,16(a5)
	sd	a0,0(s1)
	beq	a3,a2,.L139
	li	a2,5
	beq	a3,a2,.L140
.L99:
	beqz	a4,.L100
.L101:
	ld	a4,8(s1)
	ld	a5,16(sp)
	addi	s11,s11,-4
	addi	a4,a4,1
	sd	a4,8(s1)
	bne	s11,a5,.L103
.L92:
	ld	a5,8(sp)
	ld	a4,32(sp)
	lw	a5,8(a5)
	addiw	a4,a4,1
	sd	a4,32(sp)
	bgt	a5,a4,.L104
.L83:
	ld	a0,240(sp)
	call	free@plt
	ld	a0,248(sp)
	call	free@plt
	ld	a0,256(sp)
	call	free@plt
	ld	a0,264(sp)
	call	free@plt
	ld	a0,272(sp)
	call	free@plt
	ld	a0,280(sp)
	call	free@plt
	ld	a0,288(sp)
	call	free@plt
	ld	a0,296(sp)
	call	free@plt
	ld	a0,304(sp)
	call	pb_free@plt
	ld	a0,312(sp)
	call	po_free@plt
	ld	a0,328(sp)
	call	free@plt
	ld	a0,344(sp)
	call	free@plt
	ld	a0,320(sp)
	call	free@plt
	ld	a0,336(sp)
	call	free@plt
	ld	a0,352(sp)
	call	free@plt
	la	a5,__stack_chk_guard
	ld	a4,376(sp)
	ld	a5,0(a5)
	bne	a4,a5,.L141
	ld	ra,488(sp)
	ld	s0,480(sp)
	ld	s2,464(sp)
	ld	s3,456(sp)
	ld	s4,448(sp)
	ld	s5,440(sp)
	ld	s6,432(sp)
	ld	s7,424(sp)
	ld	s8,416(sp)
	ld	s9,408(sp)
	ld	s10,400(sp)
	ld	s11,392(sp)
	mv	a0,s1
	ld	s1,472(sp)
	addi	sp,sp,496
	jr	ra
.L139:
	ld	a5,24(sp)
	ld	a3,32(a5)
	lw	a3,0(a3)
	bltz	a3,.L99
	beqz	a4,.L100
	ld	a0,0(a5)
	mv	s2,a5
	call	pm_lock@plt
	ld	a5,56(sp)
.L132:
	ld	a4,0(a5)
	ld	a0,0(s2)
	addi	a4,a4,1
	sd	a4,0(a5)
	call	pm_unlock@plt
	j	.L101
.L138:
	bnez	s5,.L97
	mv	a4,s5
	bnez	s6,.L97
	mv	a4,s6
	bnez	s7,.L97
	mv	a4,s7
	bne	s8,s4,.L97
	addi	a4,s10,-1
	seqz	a4,a4
	j	.L97
.L137:
	ld	a0,0(a5)
	mv	s2,a5
	call	pm_lock@plt
	lla	a5,.LANCHOR1
	j	.L132
.L136:
	ld	a1,40(sp)
	ld	a0,80(sp)
	li	a2,2
	call	perm_threads@plt
	j	.L91
.L135:
	ld	a1,88(sp)
	ld	a0,80(sp)
	li	a2,2
	call	perm_funs@plt
	j	.L90
.L133:
	ld	s2,24(sp)
	ld	a0,8(s2)
	call	pb_wait@plt
	lw	a5,24(s2)
	beqz	a5,.L142
.L85:
	ld	a5,24(sp)
	ld	a0,8(a5)
	call	pb_wait@plt
	j	.L86
.L134:
	ld	s2,24(sp)
	ld	a0,8(s2)
	call	pb_wait@plt
	ld	a5,32(sp)
	lw	a4,24(s2)
	lla	a3,.LANCHOR0
	andi	a5,a5,1
	slliw	a5,a5,2
	slliw	a4,a4,1
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
	j	.L86
.L142:
	ld	a5,8(sp)
	ld	a0,80(sp)
	lw	a3,20(a5)
	lw	a2,24(a5)
	ld	a5,24(sp)
	ld	a1,32(a5)
	call	perm_prefix_ints@plt
	j	.L85
.L141:
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
	.string	"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
	.align	3
.LC11:
	.string	"%s\n"
	.align	3
.LC12:
	.string	"% Results for tests/non-mixed-size/FENCE.TSO/2/MP+fence.tsoxp+fence.tsoxx.litmus %"
	.align	3
.LC13:
	.string	"RISCV MP+fence.tsoxp+fence.tsoxx"
	.align	3
.LC14:
	.string	"\"Fence.tsodWWXP RfePX Fence.tsodRRXX FreXX\""
	.align	3
.LC15:
	.string	"{"
	.align	3
.LC16:
	.string	" 0:x5=x; 0:x6=1; 0:x9=y;"
	.align	3
.LC17:
	.string	" 1:x5=y; 1:x8=x;"
	.align	3
.LC18:
	.string	"}"
	.align	3
.LC19:
	.string	" P0               | P1                ;"
	.align	3
.LC20:
	.string	" lr.w x7,0(x5)    | lr.w x6,0(x5)     ;"
	.align	3
.LC21:
	.string	" sc.w x8,x6,0(x5) | sc.w x7,x6,0(x5)  ;"
	.align	3
.LC22:
	.string	" fence.tso        | fence.tso         ;"
	.align	3
.LC23:
	.string	" sw x6,0(x9)      | lr.w x9,0(x8)     ;"
	.align	3
.LC24:
	.string	"                  | sc.w x10,x9,0(x8) ;"
	.align	3
.LC25:
	.string	""
	.align	3
.LC26:
	.string	"exists ([x]=1 /\\ [y]=1 /\\ 0:x8=0 /\\ 0:x7=0 /\\ 1:x10=0 /\\ 1:x7=0 /\\ 1:x6=1 /\\ 1:x9=0)"
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
	.string	"MP+fence.tsoxp+fence.tsoxx: n=%i, r=%i, s=%i"
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
	.string	"MP+fence.tsoxp+fence.tsoxx, sum_hist"
	.align	3
.LC42:
	.string	"Test MP+fence.tsoxp+fence.tsoxx Allowed\n"
	.align	3
.LC43:
	.string	"Histogram (%d states)\n"
	.align	3
.LC44:
	.string	"Observation MP+fence.tsoxp+fence.tsoxx %s %lu %lu\n"
	.align	3
.LC46:
	.string	"Time MP+fence.tsoxp+fence.tsoxx %.2f\n"
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
	.string	"Hash=8cb32495e0571d225ba2bf83eac985de\n"
	.align	3
.LC52:
	.string	"Cycle=RfePX Fence.tsodRRXX FreXX Fence.tsodWWXP\n"
	.align	3
.LC53:
	.string	"Relax MP+fence.tsoxp+fence.tsoxx %s %s\n"
	.align	3
.LC54:
	.string	"Safe=Rfe Fre Fence.tsodWW Fence.tsodRR X\n"
	.align	3
.LC55:
	.string	"Generator=diy7 (version 7.51+4(dev))\n"
	.align	3
.LC56:
	.string	"Com=Rf Fr\n"
	.align	3
.LC57:
	.string	"Orig=Fence.tsodWWXP RfePX Fence.tsodRRXX FreXX\n"
	.align	3
.LC58:
	.string	"No"
	.align	3
.LC59:
	.string	"NOT "
	.align	3
.LC60:
	.string	"Affinity=[0] [1] ; (1,0)\n"
	.text
	.align	1
	.globl	MP_2B_fence_2E_tsoxp_2B_fence_2E_tsoxx
	.type	MP_2B_fence_2E_tsoxp_2B_fence_2E_tsoxx, @function
MP_2B_fence_2E_tsoxp_2B_fence_2E_tsoxx:
	addi	sp,sp,-560
	sd	s0,544(sp)
	sd	s1,536(sp)
	sd	s2,528(sp)
	sd	s3,520(sp)
	sd	ra,552(sp)
	sd	s4,512(sp)
	sd	s5,504(sp)
	sd	s6,496(sp)
	sd	s7,488(sp)
	sd	s8,480(sp)
	sd	s9,472(sp)
	sd	s10,464(sp)
	sd	s11,456(sp)
	addi	s0,sp,560
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
	ble	a4,a5,.L229
	slli	a4,a5,32
	li	t1,-1
	mv	s5,a0
	li	a6,5
	addi	a0,a4,100
	srli	a7,t1,32
	addi	a1,a4,1
	addi	a2,s0,-408
	addi	a3,s0,-296
	slli	a6,a6,33
	sd	a0,-400(s0)
	li	a0,4
	sd	a4,-384(s0)
	sw	a5,-368(s0)
	sd	t1,-320(s0)
	sw	a5,-304(s0)
	sd	a6,-408(s0)
	sd	a0,-392(s0)
	sd	a1,-376(s0)
	sd	s5,-360(s0)
	sd	zero,-352(s0)
	sd	a7,-344(s0)
	sd	zero,-336(s0)
	sd	zero,-328(s0)
	sd	a7,-312(s0)
	mv	a5,a2
	mv	a4,a3
	addi	t1,s0,-312
.L146:
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
	bne	a5,t1,.L146
	ld	a6,0(a5)
	ld	a5,8(a5)
	mv	a1,s2
	mv	a0,s3
	sd	a5,8(a4)
	sd	a6,0(a4)
	call	parse_cmd@plt
	lw	a5,-192(s0)
	sd	sp,-528(s0)
	bnez	a5,.L230
.L147:
	call	timeofday@plt
	lw	a5,-296(s0)
	lw	a4,-284(s0)
	sd	a0,-536(s0)
	sw	a5,-448(s0)
	lw	a5,-288(s0)
	sw	a5,-444(s0)
	lw	a5,-292(s0)
	sw	a5,-440(s0)
	blez	a4,.L231
	lw	a5,-268(s0)
	sw	a4,-436(s0)
	li	a4,5
	beq	a5,a4,.L149
.L246:
	addiw	a5,a5,-3
	li	a4,2
	sgtu	a5,a5,a4
	li	s9,-1
.L150:
	lw	a4,-196(s0)
	sw	a5,-420(s0)
	beqz	a4,.L152
	sw	zero,-420(s0)
.L152:
	lw	a0,0(s5)
	li	a1,2
	call	coremap_seq@plt
	lw	s2,-280(s0)
	sd	a0,-416(s0)
	ld	s4,-248(s0)
	blez	s2,.L232
	lw	a2,0(s4)
	ble	s2,a2,.L154
	mv	a1,s2
	lla	a0,.LC29
	call	log_error@plt
	ld	s4,-248(s0)
.L154:
	lw	s6,-276(s0)
	blez	s6,.L155
.L247:
	slli	s7,s6,2
	addiw	a5,s6,-1
	add	s7,s7,s6
	slliw	s2,s6,1
	sd	a5,-480(s0)
	slli	s8,a5,3
	sd	s6,-544(s0)
	slli	s7,s7,3
.L156:
	lw	a4,-268(s0)
	li	a5,2
	mv	s11,s2
	beq	a4,a5,.L233
.L157:
	slli	a5,s11,2
	addi	a5,a5,15
	lw	a3,-448(s0)
	andi	a5,a5,-16
	sub	sp,sp,a5
	sw	s2,-424(s0)
	sw	a4,-432(s0)
	sw	s11,-428(s0)
	mv	s2,sp
	bnez	a3,.L234
.L158:
	li	a5,2
	beq	a4,a5,.L235
	li	a5,3
	beq	a4,a5,.L236
	li	a5,5
	beq	a4,a5,.L237
.L167:
	addi	s8,s8,15
	andi	s8,s8,-16
	addi	s7,s7,15
	sub	sp,sp,s8
	andi	s7,s7,-16
	sd	sp,-504(s0)
	sub	sp,sp,s7
	call	pm_create@plt
	mv	s9,a0
	mv	a0,s6
	sd	s9,-488(s0)
	call	pb_create@plt
	lw	s7,-256(s0)
	sd	a0,-496(s0)
	lw	a1,0(s4)
	mv	s8,sp
	blez	s7,.L238
	remw	a5,s7,a1
	sd	a5,-472(s0)
.L174:
	ld	a0,-472(s0)
	addi	s7,s2,8
	li	s11,0
	call	gcd@plt
	ld	s3,-504(s0)
	addi	a5,s0,-448
	mv	a2,s8
	sd	a0,-552(s0)
	mv	s8,s3
	li	s2,0
	li	s9,0
	li	s10,0
	sd	a5,-520(s0)
	j	.L181
.L241:
	mv	a0,s3
	lla	a1,zyva
	sd	a2,-512(s0)
	call	launch@plt
	ld	a2,-512(s0)
	addiw	s10,s10,1
	addi	s3,s3,8
	addi	a2,a2,40
	addi	s7,s7,8
	beq	s6,s10,.L239
.L181:
	ld	a5,-520(s0)
	lw	a1,-268(s0)
	addi	a0,s7,-8
	sd	a5,16(a2)
	ld	a5,-488(s0)
	sw	s10,24(a2)
	sd	a0,32(a2)
	sd	a5,0(a2)
	ld	a5,-496(s0)
	sd	a5,8(a2)
	li	a5,1
	beq	a1,a5,.L240
.L176:
	ld	a5,-480(s0)
	bgt	a5,s10,.L241
	mv	a0,a2
	sd	a2,-512(s0)
	call	zyva
	ld	a2,-512(s0)
	addiw	s10,s10,1
	mv	s2,a0
	addi	a2,a2,40
	addi	s3,s3,8
	addi	s7,s7,8
	bne	s6,s10,.L181
.L239:
	lw	a5,-444(s0)
	lw	s6,-440(s0)
	mul	s6,s6,a5
	ld	a5,-480(s0)
	beqz	a5,.L188
	ld	a5,-480(s0)
	addiw	s3,a5,-1
	slli	s3,s3,32
	ld	a5,-504(s0)
	srli	s3,s3,32
	addi	s3,s3,1
	slli	s3,s3,3
	add	s11,a5,s3
	lla	s3,.LC41
.L187:
	mv	a0,s8
	call	join@plt
	mv	s7,a0
	ld	a0,0(a0)
	call	sum_outs@plt
	bne	s6,a0,.L185
	ld	a2,8(s7)
	ld	a3,16(s7)
	add	a5,a2,a3
	beq	s6,a5,.L186
.L185:
	mv	a0,s3
	call	fatal@plt
	ld	a2,8(s7)
	ld	a3,16(s7)
.L186:
	ld	a4,8(s2)
	ld	a5,16(s2)
	ld	a1,0(s7)
	ld	a0,0(s2)
	add	a4,a4,a2
	add	a5,a5,a3
	li	a2,8
	sd	a4,8(s2)
	sd	a5,16(s2)
	call	merge_outs@plt
	sd	a0,0(s2)
	ld	a0,0(s7)
	addi	s8,s8,8
	call	free_outs@plt
	mv	a0,s7
	call	free@plt
	bne	s8,s11,.L187
.L188:
	mv	a0,s4
	call	cpus_free@plt
	call	timeofday@plt
	ld	a5,-536(s0)
	mv	s3,a0
	ld	a0,-488(s0)
	sub	s3,s3,a5
	call	pm_free@plt
	ld	a5,-544(s0)
	ld	a0,-496(s0)
	mul	s6,s6,a5
	call	pb_free@plt
	ld	a0,0(s2)
	call	sum_outs@plt
	bne	s6,a0,.L183
	ld	s4,8(s2)
	ld	s7,16(s2)
	add	a5,s4,s7
	beq	s6,a5,.L189
.L183:
	lla	a0,.LC41
	call	fatal@plt
	ld	s4,8(s2)
	ld	s7,16(s2)
.L189:
	li	a2,40
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
	li	a4,8
	addi	a3,s0,-184
	lla	a1,do_dump_outcome
	mv	a0,s1
	call	dump_outs@plt
	beqz	s4,.L242
	lla	a2,.LC11
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
	li	a2,48
	li	a1,1
	lla	a0,.LC52
	call	fwrite@plt
	lla	a4,.LC25
	lla	a2,.LC53
	li	a1,1
	lla	a3,.LC47
	mv	a0,s1
	call	__fprintf_chk@plt
	mv	a3,s1
	li	a2,41
	li	a1,1
	lla	a0,.LC54
	call	fwrite@plt
	mv	a3,s1
	li	a2,37
	li	a1,1
	lla	a0,.LC55
	call	fwrite@plt
	mv	a3,s1
	li	a2,10
	li	a1,1
	lla	a0,.LC56
	call	fwrite@plt
	mv	a3,s1
	li	a2,47
	li	a1,1
	lla	a0,.LC57
	call	fwrite@plt
	lw	a4,-268(s0)
	li	a5,3
	beq	a4,a5,.L243
.L194:
	lla	s6,.LC8
	bnez	s7,.L244
.L192:
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
	ld	a0,-416(s0)
	call	cpus_free@plt
	ld	a5,-248(s0)
	ld	sp,-528(s0)
	beq	a5,s5,.L145
	mv	a0,s5
.L229:
	call	cpus_free@plt
.L145:
	la	a5,__stack_chk_guard
	ld	a4,-120(s0)
	ld	a5,0(a5)
	bne	a4,a5,.L245
	addi	sp,s0,-560
	ld	ra,552(sp)
	ld	s0,544(sp)
	ld	s1,536(sp)
	ld	s2,528(sp)
	ld	s3,520(sp)
	ld	s4,512(sp)
	ld	s5,504(sp)
	ld	s6,496(sp)
	ld	s7,488(sp)
	ld	s8,480(sp)
	ld	s9,472(sp)
	ld	s10,464(sp)
	ld	s11,456(sp)
	li	a0,0
	addi	sp,sp,560
	jr	ra
.L231:
	lw	a5,-268(s0)
	li	a4,2
	sw	a4,-436(s0)
	li	a4,5
	bne	a5,a4,.L246
.L149:
	ld	a2,-240(s0)
	li	a1,2
	lla	a0,.LANCHOR2
	call	find_string@plt
	mv	s9,a0
	bltz	a0,.L151
	lw	a5,-268(s0)
	li	a4,2
	addiw	a5,a5,-3
	sgtu	a5,a5,a4
	j	.L150
.L232:
	lw	s6,-276(s0)
	lw	s2,0(s4)
	bgtz	s6,.L247
.L155:
	li	a5,1
	ble	s2,a5,.L197
	srai	s6,s2,1
	sraiw	s3,s2,1
	lw	a4,-268(s0)
	addiw	a5,s3,-1
	slli	s7,s6,2
	sd	a5,-480(s0)
	add	s7,s7,s6
	andi	s2,s2,-2
	slli	s8,a5,3
	sd	s6,-544(s0)
	li	a5,2
	slli	s7,s7,3
	mv	s11,s2
	bne	a4,a5,.L157
.L233:
	lw	a0,0(s4)
	mv	a1,s2
	call	max@plt
	lw	a4,-268(s0)
	mv	s11,a0
	j	.L157
.L240:
	ld	a1,8(s4)
	slli	a0,s9,2
	ld	a5,-472(s0)
	add	a0,a1,a0
	lw	a0,0(a0)
	addw	a5,a5,s9
	sw	a0,-8(s7)
	lw	a0,0(s4)
	remw	a5,a5,a0
	bne	a5,s11,.L177
	ld	a5,-552(s0)
	addiw	a4,s11,1
	remw	s11,a4,a5
	mv	a5,s11
.L177:
	slli	a0,a5,2
	add	a1,a1,a0
	lw	a1,0(a1)
	ld	a4,-472(s0)
	sw	a1,-4(s7)
	lw	a1,0(s4)
	addw	a5,a4,a5
	remw	s9,a5,a1
	bne	s9,s11,.L176
	ld	a5,-552(s0)
	addiw	a4,s11,1
	remw	s11,a4,a5
	mv	s9,s11
	j	.L176
.L242:
	lla	a2,.LC11
	li	a1,1
	lla	a3,.LC58
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
	lla	a4,.LC59
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
	li	a2,48
	li	a1,1
	lla	a0,.LC52
	call	fwrite@plt
	lla	a4,.LC25
	lla	a2,.LC53
	li	a1,1
	lla	a3,.LC58
	mv	a0,s1
	call	__fprintf_chk@plt
	mv	a3,s1
	li	a2,41
	li	a1,1
	lla	a0,.LC54
	call	fwrite@plt
	mv	a3,s1
	li	a2,37
	li	a1,1
	lla	a0,.LC55
	call	fwrite@plt
	mv	a3,s1
	li	a2,10
	li	a1,1
	lla	a0,.LC56
	call	fwrite@plt
	mv	a3,s1
	li	a2,47
	li	a1,1
	lla	a0,.LC57
	call	fwrite@plt
	lw	a4,-268(s0)
	li	a5,3
	lla	s6,.LC7
	bne	a4,a5,.L192
	mv	a3,s1
	li	a2,25
	li	a1,1
	lla	a0,.LC60
	call	fwrite@plt
	j	.L192
.L238:
	blez	a1,.L199
	ld	a4,8(s4)
	li	a5,0
	li	a3,-1
.L175:
	sw	a3,0(a4)
	lw	a1,0(s4)
	addiw	a5,a5,1
	addi	a4,a4,4
	blt	a5,a1,.L175
.L199:
	li	a5,1
	sd	a5,-472(s0)
	j	.L174
.L235:
	blez	s11,.L167
	ld	a2,8(s4)
	mv	a3,s2
	li	a4,0
.L168:
	lw	a5,0(s4)
	addi	a3,a3,4
	remw	a5,a4,a5
	addiw	a4,a4,1
	slli	a5,a5,2
	add	a5,a2,a5
	lw	a5,0(a5)
	sw	a5,-4(a3)
	bne	s11,a4,.L168
	j	.L167
.L234:
	lw	a3,-444(s0)
	lw	a2,-440(s0)
	mv	a1,s6
	lla	a0,.LC30
	call	log_error@plt
	lw	a1,-436(s0)
	lla	a0,.LC31
	call	log_error@plt
	lw	a5,-268(s0)
	li	a4,1
	beq	a5,a4,.L248
	li	a4,2
	beq	a5,a4,.L249
	li	a4,3
	beq	a5,a4,.L250
	li	a4,4
	beq	a5,a4,.L251
.L160:
	lla	a0,.LC36
	call	log_error@plt
	la	s10,stderr
	ld	a1,-248(s0)
	ld	a0,0(s10)
	call	cpus_dump@plt
	lla	a0,.LC37
	call	log_error@plt
	lla	a0,.LC38
	call	log_error@plt
	lw	a4,-448(s0)
	li	a5,1
	ble	a4,a5,.L228
	ld	a5,-416(s0)
	beqz	a5,.L228
	lla	a0,.LC39
	call	log_error@plt
	ld	a0,0(s10)
	ld	a1,-416(s0)
	call	cpus_dump@plt
	lla	a0,.LC38
	call	log_error@plt
.L228:
	lw	a4,-268(s0)
	j	.L158
.L230:
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
	lla	a3,.LC27
	lla	a2,.LC11
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	j	.L147
.L244:
	lla	s6,.LC9
	j	.L192
.L197:
	li	a5,1
	li	s7,40
	sd	a5,-544(s0)
	li	s8,0
	sd	zero,-480(s0)
	li	s2,2
	li	s6,1
	j	.L156
.L237:
	slliw	s9,s9,2
	slli	s9,s9,2
	lla	a4,.LANCHOR0
	add	a4,a4,s9
	blez	s11,.L167
	addiw	a5,s11,-1
	slli	a5,a5,32
	srli	a5,a5,32
	addi	a5,a5,1
	slli	a5,a5,2
	mv	a3,s2
	add	a5,a4,a5
.L172:
	lw	a2,0(a4)
	addi	a4,a4,4
	addi	a3,a3,4
	sw	a2,-4(a3)
	bne	a4,a5,.L172
	j	.L167
.L236:
	ld	a1,-416(s0)
	mv	a5,s6
	mv	a6,s2
	mv	a4,s4
	lla	a3,.LANCHOR0+32
	lla	a2,.LANCHOR2+16
	addi	a0,s0,-452
	sw	zero,-452(s0)
	call	custom_affinity@plt
	lw	a5,-448(s0)
	beqz	a5,.L167
	lla	a0,.LC40
	call	log_error@plt
	la	a5,stderr
	ld	a3,-416(s0)
	ld	a0,0(a5)
	li	a4,2
	mv	a2,s11
	mv	a1,s2
	call	cpus_dump_test@plt
	j	.L167
.L243:
	mv	a3,s1
	li	a2,25
	li	a1,1
	lla	a0,.LC60
	call	fwrite@plt
	j	.L194
.L248:
	lw	a1,-256(s0)
	lla	a0,.LC32
	call	log_error@plt
	j	.L160
.L249:
	lla	a0,.LC33
	call	log_error@plt
	j	.L160
.L151:
	ld	a1,-240(s0)
	lla	a0,.LC28
	call	log_error@plt
	li	a5,4
	sw	a5,-268(s0)
	sd	zero,-240(s0)
	li	a5,0
	j	.L150
.L250:
	lla	a0,.LC34
	call	log_error@plt
	j	.L160
.L251:
	lla	a0,.LC35
	call	log_error@plt
	j	.L160
.L245:
	call	__stack_chk_fail@plt
	.size	MP_2B_fence_2E_tsoxp_2B_fence_2E_tsoxx, .-MP_2B_fence_2E_tsoxp_2B_fence_2E_tsoxx
	.section	.rodata.str1.8
	.align	3
.LC61:
	.string	"[[0],[1]]"
	.align	3
.LC62:
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
	.dword	.LC61
	.dword	.LC62
	.type	color, @object
	.size	color, 24
color:
	.dword	color_0
	.dword	color_1
	.dword	0
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
