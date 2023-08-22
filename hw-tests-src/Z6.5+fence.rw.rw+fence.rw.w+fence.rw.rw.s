	.file	"Z6.5+fence.rw.rw+fence.rw.w+fence.rw.rw.c"
	.option pic
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"%-6lu%c>2:x7=%d; [y]=%d; [z]=%d;\n"
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
	.string	"Z6.5+fence.rw.rw+fence.rw.w+fence.rw.rw, check_globals failed"
	.text
	.align	1
	.type	check_globals, @function
check_globals:
	ld	a5,112(a0)
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
	addi	s1,a0,104
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
	ld	a0,32(s6)
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
	addi	sp,sp,-112
	ld	a5,112(a1)
	sd	s8,32(sp)
	mv	s8,a0
	ld	a0,32(a1)
	sd	s0,96(sp)
	sd	s1,88(sp)
	sd	s2,80(sp)
	mv	s1,a1
	sd	s3,72(sp)
	sd	s4,64(sp)
	sd	s5,56(sp)
	sd	s6,48(sp)
	sd	s7,40(sp)
	sd	s9,24(sp)
	lw	s7,4(a5)
	sd	s10,16(sp)
	sd	s11,8(sp)
	ld	s9,8(a1)
	ld	s11,0(a1)
	sd	ra,104(sp)
	call	pb_wait@plt
	li	a4,3
	addiw	a5,s8,1
	remw	a5,a5,a4
	addiw	a4,s7,-1
	slli	s0,a4,32
	srli	s0,s0,32
	sub	s0,s7,s0
	addi	s6,s1,48
	addi	s5,s1,72
	slli	s3,s8,3
	slli	s0,s0,2
	add	s4,s6,s3
	addi	s10,s0,-8
	add	s3,s5,s3
	slli	s2,a4,2
	addi	s0,s0,-4
	slli	a5,a5,3
	add	s6,s6,a5
	add	s5,s5,a5
.L43:
	ld	a0,40(s1)
	blez	s7,.L36
	ld	a7,0(s4)
	ld	a6,0(s3)
	mv	a5,s2
.L37:
	add	a4,s9,a5
	lw	a1,0(a4)
	add	a3,a7,a5
	add	a4,s11,a5
	sw	a1,0(a3)
	lw	a3,0(a4)
	add	a4,a6,a5
	addi	a5,a5,-4
	sw	a3,0(a4)
	bne	a5,s10,.L37
	call	po_reinit@plt
	ld	a7,0(s4)
	ld	a6,0(s6)
	ld	a0,0(s3)
	ld	a1,0(s5)
	mv	a3,s2
.L41:
	add	a4,a0,a3
	add	a5,a1,a3
	lw	a4,0(a4)
	lw	a5,0(a5)
	beq	a4,a5,.L51
.L39:
	mv	a1,s8
	lla	a0,.LC2
	call	log_error@plt
	li	a1,1
.L42:
	ld	a0,40(s1)
	call	po_wait@plt
	bnez	a0,.L43
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
.L51:
	add	a4,a7,a3
	add	a5,a6,a3
	lw	a4,0(a4)
	lw	a5,0(a5)
	beq	s0,a3,.L40
	addi	a3,a3,-4
	beq	a4,a5,.L41
	j	.L39
.L40:
	li	a1,0
	beq	a4,a5,.L42
	j	.L39
.L36:
	call	po_reinit@plt
	li	a1,0
	j	.L42
	.size	stabilize_globals, .-stabilize_globals
	.section	.rodata.str1.8
	.align	3
.LC3:
	.string	"Z6.5+fence.rw.rw+fence.rw.w+fence.rw.rw"
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
# 47 "Z6.5+fence.rw.rw+fence.rw.w+fence.rw.rw.c" 1
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
	lw	a7,0(s1)
	ld	t4,96(s0)
	lw	a6,12(a5)
	lw	t2,4(a5)
	blez	a6,.L56
	sub	t6,t2,a6
	negw	a0,a6
	subw	t5,t2,a6
	slli	t6,t6,2
	sext.w	t2,t2
	slli	a0,a0,2
	sext.w	a7,a7
	li	t3,3
	li	t0,1
	li	t1,2
.L55:
	sext.w	a2,t5
	mv	a3,t6
	bltz	t5,.L60
.L59:
	remuw	a5,a2,t3
	add	a4,t4,a3
	beq	a5,a7,.L69
.L57:
	lw	a5,0(a4)
	sext.w	a5,a5
	beqz	a5,.L57
.L58:
	ld	a5,0(s0)
	ld	a4,16(s0)
	add	a5,a5,a3
	add	a4,a4,a3
#APP
# 318 "Z6.5+fence.rw.rw+fence.rw.w+fence.rw.rw.c" 1
	
#START _litmus_P2
#_litmus_P2_0
	sw t1,0(a5)
#_litmus_P2_1
	fence rw,rw
#_litmus_P2_2
	lw a1,0(a4)
