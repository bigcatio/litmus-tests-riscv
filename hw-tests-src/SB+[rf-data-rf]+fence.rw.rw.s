	.file	"SB+[rf-data-rf]+fence.rw.rw.c"
	.option pic
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"%-6lu%c>0:x7=%d; 1:x5=%d; 2:x7=%d; [y]=%d;\n"
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
	.string	"SB+[rf-data-rf]+fence.rw.rw, check_globals failed"
	.text
	.align	1
	.type	check_globals, @function
check_globals:
	ld	a5,96(a0)
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
	addi	s1,a0,88
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
	ld	a0,40(s5)
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
	ld	s1,0(a1)
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
.L36:
	ld	a0,48(s4)
	blez	s8,.L30
	ld	a2,0(s6)
	mv	a5,s5
.L31:
	add	a4,s1,a5
	lw	a3,0(a4)
	add	a4,a2,a5
	addi	a5,a5,-4
	sw	a3,0(a4)
	bne	a5,s0,.L31
	call	po_reinit@plt
	ld	a1,0(s6)
	ld	a2,0(s7)
	mv	a3,s5
.L34:
	add	a4,a1,a3
	add	a5,a2,a3
	lw	a4,0(a4)
	lw	a5,0(a5)
	beq	a4,a5,.L44
	mv	a1,s2
	mv	a0,s3
	call	log_error@plt
	li	a1,1
.L35:
	ld	a0,48(s4)
	call	po_wait@plt
	bnez	a0,.L36
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
.L44:
	addi	a3,a3,-4
	bne	a3,s0,.L34
	li	a1,0
	j	.L35
.L30:
	call	po_reinit@plt
	li	a1,0
	j	.L35
	.size	stabilize_globals, .-stabilize_globals
	.section	.rodata.str1.8
	.align	3
.LC3:
	.string	"SB+[rf-data-rf]+fence.rw.rw"
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
# 47 "SB+[rf-data-rf]+fence.rw.rw.c" 1
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
	blez	a6,.L49
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
.L48:
	sext.w	a2,t5
	mv	a3,t6
	bltz	t5,.L53
.L52:
	remuw	a5,a2,t3
	add	a4,t4,a3
	beq	a5,a7,.L62
.L50:
	lw	a5,0(a4)
	sext.w	a5,a5
	beqz	a5,.L50
.L51:
	ld	a5,0(s0)
	ld	a4,8(s0)
	add	a5,a5,a3
	add	a4,a4,a3
#APP
# 319 "SB+[rf-data-rf]+fence.rw.rw.c" 1
	
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
	ld	a5,32(s0)
	subw	a2,a2,a6
	add	a5,a5,a3
	sw	a1,0(a5)
	add	a3,a3,a0
	bgez	a2,.L52
.L53:
	addiw	t5,t5,1
	addi	t6,t6,4
	bne	t5,t2,.L48
.L49:
	mv	a1,s0
	li	a0,2
	call	stabilize_globals
#APP
# 47 "SB+[rf-data-rf]+fence.rw.rw.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	li	a0,0
	addi	sp,sp,32
	jr	ra
.L62:
	sw	t0,0(a4)
#APP
# 47 "SB+[rf-data-rf]+fence.rw.rw.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	j	.L51
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
# 47 "SB+[rf-data-rf]+fence.rw.rw.c" 1
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
	lw	t2,4(a5)
	blez	a6,.L67
	sub	t6,t2,a6
	negw	a0,a6
	subw	t5,t2,a6
	slli	t6,t6,2
	sext.w	t2,t2
	slli	a0,a0,2
	sext.w	a7,a7
	li	t1,3
	li	t0,1
.L66:
	sext.w	a2,t5
	mv	a3,t6
	bltz	t5,.L71
.L70:
	remuw	a5,a2,t1
	add	a4,t3,a3
	beq	a5,a7,.L80
.L68:
	lw	a5,0(a4)
	sext.w	a5,a5
	beqz	a5,.L68
.L69:
	ld	a5,8(s0)
	ld	a4,0(s0)
	add	a5,a5,a3
	add	a4,a4,a3
#APP
# 282 "SB+[rf-data-rf]+fence.rw.rw.c" 1
	
#START _litmus_P1
#_litmus_P1_0
	lw a1,0(a5)
#_litmus_P1_1
	xor t4,a1,a1
#_litmus_P1_2
	ori t4,t4,1
#_litmus_P1_3
	sw t4,0(a4)
#END _litmus_P1

# 0 "" 2
#NO_APP
	ld	a5,24(s0)
	subw	a2,a2,a6
	add	a5,a5,a3
	sw	a1,0(a5)
	add	a3,a3,a0
	bgez	a2,.L70
.L71:
	addiw	t5,t5,1
	addi	t6,t6,4
	bne	t5,t2,.L66
