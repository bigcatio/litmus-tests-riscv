	.file	"S+fence.rw.rw+ctrl-wsi-rfi-data.c"
	.option pic
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"%-6lu%c>1:x5=%d; 1:x10=%d; [x]=%d; [z]=%d;\n"
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
	.string	"S+fence.rw.rw+ctrl-wsi-rfi-data, check_globals failed"
	.text
	.align	1
	.type	check_globals, @function
check_globals:
	ld	a5,104(a0)
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
	bltz	a4,.L13
	sext.w	s0,a5
	slli	a5,a5,32
	srli	a5,a5,32
	sub	s2,s2,a5
	slli	s2,s2,2
	addi	s1,a0,96
	slli	s0,s0,2
	addi	s2,s2,-8
	lla	s7,.LC1
.L12:
	mv	a0,s1
	call	rand_bit@plt
	add	a5,s3,s0
	beqz	a0,.L9
	lw	a5,0(a5)
	bnez	a5,.L34
.L9:
	mv	a0,s1
	call	rand_bit@plt
	add	a5,s4,s0
	beqz	a0,.L10
	lw	a5,0(a5)
	bnez	a5,.L35
.L10:
	mv	a0,s1
	call	rand_bit@plt
	add	a5,s5,s0
	addi	s0,s0,-4
	beqz	a0,.L11
	lw	a5,0(a5)
	bnez	a5,.L36
.L11:
	bne	s0,s2,.L12
.L13:
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
.L36:
	mv	a0,s7
	call	fatal@plt
	bne	s0,s2,.L12
	j	.L13
.L34:
	mv	a0,s7
	call	fatal@plt
	j	.L9
.L35:
	mv	a0,s7
	call	fatal@plt
	j	.L10
	.size	check_globals, .-check_globals
	.section	.rodata.str1.8
	.align	3
.LC2:
	.string	"%i: Stabilizing final state!\n"
	.text
	.align	1
	.type	stabilize_globals, @function
stabilize_globals:
	ld	a5,104(a1)
	addi	sp,sp,-112
	sd	s8,32(sp)
	mv	s8,a0
	ld	a0,40(a1)
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
	ld	s9,16(a1)
	ld	s11,0(a1)
	sd	ra,104(sp)
	call	pb_wait@plt
	addiw	a4,s7,-1
	slli	s0,a4,32
	addiw	a5,s8,1
	srli	s0,s0,32
	andi	a5,a5,1
	sub	s0,s7,s0
	addi	s6,s1,56
	addi	s5,s1,72
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
.L45:
	ld	a0,48(s1)
	blez	s7,.L38
	ld	a7,0(s4)
	ld	a6,0(s3)
	mv	a5,s2
.L39:
	add	a4,s9,a5
	lw	a1,0(a4)
	add	a3,a7,a5
	add	a4,s11,a5
	sw	a1,0(a3)
	lw	a3,0(a4)
	add	a4,a6,a5
	addi	a5,a5,-4
	sw	a3,0(a4)
	bne	a5,s10,.L39
	call	po_reinit@plt
	ld	a7,0(s4)
	ld	a6,0(s6)
	ld	a0,0(s3)
	ld	a1,0(s5)
	mv	a3,s2
.L43:
	add	a4,a0,a3
	add	a5,a1,a3
	lw	a4,0(a4)
	lw	a5,0(a5)
	beq	a4,a5,.L53
.L41:
	mv	a1,s8
	lla	a0,.LC2
	call	log_error@plt
	li	a1,1
.L44:
	ld	a0,48(s1)
	call	po_wait@plt
	bnez	a0,.L45
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
.L53:
	add	a4,a7,a3
	add	a5,a6,a3
	lw	a4,0(a4)
	lw	a5,0(a5)
	beq	s0,a3,.L42
	addi	a3,a3,-4
	beq	a4,a5,.L43
	j	.L41
.L42:
	li	a1,0
	beq	a4,a5,.L44
	j	.L41
.L38:
	call	po_reinit@plt
	li	a1,0
	j	.L44
	.size	stabilize_globals, .-stabilize_globals
	.section	.rodata.str1.8
	.align	3
.LC3:
	.string	"S+fence.rw.rw+ctrl-wsi-rfi-data"
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
# 47 "S+fence.rw.rw+ctrl-wsi-rfi-data.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	ld	s0,16(a0)
	lw	a4,0(a0)
	ld	a5,8(a0)
	ld	a3,104(s0)
	slli	a4,a4,2
	add	a5,a5,a4
	lw	a0,0(a5)
	lw	a2,0(a3)
	li	a1,4
	lla	a3,.LC3
	call	force_one_affinity@plt
	mv	a0,s0
	call	check_globals
	ld	a5,104(s0)
	lw	t4,0(s1)
	ld	t5,88(s0)
	lw	t3,12(a5)
	lw	t2,4(a5)
	blez	t3,.L58
	sub	t0,t2,t3
	negw	t1,t3
	subw	t6,t2,t3
	slli	t0,t0,2
	sext.w	t2,t2
	slli	t1,t1,2
	sext.w	t4,t4
	li	a0,1
	li	a6,2
.L57:
	sext.w	a1,t6
	mv	a4,t0
	bltz	t6,.L62
.L61:
	andi	a5,a1,1
	add	a3,t5,a4
	beq	a5,t4,.L71
.L59:
	lw	a5,0(a3)
	sext.w	a5,a5
	beqz	a5,.L59
.L60:
	ld	a5,8(s0)
	ld	a3,0(s0)
	ld	a2,16(s0)
	add	a5,a5,a4
	add	a3,a3,a4
	add	a2,a2,a4
