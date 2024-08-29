	.text
	.attribute	4, 16
	.attribute	5, "rv32i2p0"
	.file	"builtin.c"
	.globl	print                           # -- Begin function print
	.p2align	1
	.type	print,@function
print:                                  # @print
# %bb.0:
	lui	a1, %hi(.L.str)
	addi	a1, a1, %lo(.L.str)
	mv	a2, a0
	mv	a0, a1
	mv	a1, a2
	tail	printf
.Lfunc_end0:
	.size	print, .Lfunc_end0-print
                                        # -- End function
	.globl	println                         # -- Begin function println
	.p2align	1
	.type	println,@function
println:                                # @println
# %bb.0:
	lui	a1, %hi(.L.str.1)
	addi	a1, a1, %lo(.L.str.1)
	mv	a2, a0
	mv	a0, a1
	mv	a1, a2
	tail	printf
.Lfunc_end1:
	.size	println, .Lfunc_end1-println
                                        # -- End function
	.globl	printInt                        # -- Begin function printInt
	.p2align	1
	.type	printInt,@function
printInt:                               # @printInt
# %bb.0:
	lui	a1, %hi(.L.str.2)
	addi	a1, a1, %lo(.L.str.2)
	mv	a2, a0
	mv	a0, a1
	mv	a1, a2
	tail	printf
.Lfunc_end2:
	.size	printInt, .Lfunc_end2-printInt
                                        # -- End function
	.globl	printlnInt                      # -- Begin function printlnInt
	.p2align	1
	.type	printlnInt,@function
printlnInt:                             # @printlnInt
# %bb.0:
	lui	a1, %hi(.L.str.3)
	addi	a1, a1, %lo(.L.str.3)
	mv	a2, a0
	mv	a0, a1
	mv	a1, a2
	tail	printf
.Lfunc_end3:
	.size	printlnInt, .Lfunc_end3-printlnInt
                                        # -- End function
	.globl	getInt                          # -- Begin function getInt
	.p2align	1
	.type	getInt,@function
getInt:                                 # @getInt
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)                      # 4-byte Folded Spill
	lui	a0, %hi(.L.str.2)
	addi	a0, a0, %lo(.L.str.2)
	addi	a1, sp, 8
	call	scanf
	lw	a0, 8(sp)
	lw	ra, 12(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 16
	ret
.Lfunc_end4:
	.size	getInt, .Lfunc_end4-getInt
                                        # -- End function
	.globl	getString                       # -- Begin function getString
	.p2align	1
	.type	getString,@function
getString:                              # @getString
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)                      # 4-byte Folded Spill
	sw	s0, 8(sp)                       # 4-byte Folded Spill
	li	a0, 256
	call	malloc
	mv	s0, a0
	lui	a0, %hi(.L.str)
	addi	a0, a0, %lo(.L.str)
	mv	a1, s0
	call	scanf
	mv	a0, s0
	lw	ra, 12(sp)                      # 4-byte Folded Reload
	lw	s0, 8(sp)                       # 4-byte Folded Reload
	addi	sp, sp, 16
	ret
.Lfunc_end5:
	.size	getString, .Lfunc_end5-getString
                                        # -- End function
	.globl	toString                        # -- Begin function toString
	.p2align	1
	.type	toString,@function
toString:                               # @toString
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)                      # 4-byte Folded Spill
	sw	s0, 8(sp)                       # 4-byte Folded Spill
	sw	s1, 4(sp)                       # 4-byte Folded Spill
	mv	s0, a0
	li	a0, 16
	call	malloc
	mv	s1, a0
	lui	a0, %hi(.L.str.2)
	addi	a1, a0, %lo(.L.str.2)
	mv	a0, s1
	mv	a2, s0
	call	sprintf
	mv	a0, s1
	lw	ra, 12(sp)                      # 4-byte Folded Reload
	lw	s0, 8(sp)                       # 4-byte Folded Reload
	lw	s1, 4(sp)                       # 4-byte Folded Reload
	addi	sp, sp, 16
	ret
.Lfunc_end6:
	.size	toString, .Lfunc_end6-toString
                                        # -- End function
	.globl	string.copy                     # -- Begin function string.copy
	.p2align	1
	.type	string.copy,@function
string.copy:                            # @string.copy
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)                      # 4-byte Folded Spill
	sw	s0, 8(sp)                       # 4-byte Folded Spill
	sw	s1, 4(sp)                       # 4-byte Folded Spill
	sw	s2, 0(sp)                       # 4-byte Folded Spill
	mv	s2, a0
	call	strlen
	mv	s1, a0
	addi	a0, a0, 1
	call	malloc
	mv	s0, a0
	mv	a1, s2
	mv	a2, s1
	call	memcpy
	add	a0, s0, s1
	sb	zero, 0(a0)
	mv	a0, s0
	lw	ra, 12(sp)                      # 4-byte Folded Reload
	lw	s0, 8(sp)                       # 4-byte Folded Reload
	lw	s1, 4(sp)                       # 4-byte Folded Reload
	lw	s2, 0(sp)                       # 4-byte Folded Reload
	addi	sp, sp, 16
	ret
.Lfunc_end7:
	.size	string.copy, .Lfunc_end7-string.copy
                                        # -- End function
	.globl	string.length                   # -- Begin function string.length
	.p2align	1
	.type	string.length,@function
string.length:                          # @string.length
# %bb.0:
	tail	strlen
.Lfunc_end8:
	.size	string.length, .Lfunc_end8-string.length
                                        # -- End function
	.globl	string.substring                # -- Begin function string.substring
	.p2align	1
	.type	string.substring,@function
string.substring:                       # @string.substring
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)                      # 4-byte Folded Spill
	sw	s0, 8(sp)                       # 4-byte Folded Spill
	sw	s1, 4(sp)                       # 4-byte Folded Spill
	sw	s2, 0(sp)                       # 4-byte Folded Spill
	mv	s0, a1
	mv	s2, a0
	sub	s1, a2, a1
	addi	a0, s1, 1
	call	malloc
	blez	s1, .LBB9_3
# %bb.1:                                # %.preheader
	add	a1, s2, s0
	mv	a2, a0
	mv	a3, s1
.LBB9_2:                                # =>This Inner Loop Header: Depth=1
	lb	a4, 0(a1)
	sb	a4, 0(a2)
	addi	a3, a3, -1
	addi	a2, a2, 1
	addi	a1, a1, 1
	bnez	a3, .LBB9_2
.LBB9_3:
	add	a1, a0, s1
	sb	zero, 0(a1)
	lw	ra, 12(sp)                      # 4-byte Folded Reload
	lw	s0, 8(sp)                       # 4-byte Folded Reload
	lw	s1, 4(sp)                       # 4-byte Folded Reload
	lw	s2, 0(sp)                       # 4-byte Folded Reload
	addi	sp, sp, 16
	ret
.Lfunc_end9:
	.size	string.substring, .Lfunc_end9-string.substring
                                        # -- End function
	.globl	string.parseInt                 # -- Begin function string.parseInt
	.p2align	1
	.type	string.parseInt,@function
