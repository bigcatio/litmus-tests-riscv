	.file	"3.2W+fence.rw.w+fence.rw.rw+fence.rw.rw.c"
	.option pic
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"%-6lu%c>[x]=%d; [y]=%d; [z]=%d;\n"
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
	.string	"3.2W+fence.rw.w+fence.rw.rw+fence.rw.rw, check_globals failed"
	.text
	.align	1
	.type	check_globals, @function
check_globals:
	ld	a5,128(a0)
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
	addi	s1,a0,120
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
	ld	a0,24(s6)
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
	ld	a5,128(a1)
	addi	sp,sp,-144
	mv	a4,a0
	sd	s0,128(sp)
	ld	a0,24(a1)
	lw	s0,4(a5)
	sd	s1,120(sp)
	sd	s2,112(sp)
	mv	s1,a1
	mv	s2,a4
	sd	s3,104(sp)
	sd	s4,96(sp)
	sd	s5,88(sp)
	sd	s6,80(sp)
	sd	s7,72(sp)
	sd	s8,64(sp)
	sd	s9,56(sp)
	sd	s10,48(sp)
	sd	s11,40(sp)
	sd	a4,24(sp)
	sd	s0,8(sp)
	ld	s6,16(a1)
	ld	s9,8(a1)
	ld	s11,0(a1)
	sd	ra,136(sp)
	call	pb_wait@plt
	addiw	a5,s2,1
	li	a4,3
	remw	a5,a5,a4
	addiw	a4,s0,-1
	mv	a3,s0
	slli	s0,a4,32
	srli	s0,s0,32
	slli	s3,s2,3
	sub	s0,a3,s0
	addi	s8,s1,40
	addi	s7,s1,64
	addi	a3,s1,88
	slli	s0,s0,2
	add	s5,s8,s3
	add	s4,s7,s3
	addi	s10,s0,-8
	add	s3,a3,s3
	slli	s2,a4,2
	addi	s0,s0,-4
	slli	a5,a5,3
	add	s8,s8,a5
	add	s7,s7,a5
	add	a5,a3,a5
	sd	a5,16(sp)
.L44:
	ld	a5,8(sp)
	ld	a0,32(s1)
	blez	a5,.L36
	ld	a7,0(s5)
	ld	a6,0(s4)
	ld	a1,0(s3)
	mv	a5,s2
.L37:
	add	a4,s6,a5
	lw	a2,0(a4)
	add	a3,a7,a5
	add	a4,s9,a5
	sw	a2,0(a3)
	lw	a2,0(a4)
	add	a3,a6,a5
	add	a4,s11,a5
	sw	a2,0(a3)
	lw	a3,0(a4)
	add	a4,a1,a5
	addi	a5,a5,-4
	sw	a3,0(a4)
	bne	a5,s10,.L37
	call	po_reinit@plt
	ld	a5,16(sp)
	ld	ra,0(s5)
	ld	t2,0(s8)
	ld	t0,0(s4)
	ld	t4,0(s7)
	ld	t3,0(s3)
	ld	t1,0(a5)
	mv	a5,s2
.L42:
	add	a3,t0,a5
	add	a4,t4,a5
	lw	a7,0(a3)
	lw	a6,0(a4)
	add	a3,ra,a5
	add	a4,t2,a5
	lw	a3,0(a3)
	lw	a4,0(a4)
	add	a0,t3,a5
	add	a2,t1,a5
	li	a1,1
	bne	a7,a6,.L39
	sub	a1,a3,a4
	snez	a1,a1
.L39:
	lw	a3,0(a0)
	lw	a4,0(a2)
	beq	a3,a4,.L56
.L40:
	ld	a1,24(sp)
	lla	a0,.LC2
	call	log_error@plt
	li	a1,1
.L43:
	ld	a0,32(s1)
	call	po_wait@plt
	bnez	a0,.L44
	ld	ra,136(sp)
	ld	s0,128(sp)
	ld	s1,120(sp)
	ld	s2,112(sp)
	ld	s3,104(sp)
	ld	s4,96(sp)
	ld	s5,88(sp)
	ld	s6,80(sp)
	ld	s7,72(sp)
	ld	s8,64(sp)
	ld	s9,56(sp)
	ld	s10,48(sp)
	ld	s11,40(sp)
	addi	sp,sp,144
	jr	ra
.L56:
	beq	s0,a5,.L41
	addi	a5,a5,-4
	beqz	a1,.L42
	j	.L40
.L41:
	beqz	a1,.L43
	j	.L40
.L36:
	call	po_reinit@plt
	li	a1,0
	j	.L43
	.size	stabilize_globals, .-stabilize_globals
	.section	.rodata.str1.8
	.align	3