#END _litmus_P2

# 0 "" 2
#NO_APP
	ld	a5,24(s0)
	subw	a2,a2,a6
	add	a5,a5,a3
	sw	a1,0(a5)
	add	a3,a3,a0
	bgez	a2,.L59
.L60:
	addiw	t5,t5,1
	addi	t6,t6,4
	bne	t5,t2,.L55
.L56:
	mv	a1,s0
	li	a0,2
	call	stabilize_globals
#APP
# 47 "Z6.5+fence.rw.rw+fence.rw.w+fence.rw.rw.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	li	a0,0
	addi	sp,sp,32
	jr	ra
.L69:
	sw	t0,0(a4)
#APP
# 47 "Z6.5+fence.rw.rw+fence.rw.w+fence.rw.rw.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	j	.L58
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
# 47 "Z6.5+fence.rw.rw+fence.rw.w+fence.rw.rw.c" 1
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
	lw	a7,0(s1)
	ld	t4,96(s0)
	lw	a6,12(a5)
	lw	t0,4(a5)
	blez	a6,.L74
	sub	t6,t0,a6
	negw	a0,a6
	subw	t5,t0,a6
	slli	t6,t6,2
	sext.w	t0,t0
	slli	a0,a0,2
	sext.w	a7,a7
	li	t3,3
	li	a1,1
	li	t1,2
.L73:
	sext.w	a2,t5
	mv	a3,t6
	bltz	t5,.L78
.L77:
	remuw	a5,a2,t3
	add	a4,t4,a3
	beq	a5,a7,.L87
.L75:
	lw	a5,0(a4)
	sext.w	a5,a5
	beqz	a5,.L75
.L76:
	ld	a5,8(s0)
	ld	a4,0(s0)
	add	a5,a5,a3
	add	a4,a4,a3
#APP
# 283 "Z6.5+fence.rw.rw+fence.rw.w+fence.rw.rw.c" 1
	
#START _litmus_P1
#_litmus_P1_0
	sw t1,0(a5)
#_litmus_P1_1
	fence rw,w
#_litmus_P1_2
	sw a1,0(a4)
#END _litmus_P1

# 0 "" 2
#NO_APP
	subw	a2,a2,a6
	add	a3,a3,a0
	bgez	a2,.L77
.L78:
	addiw	t5,t5,1
	addi	t6,t6,4
	bne	t5,t0,.L73
.L74:
	mv	a1,s0
	li	a0,1
	call	stabilize_globals
#APP
# 47 "Z6.5+fence.rw.rw+fence.rw.w+fence.rw.rw.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	li	a0,0
	addi	sp,sp,32
	jr	ra
.L87:
	sw	a1,0(a4)
#APP
# 47 "Z6.5+fence.rw.rw+fence.rw.w+fence.rw.rw.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	j	.L76
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
# 47 "Z6.5+fence.rw.rw+fence.rw.w+fence.rw.rw.c" 1
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
	lw	a7,0(s1)
	ld	t3,96(s0)
	lw	a6,12(a5)
	lw	t6,4(a5)
	blez	a6,.L92
	sub	t5,t6,a6
	negw	a0,a6
	subw	t4,t6,a6
	slli	t5,t5,2
	sext.w	t6,t6
	slli	a0,a0,2
	sext.w	a7,a7
	li	t1,3
	li	a1,1
.L91:
	sext.w	a2,t4
	mv	a3,t5
	bltz	t4,.L96
.L95:
	remuw	a5,a2,t1
	add	a4,t3,a3
	beq	a5,a7,.L105
.L93:
	lw	a5,0(a4)
	sext.w	a5,a5
	beqz	a5,.L93
.L94:
	ld	a5,16(s0)
	ld	a4,8(s0)
	add	a5,a5,a3
	add	a4,a4,a3
#APP
# 248 "Z6.5+fence.rw.rw+fence.rw.w+fence.rw.rw.c" 1
	
#START _litmus_P0
#_litmus_P0_0
	sw a1,0(a5)
#_litmus_P0_1
	fence rw,rw
#_litmus_P0_2
	sw a1,0(a4)
#END _litmus_P0

# 0 "" 2
#NO_APP
	subw	a2,a2,a6
	add	a3,a3,a0
	bgez	a2,.L95
.L96:
	addiw	t4,t4,1
	addi	t5,t5,4
	bne	t4,t6,.L91
.L92:
	mv	a1,s0
	li	a0,0
	call	stabilize_globals
#APP
# 47 "Z6.5+fence.rw.rw+fence.rw.w+fence.rw.rw.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	li	a0,0
	addi	sp,sp,32
	jr	ra
.L105:
	sw	a1,0(a4)
#APP
# 47 "Z6.5+fence.rw.rw+fence.rw.w+fence.rw.rw.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	j	.L94
	.size	P0, .-P0
	.section	.rodata.str1.8
	.align	3
.LC4:
	.string	"Run %i of %i\r"
	.align	3