.L67:
	mv	a1,s0
	li	a0,1
	call	stabilize_globals
#APP
# 47 "SB+[rf-data-rf]+fence.rw.rw.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	li	a0,0
	addi	sp,sp,32
	jr	ra
.L80:
	sw	t0,0(a4)
#APP
# 47 "SB+[rf-data-rf]+fence.rw.rw.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	j	.L69
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
# 47 "SB+[rf-data-rf]+fence.rw.rw.c" 1
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
	blez	a7,.L85
	sub	t6,t0,a7
	negw	a6,a7
	subw	t5,t0,a7
	slli	t6,t6,2
	sext.w	t0,t0
	slli	a6,a6,2
	sext.w	t1,t1
	li	t3,3
	li	a0,1
.L84:
	sext.w	a2,t5
	mv	a3,t6
	bltz	t5,.L89
.L88:
	remuw	a5,a2,t3
	add	a4,t4,a3
	beq	a5,t1,.L98
.L86:
	lw	a5,0(a4)
	sext.w	a5,a5
	beqz	a5,.L86
.L87:
	ld	a5,8(s0)
	ld	a4,0(s0)
	add	a5,a5,a3
	add	a4,a4,a3
#APP
# 248 "SB+[rf-data-rf]+fence.rw.rw.c" 1
	
#START _litmus_P0
#_litmus_P0_0
	sw a0,0(a5)
#_litmus_P0_1
	lw a1,0(a4)
#END _litmus_P0

# 0 "" 2
#NO_APP
	ld	a5,16(s0)
	subw	a2,a2,a7
	add	a5,a5,a3
	sw	a1,0(a5)
	add	a3,a3,a6
	bgez	a2,.L88
.L89:
	addiw	t5,t5,1
	addi	t6,t6,4
	bne	t5,t0,.L84
.L85:
	mv	a1,s0
	li	a0,0
	call	stabilize_globals
#APP
# 47 "SB+[rf-data-rf]+fence.rw.rw.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	li	a0,0
	addi	sp,sp,32
	jr	ra
.L98:
	sw	a0,0(a4)
#APP
# 47 "SB+[rf-data-rf]+fence.rw.rw.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	j	.L87
	.size	P0, .-P0
	.section	.rodata.str1.8
	.align	3
.LC4:
	.string	"Run %i of %i\r"
	.align	3
.LC5:
	.string	"SB+[rf-data-rf]+fence.rw.rw, global y unstabilized"
	.text
	.align	1
	.type	zyva, @function