string.parseInt:                        # @string.parseInt
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)                      # 4-byte Folded Spill
	lui	a1, %hi(.L.str.2)
	addi	a1, a1, %lo(.L.str.2)
	addi	a2, sp, 8
	call	sscanf
	lw	a0, 8(sp)
	lw	ra, 12(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 16
	ret
.Lfunc_end10:
	.size	string.parseInt, .Lfunc_end10-string.parseInt
                                        # -- End function
	.globl	string.ord                      # -- Begin function string.ord
	.p2align	1
	.type	string.ord,@function
string.ord:                             # @string.ord
# %bb.0:
	add	a0, a0, a1
	lbu	a0, 0(a0)
	ret
.Lfunc_end11:
	.size	string.ord, .Lfunc_end11-string.ord
                                        # -- End function
	.globl	string.add                      # -- Begin function string.add
	.p2align	1
	.type	string.add,@function
string.add:                             # @string.add
# %bb.0:
	addi	sp, sp, -32
	sw	ra, 28(sp)                      # 4-byte Folded Spill
	sw	s0, 24(sp)                      # 4-byte Folded Spill
	sw	s1, 20(sp)                      # 4-byte Folded Spill
	sw	s2, 16(sp)                      # 4-byte Folded Spill
	sw	s3, 12(sp)                      # 4-byte Folded Spill
	sw	s4, 8(sp)                       # 4-byte Folded Spill
	sw	s5, 4(sp)                       # 4-byte Folded Spill
	mv	s2, a1
	mv	s3, a0
	call	strlen
	mv	s0, a0
	mv	a0, s2
	call	strlen
	mv	s4, a0
	add	s5, a0, s0
	addi	a0, s5, 1
	call	malloc
	mv	s1, a0
	mv	a1, s3
	mv	a2, s0
	call	memcpy
	add	a0, s1, s0
	mv	a1, s2
	mv	a2, s4
	call	memcpy
	add	a0, s1, s5
	sb	zero, 0(a0)
	mv	a0, s1
	lw	ra, 28(sp)                      # 4-byte Folded Reload
	lw	s0, 24(sp)                      # 4-byte Folded Reload
	lw	s1, 20(sp)                      # 4-byte Folded Reload
	lw	s2, 16(sp)                      # 4-byte Folded Reload
	lw	s3, 12(sp)                      # 4-byte Folded Reload
	lw	s4, 8(sp)                       # 4-byte Folded Reload
	lw	s5, 4(sp)                       # 4-byte Folded Reload
	addi	sp, sp, 32
	ret
.Lfunc_end12:
	.size	string.add, .Lfunc_end12-string.add
                                        # -- End function
	.globl	string.equal                    # -- Begin function string.equal
	.p2align	1
	.type	string.equal,@function
string.equal:                           # @string.equal
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)                      # 4-byte Folded Spill
	call	strcmp
	seqz	a0, a0
	lw	ra, 12(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 16
	ret
.Lfunc_end13:
	.size	string.equal, .Lfunc_end13-string.equal
                                        # -- End function
	.globl	string.notEqual                 # -- Begin function string.notEqual
	.p2align	1
	.type	string.notEqual,@function
string.notEqual:                        # @string.notEqual
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)                      # 4-byte Folded Spill
	call	strcmp
	snez	a0, a0
	lw	ra, 12(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 16
	ret
.Lfunc_end14:
	.size	string.notEqual, .Lfunc_end14-string.notEqual
                                        # -- End function
	.globl	string.less                     # -- Begin function string.less
	.p2align	1
	.type	string.less,@function
string.less:                            # @string.less
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)                      # 4-byte Folded Spill
	call	strcmp
	srli	a0, a0, 31
	lw	ra, 12(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 16
	ret
.Lfunc_end15:
	.size	string.less, .Lfunc_end15-string.less
                                        # -- End function
	.globl	string.lessOrEqual              # -- Begin function string.lessOrEqual
	.p2align	1
	.type	string.lessOrEqual,@function
string.lessOrEqual:                     # @string.lessOrEqual
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)                      # 4-byte Folded Spill
	call	strcmp
	slti	a0, a0, 1
	lw	ra, 12(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 16
	ret
.Lfunc_end16:
	.size	string.lessOrEqual, .Lfunc_end16-string.lessOrEqual
                                        # -- End function
	.globl	string.greater                  # -- Begin function string.greater
	.p2align	1
	.type	string.greater,@function
string.greater:                         # @string.greater
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)                      # 4-byte Folded Spill
	call	strcmp
	sgtz	a0, a0
	lw	ra, 12(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 16
	ret
.Lfunc_end17:
	.size	string.greater, .Lfunc_end17-string.greater
                                        # -- End function
	.globl	string.greaterOrEqual           # -- Begin function string.greaterOrEqual
	.p2align	1
	.type	string.greaterOrEqual,@function
string.greaterOrEqual:                  # @string.greaterOrEqual
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)                      # 4-byte Folded Spill
	call	strcmp
	not	a0, a0
	srli	a0, a0, 31
	lw	ra, 12(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 16
	ret
.Lfunc_end18:
	.size	string.greaterOrEqual, .Lfunc_end18-string.greaterOrEqual
                                        # -- End function
	.globl	array.size                      # -- Begin function array.size
	.p2align	1
	.type	array.size,@function
array.size:                             # @array.size
# %bb.0:
	lw	a0, -4(a0)
	ret
.Lfunc_end19:
	.size	array.size, .Lfunc_end19-array.size
                                        # -- End function
	.globl	_malloc                         # -- Begin function _malloc
	.p2align	1
	.type	_malloc,@function
_malloc:                                # @_malloc
# %bb.0:
	tail	malloc
.Lfunc_end20:
	.size	_malloc, .Lfunc_end20-_malloc
                                        # -- End function
	.globl	__alloca_helper                 # -- Begin function __alloca_helper
	.p2align	1
	.type	__alloca_helper,@function
__alloca_helper:                        # @__alloca_helper
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)                      # 4-byte Folded Spill
	sw	s0, 8(sp)                       # 4-byte Folded Spill
	mv	s0, a1
	mul	a0, a1, a0
	addi	a0, a0, 4
	call	malloc
	addi	a1, a0, 4
	sw	s0, 0(a0)
	mv	a0, a1
	lw	ra, 12(sp)                      # 4-byte Folded Reload
	lw	s0, 8(sp)                       # 4-byte Folded Reload
	addi	sp, sp, 16
	ret
.Lfunc_end21:
	.size	__alloca_helper, .Lfunc_end21-__alloca_helper
                                        # -- End function
	.globl	__array.alloca_inside           # -- Begin function __array.alloca_inside
	.p2align	1
	.type	__array.alloca_inside,@function
__array.alloca_inside:                  # @__array.alloca_inside
# %bb.0:
	addi	sp, sp, -48
	sw	ra, 44(sp)                      # 4-byte Folded Spill
	sw	s0, 40(sp)                      # 4-byte Folded Spill
	sw	s1, 36(sp)                      # 4-byte Folded Spill
	sw	s2, 32(sp)                      # 4-byte Folded Spill
	sw	s3, 28(sp)                      # 4-byte Folded Spill
	sw	s4, 24(sp)                      # 4-byte Folded Spill
	sw	s5, 20(sp)                      # 4-byte Folded Spill
	sw	s6, 16(sp)                      # 4-byte Folded Spill
	sw	s7, 12(sp)                      # 4-byte Folded Spill
	li	a4, 1
	mv	s6, a2
	mv	s2, a0
	bne	a1, a4, .LBB22_2
# %bb.1:
	lw	s0, 0(s6)
	mul	a0, s0, s2
	addi	a0, a0, 4
	call	malloc
	sw	s0, 0(a0)
	addi	s3, a0, 4
	j	.LBB22_5
