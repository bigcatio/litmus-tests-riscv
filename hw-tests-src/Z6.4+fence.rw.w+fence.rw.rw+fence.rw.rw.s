	.file	"Z6.4+fence.rw.w+fence.rw.rw+fence.rw.rw.c"
	.option pic
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"%-6lu%c>1:x7=%d; 2:x7=%d; [y]=%d;\n"
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
	.string	"Z6.4+fence.rw.w+fence.rw.rw+fence.rw.rw, check_globals failed"
	.text
	.align	1
	.type	check_globals, @function
check_globals:
	ld	a5,96(a0)
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
	addi	s1,a0,88
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
	addi	sp,sp,-80
	ld	a5,96(a1)
	sd	s2,48(sp)
	mv	s2,a0
	ld	a0,40(a1)
	sd	s0,64(sp)
	sd	s1,56(sp)
	sd	s3,40(sp)
	sd	s4,32(sp)
	sd	s5,24(sp)
	sd	s6,16(sp)
	sd	s7,8(sp)
	sd	s8,0(sp)
	mv	s4,a1
	lw	s8,4(a5)
	ld	s1,8(a1)
	sd	ra,72(sp)
	call	pb_wait@plt
	li	a4,3
	addiw	a5,s2,1
	remw	a5,a5,a4
	addiw	a4,s8,-1
	slli	s0,a4,32
	srli	s0,s0,32
	sub	s0,s8,s0
	addi	s7,s4,56
	slli	s6,s2,3
	slli	s0,s0,2
	add	s6,s7,s6
	slli	s5,a4,2
	addi	s0,s0,-8
	lla	s3,.LC2
	slli	a5,a5,3
	add	s7,s7,a5
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
	.string	"Z6.4+fence.rw.w+fence.rw.rw+fence.rw.rw"
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
# 47 "Z6.4+fence.rw.w+fence.rw.rw+fence.rw.rw.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	ld	s0,16(a0)
	lw	a4,0(a0)
	ld	a5,8(a0)
	ld	a3,96(s0)
	slli	a4,a4,2
	add	a5,a5,a4
	lw	a0,0(a5)
	lw	a2,0(a3)
	li	a1,4
	lla	a3,.LC3
	call	force_one_affinity@plt
	mv	a0,s0
	call	check_globals
	ld	a5,96(s0)
	lw	t1,0(s1)
	ld	t4,80(s0)
	lw	a7,12(a5)
	lw	t0,4(a5)
	blez	a7,.L55
	sub	t6,t0,a7
	negw	a6,a7
	subw	t5,t0,a7
	slli	t6,t6,2
	sext.w	t0,t0
	slli	a6,a6,2
	sext.w	t1,t1
	li	t3,3
	li	a0,1
.L54:
	sext.w	a2,t5
	mv	a3,t6
	bltz	t5,.L59
.L58:
	remuw	a5,a2,t3
	add	a4,t4,a3
	beq	a5,t1,.L68
.L56:
	lw	a5,0(a4)
	sext.w	a5,a5
	beqz	a5,.L56
.L57:
	ld	a5,0(s0)
	ld	a4,16(s0)
	add	a5,a5,a3
	add	a4,a4,a3
#APP
# 314 "Z6.4+fence.rw.w+fence.rw.rw+fence.rw.rw.c" 1
	
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
	ld	a5,32(s0)
	subw	a2,a2,a7
	add	a5,a5,a3
	sw	a1,0(a5)
	add	a3,a3,a6
	bgez	a2,.L58
.L59:
	addiw	t5,t5,1
	addi	t6,t6,4
	bne	t5,t0,.L54
.L55:
	mv	a1,s0
	li	a0,2
	call	stabilize_globals
#APP
# 47 "Z6.4+fence.rw.w+fence.rw.rw+fence.rw.rw.c" 1
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
	sw	a0,0(a4)
#APP
# 47 "Z6.4+fence.rw.w+fence.rw.rw+fence.rw.rw.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	j	.L57
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
# 47 "Z6.4+fence.rw.w+fence.rw.rw+fence.rw.rw.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	ld	s0,16(a0)
	lw	a4,0(a0)
	ld	a5,8(a0)
	ld	a3,96(s0)
	slli	a4,a4,2
	add	a5,a5,a4
	lw	a0,0(a5)
	lw	a2,0(a3)
	li	a1,4
	lla	a3,.LC3
	call	force_one_affinity@plt
	mv	a0,s0
	call	check_globals
	ld	a5,96(s0)
	lw	a7,0(s1)
	ld	t4,80(s0)
	lw	a6,12(a5)
	lw	t2,4(a5)
	blez	a6,.L73
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
.L72:
	sext.w	a2,t5
	mv	a3,t6
	bltz	t5,.L77
