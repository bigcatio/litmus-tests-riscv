	.file	"S+fence.rw.rw-[fr-ws]+fence.rw.rw.c"
	.option pic
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"%-6lu%c>0:x7=%d; 2:x5=%d; [x]=%d; [y]=%d;\n"
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
	.string	"S+fence.rw.rw-[fr-ws]+fence.rw.rw, check_globals failed"
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
	ld	a0,32(s5)
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
.L37:
	ld	a0,40(s1)
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
	ld	a0,40(s1)
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
	.string	"S+fence.rw.rw-[fr-ws]+fence.rw.rw"
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
# 47 "S+fence.rw.rw-[fr-ws]+fence.rw.rw.c" 1
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
	lw	t1,0(s1)
	ld	t4,96(s0)
	lw	a7,12(a5)
	lw	t0,4(a5)
	blez	a7,.L50
	sub	t6,t0,a7
	negw	a6,a7
	subw	t5,t0,a7
	slli	t6,t6,2
	sext.w	t0,t0
	slli	a6,a6,2
	sext.w	t1,t1
	li	t3,3
	li	a0,1
.L49:
	sext.w	a2,t5
	mv	a3,t6
	bltz	t5,.L54
.L53:
	remuw	a5,a2,t3
	add	a4,t4,a3
	beq	a5,t1,.L63
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
# 320 "S+fence.rw.rw-[fr-ws]+fence.rw.rw.c" 1
	
#START _litmus_P2
#_litmus_P2_0
	lw a1,0(a5)
#_litmus_P2_1
	fence rw,rw
#_litmus_P2_2
	sw a0,0(a4)
#END _litmus_P2

# 0 "" 2
#NO_APP
	ld	a5,24(s0)
	subw	a2,a2,a7
	add	a5,a5,a3
	sw	a1,0(a5)
	add	a3,a3,a6
	bgez	a2,.L53
.L54:
	addiw	t5,t5,1
	addi	t6,t6,4
	bne	t5,t0,.L49
.L50:
	mv	a1,s0
	li	a0,2
	call	stabilize_globals
#APP
# 47 "S+fence.rw.rw-[fr-ws]+fence.rw.rw.c" 1
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
	sw	a0,0(a4)
#APP
# 47 "S+fence.rw.rw-[fr-ws]+fence.rw.rw.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	j	.L52
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
# 47 "S+fence.rw.rw-[fr-ws]+fence.rw.rw.c" 1
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
	blez	a6,.L68
	sub	t5,t6,a6
	negw	a0,a6
	subw	t4,t6,a6
	slli	t5,t5,2
	sext.w	t6,t6
	slli	a0,a0,2
	sext.w	a7,a7
	li	t1,3
	li	a1,1
.L67:
	sext.w	a2,t4
	mv	a3,t5
	bltz	t4,.L72
.L71:
	remuw	a5,a2,t1
	add	a4,t3,a3
	beq	a5,a7,.L81
.L69:
	lw	a5,0(a4)
	sext.w	a5,a5
	beqz	a5,.L69
.L70:
	ld	a5,0(s0)
	add	a5,a5,a3
#APP
# 289 "S+fence.rw.rw-[fr-ws]+fence.rw.rw.c" 1
	
#START _litmus_P1
#_litmus_P1_0
	sw a1,0(a5)
#END _litmus_P1

# 0 "" 2
#NO_APP
	subw	a2,a2,a6
	add	a3,a3,a0
	bgez	a2,.L71
.L72:
	addiw	t4,t4,1
	addi	t5,t5,4
	bne	t4,t6,.L67
.L68:
	mv	a1,s0
	li	a0,1
	call	stabilize_globals
#APP
# 47 "S+fence.rw.rw-[fr-ws]+fence.rw.rw.c" 1
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
# 47 "S+fence.rw.rw-[fr-ws]+fence.rw.rw.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	j	.L70
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
# 47 "S+fence.rw.rw-[fr-ws]+fence.rw.rw.c" 1
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
	blez	a6,.L86
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
.L85:
	sext.w	a2,t5
	mv	a3,t6
	bltz	t5,.L90
.L89:
	remuw	a5,a2,t3
	add	a4,t4,a3
	beq	a5,a7,.L99