.LBB22_2:
	mv	s4, a1
	lw	s0, 0(s6)
	addi	s5, a3, -1
	snez	s1, s5
	slli	a0, s0, 2
	addi	a0, a0, 4
	call	malloc
	sw	s0, 0(a0)
	sgtz	a1, s0
	and	a1, a1, s1
	addi	s3, a0, 4
	beqz	a1, .LBB22_5
# %bb.3:
	li	s0, 0
	addi	s4, s4, -1
	addi	s7, s6, 4
	mv	s1, s3
.LBB22_4:                               # =>This Inner Loop Header: Depth=1
	mv	a0, s2
	mv	a1, s4
	mv	a2, s7
	mv	a3, s5
	call	__array.alloca_inside
	sw	a0, 0(s1)
	lw	a0, 0(s6)
	addi	s0, s0, 1
	addi	s1, s1, 4
	blt	s0, a0, .LBB22_4
.LBB22_5:
	mv	a0, s3
	lw	ra, 44(sp)                      # 4-byte Folded Reload
	lw	s0, 40(sp)                      # 4-byte Folded Reload
	lw	s1, 36(sp)                      # 4-byte Folded Reload
	lw	s2, 32(sp)                      # 4-byte Folded Reload
	lw	s3, 28(sp)                      # 4-byte Folded Reload
	lw	s4, 24(sp)                      # 4-byte Folded Reload
	lw	s5, 20(sp)                      # 4-byte Folded Reload
	lw	s6, 16(sp)                      # 4-byte Folded Reload
	lw	s7, 12(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 48
	ret
.Lfunc_end22:
	.size	__array.alloca_inside, .Lfunc_end22-__array.alloca_inside
                                        # -- End function
	.globl	__array.alloca                  # -- Begin function __array.alloca
	.p2align	1
	.type	__array.alloca,@function
__array.alloca:                         # @__array.alloca
# %bb.0:
	addi	sp, sp, -48
	sw	ra, 20(sp)                      # 4-byte Folded Spill
	sw	s0, 16(sp)                      # 4-byte Folded Spill
	sw	s1, 12(sp)                      # 4-byte Folded Spill
	sw	s2, 8(sp)                       # 4-byte Folded Spill
	mv	s0, a2
	mv	s2, a1
	mv	s1, a0
	sw	a7, 44(sp)
	sw	a6, 40(sp)
	sw	a5, 36(sp)
	sw	a4, 32(sp)
	sw	a3, 28(sp)
	slli	a0, a2, 2
	call	malloc
	mv	a2, a0
	addi	a0, sp, 28
	sw	a0, 4(sp)
	blez	s0, .LBB23_3
# %bb.1:
	lw	a0, 4(sp)
	addi	a0, a0, 4
	mv	a1, a2
	mv	a3, s0
.LBB23_2:                               # =>This Inner Loop Header: Depth=1
	sw	a0, 4(sp)
	lw	a4, -4(a0)
	sw	a4, 0(a1)
	addi	a0, a0, 4
	addi	a3, a3, -1
	addi	a1, a1, 4
	bnez	a3, .LBB23_2
.LBB23_3:
	mv	a0, s1
	mv	a1, s2
	mv	a3, s0
	call	__array.alloca_inside
	lw	ra, 20(sp)                      # 4-byte Folded Reload
	lw	s0, 16(sp)                      # 4-byte Folded Reload
	lw	s1, 12(sp)                      # 4-byte Folded Reload
	lw	s2, 8(sp)                       # 4-byte Folded Reload
	addi	sp, sp, 48
	ret
.Lfunc_end23:
	.size	__array.alloca, .Lfunc_end23-__array.alloca
                                        # -- End function
	.globl	Int_toString                    # -- Begin function Int_toString
	.p2align	1
	.type	Int_toString,@function
Int_toString:                           # @Int_toString
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)                      # 4-byte Folded Spill
	sw	s0, 8(sp)                       # 4-byte Folded Spill
	sw	s1, 4(sp)                       # 4-byte Folded Spill
	mv	s0, a0
	li	a0, 10
	call	malloc
	mv	s1, a0
	lui	a0, %hi(.L.str.2)
	addi	a1, a0, %lo(.L.str.2)
	mv	a0, s1
	mv	a2, s0
	call	sprintf
	mv	a0, s1
	lw	ra, 12(sp)                      # 4-byte Folded Reload
	lw	s0, 8(sp)                       # 4-byte Folded Reload
	lw	s1, 4(sp)                       # 4-byte Folded Reload
	addi	sp, sp, 16
	ret
.Lfunc_end24:
	.size	Int_toString, .Lfunc_end24-Int_toString
                                        # -- End function
	.globl	Bool_toString                   # -- Begin function Bool_toString
	.p2align	1
	.type	Bool_toString,@function
Bool_toString:                          # @Bool_toString
# %bb.0:
	bnez	a0, .LBB25_2
# %bb.1:
	lui	a0, %hi(.L.str.5)
	addi	a0, a0, %lo(.L.str.5)
	ret
.LBB25_2:
	lui	a0, %hi(.L.str.4)
	addi	a0, a0, %lo(.L.str.4)
	ret
.Lfunc_end25:
	.size	Bool_toString, .Lfunc_end25-Bool_toString
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%s"
	.size	.L.str, 3

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"%s\n"
	.size	.L.str.1, 4

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"%d"
	.size	.L.str.2, 3

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"%d\n"
	.size	.L.str.3, 4

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"true"
	.size	.L.str.4, 5

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"false"
	.size	.L.str.5, 6

	.ident	"Ubuntu clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits

   .section .text
   .globl quick_sort_inf
quick_sort_inf:
   addi sp, sp, -44
   sw t0, 32(sp)
   sw t1, 36(sp)
   sw t2, 40(sp)

   .section .text
   .globl quick_sort_inf_entry
quick_sort_inf_entry:
   # %a.3 = alloca ptr

   addi t0, sp, 4
   sw t0, 0(sp)
   # store ptr %a, ptr %a.3

   mv t0, a0
   lw t1, 0(sp)
   sw t0, 0(t1)
   # %var77 = load ptr, ptr %a.3

   lw t0, 0(sp)
   lw t1, 0(t0)
   sw t1, 8(sp)
   # %var78 = load ptr, ptr %a.3

   lw t0, 0(sp)
   lw t1, 0(t0)
   sw t1, 12(sp)
   # %var79 = call i32 @array.size(ptr %var78)

   sw ra, 28(sp)
   lw a0, 12(sp)
   call array.size
   lw ra, 28(sp)
   sw a0, 16(sp)
   # %var80 = sub i32 %var79, 1

   lw t0, 16(sp)
   li t1, 1
   sub t2, t0, t1
   sw t2, 20(sp)
   # call void @quick_sort(ptr %var77, i32 0, i32 %var80)

   sw ra, 28(sp)
   lw a0, 8(sp)
   li a1, 0
   lw a2, 20(sp)
   call quick_sort
   lw ra, 28(sp)
   sw a0, 24(sp)
   # ret void

   addi sp, sp, 44
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   ret

   .section .text
   .globl partition
partition:
   addi sp, sp, -316
   sw t0, 304(sp)
   sw t1, 308(sp)
   sw t2, 312(sp)

   .section .text
   .globl partition_entry