#APP
# 288 "S+fence.rw.rw+ctrl-wsi-rfi-data.c" 1
	
#START _litmus_P1
#_litmus_P1_0
	lw a7,0(a5)
#_litmus_P1_1
	bne a7,x0,0f
#_litmus_P1_2
0:
#_litmus_P1_3
	sw a0,0(a3)
#_litmus_P1_4
	sw a6,0(a3)
#_litmus_P1_5
	lw ra,0(a3)
#_litmus_P1_6
	xor s1,ra,ra
#_litmus_P1_7
	ori s1,s1,1
#_litmus_P1_8
	sw s1,0(a2)
#END _litmus_P1

# 0 "" 2
#NO_APP
	ld	a3,32(s0)
	ld	a5,24(s0)
	subw	a1,a1,t3
	add	a3,a3,a4
	add	a5,a5,a4
	sw	ra,0(a3)
	sw	a7,0(a5)
	add	a4,a4,t1
	bgez	a1,.L61
.L62:
	addiw	t6,t6,1
	addi	t0,t0,4
	bne	t6,t2,.L57
.L58:
	mv	a1,s0
	li	a0,1
	call	stabilize_globals
#APP
# 47 "S+fence.rw.rw+ctrl-wsi-rfi-data.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	li	a0,0
	addi	sp,sp,32
	jr	ra
.L71:
	sw	a0,0(a3)
#APP
# 47 "S+fence.rw.rw+ctrl-wsi-rfi-data.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	j	.L60
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
# 47 "S+fence.rw.rw+ctrl-wsi-rfi-data.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	ld	s0,16(a0)
	lw	a4,0(a0)
	ld	a5,8(a0)
	ld	a3,104(s0)
	slli	a4,a4,2
	add	a5,a5,a4
	lw	a0,0(a5)
	lw	a2,0(a3)
	li	a1,4
	lla	a3,.LC3
	call	force_one_affinity@plt
	mv	a0,s0
	call	check_globals
	ld	a5,104(s0)
	lw	a7,0(s1)
	ld	t3,88(s0)
	lw	a6,12(a5)
	lw	t6,4(a5)
	blez	a6,.L76
	sub	t5,t6,a6
	negw	a0,a6
	subw	t4,t6,a6
	slli	t5,t5,2
	sext.w	t6,t6
	slli	a0,a0,2
	sext.w	a7,a7
	li	a1,1
	li	t1,2
.L75:
	sext.w	a2,t4
	mv	a3,t5
	bltz	t4,.L80
.L79:
	andi	a5,a2,1
	add	a4,t3,a3
	beq	a5,a7,.L89
.L77:
	lw	a5,0(a4)
	sext.w	a5,a5
	beqz	a5,.L77
.L78:
	ld	a5,16(s0)
	ld	a4,8(s0)
	add	a5,a5,a3
	add	a4,a4,a3
#APP
# 252 "S+fence.rw.rw+ctrl-wsi-rfi-data.c" 1
	
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
	bgez	a2,.L79
.L80:
	addiw	t4,t4,1
	addi	t5,t5,4
	bne	t4,t6,.L75
.L76:
	mv	a1,s0
	li	a0,0
	call	stabilize_globals
#APP
# 47 "S+fence.rw.rw+ctrl-wsi-rfi-data.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	li	a0,0
	addi	sp,sp,32
	jr	ra
.L89:
	sw	a1,0(a4)
#APP
# 47 "S+fence.rw.rw+ctrl-wsi-rfi-data.c" 1
	fence rw,rw
# 0 "" 2
#NO_APP
	j	.L78
	.size	P0, .-P0
	.section	.rodata.str1.8
	.align	3
.LC4:
	.string	"Run %i of %i\r"
	.align	3
.LC5:
	.string	"S+fence.rw.rw+ctrl-wsi-rfi-data, global x unstabilized"
	.align	3
.LC6:
	.string	"S+fence.rw.rw+ctrl-wsi-rfi-data, global z unstabilized"
	.text
	.align	1
	.type	zyva, @function
zyva:
	addi	sp,sp,-432
	la	a5,__stack_chk_guard
	ld	a5,0(a5)
	sd	s8,352(sp)
	mv	s8,a0
	ld	a0,8(a0)
	sd	ra,424(sp)
	sd	s0,416(sp)
	sd	s1,408(sp)
	sd	s5,376(sp)
	sd	a5,312(sp)
	ld	s5,16(s8)
	sd	s2,400(sp)
	sd	s3,392(sp)
	sd	s4,384(sp)
	sd	s6,368(sp)
	sd	s7,360(sp)
	sd	s9,344(sp)
	sd	s10,336(sp)
	sd	s11,328(sp)
	call	pb_wait@plt
	lla	a5,P0
	sd	a5,104(sp)
	li	a0,24
	lla	a5,P1
	sd	a5,112(sp)
	call	malloc_check@plt
	lw	s1,4(s5)
	sd	zero,0(a0)
	sd	zero,16(a0)
	sd	zero,8(a0)
	slli	s1,s1,2
	mv	s0,a0
	sd	s5,304(sp)
	call	rand@plt
	mv	a5,a0
	mv	a0,s1
	sw	a5,296(sp)
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
	sd	a5,200(sp)
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
	sd	a5,240(sp)
	call	po_create@plt
	mv	a5,a0
	mv	a0,s1
	sd	a5,248(sp)
	call	malloc_check@plt
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
	sd	a5,256(sp)
	call	malloc_check@plt
	mv	a5,a0
	mv	a0,s1
	sd	a5,272(sp)
	call	malloc_check@plt
	ld	a4,32(s8)
	lw	a3,8(s5)
	li	a5,1
	sw	a5,176(sp)
	addi	a5,sp,200
	sd	a0,288(sp)
	sd	a5,192(sp)
	sd	a4,184(sp)
	sw	zero,152(sp)
	sd	a5,168(sp)
	sd	a4,160(sp)
	blez	a3,.L91
	addi	a5,sp,152
	sd	a5,48(sp)
	addi	a5,sp,176
	sd	a5,56(sp)
	addi	a5,sp,88
	sd	a5,24(sp)
	addi	a5,sp,96
	sd	a5,32(sp)
	addi	a5,sp,296
	sd	a5,64(sp)
	li	s3,-237568
	addi	a5,sp,104
	sd	zero,16(sp)
	addiw	s3,s3,-1919
	sd	a5,72(sp)