.L87:
	lw	a5,0(a4)
	sext.w	a5,a5
	beqz	a5,.L87
.L88:
	ld	a5,8(s0)
	ld	a4,0(s0)
	add	a5,a5,a3
	add	a4,a4,a3
#APP
# 252 "S+fence.rw.rw-[fr-ws]+fence.rw.rw.c" 1
	
#START _litmus_P0
#_litmus_P0_0
	sw t1,0(a5)
#_litmus_P0_1
	fence rw,rw
#_litmus_P0_2
	lw a1,0(a4)
#_litmus_P0_3
	sw t1,0(a4)
#END _litmus_P0

# 0 "" 2
#NO_APP
	ld	a5,16(s0)
	subw	a2,a2,a6
	add	a5,a5,a3
	sw	a1,0(a5)
	add	a3,a3,a0
	bgez	a2,.L89
.L90:
	addiw	t5,t5,1
	addi	t6,t6,4
	bne	t5,t2,.L85
.L86:
	mv	a1,s0
	li	a0,0
	call	stabilize_globals
#APP
# 47 "S+fence.rw.rw-[fr-ws]+fence.rw.rw.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	li	a0,0
	addi	sp,sp,32
	jr	ra
.L99:
	sw	t0,0(a4)
#APP
# 47 "S+fence.rw.rw-[fr-ws]+fence.rw.rw.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	j	.L88
	.size	P0, .-P0
	.section	.rodata.str1.8
	.align	3
.LC4:
	.string	"Run %i of %i\r"
	.align	3
.LC5:
	.string	"S+fence.rw.rw-[fr-ws]+fence.rw.rw, global x unstabilized"
	.align	3
.LC6:
	.string	"S+fence.rw.rw-[fr-ws]+fence.rw.rw, global y unstabilized"
	.text
	.align	1
	.type	zyva, @function
