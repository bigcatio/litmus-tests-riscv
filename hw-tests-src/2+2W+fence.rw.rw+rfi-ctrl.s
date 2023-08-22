	.file	"2+2W+fence.rw.rw+rfi-ctrl.c"
	.option pic
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"%-6lu%c>1:x7=%d; [x]=%d; [y]=%d;\n"
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
	.string	"2+2W+fence.rw.rw+rfi-ctrl, check_globals failed"
	.text
	.align	1
	.type	check_globals, @function
check_globals:
	ld	a5,88(a0)
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
	addi	s1,a0,80
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
	ld	a0,24(s5)
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
	ld	a5,88(a1)
	addi	sp,sp,-112
	sd	s8,32(sp)
	mv	s8,a0
	ld	a0,24(a1)
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
	addi	s6,s1,40
	addi	s5,s1,56
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
	ld	a0,32(s1)
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
	ld	a0,32(s1)
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
	.string	"2+2W+fence.rw.rw+rfi-ctrl"
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
# 47 "2+2W+fence.rw.rw+rfi-ctrl.c" 1
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
	lw	t1,0(s1)
	ld	t4,72(s0)
	lw	a7,12(a5)
	lw	t0,4(a5)
	blez	a7,.L48
	sub	t6,t0,a7
	negw	a6,a7
	subw	t5,t0,a7
	slli	t6,t6,2
	sext.w	t0,t0
	slli	a6,a6,2
	sext.w	t1,t1
	li	a0,1
	li	t3,2
.L47:
	sext.w	a2,t5
	mv	a3,t6
	bltz	t5,.L52
.L51:
	andi	a5,a2,1
	add	a4,t4,a3
	beq	a5,t1,.L61
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
# 277 "2+2W+fence.rw.rw+rfi-ctrl.c" 1
	
#START _litmus_P1
#_litmus_P1_0
	sw t3,0(a5)
#_litmus_P1_1
	lw a1,0(a5)
#_litmus_P1_2
	bne a1,x0,0f
#_litmus_P1_3
0:
#_litmus_P1_4
	sw a0,0(a4)
#END _litmus_P1

# 0 "" 2
#NO_APP
	ld	a5,16(s0)
	subw	a2,a2,a7
	add	a5,a5,a3
	sw	a1,0(a5)
	add	a3,a3,a6
	bgez	a2,.L51
.L52:
	addiw	t5,t5,1
	addi	t6,t6,4
	bne	t5,t0,.L47
.L48:
	mv	a1,s0
	li	a0,1
	call	stabilize_globals
#APP
# 47 "2+2W+fence.rw.rw+rfi-ctrl.c" 1
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
	sw	a0,0(a4)
#APP
# 47 "2+2W+fence.rw.rw+rfi-ctrl.c" 1
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
# 47 "2+2W+fence.rw.rw+rfi-ctrl.c" 1
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
# 242 "2+2W+fence.rw.rw+rfi-ctrl.c" 1
	
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
# 47 "2+2W+fence.rw.rw+rfi-ctrl.c" 1
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
# 47 "2+2W+fence.rw.rw+rfi-ctrl.c" 1
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
	.string	"2+2W+fence.rw.rw+rfi-ctrl, global x unstabilized"
	.align	3
.LC6:
	.string	"2+2W+fence.rw.rw+rfi-ctrl, global y unstabilized"
	.text
	.align	1
	.type	zyva, @function