zyva:
	addi	sp,sp,-480
	la	a5,__stack_chk_guard
	ld	a5,0(a5)
	sd	s2,448(sp)
	sd	a0,16(sp)
	mv	s2,a0
	ld	a0,8(a0)
	sd	ra,472(sp)
	sd	s0,464(sp)
	sd	s1,456(sp)
	sd	s6,416(sp)
	sd	a5,360(sp)
	ld	s6,16(s2)
	sd	s3,440(sp)
	sd	s4,432(sp)
	sd	s5,424(sp)
	sd	s7,408(sp)
	sd	s8,400(sp)
	sd	s9,392(sp)
	sd	s10,384(sp)
	sd	s11,376(sp)
	call	pb_wait@plt
	lla	a5,P0
	sd	a5,128(sp)
	lla	a5,P1
	sd	a5,136(sp)
	li	a0,24
	lla	a5,P2
	sd	a5,144(sp)
	call	malloc_check@plt
	lw	s1,4(s6)
	sd	zero,0(a0)
	sd	zero,16(a0)
	sd	zero,8(a0)
	slli	s1,s1,2
	mv	s0,a0
	sd	s6,352(sp)
	call	rand@plt
	mv	a5,a0
	mv	a0,s1
	sw	a5,344(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s1
	sd	a5,272(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s1
	sd	a5,280(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s1
	sd	a5,288(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s1
	sd	a5,256(sp)
	call	malloc_check@plt
	mv	a5,a0
	li	a0,3
	sd	a5,264(sp)
	call	pb_create@plt
	mv	a5,a0
	li	a0,3
	sd	a5,296(sp)
	call	po_create@plt
	mv	a5,a0
	mv	a0,s1
	sd	a5,304(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s1
	sd	a5,328(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s1
	sd	a5,320(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s1
	sd	a5,312(sp)
	call	malloc_check@plt
	ld	a5,32(s2)
	lw	a4,8(s6)
	li	a3,2
	addi	a2,sp,256
	sw	a3,232(sp)
	li	a3,1
	sd	a2,8(sp)
	sd	a0,336(sp)
	sd	a2,248(sp)
	sd	a5,240(sp)
	sw	a3,208(sp)
	sd	a2,224(sp)
	sd	a5,216(sp)
	sw	zero,184(sp)
	sd	a2,200(sp)
	sd	a5,192(sp)
	blez	a4,.L113
	addi	a5,sp,184
	sd	a5,64(sp)
	addi	a5,sp,104
	sd	a5,32(sp)
	addi	a5,sp,120
	sd	a5,40(sp)
	addi	a5,sp,208
	sd	a5,72(sp)
	addi	a5,sp,112
	sd	a5,48(sp)
	addi	a5,sp,344
	sd	a5,80(sp)
	li	s2,-237568
	addi	a5,sp,128
	sd	zero,24(sp)
	addi	s1,sp,232
	addiw	s2,s2,-1919
	sd	a5,88(sp)
.L100:
	lw	a5,16(s6)
	li	a4,2
	beq	a5,a4,.L150
	li	a4,4
	beq	a5,a4,.L151
.L103:
	lw	a4,0(s6)
	li	a5,1
	ble	a4,a5,.L105
	la	a5,stderr
	lw	a4,8(s6)
	ld	a0,0(a5)
	ld	a3,24(sp)
	lla	a2,.LC4
	li	a1,1
	call	__fprintf_chk@plt
.L105:
	ld	a5,352(sp)
	lw	a4,4(a5)
	addiw	a2,a4,-1
	slli	a3,a2,32
	sext.w	a5,a2
	bltz	a3,.L110
	slli	a2,a2,32
	srli	a2,a2,32
	sub	a2,a4,a2
	ld	t3,256(sp)
	ld	t1,264(sp)
	ld	a7,272(sp)
	ld	a6,280(sp)
	ld	a0,288(sp)
	ld	a1,336(sp)
	slli	a2,a2,2
	slli	a5,a5,2
	addi	a2,a2,-8
.L109:
	add	a4,t3,a5
	sw	zero,0(a4)
	add	a4,t1,a5
	sw	zero,0(a4)
	add	a4,a7,a5
	sw	s2,0(a4)
	add	a4,a6,a5
	sw	s2,0(a4)
	add	a3,a0,a5
	add	a4,a1,a5
	sw	s2,0(a3)
	sw	zero,0(a4)
	addi	a5,a5,-4
	bne	a5,a2,.L109
.L110:
	lw	a5,28(s6)
	bnez	a5,.L152
.L108:
	ld	a1,144(sp)
	ld	a0,40(sp)
	mv	a2,s1
	call	launch@plt
	ld	a2,72(sp)
	ld	a1,136(sp)
	ld	a0,48(sp)
	call	launch@plt
	ld	a2,64(sp)
	ld	a1,128(sp)
	ld	a0,32(sp)
	call	launch@plt
	lw	a5,28(s6)
	bnez	a5,.L153
.L111:
	ld	a0,40(sp)
	call	join@plt
	ld	a0,48(sp)
	call	join@plt
	ld	a0,32(sp)
	call	join@plt
	lw	a5,4(s6)
	addiw	s5,a5,-1
	slli	a4,s5,32
	sext.w	a6,s5
	bltz	a4,.L123
	ld	a3,24(sp)
	li	a4,3
	slli	s5,s5,32
	remw	a4,a3,a4
	srli	s5,s5,32
	sub	s5,a5,s5
	slli	s5,s5,2
	addi	a5,s5,-8
	sd	a5,0(sp)
	slli	s11,a6,2
	addi	s9,sp,152
	lla	s7,.LC5
	slli	a5,a4,3
	lla	a4,.LANCHOR1
	add	a5,a4,a5
	sd	a5,56(sp)
.L122:
	ld	a2,272(sp)
	ld	a3,280(sp)
	ld	a4,288(sp)
	ld	a5,256(sp)
	add	a2,a2,s11
	add	a3,a3,s11
	add	a4,a4,s11
	add	a5,a5,s11
	lw	s10,0(a2)
	lw	s3,0(a3)
	lw	s4,0(a4)
	lw	s5,0(a5)
	ld	s8,8(sp)
.L115:
	ld	a4,72(s8)
	add	a4,a4,s11
	lw	a4,0(a4)
	beq	a4,s5,.L114
	mv	a0,s7
	call	fatal@plt
.L114:
	addi	s8,s8,-8
	bne	s1,s8,.L115
	li	a5,1
	li	s8,0
	beq	s10,a5,.L154
.L116:
	ld	a0,0(s0)
	li	a3,1
	mv	a4,s8
	li	a2,4
	mv	a1,s9
	sd	s10,152(sp)
	sd	s3,160(sp)
	sd	s4,168(sp)
	sd	s5,176(sp)
	call	add_outcome_outs@plt
	lw	a5,16(s6)
	li	a3,4
	sd	a0,0(s0)
	beq	a5,a3,.L155
	li	a4,5
	bne	a5,a4,.L118
	ld	a5,16(sp)
	ld	a5,32(a5)
	lw	a5,0(a5)
	bltz	a5,.L118
	bnez	s8,.L156
.L119:
	ld	a5,16(s0)
	addi	a5,a5,1
	sd	a5,16(s0)
.L121:
	ld	a5,0(sp)
	addi	s11,s11,-4
	bne	s11,a5,.L122
.L123:
	ld	a4,24(sp)
	lw	a5,8(s6)
	addiw	a4,a4,1
	sd	a4,24(sp)
	bgt	a5,a4,.L100
.L113:
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
	call	pb_free@plt
	ld	a0,304(sp)
	call	po_free@plt
	ld	a0,328(sp)
	call	free@plt
	ld	a0,320(sp)
	call	free@plt
	ld	a0,312(sp)
	call	free@plt
	ld	a0,336(sp)
	call	free@plt
	la	a5,__stack_chk_guard
	ld	a4,360(sp)
	ld	a5,0(a5)
	bne	a4,a5,.L157
	ld	ra,472(sp)
	mv	a0,s0
	ld	s0,464(sp)
	ld	s1,456(sp)
	ld	s2,448(sp)
	ld	s3,440(sp)
	ld	s4,432(sp)
	ld	s5,424(sp)
	ld	s6,416(sp)
	ld	s7,408(sp)
	ld	s8,400(sp)
	ld	s9,392(sp)
	ld	s10,384(sp)
	ld	s11,376(sp)
	addi	sp,sp,480
	jr	ra
.L118:
	beqz	s8,.L119
.L120:
	ld	a5,8(s0)
	addi	a5,a5,1
	sd	a5,8(s0)
	j	.L121
.L155:
	ld	a5,16(sp)
	ld	a5,32(a5)
	lw	a5,0(a5)
	bltz	a5,.L118
	beqz	s8,.L119
	ld	s3,16(sp)
	ld	a0,0(s3)
	call	pm_lock@plt
	ld	a4,56(sp)
.L149:
	ld	a5,0(a4)
	ld	a0,0(s3)
	addi	a5,a5,1
	sd	a5,0(a4)
	call	pm_unlock@plt
	j	.L120
.L154:
	bne	s3,s10,.L116
	bnez	s4,.L116
	addi	a4,s5,-2
	seqz	s8,a4
	j	.L116
.L156:
	ld	s3,16(sp)
	ld	a0,0(s3)
	call	pm_lock@plt
	lla	a4,.LANCHOR1
	j	.L149
.L153:
	ld	a1,32(sp)
	ld	a0,80(sp)
	li	a2,3
	call	perm_threads@plt
	j	.L111
.L152:
	ld	a1,88(sp)
	ld	a0,80(sp)
	li	a2,3
	call	perm_funs@plt
	j	.L108
.L150:
	ld	s3,16(sp)
	ld	a0,8(s3)
	call	pb_wait@plt
	lw	a5,24(s3)
	beqz	a5,.L158
.L148:
	ld	a5,16(sp)
	ld	a0,8(a5)
	call	pb_wait@plt
	j	.L103
.L151:
	ld	s3,16(sp)
	ld	a0,8(s3)
	call	pb_wait@plt
	ld	a5,24(sp)
	li	a3,3
	lw	a2,24(s3)
	remw	a3,a5,a3
	ld	a4,32(s3)
	slliw	a5,a2,1
	addw	a5,a5,a2
	addi	a1,a4,12
	slliw	a2,a3,1
	addw	a3,a2,a3
	add	a5,a5,a3
	slli	a5,a5,2
	lla	a3,.LANCHOR0
	add	a5,a3,a5
.L104:
	lw	a3,0(a5)
	addi	a4,a4,4
	addi	a5,a5,4
	sw	a3,-4(a4)
	bne	a4,a1,.L104
	j	.L148
.L158:
	ld	a5,16(sp)
	lw	a3,20(s6)
	lw	a2,24(s6)
	ld	a1,32(a5)
	ld	a0,80(sp)
	call	perm_prefix_ints@plt
	j	.L148
.L157:
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
	.string	"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
	.align	3
.LC10:
	.string	"%s\n"
	.align	3
.LC11:
	.string	"% Results for tests/non-mixed-size/SAFE/SB+[rf-data-rf]+fence.rw.rw.litmus %"
	.align	3
.LC12:
	.string	"RISCV SB+[rf-data-rf]+fence.rw.rw"
	.align	3
.LC13:
	.string	"\"RfLeave DpDatadW RfBack Fre Fence.rw.rwdWR Fre\""
	.align	3
.LC14:
	.string	"{"
	.align	3
.LC15:
	.string	" 0:x5=1; 0:x6=x; 0:x8=y;"
	.align	3
.LC16:
	.string	" 1:x6=x; 1:x8=y;"
	.align	3
.LC17:
	.string	" 2:x5=2; 2:x6=y; 2:x8=x;"
	.align	3
.LC18:
	.string	"}"
	.align	3
.LC19:
	.string	" P0          | P1           | P2          ;"
	.align	3
.LC20:
	.string	" sw x5,0(x6) | lw x5,0(x6)  | sw x5,0(x6) ;"
	.align	3
.LC21:
	.string	" lw x7,0(x8) | xor x7,x5,x5 | fence rw,rw ;"
	.align	3
.LC22:
	.string	"             | ori x7,x7,1  | lw x7,0(x8) ;"
	.align	3
.LC23:
	.string	"             | sw x7,0(x8)  |             ;"
	.align	3
.LC24:
	.string	""
	.align	3
.LC25:
	.string	"exists ([y]=2 /\\ 0:x7=1 /\\ 1:x5=1 /\\ 2:x7=0)"
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
	.string	"SB+[rf-data-rf]+fence.rw.rw: n=%i, r=%i, s=%i"
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
	.string	"SB+[rf-data-rf]+fence.rw.rw, sum_hist"
	.align	3
.LC41:
	.string	"Test SB+[rf-data-rf]+fence.rw.rw Allowed\n"
	.align	3
.LC42:
	.string	"Histogram (%d states)\n"
	.align	3
.LC43:
	.string	"Observation SB+[rf-data-rf]+fence.rw.rw %s %lu %lu\n"
	.align	3
.LC45:
	.string	"Time SB+[rf-data-rf]+fence.rw.rw %.2f\n"
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
	.string	"Hash=0b7f499cb5fe486dbeb9466c58fbf530\n"
	.align	3
.LC51:
	.string	"Cycle=Fre Fence.rw.rwdWR Fre RfLeave DpDatadW RfBack\n"
	.align	3
.LC52:
	.string	"Relax SB+[rf-data-rf]+fence.rw.rw %s %s\n"
	.align	3
.LC53:
	.string	"Safe=Fre Fence.rw.rwdWR DpDatadW RfLeave RfBack\n"
	.align	3
.LC54:
	.string	"Generator=diy7 (version 7.51+4(dev))\n"
	.align	3
.LC55:
	.string	"Com=Fr Rf Fr\n"
	.align	3
.LC56:
	.string	"Orig=RfLeave DpDatadW RfBack Fre Fence.rw.rwdWR Fre\n"
	.align	3
.LC57:
	.string	"No"
	.align	3
.LC58:
	.string	"NOT "
	.align	3
.LC59:
	.string	"Affinity=[1, 2] [0] ; (0,1) (2,0)\n"
	.text
	.align	1
	.globl	SB_2B__5B_rf_2D_data_2D_rf_5D__2B_fence_2E_rw_2E_rw
	.type	SB_2B__5B_rf_2D_data_2D_rf_5D__2B_fence_2E_rw_2E_rw, @function
SB_2B__5B_rf_2D_data_2D_rf_5D__2B_fence_2E_rw_2E_rw:
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
	li	a5,2
	ble	a4,a5,.L246
	li	a5,1
	li	a6,5
	slli	a4,a5,32
	mv	s5,a0
	slli	a6,a6,33
	li	a0,-1
	addi	t1,a4,100
	srli	a1,a0,32
	addi	a7,a4,1
	addi	a2,s0,-376
	addi	a3,s0,-264
	sd	a6,-376(s0)
	li	a6,4
	sd	t1,-368(s0)
	sd	a4,-352(s0)
	sw	a5,-336(s0)
	sw	a5,-272(s0)
	sd	a6,-360(s0)
	sd	a7,-344(s0)
	sd	s5,-328(s0)
	sd	zero,-320(s0)
	sd	a1,-312(s0)
	sd	zero,-304(s0)
	sd	zero,-296(s0)
	sd	a0,-288(s0)
	sd	a1,-280(s0)
	mv	a5,a2
	mv	a4,a3
	addi	t1,s0,-280
.L162:
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
	bne	a5,t1,.L162
	ld	a6,0(a5)
	ld	a5,8(a5)
	mv	a1,s2
	mv	a0,s3
	sd	a5,8(a4)
	sd	a6,0(a4)
	call	parse_cmd@plt
	lw	a5,-160(s0)
	sd	sp,-504(s0)
	bnez	a5,.L247
.L163:
	call	timeofday@plt
	lw	a5,-264(s0)
	lw	a4,-252(s0)
	sd	a0,-512(s0)
	sw	a5,-416(s0)
	lw	a5,-256(s0)
	sw	a5,-412(s0)
	lw	a5,-260(s0)
	sw	a5,-408(s0)
	blez	a4,.L248
	lw	a5,-236(s0)
	sw	a4,-404(s0)
	li	a4,5
	beq	a5,a4,.L165
.L263:
	addiw	a5,a5,-3
	li	a4,2
	sgtu	a5,a5,a4
	li	s9,-1
.L166:
	lw	a4,-164(s0)
	sw	a5,-388(s0)
	beqz	a4,.L168
	sw	zero,-388(s0)
.L168:
	lw	a0,0(s5)
	li	a1,2
	call	coremap_seq@plt
	lw	s2,-248(s0)
	sd	a0,-384(s0)
	ld	s4,-216(s0)
	blez	s2,.L249
	lw	a2,0(s4)
	ble	s2,a2,.L170
	mv	a1,s2
	lla	a0,.LC28
	call	log_error@plt
	ld	s4,-216(s0)
.L170:
	lw	s6,-244(s0)
	blez	s6,.L171
.L264:
	slli	s7,s6,2
	addiw	a5,s6,-1
	slliw	s2,s6,1
	add	s7,s7,s6
	sd	a5,-440(s0)
	addw	s2,s2,s6
	slli	s8,a5,3
	sd	s6,-520(s0)
	slli	s7,s7,3
.L172:
	lw	a4,-236(s0)
	li	a5,2
	mv	s3,s2
	beq	a4,a5,.L250
.L173:
	slli	a5,s3,2
	addi	a5,a5,15
	lw	a3,-416(s0)
	andi	a5,a5,-16
	sub	sp,sp,a5
	sw	a4,-400(s0)
	sw	s3,-396(s0)
	sw	s2,-392(s0)
	mv	s10,sp
	bnez	a3,.L251
.L174:
	li	a5,2
	beq	a4,a5,.L252
	li	a5,3
	beq	a4,a5,.L253
	li	a5,5
	beq	a4,a5,.L254
.L183:
	addi	s8,s8,15
	andi	s8,s8,-16
	addi	s7,s7,15
	sub	sp,sp,s8
	andi	s7,s7,-16
	sd	sp,-480(s0)
	sub	sp,sp,s7
	call	pm_create@plt
	mv	s8,a0
	mv	a0,s6
	sd	s8,-456(s0)
	call	pb_create@plt
	lw	a5,-224(s0)
	sd	a0,-464(s0)
	lw	a1,0(s4)
	mv	s3,sp
	blez	a5,.L255
	remw	a5,a5,a1
	sd	a5,-472(s0)
.L190:
	ld	a0,-472(s0)
	addi	s10,s10,12
	li	s2,0
	call	gcd@plt
	ld	s11,-480(s0)
	addi	a5,s0,-416
	sd	a0,-496(s0)
	mv	s7,s11
	sd	zero,-448(s0)
	li	s8,0
	li	s9,0
	sd	a5,-488(s0)
	j	.L197
.L258:
	mv	a2,s3
	mv	a0,s11
	lla	a1,zyva
	addiw	s9,s9,1
	call	launch@plt
	addi	s3,s3,40
	addi	s11,s11,8
	addi	s10,s10,12
	beq	s6,s9,.L256
.L197:
	ld	a4,-488(s0)
	lw	a5,-236(s0)
	addi	a3,s10,-12
	sd	a4,16(s3)
	ld	a4,-456(s0)
	sw	s9,24(s3)
	sd	a3,32(s3)
	sd	a4,0(s3)
	ld	a4,-464(s0)
	sd	a4,8(s3)
	li	a4,1
	beq	a5,a4,.L257
.L192:
	ld	a5,-440(s0)
	bgt	a5,s9,.L258
	mv	a0,s3
	call	zyva
	addiw	s9,s9,1
	mv	s2,a0
	addi	s3,s3,40
	addi	s11,s11,8
	addi	s10,s10,12
	bne	s6,s9,.L197
.L256:
	lw	a5,-412(s0)
	lw	s6,-408(s0)
	mul	s6,s6,a5
	ld	a5,-440(s0)
	beqz	a5,.L204
	ld	a5,-440(s0)
	addiw	s3,a5,-1
	slli	s3,s3,32
	ld	a5,-480(s0)
	srli	s3,s3,32
	addi	s3,s3,1
	slli	s3,s3,3
	add	s11,a5,s3
	lla	s3,.LC40
.L203:
	mv	a0,s7
	call	join@plt
	mv	s8,a0
	ld	a0,0(a0)
	call	sum_outs@plt
	bne	s6,a0,.L201
	ld	a6,8(s8)
	ld	a2,16(s8)
	add	a4,a6,a2
	beq	s6,a4,.L202
.L201:
	mv	a0,s3
	call	fatal@plt
	ld	a6,8(s8)
	ld	a2,16(s8)
.L202:
	ld	a3,8(s2)
	ld	a4,16(s2)
	ld	a1,0(s8)
	ld	a0,0(s2)
	add	a4,a4,a2
	add	a3,a3,a6
	li	a2,4
	sd	a3,8(s2)
	sd	a4,16(s2)
	call	merge_outs@plt
	sd	a0,0(s2)
	ld	a0,0(s8)
	addi	s7,s7,8
	call	free_outs@plt
	mv	a0,s8
	call	free@plt
	bne	s11,s7,.L203
.L204:
	mv	a0,s4
	call	cpus_free@plt
	call	timeofday@plt
	ld	a5,-512(s0)
	mv	s3,a0
	ld	a0,-456(s0)
	sub	s3,s3,a5
	call	pm_free@plt
	ld	a5,-520(s0)
	ld	a0,-464(s0)
	mul	s6,s6,a5
	call	pb_free@plt
	ld	a0,0(s2)
	call	sum_outs@plt
	bne	s6,a0,.L199
	ld	s4,8(s2)
	ld	s7,16(s2)
	add	a5,s4,s7
	beq	s6,a5,.L205
.L199:
	lla	a0,.LC40
	call	fatal@plt
	ld	s4,8(s2)
	ld	s7,16(s2)
.L205:
	li	a2,41
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
	li	a4,4
	addi	a3,s0,-152
	lla	a1,do_dump_outcome
	mv	a0,s1
	call	dump_outs@plt
	beqz	s4,.L259
	lla	a2,.LC10
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
	li	a2,53
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
	li	a2,48
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
	li	a2,52
	li	a1,1
	lla	a0,.LC56
	call	fwrite@plt
	lw	a4,-236(s0)
	li	a5,3
	beq	a4,a5,.L260
.L210:
	lla	s6,.LC7
	bnez	s7,.L261
.L208:
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
	ld	a0,-384(s0)
	call	cpus_free@plt
	ld	a5,-216(s0)
	ld	sp,-504(s0)
	beq	a5,s5,.L161
	mv	a0,s5
.L246:
	call	cpus_free@plt
.L161:
	la	a5,__stack_chk_guard
	ld	a4,-120(s0)
	ld	a5,0(a5)
	bne	a4,a5,.L262
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
.L248:
	lw	a5,-236(s0)
	li	a4,3
	sw	a4,-404(s0)
	li	a4,5
	bne	a5,a4,.L263
.L165:
	ld	a2,-208(s0)
	li	a1,3
	lla	a0,.LANCHOR2
	call	find_string@plt
	mv	s9,a0
	bltz	a0,.L167
	lw	a5,-236(s0)
	li	a4,2
	addiw	a5,a5,-3
	sgtu	a5,a5,a4
	j	.L166
.L249:
	lw	s6,-244(s0)
	lw	s2,0(s4)
	bgtz	s6,.L264
.L171:
	li	a5,2
	ble	s2,a5,.L213
	li	a1,3
	divw	s6,s2,a1
	lw	a4,-236(s0)
	addiw	a5,s6,-1
	slli	s7,s6,2
	slliw	s2,s6,1
	sd	a5,-440(s0)
	add	s7,s7,s6
	addw	s2,s2,s6
	slli	s8,a5,3
	sd	s6,-520(s0)
	li	a5,2
	slli	s7,s7,3
	mv	s3,s2
	bne	a4,a5,.L173
.L250:
	lw	a0,0(s4)
	mv	a1,s2
	call	max@plt
	lw	a4,-236(s0)
	mv	s3,a0
	j	.L173
.L247:
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
	j	.L163
.L257:
	ld	a0,8(s4)
.L194:
	slli	a5,s8,2
	add	a5,a0,a5
	lw	a1,0(a5)
	ld	a5,-472(s0)
	addi	a3,a3,4
	sw	a1,-4(a3)
	lw	a4,0(s4)
	addw	a5,a5,s8
	remw	s8,a5,a4
	ld	a4,-448(s0)
	beq	s8,a4,.L265
	bne	a3,s10,.L194
	j	.L192
.L265:
	ld	a4,-496(s0)
	addiw	a5,s8,1
	remw	s8,a5,a4
	sd	s8,-448(s0)
	bne	a3,s10,.L194
	j	.L192
.L259:
	lla	a2,.LC10
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
	li	a2,53
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
	li	a2,48
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
	li	a2,52
	li	a1,1
	lla	a0,.LC56
	call	fwrite@plt
	lw	a4,-236(s0)
	li	a5,3
	lla	s6,.LC6
	bne	a4,a5,.L208
	mv	a3,s1
	li	a2,34
	li	a1,1
	lla	a0,.LC59
	call	fwrite@plt
	j	.L208
.L255:
	blez	a1,.L215
	ld	a4,8(s4)
	li	a5,0
	li	a3,-1
.L191:
	sw	a3,0(a4)
	lw	a1,0(s4)
	addiw	a5,a5,1
	addi	a4,a4,4
	blt	a5,a1,.L191
.L215:
	li	a5,1
	sd	a5,-472(s0)
	j	.L190
.L252:
	blez	s3,.L183
	ld	a2,8(s4)
	mv	a3,s10
	li	a4,0
.L184:
	lw	a5,0(s4)
	addi	a3,a3,4
	remw	a5,a4,a5
	addiw	a4,a4,1
	slli	a5,a5,2
	add	a5,a2,a5
	lw	a5,0(a5)
	sw	a5,-4(a3)
	bne	s3,a4,.L184
	j	.L183
.L251:
	lw	a3,-412(s0)
	lw	a2,-408(s0)
	mv	a1,s6
	lla	a0,.LC29
	call	log_error@plt
	lw	a1,-404(s0)
	lla	a0,.LC30
	call	log_error@plt
	lw	a5,-236(s0)
	li	a4,1
	beq	a5,a4,.L266
	li	a4,2
	beq	a5,a4,.L267
	li	a4,3
	beq	a5,a4,.L268
	li	a4,4
	beq	a5,a4,.L269
.L176:
	lla	a0,.LC35
	call	log_error@plt
	la	s11,stderr
	ld	a1,-216(s0)
	ld	a0,0(s11)
	call	cpus_dump@plt
	lla	a0,.LC36
	call	log_error@plt
	lla	a0,.LC37
	call	log_error@plt
	lw	a4,-416(s0)
	li	a5,1
	ble	a4,a5,.L245
	ld	a5,-384(s0)
	beqz	a5,.L245
	lla	a0,.LC38
	call	log_error@plt
	ld	a0,0(s11)
	ld	a1,-384(s0)
	call	cpus_dump@plt
	lla	a0,.LC37
	call	log_error@plt
.L245:
	lw	a4,-236(s0)
	j	.L174
.L261:
	lla	s6,.LC8
	j	.L208
.L213:
	li	a5,1
	li	s7,40
	sd	a5,-520(s0)
	li	s8,0
	sd	zero,-440(s0)
	li	s2,3
	li	s6,1
	j	.L172
.L254:
	slliw	a0,s9,1
	addw	s9,a0,s9
	slli	a0,s9,2
	lla	s9,.LANCHOR0
	add	s9,s9,a0
	blez	s3,.L183
	addiw	a5,s3,-1
	slli	a5,a5,32
	srli	a5,a5,32
	addi	a5,a5,1
	slli	a5,a5,2
	mv	a4,s10
	add	a5,s9,a5
.L188:
	lw	a3,0(s9)
	addi	s9,s9,4
	addi	a4,a4,4
	sw	a3,-4(a4)
	bne	s9,a5,.L188
	j	.L183
.L253:
	ld	a1,-384(s0)
	mv	a5,s6
	mv	a6,s10
	mv	a4,s4
	lla	a3,.LANCHOR0+40
	lla	a2,.LANCHOR2+24
	addi	a0,s0,-420
	sw	zero,-420(s0)
	call	custom_affinity@plt
	lw	a5,-416(s0)
	beqz	a5,.L183
	lla	a0,.LC39
	call	log_error@plt
	la	a5,stderr
	ld	a3,-384(s0)
	ld	a0,0(a5)
	li	a4,3
	mv	a2,s3
	mv	a1,s10
	call	cpus_dump_test@plt
	j	.L183
.L260:
	mv	a3,s1
	li	a2,34
	li	a1,1
	lla	a0,.LC59
	call	fwrite@plt
	j	.L210
.L266:
	lw	a1,-224(s0)
	lla	a0,.LC31
	call	log_error@plt
	j	.L176
.L267:
	lla	a0,.LC32
	call	log_error@plt
	j	.L176
.L167:
	ld	a1,-208(s0)
	lla	a0,.LC27
	call	log_error@plt
	li	a5,4
	sw	a5,-236(s0)
	sd	zero,-208(s0)
	li	a5,0
	j	.L166
.L268:
	lla	a0,.LC33
	call	log_error@plt
	j	.L176
.L269:
	lla	a0,.LC34
	call	log_error@plt
	j	.L176
.L262:
	call	__stack_chk_fail@plt
	.size	SB_2B__5B_rf_2D_data_2D_rf_5D__2B_fence_2E_rw_2E_rw, .-SB_2B__5B_rf_2D_data_2D_rf_5D__2B_fence_2E_rw_2E_rw
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
	.size	diff, 20
diff:
	.word	0
	.word	1
	.word	2
	.word	0
	.word	-1
	.zero	4
	.type	color_1, @object
	.size	color_1, 8
color_1:
	.word	0
	.word	-1
	.type	color_0, @object
	.size	color_0, 12
color_0:
	.word	1
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
	.dword	.LC60
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