partition_entry:
   # %a.1 = alloca ptr

   addi t0, sp, 4
   sw t0, 0(sp)
   # store ptr %a, ptr %a.1

   mv t0, a0
   lw t1, 0(sp)
   sw t0, 0(t1)
   # %p.1 = alloca i32

   addi t0, sp, 12
   sw t0, 8(sp)
   # store i32 %p, ptr %p.1

   mv t0, a1
   lw t1, 8(sp)
   sw t0, 0(t1)
   # %r.1 = alloca i32

   addi t0, sp, 20
   sw t0, 16(sp)
   # store i32 %r, ptr %r.1

   mv t0, a2
   lw t1, 16(sp)
   sw t0, 0(t1)
   # %pivot.1 = alloca i32

   addi t0, sp, 28
   sw t0, 24(sp)
   # %var0 = load ptr, ptr %a.1

   lw t0, 0(sp)
   lw t1, 0(t0)
   sw t1, 32(sp)
   # %var1 = load i32, ptr %r.1

   lw t0, 16(sp)
   lw t1, 0(t0)
   sw t1, 36(sp)
   # %var2 = getelementptr i32, ptr %var0, i32 %var1

   lw t0, 32(sp)
   lw t1, 36(sp)
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 40(sp)
   # %var3 = load i32, ptr %var2

   lw t0, 40(sp)
   lw t1, 0(t0)
   sw t1, 44(sp)
   # store i32 %var3, ptr %pivot.1

   lw t0, 44(sp)
   lw t1, 24(sp)
   sw t0, 0(t1)
   # %i.1 = alloca i32

   addi t0, sp, 52
   sw t0, 48(sp)
   # %var4 = load i32, ptr %p.1

   lw t0, 8(sp)
   lw t1, 0(t0)
   sw t1, 56(sp)
   # %var5 = sub i32 %var4, 1

   lw t0, 56(sp)
   li t1, 1
   sub t2, t0, t1
   sw t2, 60(sp)
   # store i32 %var5, ptr %i.1

   lw t0, 60(sp)
   lw t1, 48(sp)
   sw t0, 0(t1)
   # %j.1 = alloca i32

   addi t0, sp, 68
   sw t0, 64(sp)
   # store i32 0, ptr %j.1

   li t0, 0
   lw t1, 64(sp)
   sw t0, 0(t1)
   # %var6 = load i32, ptr %j.1

   lw t0, 64(sp)
   lw t1, 0(t0)
   sw t1, 72(sp)
   # %var7 = load i32, ptr %p.1

   lw t0, 8(sp)
   lw t1, 0(t0)
   sw t1, 76(sp)
   # store i32 %var7, ptr %j.1

   lw t0, 76(sp)
   lw t1, 64(sp)
   sw t0, 0(t1)
   # br label %for.cond.0

   j partition_for.cond.0

   .section .text
   .globl partition_for.cond.0
partition_for.cond.0:
   # %var8 = load i32, ptr %j.1

   lw t0, 64(sp)
   lw t1, 0(t0)
   sw t1, 80(sp)
   # %var9 = load i32, ptr %r.1

   lw t0, 16(sp)
   lw t1, 0(t0)
   sw t1, 84(sp)
   # %var10 = icmp slt i32 %var8, %var9

   lw t0, 80(sp)
   lw t1, 84(sp)
   sub t2, t0, t1
   sltz    t0, t2
   sw t0, 88(sp)
   # br i1 %var10, label %for.body.0, label %for.back.0

   lw t0, 88(sp)
   bne      t0, x0, .+8
   j partition_for.back.0
   j partition_for.body.0

   .section .text
   .globl partition_for.body.0
partition_for.body.0:
   # %var11 = load ptr, ptr %a.1

   lw t0, 0(sp)
   lw t1, 0(t0)
   sw t1, 92(sp)
   # %var12 = load i32, ptr %j.1

   lw t0, 64(sp)
   lw t1, 0(t0)
   sw t1, 96(sp)
   # %var13 = getelementptr i32, ptr %var11, i32 %var12

   lw t0, 92(sp)
   lw t1, 96(sp)
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 100(sp)
   # %var14 = load i32, ptr %var13

   lw t0, 100(sp)
   lw t1, 0(t0)
   sw t1, 104(sp)
   # %var15 = load i32, ptr %pivot.1

   lw t0, 24(sp)
   lw t1, 0(t0)
   sw t1, 108(sp)
   # %var16 = icmp sle i32 %var14, %var15

   lw t0, 104(sp)
   lw t1, 108(sp)
   sub t2, t0, t1
   sltz    t0, t2
   seqz    t1, t2
   or t0, t0, t1
   sw t0, 112(sp)
   # br i1 %var16, label %if.then.0, label %if.else.0

   lw t0, 112(sp)
   bne      t0, x0, .+8
   j partition_if.else.0
   j partition_if.then.0

   .section .text
   .globl partition_if.then.0
partition_if.then.0:
   # %var17 = load i32, ptr %i.1

   lw t0, 48(sp)
   lw t1, 0(t0)
   sw t1, 116(sp)
   # %var18 = add i32 %var17, 1

   lw t0, 116(sp)
   li t1, 1
   add t2, t0, t1
   sw t2, 120(sp)
   # store i32 %var18, ptr %i.1

   lw t0, 120(sp)
   lw t1, 48(sp)
   sw t0, 0(t1)
   # %t.1 = alloca i32

   addi t0, sp, 128
   sw t0, 124(sp)
   # %var19 = load ptr, ptr %a.1

   lw t0, 0(sp)
   lw t1, 0(t0)
   sw t1, 132(sp)
   # %var20 = load i32, ptr %i.1

   lw t0, 48(sp)
   lw t1, 0(t0)
   sw t1, 136(sp)
   # %var21 = getelementptr i32, ptr %var19, i32 %var20

   lw t0, 132(sp)
   lw t1, 136(sp)
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 140(sp)
   # %var22 = load i32, ptr %var21

   lw t0, 140(sp)
   lw t1, 0(t0)
   sw t1, 144(sp)
   # store i32 %var22, ptr %t.1

   lw t0, 144(sp)
   lw t1, 124(sp)
   sw t0, 0(t1)
   # %var23 = load ptr, ptr %a.1

   lw t0, 0(sp)
   lw t1, 0(t0)
   sw t1, 148(sp)
   # %var24 = load i32, ptr %i.1

   lw t0, 48(sp)
   lw t1, 0(t0)
   sw t1, 152(sp)
   # %var25 = getelementptr i32, ptr %var23, i32 %var24

   lw t0, 148(sp)
   lw t1, 152(sp)
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 156(sp)
   # %var26 = load i32, ptr %var25

   lw t0, 156(sp)
   lw t1, 0(t0)
   sw t1, 160(sp)
   # %var27 = load ptr, ptr %a.1

   lw t0, 0(sp)
   lw t1, 0(t0)
   sw t1, 164(sp)
   # %var28 = load i32, ptr %j.1

   lw t0, 64(sp)
   lw t1, 0(t0)
   sw t1, 168(sp)
   # %var29 = getelementptr i32, ptr %var27, i32 %var28

   lw t0, 164(sp)
   lw t1, 168(sp)
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 172(sp)
   # %var30 = load i32, ptr %var29

   lw t0, 172(sp)
   lw t1, 0(t0)
   sw t1, 176(sp)
   # store i32 %var30, ptr %var25

   lw t0, 176(sp)
   lw t1, 156(sp)
   sw t0, 0(t1)
   # %var31 = load ptr, ptr %a.1

   lw t0, 0(sp)
   lw t1, 0(t0)
   sw t1, 180(sp)
   # %var32 = load i32, ptr %j.1

   lw t0, 64(sp)
   lw t1, 0(t0)
   sw t1, 184(sp)
   # %var33 = getelementptr i32, ptr %var31, i32 %var32

   lw t0, 180(sp)
   lw t1, 184(sp)
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 188(sp)
   # %var34 = load i32, ptr %var33

   lw t0, 188(sp)
   lw t1, 0(t0)
   sw t1, 192(sp)
   # %var35 = load i32, ptr %t.1

   lw t0, 124(sp)
   lw t1, 0(t0)
   sw t1, 196(sp)
   # store i32 %var35, ptr %var33

   lw t0, 196(sp)
   lw t1, 188(sp)
   sw t0, 0(t1)
   # br label %if.back.0

   j partition_if.back.0

   .section .text
   .globl partition_if.else.0