.L76:
	remuw	a5,a2,t3
	add	a4,t4,a3
	beq	a5,a7,.L86
.L74:
	lw	a5,0(a4)
	sext.w	a5,a5
	beqz	a5,.L74
.L75:
	ld	a5,8(s0)
	ld	a4,0(s0)
	add	a5,a5,a3
	add	a4,a4,a3
#APP
# 279 "Z6.4+fence.rw.w+fence.rw.rw+fence.rw.rw.c" 1
	
#START _litmus_P1
#_litmus_P1_0
	sw t1,0(a5)
#_litmus_P1_1
	fence rw,rw
#_litmus_P1_2
	lw a1,0(a4)
#END _litmus_P1

# 0 "" 2
#NO_APP
	ld	a5,24(s0)
	subw	a2,a2,a6
	add	a5,a5,a3
	sw	a1,0(a5)
	add	a3,a3,a0
	bgez	a2,.L76
.L77:
	addiw	t5,t5,1
	addi	t6,t6,4
	bne	t5,t2,.L72
.L73:
	mv	a1,s0
	li	a0,1
	call	stabilize_globals
#APP
# 47 "Z6.4+fence.rw.w+fence.rw.rw+fence.rw.rw.c" 1
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
	sw	t0,0(a4)
#APP
# 47 "Z6.4+fence.rw.w+fence.rw.rw+fence.rw.rw.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	j	.L75
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
# 47 "Z6.4+fence.rw.w+fence.rw.rw+fence.rw.rw.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	ld	s0,16(a0)
	lw	a4,0(a0)
	ld	a5,8(a0)
	ld	a3,96(s0)
	slli	a4,a4,2
	add	a5,a5,a4
	lw	a0,0(a5)
	lw	a2,0(a3)
	li	a1,4
	lla	a3,.LC3
	call	force_one_affinity@plt
	mv	a0,s0
	call	check_globals
	ld	a5,96(s0)
	lw	a7,0(s1)
	ld	t3,80(s0)
	lw	a6,12(a5)
	lw	t6,4(a5)
	blez	a6,.L91
	sub	t5,t6,a6
	negw	a0,a6
	subw	t4,t6,a6
	slli	t5,t5,2
	sext.w	t6,t6
	slli	a0,a0,2
	sext.w	a7,a7
	li	t1,3
	li	a1,1
.L90:
	sext.w	a2,t4
	mv	a3,t5
	bltz	t4,.L95
.L94:
	remuw	a5,a2,t1
	add	a4,t3,a3
	beq	a5,a7,.L104
.L92:
	lw	a5,0(a4)
	sext.w	a5,a5
	beqz	a5,.L92
.L93:
	ld	a5,16(s0)
	ld	a4,8(s0)
	add	a5,a5,a3
	add	a4,a4,a3
#APP
# 244 "Z6.4+fence.rw.w+fence.rw.rw+fence.rw.rw.c" 1
	
#START _litmus_P0
#_litmus_P0_0
	sw a1,0(a5)
#_litmus_P0_1
	fence rw,w
#_litmus_P0_2
	sw a1,0(a4)
#END _litmus_P0

# 0 "" 2
#NO_APP
	subw	a2,a2,a6
	add	a3,a3,a0
	bgez	a2,.L94
.L95:
	addiw	t4,t4,1
	addi	t5,t5,4
	bne	t4,t6,.L90
.L91:
	mv	a1,s0
	li	a0,0
	call	stabilize_globals
#APP
# 47 "Z6.4+fence.rw.w+fence.rw.rw+fence.rw.rw.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	li	a0,0
	addi	sp,sp,32
	jr	ra
.L104:
	sw	a1,0(a4)
#APP
# 47 "Z6.4+fence.rw.w+fence.rw.rw+fence.rw.rw.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	j	.L93
	.size	P0, .-P0
	.section	.rodata.str1.8
	.align	3
.LC4:
	.string	"Run %i of %i\r"
	.align	3
.LC5:
	.string	"Z6.4+fence.rw.w+fence.rw.rw+fence.rw.rw, global y unstabilized"
	.text
	.align	1
	.type	zyva, @function