zyva:
	addi	sp,sp,-400
	la	a5,__stack_chk_guard
	ld	a5,0(a5)
	sd	s6,336(sp)
	mv	s6,a0
	ld	a0,8(a0)
	sd	ra,392(sp)
	sd	s0,384(sp)
	sd	s1,376(sp)
	sd	s3,360(sp)
	sd	a5,280(sp)
	ld	s3,16(s6)
	sd	s2,368(sp)
	sd	s4,352(sp)
	sd	s5,344(sp)
	sd	s7,328(sp)
	sd	s8,320(sp)
	sd	s9,312(sp)
	sd	s10,304(sp)
	sd	s11,296(sp)
	call	pb_wait@plt
	lla	a5,P0
	sd	a5,96(sp)
	li	a0,24
	lla	a5,P1
	sd	a5,104(sp)
	call	malloc_check@plt
	lw	s1,4(s3)
	sd	zero,0(a0)
	sd	zero,16(a0)
	sd	zero,8(a0)
	slli	s1,s1,2
	mv	s0,a0
	sd	s3,272(sp)
	call	rand@plt
	mv	a5,a0
	mv	a0,s1
	sw	a5,264(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s1
	sd	a5,200(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s1
	sd	a5,184(sp)
	call	malloc_check@plt
	mv	a5,a0
	li	a0,2
	sd	a5,192(sp)
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
	sd	a5,248(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s1
	sd	a5,224(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s1
	sd	a5,240(sp)
	call	malloc_check@plt
	ld	a4,32(s6)
	lw	a3,8(s3)
	li	a5,1
	sw	a5,160(sp)
	addi	a5,sp,184
	sd	a0,256(sp)
	sd	a5,176(sp)
	sd	a4,168(sp)
	sw	zero,136(sp)
	sd	a5,152(sp)
	sd	a4,144(sp)
	blez	a3,.L81
	addi	a5,sp,136
	sd	a5,48(sp)
	addi	a5,sp,160
	sd	a5,56(sp)
	addi	a5,sp,80
	sd	a5,24(sp)
	addi	a5,sp,88
	sd	a5,32(sp)
	li	s9,-237568
	addi	a5,sp,264
	sd	a5,64(sp)
	addiw	a5,s9,-1919
	sw	a5,12(sp)
	addi	a5,sp,96
	sd	zero,16(sp)
	sd	a5,72(sp)
.L102:
	lw	a5,16(s3)
	li	a4,2
	beq	a5,a4,.L126
	li	a4,4
	beq	a5,a4,.L127
.L84:
	lw	a4,0(s3)
	li	a5,1
	ble	a4,a5,.L85
	la	a5,stderr
	lw	a4,8(s3)
	ld	a0,0(a5)
	ld	a3,16(sp)
	lla	a2,.LC4
	li	a1,1
	call	__fprintf_chk@plt
.L85:
	ld	a5,272(sp)
	lw	a4,4(a5)
	addiw	a2,a4,-1
	slli	a3,a2,32
	sext.w	a5,a2
	bltz	a3,.L86
	slli	a2,a2,32
	srli	a2,a2,32
	sub	a2,a4,a2
	ld	a7,184(sp)
	ld	a6,192(sp)
	ld	a0,200(sp)
	ld	a1,256(sp)
	slli	a2,a2,2
	slli	a5,a5,2
	addi	a2,a2,-8
.L87:
	add	a4,a7,a5
	lw	s1,12(sp)
	sw	zero,0(a4)
	add	a4,a6,a5
	sw	zero,0(a4)
	add	a3,a0,a5
	add	a4,a1,a5
	sw	s1,0(a3)
	sw	zero,0(a4)
	addi	a5,a5,-4
	bne	a2,a5,.L87
.L86:
	lw	a5,28(s3)
	bnez	a5,.L128
.L88:
	ld	a1,104(sp)
	ld	a0,32(sp)
	ld	a2,56(sp)
	call	launch@plt
	ld	a2,48(sp)
	ld	a1,96(sp)
	ld	a0,24(sp)
	call	launch@plt
	lw	a5,28(s3)
	bnez	a5,.L129
.L89:
	ld	a0,32(sp)
	call	join@plt
	ld	a0,24(sp)
	call	join@plt
	lw	a4,4(s3)
	addiw	s2,a4,-1
	slli	a3,s2,32
	sext.w	a5,s2
	bltz	a3,.L90
	slli	s2,s2,32
	srli	s2,s2,32
	sub	s2,a4,s2
	ld	a4,16(sp)
	slli	s11,a5,2
	lla	a5,.LANCHOR1
	andi	a4,a4,1
	slli	a4,a4,3
	slli	s2,s2,2
	add	a5,a5,a4
	addi	s2,s2,-8
	addi	s5,sp,112
	lla	s8,.LC5
	lla	s7,.LC6
	sd	a5,40(sp)
	j	.L101
.L133:
	ld	a3,32(s6)
	lw	a3,0(a3)
	bltz	a3,.L97
	bnez	s10,.L130
.L98:
	ld	a4,16(s0)
	addi	s11,s11,-4
	addi	a4,a4,1
	sd	a4,16(s0)
	beq	s11,s2,.L90
.L101:
	ld	a3,192(sp)
	ld	a4,232(sp)
	add	a3,a3,s11
	add	a4,a4,s11
	lw	s4,0(a3)
	lw	a2,0(a4)
	ld	a3,200(sp)
	ld	a4,184(sp)
	add	a3,a3,s11
	add	a4,a4,s11
	lw	s1,0(a3)
	lw	s9,0(a4)
	beq	a2,s4,.L91
	mv	a0,s8
	call	fatal@plt
.L91:
	ld	a4,224(sp)
	add	a4,a4,s11
	lw	a4,0(a4)
	beq	a4,s4,.L92
	mv	a0,s8
	call	fatal@plt
.L92:
	ld	a4,248(sp)
	add	a4,a4,s11
	lw	a4,0(a4)
	beq	a4,s9,.L93
	mv	a0,s7
	call	fatal@plt
.L93:
	ld	a4,240(sp)
	add	a4,a4,s11
	lw	a4,0(a4)
	beq	a4,s9,.L94
	mv	a0,s7
	call	fatal@plt
.L94:
	li	a5,2
	li	s10,0
	beq	s1,a5,.L131
.L95:
	ld	a0,0(s0)
	li	a3,1
	li	a2,3
	mv	a4,s10
	mv	a1,s5
	sd	s1,112(sp)
	sd	s4,120(sp)
	sd	s9,128(sp)
	call	add_outcome_outs@plt
	lw	a3,16(s3)
	li	a2,4
	sd	a0,0(s0)
	beq	a3,a2,.L132
	li	a2,5
	beq	a3,a2,.L133
.L97:
	beqz	s10,.L98
.L99:
	ld	a4,8(s0)
	addi	s11,s11,-4
	addi	a4,a4,1
	sd	a4,8(s0)
	bne	s11,s2,.L101
.L90:
	ld	a4,16(sp)
	lw	a5,8(s3)
	addiw	a4,a4,1
	sd	a4,16(sp)
	bgt	a5,a4,.L102
.L81:
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
	ld	a0,248(sp)
	call	free@plt
	ld	a0,224(sp)
	call	free@plt
	ld	a0,240(sp)
	call	free@plt
	ld	a0,256(sp)
	call	free@plt
	la	a5,__stack_chk_guard
	ld	a4,280(sp)
	ld	a5,0(a5)
	bne	a4,a5,.L134
	ld	ra,392(sp)
	mv	a0,s0
	ld	s0,384(sp)
	ld	s1,376(sp)
	ld	s2,368(sp)
	ld	s3,360(sp)
	ld	s4,352(sp)
	ld	s5,344(sp)
	ld	s6,336(sp)
	ld	s7,328(sp)
	ld	s8,320(sp)
	ld	s9,312(sp)
	ld	s10,304(sp)
	ld	s11,296(sp)
	addi	sp,sp,400
	jr	ra
.L132:
	ld	a3,32(s6)
	lw	a3,0(a3)
	bltz	a3,.L97
	beqz	s10,.L98
	ld	a0,0(s6)
	call	pm_lock@plt
	ld	a5,40(sp)
.L125:
	ld	a4,0(a5)
	ld	a0,0(s6)
	addi	a4,a4,1
	sd	a4,0(a5)
	call	pm_unlock@plt
	j	.L99
.L131:
	bne	s4,s1,.L95
	addi	a4,s9,-2
	seqz	s10,a4
	j	.L95
.L130:
	ld	a0,0(s6)
	call	pm_lock@plt
	lla	a5,.LANCHOR1
	j	.L125
.L129:
	ld	a1,24(sp)
	ld	a0,64(sp)
	li	a2,2
	call	perm_threads@plt
	j	.L89
.L128:
	ld	a1,72(sp)
	ld	a0,64(sp)
	li	a2,2
	call	perm_funs@plt
	j	.L88
.L126:
	ld	a0,8(s6)
	call	pb_wait@plt
	lw	a5,24(s6)
	beqz	a5,.L135
.L83:
	ld	a0,8(s6)
	call	pb_wait@plt
	j	.L84
.L127:
	ld	a0,8(s6)
	call	pb_wait@plt
	ld	a5,16(sp)
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
	j	.L84
.L135:
	lw	a3,20(s3)
	lw	a2,24(s3)
	ld	a1,32(s6)
	ld	a0,64(sp)
	call	perm_prefix_ints@plt
	j	.L83
.L134:
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
	.string	"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
	.align	3
.LC11:
	.string	"%s\n"
	.align	3
.LC12:
	.string	"% Results for tests/non-mixed-size/RELAX/Rfi/2+2W+fence.rw.rw+rfi-ctrl.litmus %"
	.align	3
.LC13:
	.string	"RISCV 2+2W+fence.rw.rw+rfi-ctrl"
	.align	3
.LC14:
	.string	"\"Fence.rw.rwdWW Wse Rfi DpCtrldW Wse\""
	.align	3
.LC15:
	.string	"{"
	.align	3
.LC16:
	.string	" 0:x5=2; 0:x6=x; 0:x7=1; 0:x8=y;"
	.align	3
.LC17:
	.string	" 1:x5=2; 1:x6=y; 1:x8=1; 1:x9=x;"
	.align	3
.LC18:
	.string	"}"
	.align	3
.LC19:
	.string	" P0          | P1             ;"
	.align	3
.LC20:
	.string	" sw x5,0(x6) | sw x5,0(x6)    ;"
	.align	3
.LC21:
	.string	" fence rw,rw | lw x7,0(x6)    ;"
	.align	3
.LC22:
	.string	" sw x7,0(x8) | bne x7,x0,LC00 ;"
	.align	3
.LC23:
	.string	"             | LC00:          ;"
	.align	3
.LC24:
	.string	"             | sw x8,0(x9)    ;"
	.align	3
.LC25:
	.string	""
	.align	3
.LC26:
	.string	"exists ([x]=2 /\\ [y]=2 /\\ 1:x7=2)"
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
	.string	"2+2W+fence.rw.rw+rfi-ctrl: n=%i, r=%i, s=%i"
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
	.string	"2+2W+fence.rw.rw+rfi-ctrl, sum_hist"
	.align	3
.LC42:
	.string	"Test 2+2W+fence.rw.rw+rfi-ctrl Allowed\n"
	.align	3
.LC43:
	.string	"Histogram (%d states)\n"
	.align	3
.LC44:
	.string	"Observation 2+2W+fence.rw.rw+rfi-ctrl %s %lu %lu\n"
	.align	3
.LC46:
	.string	"Time 2+2W+fence.rw.rw+rfi-ctrl %.2f\n"
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
	.string	"Hash=5c12739e9c79dc47d0ed11308c8a980e\n"
	.align	3
.LC52:
	.string	"Cycle=Rfi DpCtrldW Wse Fence.rw.rwdWW Wse\n"
	.align	3
.LC53:
	.string	"Rfi"
	.align	3
.LC54:
	.string	"Relax 2+2W+fence.rw.rw+rfi-ctrl %s %s\n"
	.align	3
.LC55:
	.string	"Safe=Wse Fence.rw.rwdWW DpCtrldW\n"
	.align	3
.LC56:
	.string	"Generator=diy7 (version 7.51+4(dev))\n"
	.align	3
.LC57:
	.string	"Com=Ws Ws\n"
	.align	3
.LC58:
	.string	"Orig=Fence.rw.rwdWW Wse Rfi DpCtrldW Wse\n"
	.align	3
.LC59:
	.string	"No"
	.align	3
.LC60:
	.string	"NOT "
	.align	3
.LC61:
	.string	"Affinity=[1] [0] ; \n"
	.text
	.align	1
	.globl	_X2_2B_2W_2B_fence_2E_rw_2E_rw_2B_rfi_2D_ctrl
	.type	_X2_2B_2W_2B_fence_2E_rw_2E_rw_2B_rfi_2D_ctrl, @function
_X2_2B_2W_2B_fence_2E_rw_2E_rw_2B_rfi_2D_ctrl:
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
	ble	a4,a5,.L222
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
.L139:
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
	bne	a5,t1,.L139
	ld	a6,0(a5)
	ld	a5,8(a5)
	mv	a1,s2
	mv	a0,s3
	sd	a5,8(a4)
	sd	a6,0(a4)
	call	parse_cmd@plt
	lw	a5,-152(s0)
	sd	sp,-480(s0)
	bnez	a5,.L223
.L140:
	call	timeofday@plt
	lw	a5,-256(s0)
	lw	a4,-244(s0)
	sd	a0,-488(s0)
	sw	a5,-408(s0)
	lw	a5,-248(s0)
	sw	a5,-404(s0)
	lw	a5,-252(s0)
	sw	a5,-400(s0)
	blez	a4,.L224
	lw	a5,-228(s0)
	sw	a4,-396(s0)
	li	a4,5
	beq	a5,a4,.L142
.L239:
	addiw	a5,a5,-3
	li	a4,2
	sgtu	a5,a5,a4
	li	s9,-1
.L143:
	lw	a4,-156(s0)
	sw	a5,-380(s0)
	beqz	a4,.L145
	sw	zero,-380(s0)
.L145:
	lw	a0,0(s5)
	li	a1,2
	call	coremap_seq@plt
	lw	s2,-240(s0)
	sd	a0,-376(s0)
	ld	s4,-208(s0)
	blez	s2,.L225
	lw	a2,0(s4)
	ble	s2,a2,.L147
	mv	a1,s2
	lla	a0,.LC29
	call	log_error@plt
	ld	s4,-208(s0)
.L147:
	lw	s6,-236(s0)
	blez	s6,.L148
.L240:
	slli	s7,s6,2
	addiw	a5,s6,-1
	add	s7,s7,s6
	slliw	s2,s6,1
	sd	a5,-432(s0)
	slli	s8,a5,3
	sd	s6,-496(s0)
	slli	s7,s7,3
.L149:
	lw	a4,-228(s0)
	li	a5,2
	mv	s11,s2
	beq	a4,a5,.L226
.L150:
	slli	a5,s11,2
	addi	a5,a5,15
	lw	a3,-408(s0)
	andi	a5,a5,-16
	sub	sp,sp,a5
	sw	s2,-384(s0)
	sw	a4,-392(s0)
	sw	s11,-388(s0)
	mv	s2,sp
	bnez	a3,.L227
.L151:
	li	a5,2
	beq	a4,a5,.L228
	li	a5,3
	beq	a4,a5,.L229
	li	a5,5
	beq	a4,a5,.L230
.L160:
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
	blez	s7,.L231
	remw	a5,s7,a1
	sd	a5,-424(s0)
.L167:
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
	j	.L174
.L234:
	mv	a0,s3
	lla	a1,zyva
	sd	a2,-464(s0)
	call	launch@plt
	ld	a2,-464(s0)
	addiw	s10,s10,1
	addi	s3,s3,8
	addi	a2,a2,40
	addi	s7,s7,8
	beq	s6,s10,.L232
.L174:
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
	beq	a1,a5,.L233
.L169:
	ld	a5,-432(s0)
	bgt	a5,s10,.L234
	mv	a0,a2
	sd	a2,-464(s0)
	call	zyva
	ld	a2,-464(s0)
	addiw	s10,s10,1
	mv	s2,a0
	addi	a2,a2,40
	addi	s3,s3,8
	addi	s7,s7,8
	bne	s6,s10,.L174
.L232:
	lw	a5,-404(s0)
	lw	s6,-400(s0)
	mul	s6,s6,a5
	ld	a5,-432(s0)
	beqz	a5,.L181
	ld	a5,-432(s0)
	addiw	s3,a5,-1
	slli	s3,s3,32
	ld	a5,-456(s0)
	srli	s3,s3,32
	addi	s3,s3,1
	slli	s3,s3,3
	add	s11,a5,s3
	lla	s3,.LC41
.L180:
	mv	a0,s8
	call	join@plt
	mv	s7,a0
	ld	a0,0(a0)
	call	sum_outs@plt
	bne	s6,a0,.L178
	ld	a2,8(s7)
	ld	a3,16(s7)
	add	a5,a2,a3
	beq	s6,a5,.L179
.L178:
	mv	a0,s3
	call	fatal@plt
	ld	a2,8(s7)
	ld	a3,16(s7)
.L179:
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
	bne	s8,s11,.L180
.L181:
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
	bne	s6,a0,.L176
	ld	s4,8(s2)
	ld	s7,16(s2)
	add	a5,s4,s7
	beq	s6,a5,.L182
.L176:
	lla	a0,.LC41
	call	fatal@plt
	ld	s4,8(s2)
	ld	s7,16(s2)
.L182:
	li	a2,39
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
	beqz	s4,.L235
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
	li	a2,42
	li	a1,1
	lla	a0,.LC52
	call	fwrite@plt
	lla	a4,.LC53
	lla	a2,.LC54
	li	a1,1
	lla	a3,.LC47
	mv	a0,s1
	call	__fprintf_chk@plt
	mv	a3,s1
	li	a2,33
	li	a1,1
	lla	a0,.LC55
	call	fwrite@plt
	mv	a3,s1
	li	a2,37
	li	a1,1
	lla	a0,.LC56
	call	fwrite@plt
	mv	a3,s1
	li	a2,10
	li	a1,1
	lla	a0,.LC57
	call	fwrite@plt
	mv	a3,s1
	li	a2,41
	li	a1,1
	lla	a0,.LC58
	call	fwrite@plt
	lw	a4,-228(s0)
	li	a5,3
	beq	a4,a5,.L236
.L187:
	lla	s6,.LC8
	bnez	s7,.L237
.L185:
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
	ld	sp,-480(s0)
	beq	a5,s5,.L138
	mv	a0,s5
.L222:
	call	cpus_free@plt
.L138:
	la	a5,__stack_chk_guard
	ld	a4,-120(s0)
	ld	a5,0(a5)
	bne	a4,a5,.L238
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
.L224:
	lw	a5,-228(s0)
	li	a4,2
	sw	a4,-396(s0)
	li	a4,5
	bne	a5,a4,.L239
.L142:
	ld	a2,-200(s0)
	li	a1,2
	lla	a0,.LANCHOR2
	call	find_string@plt
	mv	s9,a0
	bltz	a0,.L144
	lw	a5,-228(s0)
	li	a4,2
	addiw	a5,a5,-3
	sgtu	a5,a5,a4
	j	.L143
.L225:
	lw	s6,-236(s0)
	lw	s2,0(s4)
	bgtz	s6,.L240
.L148:
	li	a5,1
	ble	s2,a5,.L190
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
	bne	a4,a5,.L150
.L226:
	lw	a0,0(s4)
	mv	a1,s2
	call	max@plt
	lw	a4,-228(s0)
	mv	s11,a0
	j	.L150
.L233:
	ld	a1,8(s4)
	slli	a0,s9,2
	ld	a5,-424(s0)
	add	a0,a1,a0
	lw	a0,0(a0)
	addw	a5,a5,s9
	sw	a0,-8(s7)
	lw	a0,0(s4)
	remw	a5,a5,a0
	bne	a5,s11,.L170
	ld	a5,-504(s0)
	addiw	a4,s11,1
	remw	s11,a4,a5
	mv	a5,s11
.L170:
	slli	a0,a5,2
	add	a1,a1,a0
	lw	a1,0(a1)
	ld	a4,-424(s0)
	sw	a1,-4(s7)
	lw	a1,0(s4)
	addw	a5,a4,a5
	remw	s9,a5,a1
	bne	s9,s11,.L169
	ld	a5,-504(s0)
	addiw	a4,s11,1
	remw	s11,a4,a5
	mv	s9,s11
	j	.L169
.L235:
	lla	a2,.LC11
	li	a1,1
	lla	a3,.LC59
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
	lla	a4,.LC60
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
	li	a2,42
	li	a1,1
	lla	a0,.LC52
	call	fwrite@plt
	lla	a4,.LC53
	lla	a2,.LC54
	li	a1,1
	lla	a3,.LC59
	mv	a0,s1
	call	__fprintf_chk@plt
	mv	a3,s1
	li	a2,33
	li	a1,1
	lla	a0,.LC55
	call	fwrite@plt
	mv	a3,s1
	li	a2,37
	li	a1,1
	lla	a0,.LC56
	call	fwrite@plt
	mv	a3,s1
	li	a2,10
	li	a1,1
	lla	a0,.LC57
	call	fwrite@plt
	mv	a3,s1
	li	a2,41
	li	a1,1
	lla	a0,.LC58
	call	fwrite@plt
	lw	a4,-228(s0)
	li	a5,3
	lla	s6,.LC7
	bne	a4,a5,.L185
	mv	a3,s1
	li	a2,20
	li	a1,1
	lla	a0,.LC61
	call	fwrite@plt
	j	.L185
.L231:
	blez	a1,.L192
	ld	a4,8(s4)
	li	a5,0
	li	a3,-1
.L168:
	sw	a3,0(a4)
	lw	a1,0(s4)
	addiw	a5,a5,1
	addi	a4,a4,4
	blt	a5,a1,.L168
.L192:
	li	a5,1
	sd	a5,-424(s0)
	j	.L167
.L228:
	blez	s11,.L160
	ld	a2,8(s4)
	mv	a3,s2
	li	a4,0
.L161:
	lw	a5,0(s4)
	addi	a3,a3,4
	remw	a5,a4,a5
	addiw	a4,a4,1
	slli	a5,a5,2
	add	a5,a2,a5
	lw	a5,0(a5)
	sw	a5,-4(a3)
	bne	s11,a4,.L161
	j	.L160
.L227:
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
	beq	a5,a4,.L241
	li	a4,2
	beq	a5,a4,.L242
	li	a4,3
	beq	a5,a4,.L243
	li	a4,4
	beq	a5,a4,.L244
.L153:
	lla	a0,.LC36
	call	log_error@plt
	la	s10,stderr
	ld	a1,-208(s0)
	ld	a0,0(s10)
	call	cpus_dump@plt
	lla	a0,.LC37
	call	log_error@plt
	lla	a0,.LC38
	call	log_error@plt
	lw	a4,-408(s0)
	li	a5,1
	ble	a4,a5,.L221
	ld	a5,-376(s0)
	beqz	a5,.L221
	lla	a0,.LC39
	call	log_error@plt
	ld	a0,0(s10)
	ld	a1,-376(s0)
	call	cpus_dump@plt
	lla	a0,.LC38
	call	log_error@plt
.L221:
	lw	a4,-228(s0)
	j	.L151
.L223:
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
	j	.L140
.L237:
	lla	s6,.LC9
	j	.L185
.L190:
	li	a5,1
	li	s7,40
	sd	a5,-496(s0)
	li	s8,0
	sd	zero,-432(s0)
	li	s2,2
	li	s6,1
	j	.L149
.L230:
	slliw	s9,s9,2
	slli	s9,s9,2
	lla	a4,.LANCHOR0
	add	a4,a4,s9
	blez	s11,.L160
	addiw	a5,s11,-1
	slli	a5,a5,32
	srli	a5,a5,32
	addi	a5,a5,1
	slli	a5,a5,2
	mv	a3,s2
	add	a5,a4,a5
.L165:
	lw	a2,0(a4)
	addi	a4,a4,4
	addi	a3,a3,4
	sw	a2,-4(a3)
	bne	a4,a5,.L165
	j	.L160
.L229:
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
	beqz	a5,.L160
	lla	a0,.LC40
	call	log_error@plt
	la	a5,stderr
	ld	a3,-376(s0)
	ld	a0,0(a5)
	li	a4,2
	mv	a2,s11
	mv	a1,s2
	call	cpus_dump_test@plt
	j	.L160
.L236:
	mv	a3,s1
	li	a2,20
	li	a1,1
	lla	a0,.LC61
	call	fwrite@plt
	j	.L187
.L241:
	lw	a1,-216(s0)
	lla	a0,.LC32
	call	log_error@plt
	j	.L153
.L242:
	lla	a0,.LC33
	call	log_error@plt
	j	.L153
.L144:
	ld	a1,-200(s0)
	lla	a0,.LC28
	call	log_error@plt
	li	a5,4
	sw	a5,-228(s0)
	sd	zero,-200(s0)
	li	a5,0
	j	.L143
.L243:
	lla	a0,.LC34
	call	log_error@plt
	j	.L153
.L244:
	lla	a0,.LC35
	call	log_error@plt
	j	.L153
.L238:
	call	__stack_chk_fail@plt
	.size	_X2_2B_2W_2B_fence_2E_rw_2E_rw_2B_rfi_2D_ctrl, .-_X2_2B_2W_2B_fence_2E_rw_2E_rw_2B_rfi_2D_ctrl
	.section	.rodata.str1.8
	.align	3
.LC62:
	.string	"[[0],[1]]"
	.align	3
.LC63:
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