zyva:
	addi	sp,sp,-528
	mv	a4,a0
	la	a5,__stack_chk_guard
	ld	a5,0(a5)
	sd	s0,512(sp)
	sd	a0,40(sp)
	ld	s0,16(a4)
	ld	a0,8(a0)
	sd	ra,520(sp)
	sd	s1,504(sp)
	sd	s2,496(sp)
	sd	s3,488(sp)
	sd	s6,464(sp)
	sd	s0,16(sp)
	sd	a5,408(sp)
	sd	s4,480(sp)
	sd	s5,472(sp)
	sd	s7,456(sp)
	sd	s8,448(sp)
	sd	s9,440(sp)
	sd	s10,432(sp)
	sd	s11,424(sp)
	call	pb_wait@plt
	lla	a5,P0
	sd	a5,160(sp)
	lla	a5,P1
	sd	a5,168(sp)
	li	a0,24
	lla	a5,P2
	sd	a5,176(sp)
	call	malloc_check@plt
	lw	s2,4(s0)
	sd	zero,0(a0)
	sd	zero,16(a0)
	sd	zero,8(a0)
	slli	s2,s2,2
	sd	s0,400(sp)
	mv	s3,a0
	call	rand@plt
	mv	a5,a0
	mv	a0,s2
	sw	a5,392(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s2
	sd	a5,304(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s2
	sd	a5,312(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s2
	sd	a5,288(sp)
	call	malloc_check@plt
	mv	a5,a0
	li	a0,3
	sd	a5,296(sp)
	call	pb_create@plt
	mv	a5,a0
	li	a0,3
	addi	s6,sp,288
	sd	a5,320(sp)
	call	po_create@plt
	sd	a0,328(sp)
	sd	s6,104(sp)
	addi	s0,sp,264
	mv	s1,s6
.L101:
	mv	a0,s2
	call	malloc_check@plt
	mv	a5,a0
	sd	a5,64(s1)
	mv	a0,s2
	call	malloc_check@plt
	sd	a0,88(s1)
	addi	s1,s1,-8
	bne	s0,s1,.L101
	mv	a0,s2
	call	malloc_check@plt
	ld	a5,40(sp)
	ld	a4,16(sp)
	li	a3,2
	ld	a5,32(a5)
	lw	a4,8(a4)
	sw	a3,264(sp)
	li	a3,1
	sd	a0,384(sp)
	sd	s6,280(sp)
	sd	a5,272(sp)
	sw	a3,240(sp)
	sd	s6,256(sp)
	sd	a5,248(sp)
	sw	zero,216(sp)
	sd	s6,232(sp)
	sd	a5,224(sp)
	blez	a4,.L116
	addi	a5,sp,216
	sd	a5,88(sp)
	addi	a5,sp,136
	sd	a5,56(sp)
	addi	a5,sp,152
	sd	a5,72(sp)
	addi	a5,sp,240
	sd	a5,96(sp)
	addi	a5,sp,144
	sd	a5,64(sp)
	li	s7,-237568
	addi	a5,sp,392
	sd	a5,112(sp)
	addiw	a5,s7,-1919
	sw	a5,36(sp)
	addi	a5,sp,160
	sd	zero,48(sp)
	sd	a5,120(sp)
.L102:
	ld	a5,16(sp)
	li	a4,2
	lw	a5,16(a5)
	beq	a5,a4,.L157
	li	a4,4
	beq	a5,a4,.L158
.L106:
	ld	a3,16(sp)
	li	a5,1
	lw	a4,0(a3)
	ble	a4,a5,.L108
	la	a5,stderr
	lw	a4,8(a3)
	ld	a0,0(a5)
	ld	a3,48(sp)
	lla	a2,.LC4
	li	a1,1
	call	__fprintf_chk@plt
.L108:
	ld	a5,400(sp)
	lw	a4,4(a5)
	addiw	a2,a4,-1
	slli	a3,a2,32
	sext.w	a5,a2
	bltz	a3,.L113
	slli	a2,a2,32
	srli	a2,a2,32
	sub	a2,a4,a2
	ld	t1,288(sp)
	ld	a7,296(sp)
	ld	a6,304(sp)
	ld	a0,312(sp)
	ld	a1,384(sp)
	slli	a2,a2,2
	slli	a5,a5,2
	addi	a2,a2,-8
.L112:
	add	a4,t1,a5
	lw	s1,36(sp)
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
	bne	a2,a5,.L112
.L113:
	ld	a5,16(sp)
	lw	a5,28(a5)
	bnez	a5,.L159
.L111:
	ld	a1,176(sp)
	ld	a0,72(sp)
	mv	a2,s0
	call	launch@plt
	ld	a2,96(sp)
	ld	a1,168(sp)
	ld	a0,64(sp)
	call	launch@plt
	ld	a2,88(sp)
	ld	a1,160(sp)
	ld	a0,56(sp)
	call	launch@plt
	ld	a5,16(sp)
	lw	a5,28(a5)
	bnez	a5,.L160
.L114:
	ld	a0,72(sp)
	call	join@plt
	ld	a0,64(sp)
	call	join@plt
	ld	a0,56(sp)
	call	join@plt
	ld	a5,16(sp)
	lw	a4,4(a5)
	addiw	a3,a4,-1
	slli	a2,a3,32
	sext.w	a5,a3
	bltz	a2,.L128
	ld	a1,48(sp)
	li	a2,3
	slli	a3,a3,32
	remw	a2,a1,a2
	srli	a3,a3,32
	sub	a4,a4,a3
	slli	a4,a4,2
	slli	s8,a5,2
	addi	a5,a4,-8
	sd	a5,24(sp)
	lla	a5,.LANCHOR1
	addi	s11,sp,184
	lla	s10,.LC5
	lla	s9,.LC6
	slli	a4,a2,3
	add	a5,a5,a4
	sd	a5,80(sp)
.L127:
	ld	a1,304(sp)
	ld	a2,312(sp)
	ld	a3,296(sp)
	ld	a4,288(sp)
	add	a1,a1,s8
	add	a2,a2,s8
	add	a3,a3,s8
	add	a4,a4,s8
	lw	s4,0(a1)
	lw	s5,0(a2)
	lw	s1,0(a3)
	lw	s2,0(a4)
	mv	s7,s6
.L118:
	ld	a3,64(s7)
	add	a3,a3,s8
	lw	a3,0(a3)
	beq	a3,s1,.L117
	mv	a0,s10
	call	fatal@plt
.L117:
	addi	s7,s7,-8
	bne	s0,s7,.L118
	mv	s7,s6
.L120:
	ld	a3,88(s7)
	add	a3,a3,s8
	lw	a3,0(a3)
	beq	a3,s2,.L119
	mv	a0,s9
	call	fatal@plt
.L119:
	addi	s7,s7,-8
	bne	s0,s7,.L120
	li	a4,0
	bnez	s4,.L121
	li	a5,2
	mv	a4,s4
	beq	s5,a5,.L161
.L121:
	ld	a0,0(s3)
	li	a3,1
	li	a2,4
	mv	a1,s11
	sd	a4,8(sp)
	sd	s4,184(sp)
	sd	s5,192(sp)
	sd	s1,200(sp)
	sd	s2,208(sp)
	call	add_outcome_outs@plt
	ld	a5,16(sp)
	li	a2,4
	ld	a4,8(sp)
	lw	a3,16(a5)
	sd	a0,0(s3)
	beq	a3,a2,.L162
	li	a5,5
	bne	a3,a5,.L123
	ld	a5,40(sp)
	ld	a3,32(a5)
	lw	a3,0(a3)
	bltz	a3,.L123
	bnez	a4,.L163
.L124:
	ld	a4,16(s3)
	addi	a4,a4,1
	sd	a4,16(s3)
.L126:
	ld	a5,24(sp)
	addi	s8,s8,-4
	bne	s8,a5,.L127
.L128:
	ld	a5,16(sp)
	ld	a4,48(sp)
	lw	a5,8(a5)
	addiw	a4,a4,1
	sd	a4,48(sp)
	bgt	a5,a4,.L102
.L116:
	ld	a0,288(sp)
	call	free@plt
	ld	a0,296(sp)
	call	free@plt
	ld	a0,304(sp)
	call	free@plt
	ld	a0,312(sp)
	call	free@plt
	ld	a0,320(sp)
	call	pb_free@plt
	ld	a0,328(sp)
	call	po_free@plt
.L103:
	ld	a5,104(sp)
	ld	a0,64(a5)
	addi	a5,a5,-8
	mv	s1,a5
	sd	a5,104(sp)
	call	free@plt
	ld	a0,96(s1)
	call	free@plt
	bne	s0,s1,.L103
	ld	a0,384(sp)
	call	free@plt
	la	a5,__stack_chk_guard
	ld	a4,408(sp)
	ld	a5,0(a5)
	bne	a4,a5,.L164
	ld	ra,520(sp)
	ld	s0,512(sp)
	ld	s1,504(sp)
	ld	s2,496(sp)
	ld	s4,480(sp)
	ld	s5,472(sp)
	ld	s6,464(sp)
	ld	s7,456(sp)
	ld	s8,448(sp)
	ld	s9,440(sp)
	ld	s10,432(sp)
	ld	s11,424(sp)
	mv	a0,s3
	ld	s3,488(sp)
	addi	sp,sp,528
	jr	ra
.L123:
	beqz	a4,.L124
.L125:
	ld	a4,8(s3)
	addi	a4,a4,1
	sd	a4,8(s3)
	j	.L126
.L162:
	ld	a5,40(sp)
	ld	a3,32(a5)
	lw	a3,0(a3)
	bltz	a3,.L123
	beqz	a4,.L124
	ld	a0,0(a5)
	mv	s1,a5
	call	pm_lock@plt
	ld	a5,80(sp)
.L156:
	ld	a4,0(a5)
	ld	a0,0(s1)
	addi	a4,a4,1
	sd	a4,0(a5)
	call	pm_unlock@plt
	j	.L125
.L161:
	bne	s1,s5,.L121
	addi	a4,s2,-2
	seqz	a4,a4
	j	.L121
.L163:
	ld	a0,0(a5)
	mv	s1,a5
	call	pm_lock@plt
	lla	a5,.LANCHOR1
	j	.L156
.L160:
	ld	a1,56(sp)
	ld	a0,112(sp)
	li	a2,3
	call	perm_threads@plt
	j	.L114
.L159:
	ld	a1,120(sp)
	ld	a0,112(sp)
	li	a2,3
	call	perm_funs@plt
	j	.L111
.L157:
	ld	s1,40(sp)
	ld	a0,8(s1)
	call	pb_wait@plt
	lw	a5,24(s1)
	beqz	a5,.L165
.L155:
	ld	a5,40(sp)
	ld	a0,8(a5)
	call	pb_wait@plt
	j	.L106
.L158:
	ld	s1,40(sp)
	ld	a0,8(s1)
	call	pb_wait@plt
	ld	a5,48(sp)
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
.L107:
	lw	a3,0(a5)
	addi	a4,a4,4
	addi	a5,a5,4
	sw	a3,-4(a4)
	bne	a1,a4,.L107
	j	.L155
.L165:
	ld	a5,16(sp)
	ld	a0,112(sp)
	lw	a3,20(a5)
	lw	a2,24(a5)
	ld	a5,40(sp)
	ld	a1,32(a5)
	call	perm_prefix_ints@plt
	j	.L155
.L164:
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
	.string	"% Results for tests/non-mixed-size/SAFE/S+fence.rw.rw-[fr-ws]+fence.rw.rw.litmus %"
	.align	3
.LC13:
	.string	"RISCV S+fence.rw.rw-[fr-ws]+fence.rw.rw"
	.align	3
.LC14:
	.string	"\"Fence.rw.rwdWR FrLeave WsBack Rfe Fence.rw.rwdRW Wse\""
	.align	3
.LC15:
	.string	"{"
	.align	3
.LC16:
	.string	" 0:x5=2; 0:x6=x; 0:x8=y;"
	.align	3
.LC17:
	.string	" 1:x5=1; 1:x6=y;"
	.align	3
.LC18:
	.string	" 2:x6=y; 2:x7=1; 2:x8=x;"
	.align	3
.LC19:
	.string	"}"
	.align	3
.LC20:
	.string	" P0          | P1          | P2          ;"
	.align	3
.LC21:
	.string	" sw x5,0(x6) | sw x5,0(x6) | lw x5,0(x6) ;"
	.align	3
.LC22:
	.string	" fence rw,rw |             | fence rw,rw ;"
	.align	3
.LC23:
	.string	" lw x7,0(x8) |             | sw x7,0(x8) ;"
	.align	3
.LC24:
	.string	" sw x5,0(x8) |             |             ;"
	.align	3
.LC25:
	.string	""
	.align	3
.LC26:
	.string	"exists ([x]=2 /\\ [y]=2 /\\ 0:x7=0 /\\ 2:x5=2)"
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
	.string	"S+fence.rw.rw-[fr-ws]+fence.rw.rw: n=%i, r=%i, s=%i"
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
	.string	"S+fence.rw.rw-[fr-ws]+fence.rw.rw, sum_hist"
	.align	3
.LC42:
	.string	"Test S+fence.rw.rw-[fr-ws]+fence.rw.rw Allowed\n"
	.align	3
.LC43:
	.string	"Histogram (%d states)\n"
	.align	3
.LC44:
	.string	"Observation S+fence.rw.rw-[fr-ws]+fence.rw.rw %s %lu %lu\n"
	.align	3
.LC46:
	.string	"Time S+fence.rw.rw-[fr-ws]+fence.rw.rw %.2f\n"
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
	.string	"Hash=cae0da11c6d53fe32211783f621c68fd\n"
	.align	3
.LC52:
	.string	"Cycle=Rfe Fence.rw.rwdRW Wse Fence.rw.rwdWR FrLeave WsBack\n"
	.align	3
.LC53:
	.string	"Relax S+fence.rw.rw-[fr-ws]+fence.rw.rw %s %s\n"
	.align	3
.LC54:
	.string	"Safe=Rfe Wse Fence.rw.rwdWR Fence.rw.rwdRW FrLeave WsBack\n"
	.align	3
.LC55:
	.string	"Generator=diy7 (version 7.51+4(dev))\n"
	.align	3
.LC56:
	.string	"Com=Rf Ws Ws\n"
	.align	3
.LC57:
	.string	"Orig=Fence.rw.rwdWR FrLeave WsBack Rfe Fence.rw.rwdRW Wse\n"
	.align	3
.LC58:
	.string	"No"
	.align	3
.LC59:
	.string	"NOT "
	.align	3
.LC60:
	.string	"Affinity=[0, 1] [2] ; \n"
	.text
	.align	1
	.globl	S_2B_fence_2E_rw_2E_rw_2D__5B_fr_2D_ws_5D__2B_fence_2E_rw_2E_rw
	.type	S_2B_fence_2E_rw_2E_rw_2D__5B_fr_2D_ws_5D__2B_fence_2E_rw_2E_rw, @function
S_2B_fence_2E_rw_2E_rw_2D__5B_fr_2D_ws_5D__2B_fence_2E_rw_2E_rw:
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
	ble	a4,a5,.L253
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
.L169:
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
	bne	a5,t1,.L169
	ld	a6,0(a5)
	ld	a5,8(a5)
	mv	a1,s2
	mv	a0,s3
	sd	a5,8(a4)
	sd	a6,0(a4)
	call	parse_cmd@plt
	lw	a5,-160(s0)
	sd	sp,-504(s0)
	bnez	a5,.L254
.L170:
	call	timeofday@plt
	lw	a5,-264(s0)
	lw	a4,-252(s0)
	sd	a0,-512(s0)
	sw	a5,-416(s0)
	lw	a5,-256(s0)
	sw	a5,-412(s0)
	lw	a5,-260(s0)
	sw	a5,-408(s0)
	blez	a4,.L255
	lw	a5,-236(s0)
	sw	a4,-404(s0)
	li	a4,5
	beq	a5,a4,.L172
.L270:
	addiw	a5,a5,-3
	li	a4,2
	sgtu	a5,a5,a4
	li	s9,-1
.L173:
	lw	a4,-164(s0)
	sw	a5,-388(s0)
	beqz	a4,.L175
	sw	zero,-388(s0)
.L175:
	lw	a0,0(s5)
	li	a1,2
	call	coremap_seq@plt
	lw	s2,-248(s0)
	sd	a0,-384(s0)
	ld	s4,-216(s0)
	blez	s2,.L256
	lw	a2,0(s4)
	ble	s2,a2,.L177
	mv	a1,s2
	lla	a0,.LC29
	call	log_error@plt
	ld	s4,-216(s0)
.L177:
	lw	s6,-244(s0)
	blez	s6,.L178
.L271:
	slli	s7,s6,2
	addiw	a5,s6,-1
	slliw	s2,s6,1
	add	s7,s7,s6
	sd	a5,-440(s0)
	addw	s2,s2,s6
	slli	s8,a5,3
	sd	s6,-520(s0)
	slli	s7,s7,3
.L179:
	lw	a4,-236(s0)
	li	a5,2
	mv	s3,s2
	beq	a4,a5,.L257
.L180:
	slli	a5,s3,2
	addi	a5,a5,15
	lw	a3,-416(s0)
	andi	a5,a5,-16
	sub	sp,sp,a5
	sw	a4,-400(s0)
	sw	s3,-396(s0)
	sw	s2,-392(s0)
	mv	s10,sp
	bnez	a3,.L258
.L181:
	li	a5,2
	beq	a4,a5,.L259
	li	a5,3
	beq	a4,a5,.L260
	li	a5,5
	beq	a4,a5,.L261
.L190:
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
	blez	a5,.L262
	remw	a5,a5,a1
	sd	a5,-472(s0)
.L197:
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
	j	.L204
.L265:
	mv	a2,s3
	mv	a0,s11
	lla	a1,zyva
	addiw	s9,s9,1
	call	launch@plt
	addi	s3,s3,40
	addi	s11,s11,8
	addi	s10,s10,12
	beq	s6,s9,.L263
.L204:
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
	beq	a5,a4,.L264
.L199:
	ld	a5,-440(s0)
	bgt	a5,s9,.L265
	mv	a0,s3
	call	zyva
	addiw	s9,s9,1
	mv	s2,a0
	addi	s3,s3,40
	addi	s11,s11,8
	addi	s10,s10,12
	bne	s6,s9,.L204
.L263:
	lw	a5,-412(s0)
	lw	s6,-408(s0)
	mul	s6,s6,a5
	ld	a5,-440(s0)
	beqz	a5,.L211
	ld	a5,-440(s0)
	addiw	s3,a5,-1
	slli	s3,s3,32
	ld	a5,-480(s0)
	srli	s3,s3,32
	addi	s3,s3,1
	slli	s3,s3,3
	add	s11,a5,s3
	lla	s3,.LC41
.L210:
	mv	a0,s7
	call	join@plt
	mv	s8,a0
	ld	a0,0(a0)
	call	sum_outs@plt
	bne	s6,a0,.L208
	ld	a6,8(s8)
	ld	a2,16(s8)
	add	a4,a6,a2
	beq	s6,a4,.L209
.L208:
	mv	a0,s3
	call	fatal@plt
	ld	a6,8(s8)
	ld	a2,16(s8)
.L209:
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
	bne	s11,s7,.L210
.L211:
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
	bne	s6,a0,.L206
	ld	s4,8(s2)
	ld	s7,16(s2)
	add	a5,s4,s7
	beq	s6,a5,.L212
.L206:
	lla	a0,.LC41
	call	fatal@plt
	ld	s4,8(s2)
	ld	s7,16(s2)
.L212:
	li	a2,47
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
	li	a4,4
	addi	a3,s0,-152
	lla	a1,do_dump_outcome
	mv	a0,s1
	call	dump_outs@plt
	beqz	s4,.L266
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
	li	a2,59
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
	li	a2,58
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
	li	a2,58
	li	a1,1
	lla	a0,.LC57
	call	fwrite@plt
	lw	a4,-236(s0)
	li	a5,3
	beq	a4,a5,.L267
.L217:
	lla	s6,.LC8
	bnez	s7,.L268
.L215:
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
	ld	a0,-384(s0)
	call	cpus_free@plt
	ld	a5,-216(s0)
	ld	sp,-504(s0)
	beq	a5,s5,.L168
	mv	a0,s5
.L253:
	call	cpus_free@plt
.L168:
	la	a5,__stack_chk_guard
	ld	a4,-120(s0)
	ld	a5,0(a5)
	bne	a4,a5,.L269
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
.L255:
	lw	a5,-236(s0)
	li	a4,3
	sw	a4,-404(s0)
	li	a4,5
	bne	a5,a4,.L270
.L172:
	ld	a2,-208(s0)
	li	a1,3
	lla	a0,.LANCHOR2
	call	find_string@plt
	mv	s9,a0
	bltz	a0,.L174
	lw	a5,-236(s0)
	li	a4,2
	addiw	a5,a5,-3
	sgtu	a5,a5,a4
	j	.L173
.L256:
	lw	s6,-244(s0)
	lw	s2,0(s4)
	bgtz	s6,.L271
.L178:
	li	a5,2
	ble	s2,a5,.L220
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
	bne	a4,a5,.L180
.L257:
	lw	a0,0(s4)
	mv	a1,s2
	call	max@plt
	lw	a4,-236(s0)
	mv	s3,a0
	j	.L180
.L254:
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
	j	.L170
.L264:
	ld	a0,8(s4)
.L201:
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
	beq	s8,a4,.L272
	bne	a3,s10,.L201
	j	.L199
.L272:
	ld	a4,-496(s0)
	addiw	a5,s8,1
	remw	s8,a5,a4
	sd	s8,-448(s0)
	bne	a3,s10,.L201
	j	.L199
.L266:
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
	li	a2,59
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
	li	a2,58
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
	li	a2,58
	li	a1,1
	lla	a0,.LC57
	call	fwrite@plt
	lw	a4,-236(s0)
	li	a5,3
	lla	s6,.LC7
	bne	a4,a5,.L215
	mv	a3,s1
	li	a2,23
	li	a1,1
	lla	a0,.LC60
	call	fwrite@plt
	j	.L215
.L262:
	blez	a1,.L222
	ld	a4,8(s4)
	li	a5,0
	li	a3,-1
.L198:
	sw	a3,0(a4)
	lw	a1,0(s4)
	addiw	a5,a5,1
	addi	a4,a4,4
	blt	a5,a1,.L198
.L222:
	li	a5,1
	sd	a5,-472(s0)
	j	.L197
.L259:
	blez	s3,.L190
	ld	a2,8(s4)
	mv	a3,s10
	li	a4,0
.L191:
	lw	a5,0(s4)
	addi	a3,a3,4
	remw	a5,a4,a5
	addiw	a4,a4,1
	slli	a5,a5,2
	add	a5,a2,a5
	lw	a5,0(a5)
	sw	a5,-4(a3)
	bne	s3,a4,.L191
	j	.L190
.L258:
	lw	a3,-412(s0)
	lw	a2,-408(s0)
	mv	a1,s6
	lla	a0,.LC30
	call	log_error@plt
	lw	a1,-404(s0)
	lla	a0,.LC31
	call	log_error@plt
	lw	a5,-236(s0)
	li	a4,1
	beq	a5,a4,.L273
	li	a4,2
	beq	a5,a4,.L274
	li	a4,3
	beq	a5,a4,.L275
	li	a4,4
	beq	a5,a4,.L276
.L183:
	lla	a0,.LC36
	call	log_error@plt
	la	s11,stderr
	ld	a1,-216(s0)
	ld	a0,0(s11)
	call	cpus_dump@plt
	lla	a0,.LC37
	call	log_error@plt
	lla	a0,.LC38
	call	log_error@plt
	lw	a4,-416(s0)
	li	a5,1
	ble	a4,a5,.L252
	ld	a5,-384(s0)
	beqz	a5,.L252
	lla	a0,.LC39
	call	log_error@plt
	ld	a0,0(s11)
	ld	a1,-384(s0)
	call	cpus_dump@plt
	lla	a0,.LC38
	call	log_error@plt
.L252:
	lw	a4,-236(s0)
	j	.L181
.L268:
	lla	s6,.LC9
	j	.L215
.L220:
	li	a5,1
	li	s7,40
	sd	a5,-520(s0)
	li	s8,0
	sd	zero,-440(s0)
	li	s2,3
	li	s6,1
	j	.L179
.L261:
	slliw	a0,s9,1
	addw	s9,a0,s9
	slli	a0,s9,2
	lla	s9,.LANCHOR0
	add	s9,s9,a0
	blez	s3,.L190
	addiw	a5,s3,-1
	slli	a5,a5,32
	srli	a5,a5,32
	addi	a5,a5,1
	slli	a5,a5,2
	mv	a4,s10
	add	a5,s9,a5
.L195:
	lw	a3,0(s9)
	addi	s9,s9,4
	addi	a4,a4,4
	sw	a3,-4(a4)
	bne	s9,a5,.L195
	j	.L190
.L260:
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
	beqz	a5,.L190
	lla	a0,.LC40
	call	log_error@plt
	la	a5,stderr
	ld	a3,-384(s0)
	ld	a0,0(a5)
	li	a4,3
	mv	a2,s3
	mv	a1,s10
	call	cpus_dump_test@plt
	j	.L190
.L267:
	mv	a3,s1
	li	a2,23
	li	a1,1
	lla	a0,.LC60
	call	fwrite@plt
	j	.L217
.L273:
	lw	a1,-224(s0)
	lla	a0,.LC32
	call	log_error@plt
	j	.L183
.L274:
	lla	a0,.LC33
	call	log_error@plt
	j	.L183
.L174:
	ld	a1,-208(s0)
	lla	a0,.LC28
	call	log_error@plt
	li	a5,4
	sw	a5,-236(s0)
	sd	zero,-208(s0)
	li	a5,0
	j	.L173
.L275:
	lla	a0,.LC34
	call	log_error@plt
	j	.L183
.L276:
	lla	a0,.LC35
	call	log_error@plt
	j	.L183
.L269:
	call	__stack_chk_fail@plt
	.size	S_2B_fence_2E_rw_2E_rw_2D__5B_fr_2D_ws_5D__2B_fence_2E_rw_2E_rw, .-S_2B_fence_2E_rw_2E_rw_2D__5B_fr_2D_ws_5D__2B_fence_2E_rw_2E_rw
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
	.type	color_1, @object
	.size	color_1, 8
color_1:
	.word	2
	.word	-1
	.type	color_0, @object
	.size	color_0, 12
color_0:
	.word	0
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
	.size	color, 24
color:
	.dword	color_0
	.dword	color_1
	.dword	0
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