.LC3:
	.string	"3.2W+fence.rw.w+fence.rw.rw+fence.rw.rw"
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
# 47 "3.2W+fence.rw.w+fence.rw.rw+fence.rw.rw.c" 1
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
	lw	a7,0(s1)
	ld	t4,112(s0)
	lw	a6,12(a5)
	lw	t0,4(a5)
	blez	a6,.L61
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
.L60:
	sext.w	a2,t5
	mv	a3,t6
	bltz	t5,.L65
.L64:
	remuw	a5,a2,t3
	add	a4,t4,a3
	beq	a5,a7,.L74
.L62:
	lw	a5,0(a4)
	sext.w	a5,a5
	beqz	a5,.L62
.L63:
	ld	a5,0(s0)
	ld	a4,16(s0)
	add	a5,a5,a3
	add	a4,a4,a3
#APP
# 322 "3.2W+fence.rw.w+fence.rw.rw+fence.rw.rw.c" 1
	
#START _litmus_P2
#_litmus_P2_0
	sw t1,0(a5)
#_litmus_P2_1
	fence rw,rw
#_litmus_P2_2
	sw a1,0(a4)
#END _litmus_P2

# 0 "" 2
#NO_APP
	subw	a2,a2,a6
	add	a3,a3,a0
	bgez	a2,.L64
.L65:
	addiw	t5,t5,1
	addi	t6,t6,4
	bne	t5,t0,.L60
.L61:
	mv	a1,s0
	li	a0,2
	call	stabilize_globals
#APP
# 47 "3.2W+fence.rw.w+fence.rw.rw+fence.rw.rw.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	li	a0,0
	addi	sp,sp,32
	jr	ra
.L74:
	sw	a1,0(a4)
#APP
# 47 "3.2W+fence.rw.w+fence.rw.rw+fence.rw.rw.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	j	.L63
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
# 47 "3.2W+fence.rw.w+fence.rw.rw+fence.rw.rw.c" 1
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
	lw	a7,0(s1)
	ld	t4,112(s0)
	lw	a6,12(a5)
	lw	t0,4(a5)
	blez	a6,.L79
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
.L78:
	sext.w	a2,t5
	mv	a3,t6
	bltz	t5,.L83
.L82:
	remuw	a5,a2,t3
	add	a4,t4,a3
	beq	a5,a7,.L92
.L80:
	lw	a5,0(a4)
	sext.w	a5,a5
	beqz	a5,.L80
.L81:
	ld	a5,8(s0)
	ld	a4,0(s0)
	add	a5,a5,a3
	add	a4,a4,a3
#APP
# 287 "3.2W+fence.rw.w+fence.rw.rw+fence.rw.rw.c" 1
	
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
	bgez	a2,.L82
.L83:
	addiw	t5,t5,1
	addi	t6,t6,4
	bne	t5,t0,.L78
.L79:
	mv	a1,s0
	li	a0,1
	call	stabilize_globals
#APP
# 47 "3.2W+fence.rw.w+fence.rw.rw+fence.rw.rw.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	li	a0,0
	addi	sp,sp,32
	jr	ra
.L92:
	sw	a1,0(a4)
#APP
# 47 "3.2W+fence.rw.w+fence.rw.rw+fence.rw.rw.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	j	.L81
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
# 47 "3.2W+fence.rw.w+fence.rw.rw+fence.rw.rw.c" 1
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
	lw	a7,0(s1)
	ld	t4,112(s0)
	lw	a6,12(a5)
	lw	t0,4(a5)
	blez	a6,.L97
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
.L96:
	sext.w	a2,t5
	mv	a3,t6
	bltz	t5,.L101
.L100:
	remuw	a5,a2,t3
	add	a4,t4,a3
	beq	a5,a7,.L110
.L98:
	lw	a5,0(a4)
	sext.w	a5,a5
	beqz	a5,.L98
.L99:
	ld	a5,16(s0)
	ld	a4,8(s0)
	add	a5,a5,a3
	add	a4,a4,a3
#APP
# 252 "3.2W+fence.rw.w+fence.rw.rw+fence.rw.rw.c" 1
	
#START _litmus_P0
#_litmus_P0_0
	sw t1,0(a5)
#_litmus_P0_1
	fence rw,w
#_litmus_P0_2
	sw a1,0(a4)
#END _litmus_P0

# 0 "" 2
#NO_APP
	subw	a2,a2,a6
	add	a3,a3,a0
	bgez	a2,.L100
.L101:
	addiw	t5,t5,1
	addi	t6,t6,4
	bne	t5,t0,.L96
.L97:
	mv	a1,s0
	li	a0,0
	call	stabilize_globals
#APP
# 47 "3.2W+fence.rw.w+fence.rw.rw+fence.rw.rw.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	li	a0,0
	addi	sp,sp,32
	jr	ra
.L110:
	sw	a1,0(a4)
#APP
# 47 "3.2W+fence.rw.w+fence.rw.rw+fence.rw.rw.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	j	.L99
	.size	P0, .-P0
	.section	.rodata.str1.8
	.align	3