.L112:
	lw	a5,16(s5)
	li	a4,2
	beq	a5,a4,.L137
	li	a4,4
	beq	a5,a4,.L138
.L94:
	lw	a4,0(s5)
	li	a5,1
	ble	a4,a5,.L95
	la	a5,stderr
	lw	a4,8(s5)
	ld	a0,0(a5)
	ld	a3,16(sp)
	lla	a2,.LC4
	li	a1,1
	call	__fprintf_chk@plt
.L95:
	ld	a5,304(sp)
	lw	a4,4(a5)
	addiw	a2,a4,-1
	slli	a3,a2,32
	sext.w	a5,a2
	bltz	a3,.L96
	slli	a2,a2,32
	srli	a2,a2,32
	sub	a2,a4,a2
	ld	t3,200(sp)
	ld	t1,208(sp)
	ld	a7,216(sp)
	ld	a6,224(sp)
	ld	a0,232(sp)
	ld	a1,288(sp)
	slli	a2,a2,2
	slli	a5,a5,2
	addi	a2,a2,-8
.L97:
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
	bne	a2,a5,.L97
.L96:
	lw	a5,28(s5)
	bnez	a5,.L139
.L98:
	ld	a1,112(sp)
	ld	a0,32(sp)
	ld	a2,56(sp)
	call	launch@plt
	ld	a2,48(sp)
	ld	a1,104(sp)
	ld	a0,24(sp)
	call	launch@plt
	lw	a5,28(s5)
	bnez	a5,.L140
.L99:
	ld	a0,32(sp)
	call	join@plt
	ld	a0,24(sp)
	call	join@plt
	lw	a4,4(s5)
	addiw	s4,a4,-1
	slli	a3,s4,32
	sext.w	a5,s4
	bltz	a3,.L100
	slli	s4,s4,32
	srli	s4,s4,32
	sub	s4,a4,s4
	ld	a4,16(sp)
	slli	s4,s4,2
	slli	s11,a5,2
	andi	a4,a4,1
	addi	a5,s4,-8
	slli	a4,a4,3
	sd	a5,8(sp)
	lla	a5,.LANCHOR1
	add	a5,a5,a4
	addi	s7,sp,120
	lla	s10,.LC5
	sd	a5,40(sp)
	j	.L111
.L144:
	ld	a3,32(s8)
	lw	a3,0(a3)
	bltz	a3,.L107
	bnez	s6,.L141
.L108:
	ld	a4,16(s0)
	ld	a5,8(sp)
	addi	s11,s11,-4
	addi	a4,a4,1
	sd	a4,16(s0)
	beq	s11,a5,.L100
.L111:
	ld	a3,216(sp)
	ld	a4,264(sp)
	ld	a2,224(sp)
	add	a3,a3,s11
	add	a4,a4,s11
	lw	s9,0(a3)
	lw	a1,0(a4)
	ld	a3,232(sp)
	ld	a4,200(sp)
	add	a2,a2,s11
	add	a3,a3,s11
	add	a4,a4,s11
	lw	s1,0(a2)
	lw	s2,0(a3)
	lw	s4,0(a4)
	beq	a1,s9,.L101
	mv	a0,s10
	call	fatal@plt
.L101:
	ld	a4,256(sp)
	add	a4,a4,s11
	lw	a4,0(a4)
	beq	a4,s9,.L102
	mv	a0,s10
	call	fatal@plt
.L102:
	ld	a4,280(sp)
	add	a4,a4,s11
	lw	a4,0(a4)
	beq	a4,s4,.L103
	lla	a0,.LC6
	call	fatal@plt
.L103:
	ld	a4,272(sp)
	add	a4,a4,s11
	lw	a4,0(a4)
	beq	a4,s4,.L104
	lla	a0,.LC6
	call	fatal@plt
.L104:
	li	a5,1
	li	s6,0
	beq	s1,a5,.L142
.L105:
	ld	a0,0(s0)
	li	a3,1
	li	a2,4
	mv	a4,s6
	mv	a1,s7
	sd	s1,120(sp)
	sd	s2,128(sp)
	sd	s9,136(sp)
	sd	s4,144(sp)
	call	add_outcome_outs@plt
	lw	a3,16(s5)
	li	a2,4
	sd	a0,0(s0)
	beq	a3,a2,.L143
	li	a2,5
	beq	a3,a2,.L144
.L107:
	beqz	s6,.L108
.L109:
	ld	a4,8(s0)
	ld	a5,8(sp)
	addi	s11,s11,-4
	addi	a4,a4,1
	sd	a4,8(s0)
	bne	s11,a5,.L111
.L100:
	ld	a4,16(sp)
	lw	a5,8(s5)
	addiw	a4,a4,1
	sd	a4,16(sp)
	bgt	a5,a4,.L112