zyva:
	addi	sp,sp,-464
	la	a5,__stack_chk_guard
	ld	a5,0(a5)
	sd	s9,376(sp)
	mv	s9,a0
	ld	a0,8(a0)
	sd	ra,456(sp)
	sd	s0,448(sp)
	sd	s1,440(sp)
	sd	s5,408(sp)
	sd	a5,344(sp)
	ld	s5,16(s9)
	sd	s2,432(sp)
	sd	s3,424(sp)
	sd	s4,416(sp)
	sd	s6,400(sp)
	sd	s7,392(sp)
	sd	s8,384(sp)
	sd	s10,368(sp)
	sd	s11,360(sp)
	call	pb_wait@plt
	lla	a5,P0
	sd	a5,120(sp)
	lla	a5,P1
	sd	a5,128(sp)
	li	a0,24
	lla	a5,P2
	sd	a5,136(sp)
	call	malloc_check@plt
	lw	s1,4(s5)
	sd	zero,0(a0)
	sd	zero,16(a0)
	sd	zero,8(a0)
	slli	s1,s1,2
	mv	s0,a0
	sd	s5,336(sp)
	call	rand@plt
	mv	a5,a0
	mv	a0,s1
	sw	a5,328(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s1
	sd	a5,264(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s1
	sd	a5,272(sp)
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
	li	a0,3
	sd	a5,256(sp)
	call	pb_create@plt
	mv	a5,a0
	li	a0,3
	sd	a5,280(sp)
	call	po_create@plt
	mv	a5,a0
	mv	a0,s1
	sd	a5,288(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s1
	sd	a5,312(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s1
	sd	a5,304(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s1
	sd	a5,296(sp)
	call	malloc_check@plt
	ld	a5,32(s9)
	lw	a4,8(s5)
	li	a3,2
	addi	a2,sp,240
	sw	a3,216(sp)
	li	a3,1
	sd	a2,16(sp)
	sd	a0,320(sp)
	sd	a2,232(sp)
	sd	a5,224(sp)
	sw	a3,192(sp)
	sd	a2,208(sp)
	sd	a5,200(sp)
	sw	zero,168(sp)
	sd	a2,184(sp)
	sd	a5,176(sp)
	blez	a4,.L119
	addi	a5,sp,168
	sd	a5,64(sp)
	addi	a5,sp,96
	sd	a5,32(sp)
	addi	a5,sp,112
	sd	a5,48(sp)
	addi	a5,sp,192
	sd	a5,72(sp)
	addi	a5,sp,104
	sd	a5,40(sp)
	addi	a5,sp,328
	sd	a5,80(sp)
	li	s3,-237568
	addi	a5,sp,120
	sd	zero,24(sp)
	addi	s1,sp,216
	addiw	s3,s3,-1919
	sd	a5,88(sp)
.L106:
	lw	a5,16(s5)
	li	a4,2
	beq	a5,a4,.L155
	li	a4,4
	beq	a5,a4,.L156
.L109:
	lw	a4,0(s5)
	li	a5,1
	ble	a4,a5,.L111
	la	a5,stderr
	lw	a4,8(s5)
	ld	a0,0(a5)
	ld	a3,24(sp)
	lla	a2,.LC4
	li	a1,1
	call	__fprintf_chk@plt
.L111:
	ld	a5,336(sp)
	lw	a4,4(a5)
	addiw	a2,a4,-1
	slli	a3,a2,32
	sext.w	a5,a2
	bltz	a3,.L116
	slli	a2,a2,32
	srli	a2,a2,32
	sub	a2,a4,a2
	ld	t3,240(sp)
	ld	t1,248(sp)
	ld	a7,256(sp)
	ld	a6,264(sp)
	ld	a0,272(sp)
	ld	a1,320(sp)
	slli	a2,a2,2
	slli	a5,a5,2
	addi	a2,a2,-8
.L115:
	add	a4,t3,a5
	sw	zero,0(a4)
	add	a4,t1,a5
	sw	zero,0(a4)
	add	a4,a7,a5
	sw	zero,0(a4)
	add	a4,a6,a5
	sw	s3,0(a4)
	add	a3,a0,a5
	add	a4,a1,a5
	sw	s3,0(a3)
	sw	zero,0(a4)
	addi	a5,a5,-4
	bne	a5,a2,.L115
.L116:
	lw	a5,28(s5)
	bnez	a5,.L157
.L114:
	ld	a1,136(sp)
	ld	a0,48(sp)
	mv	a2,s1
	call	launch@plt
	ld	a2,72(sp)
	ld	a1,128(sp)
	ld	a0,40(sp)
	call	launch@plt
	ld	a2,64(sp)
	ld	a1,120(sp)
	ld	a0,32(sp)
	call	launch@plt
	lw	a5,28(s5)
	bnez	a5,.L158
.L117:
	ld	a0,48(sp)
	call	join@plt
	ld	a0,40(sp)
	call	join@plt
	ld	a0,32(sp)
	call	join@plt
	lw	a5,4(s5)
	addiw	s4,a5,-1
	slli	a4,s4,32
	sext.w	a6,s4
	bltz	a4,.L129
	ld	a3,24(sp)
	li	a4,3
	slli	s4,s4,32
	remw	a4,a3,a4
	srli	s4,s4,32
	sub	s4,a5,s4
	slli	s4,s4,2
	addi	a5,s4,-8
	sd	a5,8(sp)
	slli	s11,a6,2
	addi	s8,sp,144
	lla	s6,.LC5
	slli	a5,a4,3
	lla	a4,.LANCHOR1
	add	a5,a4,a5
	sd	a5,56(sp)
.L128:
	ld	a3,264(sp)
	ld	a4,272(sp)
	ld	a5,248(sp)
	add	a3,a3,s11
	add	a4,a4,s11
	add	a5,a5,s11
	lw	s4,0(a3)
	lw	s2,0(a4)
	lw	s7,0(a5)
	ld	s10,16(sp)
.L121:
	ld	a4,72(s10)
	add	a4,a4,s11
	lw	a4,0(a4)
	beq	a4,s7,.L120
	mv	a0,s6
	call	fatal@plt
.L120:
	addi	s10,s10,-8
	bne	s1,s10,.L121
	li	s10,0
	bnez	s4,.L122
	mv	s10,s4
	bnez	s2,.L122
	addi	a4,s7,-2
	seqz	s10,a4
.L122:
	ld	a0,0(s0)
	mv	a4,s10
	li	a3,1
	li	a2,3
	mv	a1,s8
	sd	s4,144(sp)
	sd	s2,152(sp)
	sd	s7,160(sp)
	call	add_outcome_outs@plt
	lw	a5,16(s5)
	li	a4,4
	sd	a0,0(s0)
	beq	a5,a4,.L159
	li	a4,5
	bne	a5,a4,.L124
	ld	a5,32(s9)
	lw	a5,0(a5)
	bltz	a5,.L124
	bnez	s10,.L160
.L125:
	ld	a5,16(s0)
	addi	a5,a5,1
	sd	a5,16(s0)
.L127:
	ld	a5,8(sp)
	addi	s11,s11,-4
	bne	s11,a5,.L128
.L129:
	ld	a4,24(sp)
	lw	a5,8(s5)
	addiw	a4,a4,1
	sd	a4,24(sp)
	bgt	a5,a4,.L106
.L119:
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
	call	pb_free@plt
	ld	a0,288(sp)
	call	po_free@plt
	ld	a0,312(sp)
	call	free@plt
	ld	a0,304(sp)
	call	free@plt
	ld	a0,296(sp)
	call	free@plt
	ld	a0,320(sp)
	call	free@plt
	la	a5,__stack_chk_guard
	ld	a4,344(sp)
	ld	a5,0(a5)
	bne	a4,a5,.L161
	ld	ra,456(sp)
	mv	a0,s0
	ld	s0,448(sp)
	ld	s1,440(sp)
	ld	s2,432(sp)
	ld	s3,424(sp)
	ld	s4,416(sp)
	ld	s5,408(sp)
	ld	s6,400(sp)
	ld	s7,392(sp)
	ld	s8,384(sp)
	ld	s9,376(sp)
	ld	s10,368(sp)
	ld	s11,360(sp)
	addi	sp,sp,464
	jr	ra
.L124:
	beqz	s10,.L125
.L126:
	ld	a5,8(s0)
	addi	a5,a5,1
	sd	a5,8(s0)
	j	.L127
.L159:
	ld	a5,32(s9)
	lw	a5,0(a5)
	bltz	a5,.L124
	beqz	s10,.L125
	ld	a0,0(s9)
	call	pm_lock@plt
	ld	a4,56(sp)
.L154:
	ld	a5,0(a4)
	ld	a0,0(s9)
	addi	a5,a5,1
	sd	a5,0(a4)
	call	pm_unlock@plt
	j	.L126
.L160:
	ld	a0,0(s9)
	call	pm_lock@plt
	lla	a4,.LANCHOR1
	j	.L154
.L158:
	ld	a1,32(sp)
	ld	a0,80(sp)
	li	a2,3
	call	perm_threads@plt
	j	.L117
.L157:
	ld	a1,88(sp)
	ld	a0,80(sp)
	li	a2,3
	call	perm_funs@plt
	j	.L114
.L155:
	ld	a0,8(s9)
	call	pb_wait@plt
	lw	a5,24(s9)
	beqz	a5,.L162
.L153:
	ld	a0,8(s9)
	call	pb_wait@plt
	j	.L109
.L156:
	ld	a0,8(s9)
	call	pb_wait@plt
	ld	a5,24(sp)
	li	a3,3
	lw	a2,24(s9)
	remw	a3,a5,a3
	ld	a4,32(s9)
	slliw	a5,a2,1
	addw	a5,a5,a2
	addi	a1,a4,12
	slliw	a2,a3,1
	addw	a3,a2,a3
	add	a5,a5,a3
	slli	a5,a5,2
	lla	a3,.LANCHOR0
	add	a5,a3,a5
.L110:
	lw	a3,0(a5)
	addi	a4,a4,4
	addi	a5,a5,4
	sw	a3,-4(a4)
	bne	a4,a1,.L110
	j	.L153
.L162:
	lw	a3,20(s5)
	lw	a2,24(s5)
	ld	a1,32(s9)
	ld	a0,80(sp)
	call	perm_prefix_ints@plt
	j	.L153
.L161:
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
	.string	"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
	.align	3
.LC10:
	.string	"%s\n"
	.align	3
.LC11:
	.string	"% Results for tests/non-mixed-size/SAFE/Z6.4+fence.rw.w+fence.rw.rw+fence.rw.rw.litmus %"
	.align	3
.LC12:
	.string	"RISCV Z6.4+fence.rw.w+fence.rw.rw+fence.rw.rw"
	.align	3
.LC13:
	.string	"\"Fence.rw.wdWW Wse Fence.rw.rwdWR Fre Fence.rw.rwdWR Fre\""
	.align	3
.LC14:
	.string	"{"
	.align	3
.LC15:
	.string	" 0:x5=1; 0:x6=x; 0:x7=y;"
	.align	3
.LC16:
	.string	" 1:x5=2; 1:x6=y; 1:x8=z;"
	.align	3
.LC17:
	.string	" 2:x5=1; 2:x6=z; 2:x8=x;"
	.align	3
.LC18:
	.string	"}"
	.align	3
.LC19:
	.string	" P0          | P1          | P2          ;"
	.align	3
.LC20:
	.string	" sw x5,0(x6) | sw x5,0(x6) | sw x5,0(x6) ;"
	.align	3
.LC21:
	.string	" fence rw,w  | fence rw,rw | fence rw,rw ;"
	.align	3
.LC22:
	.string	" sw x5,0(x7) | lw x7,0(x8) | lw x7,0(x8) ;"
	.align	3
.LC23:
	.string	""
	.align	3
.LC24:
	.string	"exists ([y]=2 /\\ 1:x7=0 /\\ 2:x7=0)"
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
	.string	"Z6.4+fence.rw.w+fence.rw.rw+fence.rw.rw: n=%i, r=%i, s=%i"
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
	.string	"Z6.4+fence.rw.w+fence.rw.rw+fence.rw.rw, sum_hist"
	.align	3
.LC40:
	.string	"Test Z6.4+fence.rw.w+fence.rw.rw+fence.rw.rw Allowed\n"
	.align	3
.LC41:
	.string	"Histogram (%d states)\n"
	.align	3
.LC42:
	.string	"Observation Z6.4+fence.rw.w+fence.rw.rw+fence.rw.rw %s %lu %lu\n"
	.align	3
.LC44:
	.string	"Time Z6.4+fence.rw.w+fence.rw.rw+fence.rw.rw %.2f\n"
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
	.string	"Hash=00c8cc34e66d5883d54267e68ab6e17b\n"
	.align	3
.LC50:
	.string	"Cycle=Fre Fence.rw.wdWW Wse Fence.rw.rwdWR Fre Fence.rw.rwdWR\n"
	.align	3
.LC51:
	.string	"Relax Z6.4+fence.rw.w+fence.rw.rw+fence.rw.rw %s %s\n"
	.align	3
.LC52:
	.string	"Safe=Fre Wse Fence.rw.wdWW Fence.rw.rwdWR\n"
	.align	3
.LC53:
	.string	"Generator=diy7 (version 7.51+4(dev))\n"
	.align	3
.LC54:
	.string	"Com=Ws Fr Fr\n"
	.align	3
.LC55:
	.string	"Orig=Fence.rw.wdWW Wse Fence.rw.rwdWR Fre Fence.rw.rwdWR Fre\n"
	.align	3
.LC56:
	.string	"No"
	.align	3
.LC57:
	.string	"NOT "
	.align	3
.LC58:
	.string	"Affinity=[2] [0] [1] ; (1,2) (2,0)\n"
	.text
	.align	1
	.globl	Z6_2E_4_2B_fence_2E_rw_2E_w_2B_fence_2E_rw_2E_rw_2B_fence_2E_rw_2E_rw
	.type	Z6_2E_4_2B_fence_2E_rw_2E_w_2B_fence_2E_rw_2E_rw_2B_fence_2E_rw_2E_rw, @function
Z6_2E_4_2B_fence_2E_rw_2E_w_2B_fence_2E_rw_2E_rw_2B_fence_2E_rw_2E_rw:
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
	ble	a4,a5,.L250
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
.L166:
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
	bne	a5,t1,.L166
	ld	a6,0(a5)
	ld	a5,8(a5)
	mv	a1,s2
	mv	a0,s3
	sd	a5,8(a4)
	sd	a6,0(a4)
	call	parse_cmd@plt
	lw	a5,-152(s0)
	sd	sp,-488(s0)
	bnez	a5,.L251
.L167:
	call	timeofday@plt
	lw	a5,-256(s0)
	lw	a4,-244(s0)
	sd	a0,-496(s0)
	sw	a5,-408(s0)
	lw	a5,-248(s0)
	sw	a5,-404(s0)
	lw	a5,-252(s0)
	sw	a5,-400(s0)
	blez	a4,.L252
	lw	a5,-228(s0)
	sw	a4,-396(s0)
	li	a4,5
	beq	a5,a4,.L169
.L267:
	addiw	a5,a5,-3
	li	a4,2
	sgtu	a5,a5,a4
	li	s9,-1
.L170:
	lw	a4,-156(s0)
	sw	a5,-380(s0)
	beqz	a4,.L172
	sw	zero,-380(s0)
.L172:
	lw	a0,0(s5)
	li	a1,2
	call	coremap_seq@plt
	lw	s2,-240(s0)
	sd	a0,-376(s0)
	ld	s4,-208(s0)
	blez	s2,.L253
	lw	a2,0(s4)
	ble	s2,a2,.L174
	mv	a1,s2
	lla	a0,.LC27
	call	log_error@plt
	ld	s4,-208(s0)
.L174:
	lw	s6,-236(s0)
	blez	s6,.L175
.L268:
	slli	s7,s6,2
	addiw	a5,s6,-1
	slliw	s2,s6,1
	add	s7,s7,s6
	sd	a5,-424(s0)
	addw	s2,s2,s6
	slli	s8,a5,3
	sd	s6,-504(s0)
	slli	s7,s7,3
.L176:
	lw	a4,-228(s0)
	li	a5,2
	mv	s3,s2
	beq	a4,a5,.L254
.L177:
	slli	a5,s3,2
	addi	a5,a5,15
	lw	a3,-408(s0)
	andi	a5,a5,-16
	sub	sp,sp,a5
	sw	a4,-392(s0)
	sw	s3,-388(s0)
	sw	s2,-384(s0)
	mv	s10,sp
	bnez	a3,.L255
.L178:
	li	a5,2
	beq	a4,a5,.L256
	li	a5,3
	beq	a4,a5,.L257
	li	a5,5
	beq	a4,a5,.L258
.L187:
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
	blez	a5,.L259
	remw	a5,a5,a1
	sd	a5,-456(s0)
.L194:
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
	j	.L201
.L262:
	mv	a2,s3
	mv	a0,s11
	lla	a1,zyva
	addiw	s9,s9,1
	call	launch@plt
	addi	s3,s3,40
	addi	s11,s11,8
	addi	s10,s10,12
	beq	s6,s9,.L260
.L201:
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
	beq	a5,a4,.L261
.L196:
	ld	a5,-424(s0)
	bgt	a5,s9,.L262
	mv	a0,s3
	call	zyva
	addiw	s9,s9,1
	mv	s2,a0
	addi	s3,s3,40
	addi	s11,s11,8
	addi	s10,s10,12
	bne	s6,s9,.L201
.L260:
	lw	a5,-404(s0)
	lw	s6,-400(s0)
	mul	s6,s6,a5
	ld	a5,-424(s0)
	beqz	a5,.L208
	ld	a5,-424(s0)
	addiw	s3,a5,-1
	slli	s3,s3,32
	ld	a5,-464(s0)
	srli	s3,s3,32
	addi	s3,s3,1
	slli	s3,s3,3
	add	s11,a5,s3
	lla	s3,.LC39
.L207:
	mv	a0,s7
	call	join@plt
	mv	s8,a0
	ld	a0,0(a0)
	call	sum_outs@plt
	bne	s6,a0,.L205
	ld	a6,8(s8)
	ld	a2,16(s8)
	add	a4,a6,a2
	beq	s6,a4,.L206
.L205:
	mv	a0,s3
	call	fatal@plt
	ld	a6,8(s8)
	ld	a2,16(s8)
.L206:
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
	bne	s11,s7,.L207
.L208:
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
	bne	s6,a0,.L203
	ld	s4,8(s2)
	ld	s7,16(s2)
	add	a5,s4,s7
	beq	s6,a5,.L209
.L203:
	lla	a0,.LC39
	call	fatal@plt
	ld	s4,8(s2)
	ld	s7,16(s2)
.L209:
	li	a2,53
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
	li	a4,3
	addi	a3,s0,-144
	lla	a1,do_dump_outcome
	mv	a0,s1
	call	dump_outs@plt
	beqz	s4,.L263
	lla	a2,.LC10
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
	li	a2,62
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
	li	a2,42
	li	a1,1
	lla	a0,.LC52
	call	fwrite@plt
	mv	a3,s1
	li	a2,37
	li	a1,1
	lla	a0,.LC53
	call	fwrite@plt
	mv	a3,s1
	li	a2,13
	li	a1,1
	lla	a0,.LC54
	call	fwrite@plt
	mv	a3,s1
	li	a2,61
	li	a1,1
	lla	a0,.LC55
	call	fwrite@plt
	lw	a4,-228(s0)
	li	a5,3
	beq	a4,a5,.L264
.L214:
	lla	s6,.LC7
	bnez	s7,.L265
.L212:
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
	ld	a0,-376(s0)
	call	cpus_free@plt
	ld	a5,-208(s0)
	ld	sp,-488(s0)
	beq	a5,s5,.L165
	mv	a0,s5
.L250:
	call	cpus_free@plt
.L165:
	la	a5,__stack_chk_guard
	ld	a4,-120(s0)
	ld	a5,0(a5)
	bne	a4,a5,.L266
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
.L252:
	lw	a5,-228(s0)
	li	a4,3
	sw	a4,-396(s0)
	li	a4,5
	bne	a5,a4,.L267
.L169:
	ld	a2,-200(s0)
	li	a1,3
	lla	a0,.LANCHOR2
	call	find_string@plt
	mv	s9,a0
	bltz	a0,.L171
	lw	a5,-228(s0)
	li	a4,2
	addiw	a5,a5,-3
	sgtu	a5,a5,a4
	j	.L170
.L253:
	lw	s6,-236(s0)
	lw	s2,0(s4)
	bgtz	s6,.L268
.L175:
	li	a5,2
	ble	s2,a5,.L217
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
	bne	a4,a5,.L177
.L254:
	lw	a0,0(s4)
	mv	a1,s2
	call	max@plt
	lw	a4,-228(s0)
	mv	s3,a0
	j	.L177
.L251:
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
	j	.L167
.L261:
	ld	a0,8(s4)
.L198:
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
	beq	s8,a4,.L269
	bne	a3,s10,.L198
	j	.L196
.L269:
	ld	a4,-480(s0)
	addiw	a5,s8,1
	remw	s8,a5,a4
	sd	s8,-432(s0)
	bne	a3,s10,.L198
	j	.L196
.L263:
	lla	a2,.LC10
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
	li	a2,62
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
	li	a2,42
	li	a1,1
	lla	a0,.LC52
	call	fwrite@plt
	mv	a3,s1
	li	a2,37
	li	a1,1
	lla	a0,.LC53
	call	fwrite@plt
	mv	a3,s1
	li	a2,13
	li	a1,1
	lla	a0,.LC54
	call	fwrite@plt
	mv	a3,s1
	li	a2,61
	li	a1,1
	lla	a0,.LC55
	call	fwrite@plt
	lw	a4,-228(s0)
	li	a5,3
	lla	s6,.LC6
	bne	a4,a5,.L212
	mv	a3,s1
	li	a2,35
	li	a1,1
	lla	a0,.LC58
	call	fwrite@plt
	j	.L212
.L259:
	blez	a1,.L219
	ld	a4,8(s4)
	li	a5,0
	li	a3,-1
.L195:
	sw	a3,0(a4)
	lw	a1,0(s4)
	addiw	a5,a5,1
	addi	a4,a4,4
	blt	a5,a1,.L195
.L219:
	li	a5,1
	sd	a5,-456(s0)
	j	.L194
.L256:
	blez	s3,.L187
	ld	a2,8(s4)
	mv	a3,s10
	li	a4,0
.L188:
	lw	a5,0(s4)
	addi	a3,a3,4
	remw	a5,a4,a5
	addiw	a4,a4,1
	slli	a5,a5,2
	add	a5,a2,a5
	lw	a5,0(a5)
	sw	a5,-4(a3)
	bne	s3,a4,.L188
	j	.L187
.L255:
	lw	a3,-404(s0)
	lw	a2,-400(s0)
	mv	a1,s6
	lla	a0,.LC28
	call	log_error@plt
	lw	a1,-396(s0)
	lla	a0,.LC29
	call	log_error@plt
	lw	a5,-228(s0)
	li	a4,1
	beq	a5,a4,.L270
	li	a4,2
	beq	a5,a4,.L271
	li	a4,3
	beq	a5,a4,.L272
	li	a4,4
	beq	a5,a4,.L273
.L180:
	lla	a0,.LC34
	call	log_error@plt
	la	s11,stderr
	ld	a1,-208(s0)
	ld	a0,0(s11)
	call	cpus_dump@plt
	lla	a0,.LC35
	call	log_error@plt
	lla	a0,.LC36
	call	log_error@plt
	lw	a4,-408(s0)
	li	a5,1
	ble	a4,a5,.L249
	ld	a5,-376(s0)
	beqz	a5,.L249
	lla	a0,.LC37
	call	log_error@plt
	ld	a0,0(s11)
	ld	a1,-376(s0)
	call	cpus_dump@plt
	lla	a0,.LC36
	call	log_error@plt
.L249:
	lw	a4,-228(s0)
	j	.L178
.L265:
	lla	s6,.LC8
	j	.L212
.L217:
	li	a5,1
	li	s7,40
	sd	a5,-504(s0)
	li	s8,0
	sd	zero,-424(s0)
	li	s2,3
	li	s6,1
	j	.L176
.L258:
	slliw	a0,s9,1
	addw	s9,a0,s9
	slli	a0,s9,2
	lla	s9,.LANCHOR0
	add	s9,s9,a0
	blez	s3,.L187
	addiw	a5,s3,-1
	slli	a5,a5,32
	srli	a5,a5,32
	addi	a5,a5,1
	slli	a5,a5,2
	mv	a4,s10
	add	a5,s9,a5
.L192:
	lw	a3,0(s9)
	addi	s9,s9,4
	addi	a4,a4,4
	sw	a3,-4(a4)
	bne	s9,a5,.L192
	j	.L187
.L257:
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
	beqz	a5,.L187
	lla	a0,.LC38
	call	log_error@plt
	la	a5,stderr
	ld	a3,-376(s0)
	ld	a0,0(a5)
	li	a4,3
	mv	a2,s3
	mv	a1,s10
	call	cpus_dump_test@plt
	j	.L187
.L264:
	mv	a3,s1
	li	a2,35
	li	a1,1
	lla	a0,.LC58
	call	fwrite@plt
	j	.L214
.L270:
	lw	a1,-216(s0)
	lla	a0,.LC30
	call	log_error@plt
	j	.L180
.L271:
	lla	a0,.LC31
	call	log_error@plt
	j	.L180
.L171:
	ld	a1,-200(s0)
	lla	a0,.LC26
	call	log_error@plt
	li	a5,4
	sw	a5,-228(s0)
	sd	zero,-200(s0)
	li	a5,0
	j	.L170
.L272:
	lla	a0,.LC32
	call	log_error@plt
	j	.L180
.L273:
	lla	a0,.LC33
	call	log_error@plt
	j	.L180
.L266:
	call	__stack_chk_fail@plt
	.size	Z6_2E_4_2B_fence_2E_rw_2E_w_2B_fence_2E_rw_2E_rw_2B_fence_2E_rw_2E_rw, .-Z6_2E_4_2B_fence_2E_rw_2E_w_2B_fence_2E_rw_2E_rw_2B_fence_2E_rw_2E_rw
	.section	.rodata.str1.8
	.align	3
.LC59:
	.string	"[[1,2],[0]]"
	.align	3
.LC60:
	.string	"[[0,2],[1]]"
	.align	3
.LC61:
	.string	"[[0,1],[2]]"
	.section	.rodata.cst8,"aM",@progbits,8
	.align	3
.LC43:
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
	.size	diff, 20
diff:
	.word	1
	.word	2
	.word	2
	.word	0
	.word	-1
	.zero	4
	.type	color_2, @object
	.size	color_2, 8
color_2:
	.word	1
	.word	-1
	.type	color_1, @object
	.size	color_1, 8
color_1:
	.word	0
	.word	-1
	.type	color_0, @object
	.size	color_0, 8
color_0:
	.word	2
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
	.dword	.LC59
	.dword	.LC60
	.dword	.LC61
	.type	color, @object
	.size	color, 32
color:
	.dword	color_0
	.dword	color_1
	.dword	color_2
	.dword	0
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