partition_if.else.0:
   # br label %if.back.0

   j partition_if.back.0

   .section .text
   .globl partition_if.back.0
partition_if.back.0:
   # br label %for.step.0

   j partition_for.step.0

   .section .text
   .globl partition_for.step.0
partition_for.step.0:
   # %var36 = load i32, ptr %j.1

   lw t0, 64(sp)
   lw t1, 0(t0)
   sw t1, 200(sp)
   # %var37 = add i32 %var36, 1

   lw t0, 200(sp)
   li t1, 1
   add t2, t0, t1
   sw t2, 204(sp)
   # store i32 %var37, ptr %j.1

   lw t0, 204(sp)
   lw t1, 64(sp)
   sw t0, 0(t1)
   # br label %for.cond.0

   j partition_for.cond.0

   .section .text
   .globl partition_for.back.0
partition_for.back.0:
   # %t.2 = alloca i32

   addi t0, sp, 212
   sw t0, 208(sp)
   # %var38 = load ptr, ptr %a.1

   lw t0, 0(sp)
   lw t1, 0(t0)
   sw t1, 216(sp)
   # %var39 = load i32, ptr %i.1

   lw t0, 48(sp)
   lw t1, 0(t0)
   sw t1, 220(sp)
   # %var40 = add i32 %var39, 1

   lw t0, 220(sp)
   li t1, 1
   add t2, t0, t1
   sw t2, 224(sp)
   # %var41 = getelementptr i32, ptr %var38, i32 %var40

   lw t0, 216(sp)
   lw t1, 224(sp)
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 228(sp)
   # %var42 = load i32, ptr %var41

   lw t0, 228(sp)
   lw t1, 0(t0)
   sw t1, 232(sp)
   # store i32 %var42, ptr %t.2

   lw t0, 232(sp)
   lw t1, 208(sp)
   sw t0, 0(t1)
   # %var43 = load ptr, ptr %a.1

   lw t0, 0(sp)
   lw t1, 0(t0)
   sw t1, 236(sp)
   # %var44 = load i32, ptr %i.1

   lw t0, 48(sp)
   lw t1, 0(t0)
   sw t1, 240(sp)
   # %var45 = add i32 %var44, 1

   lw t0, 240(sp)
   li t1, 1
   add t2, t0, t1
   sw t2, 244(sp)
   # %var46 = getelementptr i32, ptr %var43, i32 %var45

   lw t0, 236(sp)
   lw t1, 244(sp)
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 248(sp)
   # %var47 = load i32, ptr %var46

   lw t0, 248(sp)
   lw t1, 0(t0)
   sw t1, 252(sp)
   # %var48 = load ptr, ptr %a.1

   lw t0, 0(sp)
   lw t1, 0(t0)
   sw t1, 256(sp)
   # %var49 = load i32, ptr %r.1

   lw t0, 16(sp)
   lw t1, 0(t0)
   sw t1, 260(sp)
   # %var50 = getelementptr i32, ptr %var48, i32 %var49

   lw t0, 256(sp)
   lw t1, 260(sp)
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 264(sp)
   # %var51 = load i32, ptr %var50

   lw t0, 264(sp)
   lw t1, 0(t0)
   sw t1, 268(sp)
   # store i32 %var51, ptr %var46

   lw t0, 268(sp)
   lw t1, 248(sp)
   sw t0, 0(t1)
   # %var52 = load ptr, ptr %a.1

   lw t0, 0(sp)
   lw t1, 0(t0)
   sw t1, 272(sp)
   # %var53 = load i32, ptr %r.1

   lw t0, 16(sp)
   lw t1, 0(t0)
   sw t1, 276(sp)
   # %var54 = getelementptr i32, ptr %var52, i32 %var53

   lw t0, 272(sp)
   lw t1, 276(sp)
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 280(sp)
   # %var55 = load i32, ptr %var54

   lw t0, 280(sp)
   lw t1, 0(t0)
   sw t1, 284(sp)
   # %var56 = load i32, ptr %t.2

   lw t0, 208(sp)
   lw t1, 0(t0)
   sw t1, 288(sp)
   # store i32 %var56, ptr %var54

   lw t0, 288(sp)
   lw t1, 280(sp)
   sw t0, 0(t1)
   # %var57 = load i32, ptr %i.1

   lw t0, 48(sp)
   lw t1, 0(t0)
   sw t1, 292(sp)
   # %var58 = add i32 %var57, 1

   lw t0, 292(sp)
   li t1, 1
   add t2, t0, t1
   sw t2, 296(sp)
   # ret i32 %var58

   lw a0, 296(sp)
   addi sp, sp, 316
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   ret

   .section .text
   .globl __init
__init:
   addi sp, sp, -16
   sw t0, 4(sp)
   sw t1, 8(sp)
   sw t2, 12(sp)

   .section .text
   .globl __init_entry
__init_entry:
   # ret void

   addi sp, sp, 16
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   ret

   .section .text
   .globl main
main:
   addi sp, sp, -320
   sw t0, 308(sp)
   sw t1, 312(sp)
   sw t2, 316(sp)

   .section .text
   .globl main_entry