.L91:
	ld	a0,200(sp)
	call	free@plt
	ld	a0,208(sp)
	call	free@plt
	ld	a0,216(sp)
	call	free@plt
	ld	a0,224(sp)
	call	free@plt
	ld	a0,232(sp)
	call	free@plt
	ld	a0,240(sp)
	call	pb_free@plt
	ld	a0,248(sp)
	call	po_free@plt
	ld	a0,264(sp)
	call	free@plt
	ld	a0,280(sp)
	call	free@plt
	ld	a0,256(sp)
	call	free@plt
	ld	a0,272(sp)
	call	free@plt
	ld	a0,288(sp)
	call	free@plt
	la	a5,__stack_chk_guard
	ld	a4,312(sp)
	ld	a5,0(a5)
	bne	a4,a5,.L145
	ld	ra,424(sp)
	mv	a0,s0
	ld	s0,416(sp)
	ld	s1,408(sp)
	ld	s2,400(sp)
	ld	s3,392(sp)
	ld	s4,384(sp)
	ld	s5,376(sp)
	ld	s6,368(sp)
	ld	s7,360(sp)
	ld	s8,352(sp)
	ld	s9,344(sp)
	ld	s10,336(sp)
	ld	s11,328(sp)
	addi	sp,sp,432
	jr	ra
.L143:
	ld	a3,32(s8)
	lw	a3,0(a3)
	bltz	a3,.L107
	beqz	s6,.L108
	ld	a0,0(s8)
	call	pm_lock@plt
	ld	a5,40(sp)
.L136:
	ld	a4,0(a5)
	ld	a0,0(s8)
	addi	a4,a4,1
	sd	a4,0(a5)
	call	pm_unlock@plt
	j	.L109
.L142:
	li	a3,2
	bne	s2,a3,.L105
	bne	s9,s2,.L105
	addi	a4,s4,-2
	seqz	s6,a4
	j	.L105
.L141:
	ld	a0,0(s8)
	call	pm_lock@plt
	lla	a5,.LANCHOR1
	j	.L136
.L140:
	ld	a1,24(sp)
	ld	a0,64(sp)
	li	a2,2
	call	perm_threads@plt
	j	.L99
.L139:
	ld	a1,72(sp)
	ld	a0,64(sp)
	li	a2,2
	call	perm_funs@plt
	j	.L98
.L137:
	ld	a0,8(s8)
	call	pb_wait@plt
	lw	a5,24(s8)
	beqz	a5,.L146
.L93:
	ld	a0,8(s8)
	call	pb_wait@plt
	j	.L94
.L138:
	ld	a0,8(s8)
	call	pb_wait@plt
	ld	a5,16(sp)
	lw	a4,24(s8)
	lla	a3,.LANCHOR0
	andi	a5,a5,1
	slliw	a5,a5,2
	slliw	a4,a4,1
	slli	a5,a5,2
	add	a5,a3,a5
	slli	a3,a4,2
	add	a3,a5,a3
	ld	a2,32(s8)
	lw	a3,0(a3)
	addi	a4,a4,1
	slli	a4,a4,2
	sw	a3,0(a2)
	add	a5,a5,a4
	lw	a5,0(a5)
	ld	a0,8(s8)
	sw	a5,4(a2)
	call	pb_wait@plt
	j	.L94
.L146:
	lw	a3,20(s5)
	lw	a2,24(s5)
	ld	a1,32(s8)
	ld	a0,64(sp)
	call	perm_prefix_ints@plt
	j	.L93
.L145:
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
	.string	"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
	.align	3
.LC11:
	.string	"%s\n"
	.align	3
.LC12:
	.string	"% Results for tests/non-mixed-size/RELAX/Coi-Rfi/S+fence.rw.rw+ctrl-wsi-rfi-data.litmus %"
	.align	3
.LC13:
	.string	"RISCV S+fence.rw.rw+ctrl-wsi-rfi-data"
	.align	3
.LC14:
	.string	"\"Fence.rw.rwdWW Rfe DpCtrldW Wsi Rfi DpDatadW Wse\""
	.align	3
.LC15:
	.string	"{"
	.align	3
.LC16:
	.string	" 0:x5=2; 0:x6=x; 0:x7=1; 0:x8=y;"
	.align	3
.LC17:
	.string	" 1:x6=y; 1:x7=1; 1:x8=z; 1:x9=2; 1:x12=x;"
	.align	3
.LC18:
	.string	"}"
	.align	3
.LC19:
	.string	" P0          | P1              ;"
	.align	3
.LC20:
	.string	" sw x5,0(x6) | lw x5,0(x6)     ;"
	.align	3
.LC21:
	.string	" fence rw,rw | bne x5,x0,LC00  ;"
	.align	3
.LC22:
	.string	" sw x7,0(x8) | LC00:           ;"
	.align	3
.LC23:
	.string	"             | sw x7,0(x8)     ;"
	.align	3
.LC24:
	.string	"             | sw x9,0(x8)     ;"
	.align	3
.LC25:
	.string	"             | lw x10,0(x8)    ;"
	.align	3
.LC26:
	.string	"             | xor x11,x10,x10 ;"
	.align	3
.LC27:
	.string	"             | ori x11,x11,1   ;"
	.align	3
.LC28:
	.string	"             | sw x11,0(x12)   ;"
	.align	3
.LC29:
	.string	""
	.align	3
.LC30:
	.string	"exists ([x]=2 /\\ [z]=2 /\\ 1:x5=1 /\\ 1:x10=2)"
	.align	3
.LC31:
	.string	"Generated assembler"
	.align	3
.LC32:
	.string	"Bad topology %s, reverting to scan affinity\n"
	.align	3
.LC33:
	.string	"Warning: avail=%i, available=%i\n"
	.align	3
