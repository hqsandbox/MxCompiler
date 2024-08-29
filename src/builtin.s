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