.LC4:
	.string	"Run %i of %i\r"
	.align	3
.LC5:
	.string	"3.2W+fence.rw.w+fence.rw.rw+fence.rw.rw, global x unstabilized"
	.align	3
.LC6:
	.string	"3.2W+fence.rw.w+fence.rw.rw+fence.rw.rw, global y unstabilized"
	.align	3
.LC7:
	.string	"3.2W+fence.rw.w+fence.rw.rw+fence.rw.rw, global z unstabilized"
	.text
	.align	1
	.type	zyva, @function
zyva:
	addi	sp,sp,-512
	la	a5,__stack_chk_guard
	mv	a4,a0
	ld	a5,0(a5)
	sd	a0,24(sp)
	ld	a0,8(a0)
	sd	ra,504(sp)
	sd	s0,496(sp)
	sd	s1,488(sp)
	sd	s2,480(sp)
	sd	s4,464(sp)
	sd	s5,456(sp)
	sd	s6,448(sp)
	sd	a5,392(sp)
	ld	s6,16(a4)
	sd	s3,472(sp)
	sd	s7,440(sp)
	sd	s8,432(sp)
	sd	s9,424(sp)
	sd	s10,416(sp)
	sd	s11,408(sp)
	call	pb_wait@plt
	lla	a5,P0
	sd	a5,136(sp)
	lla	a5,P1
	sd	a5,144(sp)
	li	a0,24
	lla	a5,P2
	sd	a5,152(sp)
	call	malloc_check@plt
	lw	s2,4(s6)
	sd	zero,0(a0)
	sd	zero,16(a0)
	sd	zero,8(a0)
	slli	s2,s2,2
	mv	s4,a0
	sd	s6,384(sp)
	call	rand@plt
	mv	a5,a0
	mv	a0,s2
	sw	a5,376(sp)
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
	sd	a5,280(sp)
	call	po_create@plt
	sd	a0,288(sp)
	sd	s5,88(sp)
	addi	s0,sp,232
	mv	s1,s5
.L112:
	mv	a0,s2
	call	malloc_check@plt
	mv	a5,a0
	sd	a5,56(s1)
	mv	a0,s2
	call	malloc_check@plt
	mv	a5,a0
	sd	a5,80(s1)
	mv	a0,s2
	call	malloc_check@plt
	sd	a0,104(s1)
	addi	s1,s1,-8
	bne	s0,s1,.L112
	mv	a0,s2
	call	malloc_check@plt
	ld	a5,24(sp)
	lw	a4,8(s6)
	li	a3,2
	ld	a5,32(a5)
	sw	a3,232(sp)
	li	a3,1
	sd	a0,368(sp)
	sd	s5,248(sp)
	sd	a5,240(sp)
	sw	a3,208(sp)
	sd	s5,224(sp)
	sd	a5,216(sp)
	sw	zero,184(sp)
	sd	s5,200(sp)
	sd	a5,192(sp)
	blez	a4,.L127
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
	addi	a5,sp,376
	sd	a5,96(sp)
	addi	a5,sp,136
	sd	a5,104(sp)
	addi	a5,sp,160
	sd	zero,32(sp)
	sd	a5,16(sp)
	lla	s9,.LC5
.L113:
	lw	a5,16(s6)
	li	a4,2
	beq	a5,a4,.L170
	li	a4,4
	beq	a5,a4,.L171
.L117:
	lw	a4,0(s6)
	li	a5,1
	ble	a4,a5,.L119
	la	a5,stderr
	lw	a4,8(s6)
	ld	a0,0(a5)
	ld	a3,32(sp)
	lla	a2,.LC4
	li	a1,1
	call	__fprintf_chk@plt
.L119:
	ld	a5,384(sp)
	lw	a4,4(a5)
	addiw	a2,a4,-1
	slli	a3,a2,32
	sext.w	a5,a2
	bltz	a3,.L124
	slli	a2,a2,32
	srli	a2,a2,32
	sub	a2,a4,a2
	ld	a7,256(sp)
	ld	a6,264(sp)
	ld	a0,272(sp)
	ld	a1,368(sp)
	slli	a2,a2,2
	slli	a5,a5,2
	addi	a2,a2,-8
.L123:
	add	a4,a7,a5
	sw	zero,0(a4)
	add	a4,a6,a5
	sw	zero,0(a4)
	add	a3,a0,a5
	add	a4,a1,a5
	sw	zero,0(a3)
	sw	zero,0(a4)
	addi	a5,a5,-4
	bne	a5,a2,.L123
.L124:
	lw	a5,28(s6)
	bnez	a5,.L172
.L122:
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
	lw	a5,28(s6)
	bnez	a5,.L173