.LC34:
	.string	"S+fence.rw.rw+ctrl-wsi-rfi-data: n=%i, r=%i, s=%i"
	.align	3
.LC35:
	.string	", st=%i"
	.align	3
.LC36:
	.string	", i=%i"
	.align	3
.LC37:
	.string	", +ra"
	.align	3
.LC38:
	.string	", +ca"
	.align	3
.LC39:
	.string	", +sa"
	.align	3
.LC40:
	.string	", p='"
	.align	3
.LC41:
	.string	"'"
	.align	3
.LC42:
	.string	"\n"
	.align	3
.LC43:
	.string	"logical proc -> core: "
	.align	3
.LC44:
	.string	"thread allocation: \n"
	.align	3
.LC45:
	.string	"S+fence.rw.rw+ctrl-wsi-rfi-data, sum_hist"
	.align	3
.LC46:
	.string	"Test S+fence.rw.rw+ctrl-wsi-rfi-data Allowed\n"
	.align	3
.LC47:
	.string	"Histogram (%d states)\n"
	.align	3
.LC48:
	.string	"Observation S+fence.rw.rw+ctrl-wsi-rfi-data %s %lu %lu\n"
	.align	3
.LC50:
	.string	"Time S+fence.rw.rw+ctrl-wsi-rfi-data %.2f\n"
	.align	3
.LC51:
	.string	"Ok"
	.align	3
.LC52:
	.string	"\nWitnesses\n"
	.align	3
.LC53:
	.string	"Positive: %lu, Negative: %lu\n"
	.align	3
.LC54:
	.string	"Condition %s is %svalidated\n"
	.align	3
.LC55:
	.string	"Hash=f8f8dffc3fd5f56f1d84690eb46219bb\n"
	.align	3
.LC56:
	.string	"Cycle=Rfi DpDatadW Wse Fence.rw.rwdWW Rfe DpCtrldW Wsi\n"
	.align	3
.LC57:
	.string	"[Wsi,Rfi]"
	.align	3
.LC58:
	.string	"Relax S+fence.rw.rw+ctrl-wsi-rfi-data %s %s\n"
	.align	3
.LC59:
	.string	"Safe=Rfe Wse Fence.rw.rwdWW DpDatadW DpCtrldW\n"
	.align	3
.LC60:
	.string	"Generator=diy7 (version 7.51+4(dev))\n"
	.align	3
.LC61:
	.string	"Com=Rf Ws\n"
	.align	3
.LC62:
	.string	"Orig=Fence.rw.rwdWW Rfe DpCtrldW Wsi Rfi DpDatadW Wse\n"
	.align	3
.LC63:
	.string	"No"
	.align	3
.LC64:
	.string	"NOT "
	.align	3
.LC65:
	.string	"Affinity=[0] [1] ; \n"
	.text
	.align	1
	.globl	S_2B_fence_2E_rw_2E_rw_2B_ctrl_2D_wsi_2D_rfi_2D_data
	.type	S_2B_fence_2E_rw_2E_rw_2B_ctrl_2D_wsi_2D_rfi_2D_data, @function
S_2B_fence_2E_rw_2E_rw_2B_ctrl_2D_wsi_2D_rfi_2D_data:
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
	li	a5,1
	ble	a4,a5,.L233
	slli	a4,a5,32
	li	t1,-1
	mv	s5,a0
	li	a6,5
	addi	a0,a4,100
	srli	a7,t1,32
	addi	a1,a4,1
	addi	a2,s0,-376
	addi	a3,s0,-264
	slli	a6,a6,33
	sd	a0,-368(s0)
	li	a0,4
	sd	a4,-352(s0)
	sw	a5,-336(s0)
	sd	t1,-288(s0)
	sw	a5,-272(s0)
	sd	a6,-376(s0)
	sd	a0,-360(s0)
	sd	a1,-344(s0)
	sd	s5,-328(s0)
	sd	zero,-320(s0)
	sd	a7,-312(s0)
	sd	zero,-304(s0)
	sd	zero,-296(s0)
	sd	a7,-280(s0)
	mv	a5,a2
	mv	a4,a3
	addi	t1,s0,-280
.L150:
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
	bne	a5,t1,.L150
	ld	a6,0(a5)
	ld	a5,8(a5)
	mv	a1,s2
	mv	a0,s3
	sd	a5,8(a4)
	sd	a6,0(a4)
	call	parse_cmd@plt
	lw	a5,-160(s0)
	sd	sp,-496(s0)
	bnez	a5,.L234
.L151:
	call	timeofday@plt
	lw	a5,-264(s0)
	lw	a4,-252(s0)
	sd	a0,-504(s0)
	sw	a5,-416(s0)
	lw	a5,-256(s0)
	sw	a5,-412(s0)
	lw	a5,-260(s0)
	sw	a5,-408(s0)
	blez	a4,.L235
	lw	a5,-236(s0)
	sw	a4,-404(s0)
	li	a4,5
	beq	a5,a4,.L153
.L250:
	addiw	a5,a5,-3
	li	a4,2
	sgtu	a5,a5,a4
	li	s9,-1
.L154:
	lw	a4,-164(s0)
	sw	a5,-388(s0)
	beqz	a4,.L156
	sw	zero,-388(s0)
.L156:
	lw	a0,0(s5)
	li	a1,2
	call	coremap_seq@plt
	lw	s2,-248(s0)
	sd	a0,-384(s0)
	ld	s4,-216(s0)
	blez	s2,.L236
	lw	a2,0(s4)
	ble	s2,a2,.L158
	mv	a1,s2
	lla	a0,.LC33
	call	log_error@plt
	ld	s4,-216(s0)
.L158:
	lw	s6,-244(s0)
	blez	s6,.L159