main_entry:
   # call void @__init()

   sw ra, 304(sp)
   call __init
   lw ra, 304(sp)
   sw a0, 0(sp)
   # %a.4 = alloca ptr

   addi t0, sp, 8
   sw t0, 4(sp)
   # %var82 = call ptr @_malloc(ptr 200)

   sw ra, 304(sp)
   li a0, 200
   call _malloc
   lw ra, 304(sp)
   sw a0, 12(sp)
   # %var84 = getelementptr ptr, ptr 4, i32 0

   li t0, 4
   li t1, 0
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 16(sp)
   # store ptr %var84, ptr %var82

   lw t0, 16(sp)
   lw t1, 12(sp)
   sw t0, 0(t1)
   # %var86 = getelementptr ptr, ptr 2, i32 1

   li t0, 2
   li t1, 1
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 20(sp)
   # store ptr %var86, ptr %var82

   lw t0, 20(sp)
   lw t1, 12(sp)
   sw t0, 0(t1)
   # %var88 = getelementptr ptr, ptr 46, i32 2

   li t0, 46
   li t1, 2
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 24(sp)
   # store ptr %var88, ptr %var82

   lw t0, 24(sp)
   lw t1, 12(sp)
   sw t0, 0(t1)
   # %var90 = getelementptr ptr, ptr 33, i32 3

   li t0, 33
   li t1, 3
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 28(sp)
   # store ptr %var90, ptr %var82

   lw t0, 28(sp)
   lw t1, 12(sp)
   sw t0, 0(t1)
   # %var92 = getelementptr ptr, ptr 100, i32 4

   li t0, 100
   li t1, 4
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 32(sp)
   # store ptr %var92, ptr %var82

   lw t0, 32(sp)
   lw t1, 12(sp)
   sw t0, 0(t1)
   # %var94 = getelementptr ptr, ptr 80, i32 5

   li t0, 80
   li t1, 5
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 36(sp)
   # store ptr %var94, ptr %var82

   lw t0, 36(sp)
   lw t1, 12(sp)
   sw t0, 0(t1)
   # %var96 = getelementptr ptr, ptr 53, i32 6

   li t0, 53
   li t1, 6
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 40(sp)
   # store ptr %var96, ptr %var82

   lw t0, 40(sp)
   lw t1, 12(sp)
   sw t0, 0(t1)
   # %var98 = getelementptr ptr, ptr 88, i32 7

   li t0, 88
   li t1, 7
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 44(sp)
   # store ptr %var98, ptr %var82

   lw t0, 44(sp)
   lw t1, 12(sp)
   sw t0, 0(t1)
   # %var100 = getelementptr ptr, ptr 18, i32 8

   li t0, 18
   li t1, 8
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 48(sp)
   # store ptr %var100, ptr %var82

   lw t0, 48(sp)
   lw t1, 12(sp)
   sw t0, 0(t1)
   # %var102 = getelementptr ptr, ptr 33, i32 9

   li t0, 33
   li t1, 9
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 52(sp)
   # store ptr %var102, ptr %var82

   lw t0, 52(sp)
   lw t1, 12(sp)
   sw t0, 0(t1)
   # %var104 = getelementptr ptr, ptr 76, i32 10

   li t0, 76
   li t1, 10
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 56(sp)
   # store ptr %var104, ptr %var82

   lw t0, 56(sp)
   lw t1, 12(sp)
   sw t0, 0(t1)
   # %var106 = getelementptr ptr, ptr 78, i32 11

   li t0, 78
   li t1, 11
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 60(sp)
   # store ptr %var106, ptr %var82

   lw t0, 60(sp)
   lw t1, 12(sp)
   sw t0, 0(t1)
   # %var108 = getelementptr ptr, ptr 62, i32 12

   li t0, 62
   li t1, 12
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 64(sp)
   # store ptr %var108, ptr %var82

   lw t0, 64(sp)
   lw t1, 12(sp)
   sw t0, 0(t1)
   # %var110 = getelementptr ptr, ptr 77, i32 13

   li t0, 77
   li t1, 13
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 68(sp)
   # store ptr %var110, ptr %var82

   lw t0, 68(sp)
   lw t1, 12(sp)
   sw t0, 0(t1)
   # %var112 = getelementptr ptr, ptr 73, i32 14

   li t0, 73
   li t1, 14
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 72(sp)
   # store ptr %var112, ptr %var82

   lw t0, 72(sp)
   lw t1, 12(sp)
   sw t0, 0(t1)
   # %var114 = getelementptr ptr, ptr 73, i32 15

   li t0, 73
   li t1, 15
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 76(sp)
   # store ptr %var114, ptr %var82

   lw t0, 76(sp)
   lw t1, 12(sp)
   sw t0, 0(t1)
   # %var116 = getelementptr ptr, ptr 44, i32 16

   li t0, 44
   li t1, 16
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 80(sp)
   # store ptr %var116, ptr %var82

   lw t0, 80(sp)
   lw t1, 12(sp)
   sw t0, 0(t1)
   # %var118 = getelementptr ptr, ptr 11, i32 17

   li t0, 11
   li t1, 17
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 84(sp)
   # store ptr %var118, ptr %var82

   lw t0, 84(sp)
   lw t1, 12(sp)
   sw t0, 0(t1)
   # %var120 = getelementptr ptr, ptr 61, i32 18

   li t0, 61
   li t1, 18
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 88(sp)
   # store ptr %var120, ptr %var82

   lw t0, 88(sp)
   lw t1, 12(sp)
   sw t0, 0(t1)
   # %var122 = getelementptr ptr, ptr 23, i32 19

   li t0, 23
   li t1, 19
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 92(sp)
   # store ptr %var122, ptr %var82

   lw t0, 92(sp)
   lw t1, 12(sp)
   sw t0, 0(t1)
   # %var124 = getelementptr ptr, ptr 17, i32 20

   li t0, 17
   li t1, 20
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 96(sp)
   # store ptr %var124, ptr %var82

   lw t0, 96(sp)
   lw t1, 12(sp)
   sw t0, 0(t1)
   # %var126 = getelementptr ptr, ptr 50, i32 21

   li t0, 50
   li t1, 21
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 100(sp)
   # store ptr %var126, ptr %var82

   lw t0, 100(sp)
   lw t1, 12(sp)
   sw t0, 0(t1)
   # %var128 = getelementptr ptr, ptr 91, i32 22

   li t0, 91
   li t1, 22
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 104(sp)
   # store ptr %var128, ptr %var82

   lw t0, 104(sp)
   lw t1, 12(sp)
   sw t0, 0(t1)
   # %var130 = getelementptr ptr, ptr 59, i32 23

   li t0, 59
   li t1, 23
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 108(sp)
   # store ptr %var130, ptr %var82

   lw t0, 108(sp)
   lw t1, 12(sp)
   sw t0, 0(t1)
   # %var132 = getelementptr ptr, ptr 10, i32 24

   li t0, 10
   li t1, 24
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 112(sp)
   # store ptr %var132, ptr %var82

   lw t0, 112(sp)
   lw t1, 12(sp)
   sw t0, 0(t1)
   # %var134 = getelementptr ptr, ptr 21, i32 25

   li t0, 21
   li t1, 25
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 116(sp)
   # store ptr %var134, ptr %var82

   lw t0, 116(sp)
   lw t1, 12(sp)
   sw t0, 0(t1)
   # %var136 = getelementptr ptr, ptr 37, i32 26

   li t0, 37
   li t1, 26
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 120(sp)
   # store ptr %var136, ptr %var82

   lw t0, 120(sp)
   lw t1, 12(sp)
   sw t0, 0(t1)
   # %var138 = getelementptr ptr, ptr 74, i32 27

   li t0, 74
   li t1, 27
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 124(sp)
   # store ptr %var138, ptr %var82

   lw t0, 124(sp)
   lw t1, 12(sp)
   sw t0, 0(t1)
   # %var140 = getelementptr ptr, ptr 65, i32 28

   li t0, 65
   li t1, 28
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 128(sp)
   # store ptr %var140, ptr %var82

   lw t0, 128(sp)
   lw t1, 12(sp)
   sw t0, 0(t1)
   # %var142 = getelementptr ptr, ptr 48, i32 29

   li t0, 48
   li t1, 29
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 132(sp)
   # store ptr %var142, ptr %var82

   lw t0, 132(sp)
   lw t1, 12(sp)
   sw t0, 0(t1)
   # %var144 = getelementptr ptr, ptr 48, i32 30

   li t0, 48
   li t1, 30
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 136(sp)
   # store ptr %var144, ptr %var82

   lw t0, 136(sp)
   lw t1, 12(sp)
   sw t0, 0(t1)
   # %var146 = getelementptr ptr, ptr 56, i32 31

   li t0, 56
   li t1, 31
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 140(sp)
   # store ptr %var146, ptr %var82

   lw t0, 140(sp)
   lw t1, 12(sp)
   sw t0, 0(t1)
   # %var148 = getelementptr ptr, ptr 44, i32 32

   li t0, 44
   li t1, 32
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 144(sp)
   # store ptr %var148, ptr %var82

   lw t0, 144(sp)
   lw t1, 12(sp)
   sw t0, 0(t1)
   # %var150 = getelementptr ptr, ptr 88, i32 33

   li t0, 88
   li t1, 33
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 148(sp)
   # store ptr %var150, ptr %var82

   lw t0, 148(sp)
   lw t1, 12(sp)
   sw t0, 0(t1)
   # %var152 = getelementptr ptr, ptr 95, i32 34

   li t0, 95
   li t1, 34
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 152(sp)
   # store ptr %var152, ptr %var82

   lw t0, 152(sp)
   lw t1, 12(sp)
   sw t0, 0(t1)
   # %var154 = getelementptr ptr, ptr 88, i32 35

   li t0, 88
   li t1, 35
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 156(sp)
   # store ptr %var154, ptr %var82

   lw t0, 156(sp)
   lw t1, 12(sp)
   sw t0, 0(t1)
   # %var156 = getelementptr ptr, ptr 96, i32 36

   li t0, 96
   li t1, 36
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 160(sp)
   # store ptr %var156, ptr %var82

   lw t0, 160(sp)
   lw t1, 12(sp)
   sw t0, 0(t1)
   # %var158 = getelementptr ptr, ptr 58, i32 37

   li t0, 58
   li t1, 37
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 164(sp)
   # store ptr %var158, ptr %var82

   lw t0, 164(sp)
   lw t1, 12(sp)
   sw t0, 0(t1)
   # %var160 = getelementptr ptr, ptr 73, i32 38

   li t0, 73
   li t1, 38
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 168(sp)
   # store ptr %var160, ptr %var82

   lw t0, 168(sp)
   lw t1, 12(sp)
   sw t0, 0(t1)
   # %var162 = getelementptr ptr, ptr 47, i32 39

   li t0, 47
   li t1, 39
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 172(sp)
   # store ptr %var162, ptr %var82

   lw t0, 172(sp)
   lw t1, 12(sp)
   sw t0, 0(t1)
   # %var164 = getelementptr ptr, ptr 90, i32 40

   li t0, 90
   li t1, 40
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 176(sp)
   # store ptr %var164, ptr %var82

   lw t0, 176(sp)
   lw t1, 12(sp)
   sw t0, 0(t1)
   # %var166 = getelementptr ptr, ptr 79, i32 41

   li t0, 79
   li t1, 41
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 180(sp)
   # store ptr %var166, ptr %var82

   lw t0, 180(sp)
   lw t1, 12(sp)
   sw t0, 0(t1)
   # %var168 = getelementptr ptr, ptr 16, i32 42

   li t0, 16
   li t1, 42
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 184(sp)
   # store ptr %var168, ptr %var82

   lw t0, 184(sp)
   lw t1, 12(sp)
   sw t0, 0(t1)
   # %var170 = getelementptr ptr, ptr 58, i32 43

   li t0, 58
   li t1, 43
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 188(sp)
   # store ptr %var170, ptr %var82

   lw t0, 188(sp)
   lw t1, 12(sp)
   sw t0, 0(t1)
   # %var172 = getelementptr ptr, ptr 49, i32 44

   li t0, 49
   li t1, 44
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 192(sp)
   # store ptr %var172, ptr %var82

   lw t0, 192(sp)
   lw t1, 12(sp)
   sw t0, 0(t1)
   # %var174 = getelementptr ptr, ptr 28, i32 45

   li t0, 28
   li t1, 45
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 196(sp)
   # store ptr %var174, ptr %var82

   lw t0, 196(sp)
   lw t1, 12(sp)
   sw t0, 0(t1)
   # %var176 = getelementptr ptr, ptr 74, i32 46

   li t0, 74
   li t1, 46
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 200(sp)
   # store ptr %var176, ptr %var82

   lw t0, 200(sp)
   lw t1, 12(sp)
   sw t0, 0(t1)
   # %var178 = getelementptr ptr, ptr 12, i32 47

   li t0, 12
   li t1, 47
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 204(sp)
   # store ptr %var178, ptr %var82

   lw t0, 204(sp)
   lw t1, 12(sp)
   sw t0, 0(t1)
   # %var180 = getelementptr ptr, ptr 96, i32 48

   li t0, 96
   li t1, 48
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 208(sp)
   # store ptr %var180, ptr %var82

   lw t0, 208(sp)
   lw t1, 12(sp)
   sw t0, 0(t1)
   # %var182 = getelementptr ptr, ptr 3, i32 49

   li t0, 3
   li t1, 49
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 212(sp)
   # store ptr %var182, ptr %var82

   lw t0, 212(sp)
   lw t1, 12(sp)
   sw t0, 0(t1)
   # store ptr 3, ptr %a.4

   li t0, 3
   lw t1, 4(sp)
   sw t0, 0(t1)
   # %n.1 = alloca i32

   addi t0, sp, 220
   sw t0, 216(sp)
   # %var183 = load ptr, ptr %a.4

   lw t0, 4(sp)
   lw t1, 0(t0)
   sw t1, 224(sp)
   # %var184 = call i32 @array.size(ptr %var183)

   sw ra, 304(sp)
   lw a0, 224(sp)
   call array.size
   lw ra, 304(sp)
   sw a0, 228(sp)
   # store i32 %var184, ptr %n.1

   lw t0, 228(sp)
   lw t1, 216(sp)
   sw t0, 0(t1)
   # %i.2 = alloca i32

   addi t0, sp, 236
   sw t0, 232(sp)
   # store i32 0, ptr %i.2

   li t0, 0
   lw t1, 232(sp)
   sw t0, 0(t1)
   # %var186 = load ptr, ptr %a.4

   lw t0, 4(sp)
   lw t1, 0(t0)
   sw t1, 240(sp)
   # call void @quick_sort_inf(ptr %var186)

   sw ra, 304(sp)
   lw a0, 240(sp)
   call quick_sort_inf
   lw ra, 304(sp)
   sw a0, 244(sp)
   # %var187 = load i32, ptr %i.2

   lw t0, 232(sp)
   lw t1, 0(t0)
   sw t1, 248(sp)
   # store i32 0, ptr %i.2

   li t0, 0
   lw t1, 232(sp)
   sw t0, 0(t1)
   # br label %for.cond.1

   j main_for.cond.1

   .section .text
   .globl main_for.cond.1