.L125:
	ld	a0,56(sp)
	call	join@plt
	ld	a0,48(sp)
	call	join@plt
	ld	a0,40(sp)
	call	join@plt
	lw	a4,4(s6)
	addiw	a3,a4,-1
	slli	a2,a3,32
	sext.w	a5,a3
	bltz	a2,.L141
	ld	a1,32(sp)
	li	a2,3
	slli	a3,a3,32
	remw	a2,a1,a2
	srli	a3,a3,32
	sub	a4,a4,a3
	slli	a4,a4,2
	slli	s11,a5,2
	addi	a5,a4,-8
	sd	a5,8(sp)
	lla	a5,.LANCHOR1
	lla	s8,.LC6
	lla	s7,.LC7
	slli	a4,a2,3
	add	a5,a5,a4
	sd	a5,64(sp)
.L140:
	ld	a2,272(sp)
	ld	a3,264(sp)
	ld	a4,256(sp)
	add	a2,a2,s11
	add	a3,a3,s11
	add	a4,a4,s11
	lw	s1,0(a2)
	lw	s2,0(a3)
	lw	s3,0(a4)
	mv	s10,s5
.L129:
	ld	a3,56(s10)
	add	a3,a3,s11
	lw	a3,0(a3)
	beq	a3,s1,.L128
	mv	a0,s9
	call	fatal@plt
.L128:
	addi	s10,s10,-8
	bne	s0,s10,.L129
	mv	s10,s5
.L131:
	ld	a3,80(s10)
	add	a3,a3,s11
	lw	a3,0(a3)
	beq	a3,s2,.L130
	mv	a0,s8
	call	fatal@plt
.L130:
	addi	s10,s10,-8
	bne	s0,s10,.L131
	mv	s10,s5
.L133:
	ld	a3,104(s10)
	add	a3,a3,s11
	lw	a3,0(a3)
	beq	a3,s3,.L132
	mv	a0,s7
	call	fatal@plt
.L132:
	addi	s10,s10,-8
	bne	s0,s10,.L133
	li	a5,2
	li	a4,0
	beq	s1,a5,.L174
.L134:
	ld	a0,0(s4)
	ld	a1,16(sp)
	li	a3,1
	li	a2,3
	sd	a4,0(sp)
	sd	s1,160(sp)
	sd	s2,168(sp)
	sd	s3,176(sp)
	call	add_outcome_outs@plt
	lw	a3,16(s6)
	li	a2,4
	sd	a0,0(s4)
	ld	a4,0(sp)
	beq	a3,a2,.L175
	li	a2,5
	bne	a3,a2,.L136
	ld	a5,24(sp)
	ld	a3,32(a5)
	lw	a3,0(a3)
	bltz	a3,.L136
	bnez	a4,.L176
.L137:
	ld	a4,16(s4)
	addi	a4,a4,1
	sd	a4,16(s4)
.L139:
	ld	a5,8(sp)
	addi	s11,s11,-4
	bne	a5,s11,.L140
.L141:
	ld	a4,32(sp)
	lw	a5,8(s6)
	addiw	a4,a4,1
	sd	a4,32(sp)
	bgt	a5,a4,.L113
.L127:
	ld	a0,256(sp)
	call	free@plt
	ld	a0,264(sp)
	call	free@plt
	ld	a0,272(sp)
	call	free@plt
	ld	a0,280(sp)
	call	pb_free@plt
	ld	a0,288(sp)
	call	po_free@plt
.L114:
	ld	a5,88(sp)
	ld	a0,56(a5)
	addi	a5,a5,-8
	mv	s1,a5
	sd	a5,88(sp)
	call	free@plt
	ld	a0,88(s1)
	call	free@plt
	ld	a0,112(s1)
	call	free@plt
	bne	s0,s1,.L114
	ld	a0,368(sp)
	call	free@plt
	la	a5,__stack_chk_guard
	ld	a4,392(sp)
	ld	a5,0(a5)
	bne	a4,a5,.L177
	ld	ra,504(sp)
	ld	s0,496(sp)
	ld	s1,488(sp)
	ld	s2,480(sp)
	ld	s3,472(sp)
	ld	s5,456(sp)
	ld	s6,448(sp)
	ld	s7,440(sp)
	ld	s8,432(sp)
	ld	s9,424(sp)
	ld	s10,416(sp)
	ld	s11,408(sp)
	mv	a0,s4
	ld	s4,464(sp)
	addi	sp,sp,512
	jr	ra
.L136:
	beqz	a4,.L137
.L138:
	ld	a4,8(s4)
	addi	a4,a4,1
	sd	a4,8(s4)
	j	.L139
.L175:
	ld	a5,24(sp)
	ld	a3,32(a5)
	lw	a3,0(a3)
	bltz	a3,.L136
	beqz	a4,.L137
	ld	a0,0(a5)
	mv	s1,a5
	call	pm_lock@plt
	ld	a5,64(sp)
.L169:
	ld	a4,0(a5)
	ld	a0,0(s1)
	addi	a4,a4,1
	sd	a4,0(a5)
	call	pm_unlock@plt
	j	.L138