.L251:
	slli	s7,s6,2
	addiw	a5,s6,-1
	add	s7,s7,s6
	slliw	s2,s6,1
	sd	a5,-448(s0)
	slli	s8,a5,3
	sd	s6,-512(s0)
	slli	s7,s7,3
.L160:
	lw	a4,-236(s0)
	li	a5,2
	mv	s11,s2
	beq	a4,a5,.L237
.L161:
	slli	a5,s11,2
	addi	a5,a5,15
	lw	a3,-416(s0)
	andi	a5,a5,-16
	sub	sp,sp,a5
	sw	s2,-392(s0)
	sw	a4,-400(s0)
	sw	s11,-396(s0)
	mv	s2,sp
	bnez	a3,.L238
.L162:
	li	a5,2
	beq	a4,a5,.L239
	li	a5,3
	beq	a4,a5,.L240
	li	a5,5
	beq	a4,a5,.L241
.L171:
	addi	s8,s8,15
	andi	s8,s8,-16
	addi	s7,s7,15
	sub	sp,sp,s8
	andi	s7,s7,-16
	sd	sp,-472(s0)
	sub	sp,sp,s7
	call	pm_create@plt
	mv	s9,a0
	mv	a0,s6
	sd	s9,-456(s0)
	call	pb_create@plt
	lw	s7,-224(s0)
	sd	a0,-464(s0)
	lw	a1,0(s4)
	mv	s8,sp
	blez	s7,.L242
	remw	a5,s7,a1
	sd	a5,-440(s0)
.L178:
	ld	a0,-440(s0)
	addi	s7,s2,8
	li	s11,0
	call	gcd@plt
	ld	s3,-472(s0)
	addi	a5,s0,-416
	mv	a2,s8
	sd	a0,-520(s0)
	mv	s8,s3
	li	s2,0
	li	s9,0
	li	s10,0
	sd	a5,-488(s0)
	j	.L185
.L245:
	mv	a0,s3
	lla	a1,zyva
	sd	a2,-480(s0)
	call	launch@plt
	ld	a2,-480(s0)
	addiw	s10,s10,1
	addi	s3,s3,8
	addi	a2,a2,40
	addi	s7,s7,8
	beq	s6,s10,.L243
.L185:
	ld	a5,-488(s0)
	lw	a1,-236(s0)
	addi	a0,s7,-8
	sd	a5,16(a2)
	ld	a5,-456(s0)
	sw	s10,24(a2)
	sd	a0,32(a2)
	sd	a5,0(a2)
	ld	a5,-464(s0)
	sd	a5,8(a2)
	li	a5,1
	beq	a1,a5,.L244
.L180:
	ld	a5,-448(s0)
	bgt	a5,s10,.L245
	mv	a0,a2
	sd	a2,-480(s0)
	call	zyva
	ld	a2,-480(s0)
	addiw	s10,s10,1
	mv	s2,a0
	addi	a2,a2,40
	addi	s3,s3,8
	addi	s7,s7,8
	bne	s6,s10,.L185
.L243:
	lw	a5,-412(s0)
	lw	s6,-408(s0)
	mul	s6,s6,a5
	ld	a5,-448(s0)
	beqz	a5,.L192
	ld	a5,-448(s0)
	addiw	s3,a5,-1
	slli	s3,s3,32
	ld	a5,-472(s0)
	srli	s3,s3,32
	addi	s3,s3,1
	slli	s3,s3,3
	add	s11,a5,s3
	lla	s3,.LC45
.L191:
	mv	a0,s8
	call	join@plt
	mv	s7,a0
	ld	a0,0(a0)
	call	sum_outs@plt
	bne	s6,a0,.L189
	ld	a2,8(s7)
	ld	a3,16(s7)
	add	a5,a2,a3
	beq	s6,a5,.L190
.L189:
	mv	a0,s3
	call	fatal@plt
	ld	a2,8(s7)
	ld	a3,16(s7)
.L190:
	ld	a4,8(s2)
	ld	a5,16(s2)
	ld	a1,0(s7)
	ld	a0,0(s2)
	add	a4,a4,a2
	add	a5,a5,a3
	li	a2,4
	sd	a4,8(s2)
	sd	a5,16(s2)
	call	merge_outs@plt
	sd	a0,0(s2)
	ld	a0,0(s7)
	addi	s8,s8,8
	call	free_outs@plt
	mv	a0,s7
	call	free@plt
	bne	s8,s11,.L191
.L192:
	mv	a0,s4
	call	cpus_free@plt
	call	timeofday@plt
	ld	a5,-504(s0)
	mv	s3,a0
	ld	a0,-456(s0)
	sub	s3,s3,a5
	call	pm_free@plt
	ld	a5,-512(s0)
	ld	a0,-464(s0)
	mul	s6,s6,a5
	call	pb_free@plt
	ld	a0,0(s2)
	call	sum_outs@plt
	bne	s6,a0,.L187
	ld	s4,8(s2)
	ld	s7,16(s2)
	add	a5,s4,s7
	beq	s6,a5,.L193
.L187:
	lla	a0,.LC45
	call	fatal@plt
	ld	s4,8(s2)
	ld	s7,16(s2)