main_for.cond.1:
   # %var188 = load i32, ptr %i.2

   lw t0, 232(sp)
   lw t1, 0(t0)
   sw t1, 252(sp)
   # %var189 = load i32, ptr %n.1

   lw t0, 216(sp)
   lw t1, 0(t0)
   sw t1, 256(sp)
   # %var190 = icmp slt i32 %var188, %var189

   lw t0, 252(sp)
   lw t1, 256(sp)
   sub t2, t0, t1
   sltz    t0, t2
   sw t0, 260(sp)
   # br i1 %var190, label %for.body.1, label %for.back.1

   lw t0, 260(sp)
   bne      t0, x0, .+8
   j main_for.back.1
   j main_for.body.1

   .section .text
   .globl main_for.body.1
main_for.body.1:
   # %var193 = load ptr, ptr %a.4

   lw t0, 4(sp)
   lw t1, 0(t0)
   sw t1, 264(sp)
   # %var194 = load i32, ptr %i.2

   lw t0, 232(sp)
   lw t1, 0(t0)
   sw t1, 268(sp)
   # %var195 = getelementptr i32, ptr %var193, i32 %var194

   lw t0, 264(sp)
   lw t1, 268(sp)
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 272(sp)
   # %var196 = load i32, ptr %var195

   lw t0, 272(sp)
   lw t1, 0(t0)
   sw t1, 276(sp)
   # %var192 = call ptr @toString(i32 %var196)

   sw ra, 304(sp)
   lw a0, 276(sp)
   call toString
   lw ra, 304(sp)
   sw a0, 280(sp)
   # %var197 = call ptr @string.add(ptr %var192, ptr @.str..0)

   sw ra, 304(sp)
   lw a0, 280(sp)
   la a1, @.str..0
   call string.add
   lw ra, 304(sp)
   sw a0, 284(sp)
   # call void @print(ptr %var197)

   sw ra, 304(sp)
   lw a0, 284(sp)
   call print
   lw ra, 304(sp)
   sw a0, 288(sp)
   # br label %for.step.1

   j main_for.step.1

   .section .text
   .globl main_for.step.1