.LC5:
	.string	"Z6.5+fence.rw.rw+fence.rw.w+fence.rw.rw, global y unstabilized"
	.align	3
.LC6:
	.string	"Z6.5+fence.rw.rw+fence.rw.w+fence.rw.rw, global z unstabilized"
	.text
	.align	1
	.type	zyva, @function
zyva:
	addi	sp,sp,-496
	la	a5,__stack_chk_guard
	mv	a4,a0
	ld	a5,0(a5)
	sd	a0,24(sp)
	ld	a0,8(a0)
	sd	ra,488(sp)
	sd	s0,480(sp)
	sd	s1,472(sp)
	sd	s2,464(sp)
	sd	s3,456(sp)
	sd	s5,440(sp)
	sd	s7,424(sp)
	sd	a5,376(sp)
	ld	s7,16(a4)
	sd	s4,448(sp)
	sd	s6,432(sp)
	sd	s8,416(sp)
	sd	s9,408(sp)
	sd	s10,400(sp)
	sd	s11,392(sp)
	call	pb_wait@plt
	lla	a5,P0
	sd	a5,136(sp)
	lla	a5,P1
	sd	a5,144(sp)
	li	a0,24
	lla	a5,P2
	sd	a5,152(sp)
	call	malloc_check@plt
	lw	s2,4(s7)
	sd	zero,0(a0)
	sd	zero,16(a0)
	sd	zero,8(a0)
	slli	s2,s2,2
	mv	s3,a0
	sd	s7,368(sp)
	call	rand@plt
	mv	a5,a0
	mv	a0,s2
	sw	a5,360(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s2
	sd	a5,280(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s2
	sd	a5,256(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s2
	sd	a5,264(sp)
	call	malloc_check@plt
	mv	a5,a0
	li	a0,3
	sd	a5,272(sp)
	call	pb_create@plt
	mv	a5,a0
	li	a0,3
	addi	s5,sp,256
	sd	a5,288(sp)
	call	po_create@plt
	sd	a0,296(sp)
	sd	s5,88(sp)
	addi	s0,sp,232
	mv	s1,s5
.L107:
	mv	a0,s2
	call	malloc_check@plt
	mv	a5,a0
	sd	a5,64(s1)
	mv	a0,s2
	call	malloc_check@plt
	sd	a0,88(s1)
	addi	s1,s1,-8
	bne	s0,s1,.L107
	mv	a0,s2
	call	malloc_check@plt
	ld	a5,24(sp)
	lw	a4,8(s7)
	li	a3,2
	ld	a5,32(a5)
	sw	a3,232(sp)
	li	a3,1
	sd	a0,352(sp)
	sd	s5,248(sp)
	sd	a5,240(sp)
	sw	a3,208(sp)
	sd	s5,224(sp)
	sd	a5,216(sp)
	sw	zero,184(sp)
	sd	s5,200(sp)
	sd	a5,192(sp)
	blez	a4,.L122
	addi	a5,sp,184
	sd	a5,72(sp)
	addi	a5,sp,112
	sd	a5,40(sp)
	addi	a5,sp,128
	sd	a5,56(sp)
	addi	a5,sp,208
	sd	a5,80(sp)
	addi	a5,sp,120
	sd	a5,48(sp)
	addi	a5,sp,360
	sd	a5,96(sp)
	li	a5,-237568
	addiw	a5,a5,-1919
	sw	a5,20(sp)
	addi	a5,sp,136
	sd	zero,32(sp)
	sd	a5,104(sp)
.L108:
	lw	a5,16(s7)
	li	a4,2
	beq	a5,a4,.L162
	li	a4,4
	beq	a5,a4,.L163
.L112:
	lw	a4,0(s7)
	li	a5,1
	ble	a4,a5,.L114
	la	a5,stderr
	lw	a4,8(s7)
	ld	a0,0(a5)
	ld	a3,32(sp)
	lla	a2,.LC4
	li	a1,1
	call	__fprintf_chk@plt
.L114:
	ld	a5,368(sp)
	lw	a4,4(a5)
	addiw	a2,a4,-1
	slli	a3,a2,32
	sext.w	a5,a2
	bltz	a3,.L119
	slli	a2,a2,32
	srli	a2,a2,32
	sub	a2,a4,a2
	ld	t1,256(sp)
	ld	a7,264(sp)
	ld	a6,272(sp)
	ld	a0,280(sp)
	ld	a1,352(sp)
	slli	a2,a2,2
	slli	a5,a5,2
	addi	a2,a2,-8
.L118:
	add	a4,t1,a5
	sw	zero,0(a4)
	lw	s1,20(sp)
	add	a4,a7,a5
	sw	zero,0(a4)
	add	a4,a6,a5
	sw	zero,0(a4)
	add	a3,a0,a5
	add	a4,a1,a5
	sw	s1,0(a3)
	sw	zero,0(a4)
	addi	a5,a5,-4
	bne	a5,a2,.L118
.L119:
	lw	a5,28(s7)
	bnez	a5,.L164
.L117:
	ld	a1,152(sp)
	ld	a0,56(sp)
	mv	a2,s0
	call	launch@plt
	ld	a2,80(sp)
	ld	a1,144(sp)
	ld	a0,48(sp)
	call	launch@plt
	ld	a2,72(sp)
	ld	a1,136(sp)
	ld	a0,40(sp)
	call	launch@plt
	lw	a5,28(s7)
	bnez	a5,.L165
.L120:
	ld	a0,56(sp)
	call	join@plt
	ld	a0,48(sp)
	call	join@plt
	ld	a0,40(sp)
	call	join@plt
	lw	a5,4(s7)
	addiw	s6,a5,-1
	slli	a4,s6,32
	sext.w	a6,s6
	bltz	a4,.L134
	ld	a3,32(sp)
	li	a4,3
	slli	s6,s6,32
	remw	a4,a3,a4
	srli	s6,s6,32
	sub	s6,a5,s6
	slli	a5,s6,2
	addi	a5,a5,-8
	sd	a5,8(sp)
	slli	s6,a6,2
	addi	s10,sp,160
	lla	s9,.LC5
	lla	s8,.LC6
	slli	a5,a4,3
	lla	a4,.LANCHOR1
	add	a5,a4,a5
	sd	a5,64(sp)
.L133:
	ld	a3,280(sp)
	ld	a4,264(sp)
	ld	a5,256(sp)
	add	a3,a3,s6
	add	a4,a4,s6
	add	a5,a5,s6
	lw	s4,0(a3)
	lw	s1,0(a4)
	lw	s2,0(a5)
	mv	s11,s5
.L124:
	ld	a4,64(s11)
	add	a4,a4,s6
	lw	a4,0(a4)
	beq	a4,s1,.L123
	mv	a0,s9
	call	fatal@plt
.L123:
	addi	s11,s11,-8
	bne	s0,s11,.L124
	mv	s11,s5
.L126:
	ld	a4,88(s11)
	add	a4,a4,s6
	lw	a4,0(a4)
	beq	a4,s2,.L125
	mv	a0,s8
	call	fatal@plt
.L125:
	addi	s11,s11,-8
	bne	s0,s11,.L126
	li	a4,0
	bnez	s4,.L127
	li	a5,2
	mv	a4,s4
	bne	s1,a5,.L127
	addi	a4,s2,-2
	seqz	a4,a4
.L127:
	ld	a0,0(s3)
	li	a3,1
	li	a2,3
	mv	a1,s10
	sd	a4,0(sp)
	sd	s4,160(sp)
	sd	s1,168(sp)
	sd	s2,176(sp)
	call	add_outcome_outs@plt
	lw	a5,16(s7)
	li	a3,4
	sd	a0,0(s3)
	ld	a4,0(sp)
	beq	a5,a3,.L166
	li	a3,5
	bne	a5,a3,.L129
	ld	a5,24(sp)
	ld	a5,32(a5)
	lw	a5,0(a5)
	bltz	a5,.L129
	bnez	a4,.L167
.L130:
	ld	a5,16(s3)
	addi	a5,a5,1
	sd	a5,16(s3)
.L132:
	ld	a5,8(sp)
	addi	s6,s6,-4
	bne	s6,a5,.L133
.L134:
	ld	a4,32(sp)
	lw	a5,8(s7)
	addiw	a4,a4,1
	sd	a4,32(sp)
	bgt	a5,a4,.L108
.L122:
	ld	a0,256(sp)
	call	free@plt
	ld	a0,264(sp)
	call	free@plt
	ld	a0,272(sp)
	call	free@plt
	ld	a0,280(sp)
	call	free@plt
	ld	a0,288(sp)
	call	pb_free@plt
	ld	a0,296(sp)
	call	po_free@plt
.L109:
	ld	a5,88(sp)
	ld	a0,64(a5)
	addi	a5,a5,-8
	mv	s1,a5
	sd	a5,88(sp)
	call	free@plt
	ld	a0,96(s1)
	call	free@plt
	bne	s0,s1,.L109
	ld	a0,352(sp)
	call	free@plt
	la	a5,__stack_chk_guard
	ld	a4,376(sp)
	ld	a5,0(a5)
	bne	a4,a5,.L168
	ld	ra,488(sp)
	ld	s0,480(sp)
	ld	s1,472(sp)
	ld	s2,464(sp)
	ld	s4,448(sp)
	ld	s5,440(sp)
	ld	s6,432(sp)
	ld	s7,424(sp)
	ld	s8,416(sp)
	ld	s9,408(sp)
	ld	s10,400(sp)
	ld	s11,392(sp)
	mv	a0,s3
	ld	s3,456(sp)
	addi	sp,sp,496
	jr	ra
.L129:
	beqz	a4,.L130
.L131:
	ld	a5,8(s3)
	addi	a5,a5,1
	sd	a5,8(s3)
	j	.L132
.L166:
	ld	a5,24(sp)
	ld	a5,32(a5)
	lw	a5,0(a5)
	bltz	a5,.L129
	beqz	a4,.L130
	ld	s1,24(sp)
	ld	a0,0(s1)
	call	pm_lock@plt
	ld	a4,64(sp)
.L161:
	ld	a5,0(a4)
	ld	a0,0(s1)
	addi	a5,a5,1
	sd	a5,0(a4)
	call	pm_unlock@plt
	j	.L131
.L167:
	ld	s1,24(sp)
	ld	a0,0(s1)
	call	pm_lock@plt
	lla	a4,.LANCHOR1
	j	.L161
.L165:
	ld	a1,40(sp)
	ld	a0,96(sp)
	li	a2,3
	call	perm_threads@plt
	j	.L120
.L164:
	ld	a1,104(sp)
	ld	a0,96(sp)
	li	a2,3
	call	perm_funs@plt
	j	.L117
.L162:
	ld	s1,24(sp)
	ld	a0,8(s1)
	call	pb_wait@plt
	lw	a5,24(s1)
	beqz	a5,.L169
.L160:
	ld	a5,24(sp)
	ld	a0,8(a5)
	call	pb_wait@plt
	j	.L112
.L163:
	ld	s1,24(sp)
	ld	a0,8(s1)
	call	pb_wait@plt
	ld	a5,32(sp)
	li	a3,3
	lw	a2,24(s1)
	remw	a3,a5,a3
	ld	a4,32(s1)
	slliw	a5,a2,1
	addw	a5,a5,a2
	addi	a1,a4,12
	slliw	a2,a3,1
	addw	a3,a2,a3
	add	a5,a5,a3
	slli	a5,a5,2
	lla	a3,.LANCHOR0
	add	a5,a3,a5
.L113:
	lw	a3,0(a5)
	addi	a4,a4,4
	addi	a5,a5,4
	sw	a3,-4(a4)
	bne	a1,a4,.L113
	j	.L160
.L169:
	ld	a5,24(sp)
	lw	a3,20(s7)
	lw	a2,24(s7)
	ld	a1,32(a5)
	ld	a0,96(sp)
	call	perm_prefix_ints@plt
	j	.L160
.L168:
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
	.string	"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
	.align	3
.LC11:
	.string	"%s\n"
	.align	3
.LC12:
	.string	"% Results for tests/non-mixed-size/SAFE/Z6.5+fence.rw.rw+fence.rw.w+fence.rw.rw.litmus %"
	.align	3
.LC13:
	.string	"RISCV Z6.5+fence.rw.rw+fence.rw.w+fence.rw.rw"
	.align	3
.LC14:
	.string	"\"Fence.rw.rwdWW Wse Fence.rw.wdWW Wse Fence.rw.rwdWR Fre\""
	.align	3
.LC15:
	.string	"{"
	.align	3
.LC16:
	.string	" 0:x5=1; 0:x6=x; 0:x7=y;"
	.align	3
.LC17:
	.string	" 1:x5=2; 1:x6=y; 1:x7=1; 1:x8=z;"
	.align	3
.LC18:
	.string	" 2:x5=2; 2:x6=z; 2:x8=x;"
	.align	3
.LC19:
	.string	"}"
	.align	3
.LC20:
	.string	" P0          | P1          | P2          ;"
	.align	3
.LC21:
	.string	" sw x5,0(x6) | sw x5,0(x6) | sw x5,0(x6) ;"
	.align	3
.LC22:
	.string	" fence rw,rw | fence rw,w  | fence rw,rw ;"
	.align	3
.LC23:
	.string	" sw x5,0(x7) | sw x7,0(x8) | lw x7,0(x8) ;"
	.align	3
.LC24:
	.string	""
	.align	3
.LC25:
	.string	"exists ([y]=2 /\\ [z]=2 /\\ 2:x7=0)"
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
	.string	"Z6.5+fence.rw.rw+fence.rw.w+fence.rw.rw: n=%i, r=%i, s=%i"
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
	.string	"Z6.5+fence.rw.rw+fence.rw.w+fence.rw.rw, sum_hist"
	.align	3
.LC41:
	.string	"Test Z6.5+fence.rw.rw+fence.rw.w+fence.rw.rw Allowed\n"
	.align	3
.LC42:
	.string	"Histogram (%d states)\n"
	.align	3
.LC43:
	.string	"Observation Z6.5+fence.rw.rw+fence.rw.w+fence.rw.rw %s %lu %lu\n"
	.align	3
.LC45:
	.string	"Time Z6.5+fence.rw.rw+fence.rw.w+fence.rw.rw %.2f\n"
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
	.string	"Hash=1df33f7d4371fad40b0f7c331b8d8574\n"
	.align	3
.LC51:
	.string	"Cycle=Fre Fence.rw.rwdWW Wse Fence.rw.wdWW Wse Fence.rw.rwdWR\n"
	.align	3
.LC52:
	.string	"Relax Z6.5+fence.rw.rw+fence.rw.w+fence.rw.rw %s %s\n"
	.align	3
.LC53:
	.string	"Safe=Fre Wse Fence.rw.wdWW Fence.rw.rwdWW Fence.rw.rwdWR\n"
	.align	3
.LC54:
	.string	"Generator=diy7 (version 7.51+4(dev))\n"
	.align	3
.LC55:
	.string	"Com=Ws Ws Fr\n"
	.align	3
.LC56:
	.string	"Orig=Fence.rw.rwdWW Wse Fence.rw.wdWW Wse Fence.rw.rwdWR Fre\n"
	.align	3
.LC57:
	.string	"No"
	.align	3
.LC58:
	.string	"NOT "
	.align	3
.LC59:
	.string	"Affinity=[0] [1] [2] ; (2,0)\n"
	.text
	.align	1
	.globl	Z6_2E_5_2B_fence_2E_rw_2E_rw_2B_fence_2E_rw_2E_w_2B_fence_2E_rw_2E_rw
	.type	Z6_2E_5_2B_fence_2E_rw_2E_rw_2B_fence_2E_rw_2E_w_2B_fence_2E_rw_2E_rw, @function
Z6_2E_5_2B_fence_2E_rw_2E_rw_2B_fence_2E_rw_2E_w_2B_fence_2E_rw_2E_rw:
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
	ble	a4,a5,.L257
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
.L173:
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
	bne	a5,t1,.L173
	ld	a6,0(a5)
	ld	a5,8(a5)
	mv	a1,s2
	mv	a0,s3
	sd	a5,8(a4)
	sd	a6,0(a4)
	call	parse_cmd@plt
	lw	a5,-152(s0)
	sd	sp,-488(s0)
	bnez	a5,.L258
.L174:
	call	timeofday@plt
	lw	a5,-256(s0)
	lw	a4,-244(s0)
	sd	a0,-496(s0)
	sw	a5,-408(s0)
	lw	a5,-248(s0)
	sw	a5,-404(s0)
	lw	a5,-252(s0)
	sw	a5,-400(s0)
	blez	a4,.L259
	lw	a5,-228(s0)
	sw	a4,-396(s0)
	li	a4,5
	beq	a5,a4,.L176
.L274:
	addiw	a5,a5,-3
	li	a4,2
	sgtu	a5,a5,a4
	li	s9,-1
.L177:
	lw	a4,-156(s0)
	sw	a5,-380(s0)
	beqz	a4,.L179
	sw	zero,-380(s0)
.L179:
	lw	a0,0(s5)
	li	a1,2
	call	coremap_seq@plt
	lw	s2,-240(s0)
	sd	a0,-376(s0)
	ld	s4,-208(s0)
	blez	s2,.L260
	lw	a2,0(s4)
	ble	s2,a2,.L181
	mv	a1,s2
	lla	a0,.LC28
	call	log_error@plt
	ld	s4,-208(s0)
.L181:
	lw	s6,-236(s0)
	blez	s6,.L182
.L275:
	slli	s7,s6,2
	addiw	a5,s6,-1
	slliw	s2,s6,1
	add	s7,s7,s6
	sd	a5,-424(s0)
	addw	s2,s2,s6
	slli	s8,a5,3
	sd	s6,-504(s0)
	slli	s7,s7,3
.L183:
	lw	a4,-228(s0)
	li	a5,2
	mv	s3,s2
	beq	a4,a5,.L261
.L184:
	slli	a5,s3,2
	addi	a5,a5,15
	lw	a3,-408(s0)
	andi	a5,a5,-16
	sub	sp,sp,a5
	sw	a4,-392(s0)
	sw	s3,-388(s0)
	sw	s2,-384(s0)
	mv	s10,sp
	bnez	a3,.L262
.L185:
	li	a5,2
	beq	a4,a5,.L263
	li	a5,3
	beq	a4,a5,.L264
	li	a5,5
	beq	a4,a5,.L265
.L194:
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
	blez	a5,.L266
	remw	a5,a5,a1
	sd	a5,-456(s0)
.L201:
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
	j	.L208
.L269:
	mv	a2,s3
	mv	a0,s11
	lla	a1,zyva
	addiw	s9,s9,1
	call	launch@plt
	addi	s3,s3,40
	addi	s11,s11,8
	addi	s10,s10,12
	beq	s6,s9,.L267
.L208:
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
	beq	a5,a4,.L268
.L203:
	ld	a5,-424(s0)
	bgt	a5,s9,.L269
	mv	a0,s3
	call	zyva
	addiw	s9,s9,1
	mv	s2,a0
	addi	s3,s3,40
	addi	s11,s11,8
	addi	s10,s10,12
	bne	s6,s9,.L208
.L267:
	lw	a5,-404(s0)
	lw	s6,-400(s0)
	mul	s6,s6,a5
	ld	a5,-424(s0)
	beqz	a5,.L215
	ld	a5,-424(s0)
	addiw	s3,a5,-1
	slli	s3,s3,32
	ld	a5,-464(s0)
	srli	s3,s3,32
	addi	s3,s3,1
	slli	s3,s3,3
	add	s11,a5,s3
	lla	s3,.LC40
.L214:
	mv	a0,s7
	call	join@plt
	mv	s8,a0
	ld	a0,0(a0)
	call	sum_outs@plt
	bne	s6,a0,.L212
	ld	a6,8(s8)
	ld	a2,16(s8)
	add	a4,a6,a2
	beq	s6,a4,.L213
.L212:
	mv	a0,s3
	call	fatal@plt
	ld	a6,8(s8)
	ld	a2,16(s8)
.L213:
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
	bne	s11,s7,.L214
.L215:
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
	bne	s6,a0,.L210
	ld	s4,8(s2)
	ld	s7,16(s2)
	add	a5,s4,s7
	beq	s6,a5,.L216
.L210:
	lla	a0,.LC40
	call	fatal@plt
	ld	s4,8(s2)
	ld	s7,16(s2)
.L216:
	li	a2,53
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
	li	a4,3
	addi	a3,s0,-144
	lla	a1,do_dump_outcome
	mv	a0,s1
	call	dump_outs@plt
	beqz	s4,.L270
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
	li	a2,62
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
	li	a2,57
	li	a1,1
	lla	a0,.LC53
	call	fwrite@plt
	mv	a3,s1
	li	a2,37
	li	a1,1
	lla	a0,.LC54
	call	fwrite@plt
	mv	a3,s1
	li	a2,13
	li	a1,1
	lla	a0,.LC55
	call	fwrite@plt
	mv	a3,s1
	li	a2,61
	li	a1,1
	lla	a0,.LC56
	call	fwrite@plt
	lw	a4,-228(s0)
	li	a5,3
	beq	a4,a5,.L271
.L221:
	lla	s6,.LC8
	bnez	s7,.L272
.L219:
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
	ld	a0,-376(s0)
	call	cpus_free@plt
	ld	a5,-208(s0)
	ld	sp,-488(s0)
	beq	a5,s5,.L172
	mv	a0,s5
.L257:
	call	cpus_free@plt
.L172:
	la	a5,__stack_chk_guard
	ld	a4,-120(s0)
	ld	a5,0(a5)
	bne	a4,a5,.L273
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
.L259:
	lw	a5,-228(s0)
	li	a4,3
	sw	a4,-396(s0)
	li	a4,5
	bne	a5,a4,.L274
.L176:
	ld	a2,-200(s0)
	li	a1,3
	lla	a0,.LANCHOR2
	call	find_string@plt
	mv	s9,a0
	bltz	a0,.L178
	lw	a5,-228(s0)
	li	a4,2
	addiw	a5,a5,-3
	sgtu	a5,a5,a4
	j	.L177
.L260:
	lw	s6,-236(s0)
	lw	s2,0(s4)
	bgtz	s6,.L275
.L182:
	li	a5,2
	ble	s2,a5,.L224
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
	bne	a4,a5,.L184
.L261:
	lw	a0,0(s4)
	mv	a1,s2
	call	max@plt
	lw	a4,-228(s0)
	mv	s3,a0
	j	.L184
.L258:
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
	j	.L174
.L268:
	ld	a0,8(s4)
.L205:
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
	beq	s8,a4,.L276
	bne	a3,s10,.L205
	j	.L203
.L276:
	ld	a4,-480(s0)
	addiw	a5,s8,1
	remw	s8,a5,a4
	sd	s8,-432(s0)
	bne	a3,s10,.L205
	j	.L203
.L270:
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
	li	a2,62
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
	li	a2,57
	li	a1,1
	lla	a0,.LC53
	call	fwrite@plt
	mv	a3,s1
	li	a2,37
	li	a1,1
	lla	a0,.LC54
	call	fwrite@plt
	mv	a3,s1
	li	a2,13
	li	a1,1
	lla	a0,.LC55
	call	fwrite@plt
	mv	a3,s1
	li	a2,61
	li	a1,1
	lla	a0,.LC56
	call	fwrite@plt
	lw	a4,-228(s0)
	li	a5,3
	lla	s6,.LC7
	bne	a4,a5,.L219
	mv	a3,s1
	li	a2,29
	li	a1,1
	lla	a0,.LC59
	call	fwrite@plt
	j	.L219
.L266:
	blez	a1,.L226
	ld	a4,8(s4)
	li	a5,0
	li	a3,-1
.L202:
	sw	a3,0(a4)
	lw	a1,0(s4)
	addiw	a5,a5,1
	addi	a4,a4,4
	blt	a5,a1,.L202
.L226:
	li	a5,1
	sd	a5,-456(s0)
	j	.L201
.L263:
	blez	s3,.L194
	ld	a2,8(s4)
	mv	a3,s10
	li	a4,0
.L195:
	lw	a5,0(s4)
	addi	a3,a3,4
	remw	a5,a4,a5
	addiw	a4,a4,1
	slli	a5,a5,2
	add	a5,a2,a5
	lw	a5,0(a5)
	sw	a5,-4(a3)
	bne	s3,a4,.L195
	j	.L194
.L262:
	lw	a3,-404(s0)
	lw	a2,-400(s0)
	mv	a1,s6
	lla	a0,.LC29
	call	log_error@plt
	lw	a1,-396(s0)
	lla	a0,.LC30
	call	log_error@plt
	lw	a5,-228(s0)
	li	a4,1
	beq	a5,a4,.L277
	li	a4,2
	beq	a5,a4,.L278
	li	a4,3
	beq	a5,a4,.L279
	li	a4,4
	beq	a5,a4,.L280
.L187:
	lla	a0,.LC35
	call	log_error@plt
	la	s11,stderr
	ld	a1,-208(s0)
	ld	a0,0(s11)
	call	cpus_dump@plt
	lla	a0,.LC36
	call	log_error@plt
	lla	a0,.LC37
	call	log_error@plt
	lw	a4,-408(s0)
	li	a5,1
	ble	a4,a5,.L256
	ld	a5,-376(s0)
	beqz	a5,.L256
	lla	a0,.LC38
	call	log_error@plt
	ld	a0,0(s11)
	ld	a1,-376(s0)
	call	cpus_dump@plt
	lla	a0,.LC37
	call	log_error@plt
.L256:
	lw	a4,-228(s0)
	j	.L185
.L272:
	lla	s6,.LC9
	j	.L219
.L224:
	li	a5,1
	li	s7,40
	sd	a5,-504(s0)
	li	s8,0
	sd	zero,-424(s0)
	li	s2,3
	li	s6,1
	j	.L183
.L265:
	slliw	a0,s9,1
	addw	s9,a0,s9
	slli	a0,s9,2
	lla	s9,.LANCHOR0
	add	s9,s9,a0
	blez	s3,.L194
	addiw	a5,s3,-1
	slli	a5,a5,32
	srli	a5,a5,32
	addi	a5,a5,1
	slli	a5,a5,2
	mv	a4,s10
	add	a5,s9,a5
.L199:
	lw	a3,0(s9)
	addi	s9,s9,4
	addi	a4,a4,4
	sw	a3,-4(a4)
	bne	s9,a5,.L199
	j	.L194
.L264:
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
	beqz	a5,.L194
	lla	a0,.LC39
	call	log_error@plt
	la	a5,stderr
	ld	a3,-376(s0)
	ld	a0,0(a5)
	li	a4,3
	mv	a2,s3
	mv	a1,s10
	call	cpus_dump_test@plt
	j	.L194
.L271:
	mv	a3,s1
	li	a2,29
	li	a1,1
	lla	a0,.LC59
	call	fwrite@plt
	j	.L221
.L277:
	lw	a1,-216(s0)
	lla	a0,.LC31
	call	log_error@plt
	j	.L187
.L278:
	lla	a0,.LC32
	call	log_error@plt
	j	.L187
.L178:
	ld	a1,-200(s0)
	lla	a0,.LC27
	call	log_error@plt
	li	a5,4
	sw	a5,-228(s0)
	sd	zero,-200(s0)
	li	a5,0
	j	.L177
.L279:
	lla	a0,.LC33
	call	log_error@plt
	j	.L187
.L280:
	lla	a0,.LC34
	call	log_error@plt
	j	.L187
.L273:
	call	__stack_chk_fail@plt
	.size	Z6_2E_5_2B_fence_2E_rw_2E_rw_2B_fence_2E_rw_2E_w_2B_fence_2E_rw_2E_rw, .-Z6_2E_5_2B_fence_2E_rw_2E_rw_2B_fence_2E_rw_2E_w_2B_fence_2E_rw_2E_rw
	.section	.rodata.str1.8
	.align	3
.LC60:
	.string	"[[1,2],[0]]"
	.align	3
.LC61:
	.string	"[[0,2],[1]]"
	.align	3
.LC62:
	.string	"[[0,1],[2]]"
	.section	.rodata.cst8,"aM",@progbits,8
	.align	3
.LC44:
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
	.size	diff, 12
diff:
	.word	2
	.word	0
	.word	-1
	.zero	4
	.type	color_2, @object
	.size	color_2, 8
color_2:
	.word	2
	.word	-1
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
	.size	ngroups, 24
ngroups:
	.zero	24
	.section	.data.rel.local,"aw"
	.align	3
	.set	.LANCHOR2,. + 0
	.type	group, @object
	.size	group, 24
group:
	.dword	.LC60
	.dword	.LC61
	.dword	.LC62
	.type	color, @object
	.size	color, 32
color:
	.dword	color_0
	.dword	color_1
	.dword	color_2
	.dword	0
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