.L174:
	bne	s2,s1,.L134
	addi	a4,s3,-2
	seqz	a4,a4
	j	.L134
.L176:
	ld	a0,0(a5)
	mv	s1,a5
	call	pm_lock@plt
	lla	a5,.LANCHOR1
	j	.L169
.L173:
	ld	a1,40(sp)
	ld	a0,96(sp)
	li	a2,3
	call	perm_threads@plt
	j	.L125
.L172:
	ld	a1,104(sp)
	ld	a0,96(sp)
	li	a2,3
	call	perm_funs@plt
	j	.L122
.L170:
	ld	s1,24(sp)
	ld	a0,8(s1)
	call	pb_wait@plt
	lw	a5,24(s1)
	beqz	a5,.L178
.L168:
	ld	a5,24(sp)
	ld	a0,8(a5)
	call	pb_wait@plt
	j	.L117
.L171:
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
.L118:
	lw	a3,0(a5)
	addi	a4,a4,4
	addi	a5,a5,4
	sw	a3,-4(a4)
	bne	a1,a4,.L118
	j	.L168
.L178:
	ld	a5,24(sp)
	lw	a3,20(s6)
	lw	a2,24(s6)
	ld	a1,32(a5)
	ld	a0,96(sp)
	call	perm_prefix_ints@plt
	j	.L168
.L177:
	call	__stack_chk_fail@plt
	.size	zyva, .-zyva
	.section	.rodata.str1.8
	.align	3
.LC8:
	.string	"Never"
	.align	3
.LC9:
	.string	"Always"
	.align	3
.LC10:
	.string	"Sometimes"
	.align	3
.LC11:
	.string	"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
	.align	3
.LC12:
	.string	"%s\n"
	.align	3
.LC13:
	.string	"% Results for tests/non-mixed-size/SAFE/3.2W+fence.rw.w+fence.rw.rw+fence.rw.rw.litmus %"
	.align	3
.LC14:
	.string	"RISCV 3.2W+fence.rw.w+fence.rw.rw+fence.rw.rw"
	.align	3
.LC15:
	.string	"\"Fence.rw.wdWW Wse Fence.rw.rwdWW Wse Fence.rw.rwdWW Wse\""
	.align	3
.LC16:
	.string	"{"
	.align	3
.LC17:
	.string	" 0:x5=2; 0:x6=x; 0:x7=1; 0:x8=y;"
	.align	3
.LC18:
	.string	" 1:x5=2; 1:x6=y; 1:x7=1; 1:x8=z;"
	.align	3
.LC19:
	.string	" 2:x5=2; 2:x6=z; 2:x7=1; 2:x8=x;"
	.align	3
.LC20:
	.string	"}"
	.align	3
.LC21:
	.string	" P0          | P1          | P2          ;"
	.align	3
.LC22:
	.string	" sw x5,0(x6) | sw x5,0(x6) | sw x5,0(x6) ;"
	.align	3
.LC23:
	.string	" fence rw,w  | fence rw,rw | fence rw,rw ;"
	.align	3
.LC24:
	.string	" sw x7,0(x8) | sw x7,0(x8) | sw x7,0(x8) ;"
	.align	3
.LC25:
	.string	""
	.align	3
.LC26:
	.string	"exists ([x]=2 /\\ [y]=2 /\\ [z]=2)"
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
	.string	"3.2W+fence.rw.w+fence.rw.rw+fence.rw.rw: n=%i, r=%i, s=%i"
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
	.string	"3.2W+fence.rw.w+fence.rw.rw+fence.rw.rw, sum_hist"
	.align	3
.LC42:
	.string	"Test 3.2W+fence.rw.w+fence.rw.rw+fence.rw.rw Allowed\n"
	.align	3
.LC43:
	.string	"Histogram (%d states)\n"
	.align	3
.LC44:
	.string	"Observation 3.2W+fence.rw.w+fence.rw.rw+fence.rw.rw %s %lu %lu\n"
	.align	3
.LC46:
	.string	"Time 3.2W+fence.rw.w+fence.rw.rw+fence.rw.rw %.2f\n"
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
	.string	"Hash=238fb3b577d3c7708e942884ee070a58\n"
	.align	3
.LC52:
	.string	"Cycle=Wse Fence.rw.wdWW Wse Fence.rw.rwdWW Wse Fence.rw.rwdWW\n"
	.align	3
.LC53:
	.string	"Relax 3.2W+fence.rw.w+fence.rw.rw+fence.rw.rw %s %s\n"
	.align	3
.LC54:
	.string	"Safe=Wse Fence.rw.wdWW Fence.rw.rwdWW\n"
	.align	3
.LC55:
	.string	"Generator=diy7 (version 7.51+4(dev))\n"
	.align	3
.LC56:
	.string	"Com=Ws Ws Ws\n"
	.align	3