.L193:
	li	a2,45
	li	a1,1
	mv	a3,s1
	lla	a0,.LC46
	call	fwrite@plt
	ld	a0,0(s2)
	call	finals_outs@plt
	mv	a3,a0
	lla	a2,.LC47
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	ld	a2,0(s2)
	li	a4,4
	addi	a3,s0,-152
	lla	a1,do_dump_outcome
	mv	a0,s1
	call	dump_outs@plt
	beqz	s4,.L246
	lla	a2,.LC11
	li	a1,1
	lla	a3,.LC51
	mv	a0,s1
	call	__fprintf_chk@plt
	mv	a3,s1
	li	a2,11
	li	a1,1
	lla	a0,.LC52
	call	fwrite@plt
	mv	a4,s7
	mv	a3,s4
	lla	a2,.LC53
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a4,.LC29
	lla	a2,.LC54
	li	a1,1
	lla	a3,.LC30
	mv	a0,s1
	call	__fprintf_chk@plt
	mv	a3,s1
	li	a2,38
	li	a1,1
	lla	a0,.LC55
	call	fwrite@plt
	mv	a3,s1
	li	a2,55
	li	a1,1
	lla	a0,.LC56
	call	fwrite@plt
	lla	a4,.LC57
	lla	a2,.LC58
	li	a1,1
	lla	a3,.LC51
	mv	a0,s1
	call	__fprintf_chk@plt
	mv	a3,s1
	li	a2,46
	li	a1,1
	lla	a0,.LC59
	call	fwrite@plt
	mv	a3,s1
	li	a2,37
	li	a1,1
	lla	a0,.LC60
	call	fwrite@plt
	mv	a3,s1
	li	a2,10
	li	a1,1
	lla	a0,.LC61
	call	fwrite@plt
	mv	a3,s1
	li	a2,54
	li	a1,1
	lla	a0,.LC62
	call	fwrite@plt
	lw	a4,-236(s0)
	li	a5,3
	beq	a4,a5,.L247
.L198:
	lla	s6,.LC8
	bnez	s7,.L248
.L196:
	mv	a5,s7
	mv	a4,s4
	mv	a3,s6
	lla	a2,.LC48
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	fcvt.d.lu	fa4,s3
	fld	fa5,.LC49,a5
	lla	a2,.LC50
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
	ld	sp,-496(s0)
	beq	a5,s5,.L149
	mv	a0,s5
.L233:
	call	cpus_free@plt
.L149:
	la	a5,__stack_chk_guard
	ld	a4,-120(s0)
	ld	a5,0(a5)
	bne	a4,a5,.L249
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
.L235:
	lw	a5,-236(s0)
	li	a4,2
	sw	a4,-404(s0)
	li	a4,5
	bne	a5,a4,.L250
.L153:
	ld	a2,-208(s0)
	li	a1,2
	lla	a0,.LANCHOR2
	call	find_string@plt
	mv	s9,a0
	bltz	a0,.L155
	lw	a5,-236(s0)
	li	a4,2
	addiw	a5,a5,-3
	sgtu	a5,a5,a4
	j	.L154
.L236:
	lw	s6,-244(s0)
	lw	s2,0(s4)
	bgtz	s6,.L251
.L159:
	li	a5,1
	ble	s2,a5,.L201
	srai	s6,s2,1
	sraiw	s3,s2,1
	lw	a4,-236(s0)
	addiw	a5,s3,-1
	slli	s7,s6,2
	sd	a5,-448(s0)
	add	s7,s7,s6
	andi	s2,s2,-2
	slli	s8,a5,3
	sd	s6,-512(s0)
	li	a5,2
	slli	s7,s7,3
	mv	s11,s2
	bne	a4,a5,.L161
.L237:
	lw	a0,0(s4)
	mv	a1,s2
	call	max@plt
	lw	a4,-236(s0)
	mv	s11,a0
	j	.L161
.L244:
	ld	a1,8(s4)
	slli	a0,s9,2
	ld	a5,-440(s0)
	add	a0,a1,a0
	lw	a0,0(a0)
	addw	a5,a5,s9
	sw	a0,-8(s7)
	lw	a0,0(s4)
	remw	a5,a5,a0
	bne	a5,s11,.L181
	ld	a5,-520(s0)
	addiw	a4,s11,1
	remw	s11,a4,a5
	mv	a5,s11
.L181:
	slli	a0,a5,2
	add	a1,a1,a0
	lw	a1,0(a1)
	ld	a4,-440(s0)
	sw	a1,-4(s7)
	lw	a1,0(s4)
	addw	a5,a4,a5
	remw	s9,a5,a1
	bne	s9,s11,.L180
	ld	a5,-520(s0)
	addiw	a4,s11,1
	remw	s11,a4,a5
	mv	s9,s11
	j	.L180
.L246:
	lla	a2,.LC11
	li	a1,1
	lla	a3,.LC63
	mv	a0,s1
	call	__fprintf_chk@plt
	mv	a3,s1
	li	a2,11
	li	a1,1
	lla	a0,.LC52
	call	fwrite@plt
	mv	a4,s7
	li	a3,0
	lla	a2,.LC53
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a4,.LC64
	lla	a2,.LC54
	li	a1,1
	lla	a3,.LC30
	mv	a0,s1
	call	__fprintf_chk@plt
	mv	a3,s1
	li	a2,38
	li	a1,1
	lla	a0,.LC55
	call	fwrite@plt
	mv	a3,s1
	li	a2,55
	li	a1,1
	lla	a0,.LC56
	call	fwrite@plt
	lla	a4,.LC57
	lla	a2,.LC58
	li	a1,1
	lla	a3,.LC63
	mv	a0,s1
	call	__fprintf_chk@plt
	mv	a3,s1
	li	a2,46
	li	a1,1
	lla	a0,.LC59
	call	fwrite@plt
	mv	a3,s1
	li	a2,37
	li	a1,1
	lla	a0,.LC60
	call	fwrite@plt
	mv	a3,s1
	li	a2,10
	li	a1,1
	lla	a0,.LC61
	call	fwrite@plt
	mv	a3,s1
	li	a2,54
	li	a1,1
	lla	a0,.LC62
	call	fwrite@plt
	lw	a4,-236(s0)
	li	a5,3
	lla	s6,.LC7
	bne	a4,a5,.L196
	mv	a3,s1
	li	a2,20
	li	a1,1
	lla	a0,.LC65
	call	fwrite@plt
	j	.L196