main_for.step.1:
   # %var198 = load i32, ptr %i.2

   lw t0, 232(sp)
   lw t1, 0(t0)
   sw t1, 292(sp)
   # %var199 = add i32 %var198, 1

   lw t0, 292(sp)
   li t1, 1
   add t2, t0, t1
   sw t2, 296(sp)
   # store i32 %var199, ptr %i.2

   lw t0, 296(sp)
   lw t1, 232(sp)
   sw t0, 0(t1)
   # br label %for.cond.1

   j main_for.cond.1

   .section .text
   .globl main_for.back.1
main_for.back.1:
   # call void @println(ptr @.str..1)

   sw ra, 304(sp)
   la a0, @.str..1
   call println
   lw ra, 304(sp)
   sw a0, 300(sp)
   # ret i32 0

   li a0, 0
   addi sp, sp, 320
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   ret

   .section .text
   .globl quick_sort
quick_sort:
   addi sp, sp, -116
   sw t0, 104(sp)
   sw t1, 108(sp)
   sw t2, 112(sp)

   .section .text
   .globl quick_sort_entry
quick_sort_entry:
   # %a.2 = alloca ptr

   addi t0, sp, 4
   sw t0, 0(sp)
   # store ptr %a, ptr %a.2

   mv t0, a0
   lw t1, 0(sp)
   sw t0, 0(t1)
   # %p.2 = alloca i32

   addi t0, sp, 12
   sw t0, 8(sp)
   # store i32 %p, ptr %p.2

   mv t0, a1
   lw t1, 8(sp)
   sw t0, 0(t1)
   # %r.2 = alloca i32

   addi t0, sp, 20
   sw t0, 16(sp)
   # store i32 %r, ptr %r.2

   mv t0, a2
   lw t1, 16(sp)
   sw t0, 0(t1)
   # %var59 = load i32, ptr %p.2

   lw t0, 8(sp)
   lw t1, 0(t0)
   sw t1, 24(sp)
   # %var60 = load i32, ptr %r.2

   lw t0, 16(sp)
   lw t1, 0(t0)
   sw t1, 28(sp)
   # %var61 = icmp sge i32 %var59, %var60

   lw t0, 24(sp)
   lw t1, 28(sp)
   sub t2, t0, t1
   sgtz    t0, t2
   seqz    t1, t2
   or t0, t0, t1
   sw t0, 32(sp)
   # br i1 %var61, label %if.then.1, label %if.else.1

   lw t0, 32(sp)
   bne      t0, x0, .+8
   j quick_sort_if.else.1
   j quick_sort_if.then.1

   .section .text
   .globl quick_sort_if.then.1
quick_sort_if.then.1:
   # ret void

   addi sp, sp, 116
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   ret
   # br label %if.back.1

   j quick_sort_if.back.1

   .section .text
   .globl quick_sort_if.else.1
quick_sort_if.else.1:
   # br label %if.back.1

   j quick_sort_if.back.1

   .section .text
   .globl quick_sort_if.back.1
quick_sort_if.back.1:
   # %q.1 = alloca i32

   addi t0, sp, 40
   sw t0, 36(sp)
   # %var63 = load ptr, ptr %a.2

   lw t0, 0(sp)
   lw t1, 0(t0)
   sw t1, 44(sp)
   # %var64 = load i32, ptr %p.2

   lw t0, 8(sp)
   lw t1, 0(t0)
   sw t1, 48(sp)
   # %var65 = load i32, ptr %r.2

   lw t0, 16(sp)
   lw t1, 0(t0)
   sw t1, 52(sp)
   # %var62 = call i32 @partition(ptr %var63, i32 %var64, i32 %var65)

   sw ra, 100(sp)
   lw a0, 44(sp)
   lw a1, 48(sp)
   lw a2, 52(sp)
   call partition
   lw ra, 100(sp)
   sw a0, 56(sp)
   # store i32 %var62, ptr %q.1

   lw t0, 56(sp)
   lw t1, 36(sp)
   sw t0, 0(t1)
   # %var67 = load ptr, ptr %a.2

   lw t0, 0(sp)
   lw t1, 0(t0)
   sw t1, 60(sp)
   # %var68 = load i32, ptr %p.2

   lw t0, 8(sp)
   lw t1, 0(t0)
   sw t1, 64(sp)
   # %var69 = load i32, ptr %q.1

   lw t0, 36(sp)
   lw t1, 0(t0)
   sw t1, 68(sp)
   # %var70 = sub i32 %var69, 1

   lw t0, 68(sp)
   li t1, 1
   sub t2, t0, t1
   sw t2, 72(sp)
   # call void @quick_sort(ptr %var67, i32 %var68, i32 %var70)

   sw ra, 100(sp)
   lw a0, 60(sp)
   lw a1, 64(sp)
   lw a2, 72(sp)
   call quick_sort
   lw ra, 100(sp)
   sw a0, 76(sp)
   # %var72 = load ptr, ptr %a.2

   lw t0, 0(sp)
   lw t1, 0(t0)
   sw t1, 80(sp)
   # %var73 = load i32, ptr %q.1

   lw t0, 36(sp)
   lw t1, 0(t0)
   sw t1, 84(sp)
   # %var74 = add i32 %var73, 1

   lw t0, 84(sp)
   li t1, 1
   add t2, t0, t1
   sw t2, 88(sp)
   # %var75 = load i32, ptr %r.2

   lw t0, 16(sp)
   lw t1, 0(t0)
   sw t1, 92(sp)
   # call void @quick_sort(ptr %var72, i32 %var74, i32 %var75)

   sw ra, 100(sp)
   lw a0, 80(sp)
   lw a1, 88(sp)
   lw a2, 92(sp)
   call quick_sort
   lw ra, 100(sp)
   sw a0, 96(sp)
   # ret void

   addi sp, sp, 116
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   ret

   .section .rodata
@.str..1:
   .asciz ""

   .section .rodata
@.str..0:
   .asciz " "