.LC57:
	.string	"Orig=Fence.rw.wdWW Wse Fence.rw.rwdWW Wse Fence.rw.rwdWW Wse\n"
	.align	3
.LC58:
	.string	"No"
	.align	3
.LC59:
	.string	"NOT "
	.align	3
.LC60:
	.string	"Affinity=[1] [2] [0] ; \n"
	.text
	.align	1
	.globl	_X3_2E_2W_2B_fence_2E_rw_2E_w_2B_fence_2E_rw_2E_rw_2B_fence_2E_rw_2E_rw
	.type	_X3_2E_2W_2B_fence_2E_rw_2E_w_2B_fence_2E_rw_2E_rw_2B_fence_2E_rw_2E_rw, @function
_X3_2E_2W_2B_fence_2E_rw_2E_w_2B_fence_2E_rw_2E_rw_2B_fence_2E_rw_2E_rw:
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
	ble	a4,a5,.L266
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
.L182:
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
	bne	a5,t1,.L182
	ld	a6,0(a5)
	ld	a5,8(a5)
	mv	a1,s2
	mv	a0,s3
	sd	a5,8(a4)
	sd	a6,0(a4)
	call	parse_cmd@plt
	lw	a5,-152(s0)
	sd	sp,-488(s0)
	bnez	a5,.L267
.L183:
	call	timeofday@plt
	lw	a5,-256(s0)
	lw	a4,-244(s0)
	sd	a0,-496(s0)
	sw	a5,-408(s0)
	lw	a5,-248(s0)
	sw	a5,-404(s0)
	lw	a5,-252(s0)
	sw	a5,-400(s0)
	blez	a4,.L268
	lw	a5,-228(s0)
	sw	a4,-396(s0)
	li	a4,5
	beq	a5,a4,.L185
.L283:
	addiw	a5,a5,-3
	li	a4,2
	sgtu	a5,a5,a4
	li	s9,-1
.L186:
	lw	a4,-156(s0)
	sw	a5,-380(s0)
	beqz	a4,.L188
	sw	zero,-380(s0)
.L188:
	lw	a0,0(s5)
	li	a1,2
	call	coremap_seq@plt
	lw	s2,-240(s0)
	sd	a0,-376(s0)
	ld	s4,-208(s0)
	blez	s2,.L269
	lw	a2,0(s4)
	ble	s2,a2,.L190
	mv	a1,s2
	lla	a0,.LC29
	call	log_error@plt
	ld	s4,-208(s0)
.L190:
	lw	s6,-236(s0)
	blez	s6,.L191
.L284:
	slli	s7,s6,2
	addiw	a5,s6,-1
	slliw	s2,s6,1
	add	s7,s7,s6
	sd	a5,-424(s0)
	addw	s2,s2,s6
	slli	s8,a5,3
	sd	s6,-504(s0)
	slli	s7,s7,3
.L192:
	lw	a4,-228(s0)
	li	a5,2
	mv	s3,s2
	beq	a4,a5,.L270
.L193:
	slli	a5,s3,2
	addi	a5,a5,15
	lw	a3,-408(s0)
	andi	a5,a5,-16
	sub	sp,sp,a5
	sw	a4,-392(s0)
	sw	s3,-388(s0)
	sw	s2,-384(s0)
	mv	s10,sp
	bnez	a3,.L271
.L194:
	li	a5,2
	beq	a4,a5,.L272
	li	a5,3
	beq	a4,a5,.L273
	li	a5,5
	beq	a4,a5,.L274
.L203:
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
	blez	a5,.L275
	remw	a5,a5,a1
	sd	a5,-456(s0)
.L210:
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
	j	.L217
.L278:
	mv	a2,s3
	mv	a0,s11
	lla	a1,zyva
	addiw	s9,s9,1
	call	launch@plt
	addi	s3,s3,40
	addi	s11,s11,8
	addi	s10,s10,12
	beq	s6,s9,.L276
.L217:
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
	beq	a5,a4,.L277
.L212:
	ld	a5,-424(s0)
	bgt	a5,s9,.L278
	mv	a0,s3
	call	zyva
	addiw	s9,s9,1
	mv	s2,a0
	addi	s3,s3,40
	addi	s11,s11,8
	addi	s10,s10,12
	bne	s6,s9,.L217
.L276:
	lw	a5,-404(s0)
	lw	s6,-400(s0)
	mul	s6,s6,a5
	ld	a5,-424(s0)
	beqz	a5,.L224
	ld	a5,-424(s0)
	addiw	s3,a5,-1
	slli	s3,s3,32
	ld	a5,-464(s0)
	srli	s3,s3,32
	addi	s3,s3,1
	slli	s3,s3,3
	add	s11,a5,s3
	lla	s3,.LC41
.L223:
	mv	a0,s7
	call	join@plt
	mv	s8,a0
	ld	a0,0(a0)
	call	sum_outs@plt
	bne	s6,a0,.L221
	ld	a6,8(s8)
	ld	a2,16(s8)
	add	a4,a6,a2
	beq	s6,a4,.L222