.L242:
	blez	a1,.L203
	ld	a4,8(s4)
	li	a5,0
	li	a3,-1
.L179:
	sw	a3,0(a4)
	lw	a1,0(s4)
	addiw	a5,a5,1
	addi	a4,a4,4
	blt	a5,a1,.L179
.L203:
	li	a5,1
	sd	a5,-440(s0)
	j	.L178
.L239:
	blez	s11,.L171
	ld	a2,8(s4)
	mv	a3,s2
	li	a4,0
.L172:
	lw	a5,0(s4)
	addi	a3,a3,4
	remw	a5,a4,a5
	addiw	a4,a4,1
	slli	a5,a5,2
	add	a5,a2,a5
	lw	a5,0(a5)
	sw	a5,-4(a3)
	bne	s11,a4,.L172
	j	.L171
.L238:
	lw	a3,-412(s0)
	lw	a2,-408(s0)
	mv	a1,s6
	lla	a0,.LC34
	call	log_error@plt
	lw	a1,-404(s0)
	lla	a0,.LC35
	call	log_error@plt
	lw	a5,-236(s0)
	li	a4,1
	beq	a5,a4,.L252
	li	a4,2
	beq	a5,a4,.L253
	li	a4,3
	beq	a5,a4,.L254
	li	a4,4
	beq	a5,a4,.L255
.L164:
	lla	a0,.LC40
	call	log_error@plt
	la	s10,stderr
	ld	a1,-216(s0)
	ld	a0,0(s10)
	call	cpus_dump@plt
	lla	a0,.LC41
	call	log_error@plt
	lla	a0,.LC42
	call	log_error@plt
	lw	a4,-416(s0)
	li	a5,1
	ble	a4,a5,.L232
	ld	a5,-384(s0)
	beqz	a5,.L232
	lla	a0,.LC43
	call	log_error@plt
	ld	a0,0(s10)
	ld	a1,-384(s0)
	call	cpus_dump@plt
	lla	a0,.LC42
	call	log_error@plt
.L232:
	lw	a4,-236(s0)
	j	.L162
.L234:
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
	lla	a3,.LC28
	lla	a2,.LC11
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC29
	lla	a2,.LC11
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC30
	lla	a2,.LC11
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	lla	a3,.LC31
	lla	a2,.LC11
	li	a1,1
	mv	a0,s1
	call	__fprintf_chk@plt
	j	.L151
.L248:
	lla	s6,.LC9
	j	.L196
.L201:
	li	a5,1
	li	s7,40
	sd	a5,-512(s0)
	li	s8,0
	sd	zero,-448(s0)
	li	s2,2
	li	s6,1
	j	.L160
.L241:
	slliw	s9,s9,2
	slli	s9,s9,2
	lla	a4,.LANCHOR0
	add	a4,a4,s9
	blez	s11,.L171
	addiw	a5,s11,-1
	slli	a5,a5,32
	srli	a5,a5,32
	addi	a5,a5,1
	slli	a5,a5,2
	mv	a3,s2
	add	a5,a4,a5
.L176:
	lw	a2,0(a4)
	addi	a4,a4,4
	addi	a3,a3,4
	sw	a2,-4(a3)
	bne	a4,a5,.L176
	j	.L171
.L240:
	ld	a1,-384(s0)
	mv	a5,s6
	mv	a6,s2
	mv	a4,s4
	lla	a3,.LANCHOR0+32
	lla	a2,.LANCHOR2+16
	addi	a0,s0,-420
	sw	zero,-420(s0)
	call	custom_affinity@plt
	lw	a5,-416(s0)
	beqz	a5,.L171
	lla	a0,.LC44
	call	log_error@plt
	la	a5,stderr
	ld	a3,-384(s0)
	ld	a0,0(a5)
	li	a4,2
	mv	a2,s11
	mv	a1,s2
	call	cpus_dump_test@plt
	j	.L171
.L247:
	mv	a3,s1
	li	a2,20
	li	a1,1
	lla	a0,.LC65
	call	fwrite@plt
	j	.L198
.L252:
	lw	a1,-224(s0)
	lla	a0,.LC36
	call	log_error@plt
	j	.L164
.L253:
	lla	a0,.LC37
	call	log_error@plt
	j	.L164
.L155:
	ld	a1,-208(s0)
	lla	a0,.LC32
	call	log_error@plt
	li	a5,4
	sw	a5,-236(s0)
	sd	zero,-208(s0)
	li	a5,0
	j	.L154
.L254:
	lla	a0,.LC38
	call	log_error@plt
	j	.L164
.L255:
	lla	a0,.LC39
	call	log_error@plt
	j	.L164
.L249:
	call	__stack_chk_fail@plt
	.size	S_2B_fence_2E_rw_2E_rw_2B_ctrl_2D_wsi_2D_rfi_2D_data, .-S_2B_fence_2E_rw_2E_rw_2B_ctrl_2D_wsi_2D_rfi_2D_data
	.section	.rodata.str1.8
	.align	3
.LC66:
	.string	"[[0],[1]]"
	.align	3
.LC67:
	.string	"[[0,1]]"
	.section	.rodata.cst8,"aM",@progbits,8
	.align	3
.LC49:
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
	.dword	.LC66
	.dword	.LC67
	.type	color, @object
	.size	color, 24
color:
	.dword	color_0
	.dword	color_1
	.dword	0
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