.L221:
	mv	a0,s3
	call	fatal@plt
	ld	a6,8(s8)
	ld	a2,16(s8)
.L222:
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
	bne	s11,s7,.L223
.L224:
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
	bne	s6,a0,.L219
	ld	s4,8(s2)
	ld	s7,16(s2)
	add	a5,s4,s7
	beq	s6,a5,.L225
.L219:
	lla	a0,.LC41
	call	fatal@plt
	ld	s4,8(s2)
	ld	s7,16(s2)
.L225:
	li	a2,53
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
	li	a4,3
	addi	a3,s0,-144
	lla	a1,do_dump_outcome
	mv	a0,s1
	call	dump_outs@plt
	beqz	s4,.L279
	lla	a2,.LC12
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
	li	a2,62
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
	li	a2,38
	li	a1,1
	lla	a0,.LC54
	call	fwrite@plt
	mv	a3,s1
	li	a2,37
	li	a1,1
	lla	a0,.LC55
	call	fwrite@plt
	mv	a3,s1
	li	a2,13
	li	a1,1
	lla	a0,.LC56
	call	fwrite@plt
	mv	a3,s1
	li	a2,61
	li	a1,1
	lla	a0,.LC57
	call	fwrite@plt
	lw	a4,-228(s0)
	li	a5,3
	beq	a4,a5,.L280
.L230:
	lla	s6,.LC9
	bnez	s7,.L281
.L228:
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
	ld	a0,-376(s0)
	call	cpus_free@plt
	ld	a5,-208(s0)
	ld	sp,-488(s0)
	beq	a5,s5,.L181
	mv	a0,s5
.L266:
	call	cpus_free@plt
.L181:
	la	a5,__stack_chk_guard
	ld	a4,-120(s0)
	ld	a5,0(a5)
	bne	a4,a5,.L282
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
.L268:
	lw	a5,-228(s0)
	li	a4,3
	sw	a4,-396(s0)
	li	a4,5
	bne	a5,a4,.L283
.L185:
	ld	a2,-200(s0)
	li	a1,3
	lla	a0,.LANCHOR2
	call	find_string@plt
	mv	s9,a0
	bltz	a0,.L187
	lw	a5,-228(s0)
	li	a4,2
	addiw	a5,a5,-3
	sgtu	a5,a5,a4
	j	.L186
.L269:
	lw	s6,-236(s0)
	lw	s2,0(s4)
	bgtz	s6,.L284
.L191:
	li	a5,2
	ble	s2,a5,.L233
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
	bne	a4,a5,.L193
.L270:
	lw	a0,0(s4)
	mv	a1,s2
	call	max@plt
	lw	a4,-228(s0)
	mv	s3,a0
	j	.L193
.L267:
	lla	a3,.LC11
	lla	a2,.LC12
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC13
	lla	a2,.LC12
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC11
	lla	a2,.LC12
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC14
	lla	a2,.LC12
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC15
	lla	a2,.LC12
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC16
	lla	a2,.LC12
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC17
	lla	a2,.LC12
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC18
	lla	a2,.LC12
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC19
	lla	a2,.LC12
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC20
	lla	a2,.LC12
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC21
	lla	a2,.LC12
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC22
	lla	a2,.LC12
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC23
	lla	a2,.LC12
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC24
	lla	a2,.LC12
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC25
	lla	a2,.LC12
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC26
	lla	a2,.LC12
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC27
	lla	a2,.LC12
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	j	.L183
.L277:
	ld	a0,8(s4)
.L214:
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
	beq	s8,a4,.L285
	bne	a3,s10,.L214
	j	.L212
.L285:
	ld	a4,-480(s0)
	addiw	a5,s8,1
	remw	s8,a5,a4
	sd	s8,-432(s0)
	bne	a3,s10,.L214
	j	.L212
.L279:
	lla	a2,.LC12
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
	li	a2,62
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
	li	a2,38
	li	a1,1
	lla	a0,.LC54
	call	fwrite@plt
	mv	a3,s1
	li	a2,37
	li	a1,1
	lla	a0,.LC55
	call	fwrite@plt
	mv	a3,s1
	li	a2,13
	li	a1,1
	lla	a0,.LC56
	call	fwrite@plt
	mv	a3,s1
	li	a2,61
	li	a1,1
	lla	a0,.LC57
	call	fwrite@plt
	lw	a4,-228(s0)
	li	a5,3
	lla	s6,.LC8
	bne	a4,a5,.L228
	mv	a3,s1
	li	a2,24
	li	a1,1
	lla	a0,.LC60
	call	fwrite@plt
	j	.L228
.L275:
	blez	a1,.L235
	ld	a4,8(s4)
	li	a5,0
	li	a3,-1
.L211:
	sw	a3,0(a4)
	lw	a1,0(s4)
	addiw	a5,a5,1
	addi	a4,a4,4
	blt	a5,a1,.L211
.L235:
	li	a5,1
	sd	a5,-456(s0)
	j	.L210
.L272:
	blez	s3,.L203
	ld	a2,8(s4)
	mv	a3,s10
	li	a4,0
.L204:
	lw	a5,0(s4)
	addi	a3,a3,4
	remw	a5,a4,a5
	addiw	a4,a4,1
	slli	a5,a5,2
	add	a5,a2,a5
	lw	a5,0(a5)
	sw	a5,-4(a3)
	bne	s3,a4,.L204
	j	.L203
.L271:
	lw	a3,-404(s0)
	lw	a2,-400(s0)
	mv	a1,s6
	lla	a0,.LC30
	call	log_error@plt
	lw	a1,-396(s0)
	lla	a0,.LC31
	call	log_error@plt
	lw	a5,-228(s0)
	li	a4,1
	beq	a5,a4,.L286
	li	a4,2
	beq	a5,a4,.L287
	li	a4,3
	beq	a5,a4,.L288
	li	a4,4
	beq	a5,a4,.L289
.L196:
	lla	a0,.LC36
	call	log_error@plt
	la	s11,stderr
	ld	a1,-208(s0)
	ld	a0,0(s11)
	call	cpus_dump@plt
	lla	a0,.LC37
	call	log_error@plt
	lla	a0,.LC38
	call	log_error@plt
	lw	a4,-408(s0)
	li	a5,1
	ble	a4,a5,.L265
	ld	a5,-376(s0)
	beqz	a5,.L265
	lla	a0,.LC39
	call	log_error@plt
	ld	a0,0(s11)
	ld	a1,-376(s0)
	call	cpus_dump@plt
	lla	a0,.LC38
	call	log_error@plt
.L265:
	lw	a4,-228(s0)
	j	.L194
.L281:
	lla	s6,.LC10
	j	.L228
.L233:
	li	a5,1
	li	s7,40
	sd	a5,-504(s0)
	li	s8,0
	sd	zero,-424(s0)
	li	s2,3
	li	s6,1
	j	.L192
.L274:
	slliw	a0,s9,1
	addw	s9,a0,s9
	slli	a0,s9,2
	lla	s9,.LANCHOR0
	add	s9,s9,a0
	blez	s3,.L203
	addiw	a5,s3,-1
	slli	a5,a5,32
	srli	a5,a5,32
	addi	a5,a5,1
	slli	a5,a5,2
	mv	a4,s10
	add	a5,s9,a5
.L208:
	lw	a3,0(s9)
	addi	s9,s9,4
	addi	a4,a4,4
	sw	a3,-4(a4)
	bne	s9,a5,.L208
	j	.L203
.L273:
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
	beqz	a5,.L203
	lla	a0,.LC40
	call	log_error@plt
	la	a5,stderr
	ld	a3,-376(s0)
	ld	a0,0(a5)
	li	a4,3
	mv	a2,s3
	mv	a1,s10
	call	cpus_dump_test@plt
	j	.L203
.L280:
	mv	a3,s1
	li	a2,24
	li	a1,1
	lla	a0,.LC60
	call	fwrite@plt
	j	.L230
.L286:
	lw	a1,-216(s0)
	lla	a0,.LC32
	call	log_error@plt
	j	.L196
.L287:
	lla	a0,.LC33
	call	log_error@plt
	j	.L196
.L187:
	ld	a1,-200(s0)
	lla	a0,.LC28
	call	log_error@plt
	li	a5,4
	sw	a5,-228(s0)
	sd	zero,-200(s0)
	li	a5,0
	j	.L186
.L288:
	lla	a0,.LC34
	call	log_error@plt
	j	.L196
.L289:
	lla	a0,.LC35
	call	log_error@plt
	j	.L196
.L282:
	call	__stack_chk_fail@plt
	.size	_X3_2E_2W_2B_fence_2E_rw_2E_w_2B_fence_2E_rw_2E_rw_2B_fence_2E_rw_2E_rw, .-_X3_2E_2W_2B_fence_2E_rw_2E_w_2B_fence_2E_rw_2E_rw_2B_fence_2E_rw_2E_rw
	.section	.rodata.str1.8
	.align	3
.LC61:
	.string	"[[1,2],[0]]"
	.align	3
.LC62:
	.string	"[[0,2],[1]]"
	.align	3
.LC63:
	.string	"[[0,1],[2]]"
	.section	.rodata.cst8,"aM",@progbits,8
	.align	3
.LC45:
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
	.size	diff, 4
diff:
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
	.dword	.LC61
	.dword	.LC62
	.dword	.LC63
	.type	color, @object
	.size	color, 32
color:
	.dword	color_0
	.dword	color_1
	.dword	color_2
	.dword	0
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
