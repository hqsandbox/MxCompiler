   .section .text
   .globl vector..tostring
vector..tostring:
   addi sp, sp, -144
   sw t0, 132(sp)
   sw t1, 136(sp)
   sw t2, 140(sp)
   # phi start 
   # phi end 
   mv x4, a0

   .section .text
   .globl vector..tostring_entry
vector..tostring_entry:
   # %var34 = call i32 @vector..getDim(ptr %_this)

   sw ra, 128(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x4, 16(sp)
   mv a0, x4
   call vector..getDim
   lw ra, 128(sp)
   mv x4, a0
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x4, 16(sp)
   # %var35 = icmp sgt i32 %var34, 0

   li t1, 0
   sub t2, x4, t1
   sgtz    x4, t2
   # br i1 %var35, label %if.then.2, label %if.else.2

   bne      x4, x0, .+8
   j vector..tostring_if.else.2
   # phi start 
   # phi end 
   j vector..tostring_if.then.2

   .section .text
   .globl vector..tostring_if.then.2
vector..tostring_if.then.2:
   # %var40 = getelementptr %class..vector, ptr %_this, i32 0, i32 0

   mv t0, x4
   li t1, 0
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x4, t0
   # %var41 = load ptr, ptr %var40

   mv t0, x4
   lw x4, 0(t0)
   # %var42 = getelementptr i32, ptr %var41, i32 0

   mv t0, x4
   li t1, 0
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x4, t0
   # %var43 = load i32, ptr %var42

   mv t0, x4
   lw x4, 0(t0)
   # %var38 = call ptr @toString(i32 %var43)

   sw ra, 128(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x4, 16(sp)
   mv a0, x4
   call toString
   lw ra, 128(sp)
   mv x4, a0
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x4, 16(sp)
   # %var44 = call ptr @string.add(ptr @.str..0, ptr %var38)

   sw ra, 128(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x4, 16(sp)
   la a0, @.str..0
   mv a1, x4
   call string.add
   lw ra, 128(sp)
   mv x4, a0
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x4, 16(sp)
   # %var45 = call ptr @string.copy(ptr %var44)

   sw ra, 128(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x4, 16(sp)
   mv a0, x4
   call string.copy
   lw ra, 128(sp)
   mv x4, a0
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x4, 16(sp)
   # br label %if.back.2

   # phi start 
   # phi end 
   j vector..tostring_if.back.2

   .section .text
   .globl vector..tostring_if.else.2
vector..tostring_if.else.2:
   # br label %if.back.2

   # phi start 
   la x4, @.str..0
   # phi end 
   j vector..tostring_if.back.2

   .section .text
   .globl vector..tostring_if.back.2
vector..tostring_if.back.2:
   # br label %for.cond.1

   # phi start 
   li x8, 1
   # phi end 
   j vector..tostring_for.cond.1

   .section .text
   .globl vector..tostring_for.cond.1
vector..tostring_for.cond.1:
   # %var49 = call i32 @vector..getDim(ptr %_this)

   sw ra, 128(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x8, 32(sp)
   sw x4, 16(sp)
   mv a0, x4
   call vector..getDim
   lw ra, 128(sp)
   mv x9, a0
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x8, 32(sp)
   lw x4, 16(sp)
   # %var50 = icmp slt i32 %i.2_for.cond.1, %var49

   sub t2, x8, x9
   sltz    x9, t2
   # br i1 %var50, label %for.body.1, label %for.back.1

   bne      x9, x0, .+8
   j vector..tostring_for.back.1
   # phi start 
   # phi end 
   j vector..tostring_for.body.1

   .section .text
   .globl vector..tostring_for.body.1
vector..tostring_for.body.1:
   # %var53 = call ptr @string.add(ptr %temp.1_for.cond.1, ptr @.str..1)

   sw ra, 128(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x8, 32(sp)
   sw x4, 16(sp)
   mv a0, x4
   la a1, @.str..1
   call string.add
   lw ra, 128(sp)
   mv x4, a0
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x8, 32(sp)
   lw x4, 16(sp)
   # %var56 = getelementptr %class..vector, ptr %_this, i32 0, i32 0

   mv t0, x4
   li t1, 0
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x9, t0
   # %var57 = load ptr, ptr %var56

   mv t0, x9
   lw x9, 0(t0)
   # %var59 = getelementptr i32, ptr %var57, i32 %i.2_for.cond.1

   mv t0, x9
   mv t1, x8
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x9, t0
   # %var60 = load i32, ptr %var59

   mv t0, x9
   lw x9, 0(t0)
   # %var54 = call ptr @toString(i32 %var60)

   sw ra, 128(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x8, 32(sp)
   sw x4, 16(sp)
   mv a0, x9
   call toString
   lw ra, 128(sp)
   mv x9, a0
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x8, 32(sp)
   lw x4, 16(sp)
   # %var61 = call ptr @string.add(ptr %var53, ptr %var54)

   sw ra, 128(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x8, 32(sp)
   sw x4, 16(sp)
   mv a0, x4
   mv a1, x9
   call string.add
   lw ra, 128(sp)
   mv x4, a0
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x8, 32(sp)
   lw x4, 16(sp)
   # %var62 = call ptr @string.copy(ptr %var61)

   sw ra, 128(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x8, 32(sp)
   sw x4, 16(sp)
   mv a0, x4
   call string.copy
   lw ra, 128(sp)
   mv x4, a0
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x8, 32(sp)
   lw x4, 16(sp)
   # br label %for.step.1

   # phi start 
   # phi end 
   j vector..tostring_for.step.1

   .section .text
   .globl vector..tostring_for.step.1
vector..tostring_for.step.1:
   # %var64 = add i32 %i.2_for.cond.1, 1

   li t1, 1
   add x8, x8, t1
   # br label %for.cond.1

   # phi start 
   # phi end 
   j vector..tostring_for.cond.1

   .section .text
   .globl vector..tostring_for.back.1
vector..tostring_for.back.1:
   # %var67 = call ptr @string.add(ptr %temp.1_for.cond.1, ptr @.str..2)

   sw ra, 128(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   mv a0, x4
   la a1, @.str..2
   call string.add
   lw ra, 128(sp)
   mv x3, a0
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   # %var68 = call ptr @string.copy(ptr %var67)

   sw ra, 128(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   mv a0, x3
   call string.copy
   lw ra, 128(sp)
   mv x3, a0
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   # ret ptr %var68

   mv a0, x3
   addi sp, sp, 144
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   # phi start 
   # phi end 
   ret

   .section .text
   .globl vector..init
vector..init:
   addi sp, sp, -144
   sw t0, 132(sp)
   sw t1, 136(sp)
   sw t2, 140(sp)
   mv x4, a0
   # phi start 
   # phi end 
   mv x4, a1

   .section .text
   .globl vector..init_entry
vector..init_entry:
   # %var1 = icmp eq ptr %vec, null

   li t1, 0
   sub t2, x4, t1
   seqz    x8, t2
   # br i1 %var1, label %if.then.0, label %if.else.0

   bne      x8, x0, .+8
   j vector..init_if.else.0
   # phi start 
   # phi end 
   j vector..init_if.then.0

   .section .text
   .globl vector..init_if.then.0
vector..init_if.then.0:
   # ret void

   addi sp, sp, 144
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   # phi start 
   # phi end 
   ret

   .section .text
   .globl vector..init_if.else.0
vector..init_if.else.0:
   # br label %if.back.0

   # phi start 
   # phi end 
   j vector..init_if.back.0

   .section .text
   .globl vector..init_if.back.0
vector..init_if.back.0:
   # %var3 = getelementptr %class..vector, ptr %_this, i32 0, i32 0

   mv t0, x4
   li t1, 0
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x8, t0
   # %var7 = call i32 @array.size(ptr %vec)

   sw ra, 128(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x8, 32(sp)
   sw x4, 16(sp)
   mv a0, x4
   call array.size
   lw ra, 128(sp)
   mv x9, a0
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x8, 32(sp)
   lw x4, 16(sp)
   # %var5 = call ptr @__array.alloca(i32 4, i32 1, i32 1, i32 %var7)

   sw ra, 128(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x8, 32(sp)
   sw x4, 16(sp)
   li a1, 1
   li a2, 1
   li a0, 4
   mv a3, x9
   call __array.alloca
   lw ra, 128(sp)
   mv x9, a0
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x8, 32(sp)
   lw x4, 16(sp)
   # store ptr %var5, ptr %var3

   sw x9, 0(x8)
   # br label %for.cond.0

   # phi start 
   li x8, 0
   # phi end 
   j vector..init_for.cond.0

   .section .text
   .globl vector..init_for.cond.0
vector..init_for.cond.0:
   # %var11 = call i32 @array.size(ptr %vec)

   sw ra, 128(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x8, 32(sp)
   sw x4, 16(sp)
   mv a0, x4
   call array.size
   lw ra, 128(sp)
   mv x9, a0
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x8, 32(sp)
   lw x4, 16(sp)
   # %var12 = icmp slt i32 %i.1_for.cond.0, %var11

   sub t2, x8, x9
   sltz    x9, t2
   # br i1 %var12, label %for.body.0, label %for.back.0

   bne      x9, x0, .+8
   j vector..init_for.back.0
   # phi start 
   # phi end 
   j vector..init_for.body.0

   .section .text
   .globl vector..init_for.body.0
vector..init_for.body.0:
   # %var14 = getelementptr %class..vector, ptr %_this, i32 0, i32 0

   mv t0, x4
   li t1, 0
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x9, t0
   # %var15 = load ptr, ptr %var14

   mv t0, x9
   lw x9, 0(t0)
   # %var17 = getelementptr i32, ptr %var15, i32 %i.1_for.cond.0

   mv t0, x9
   mv t1, x8
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x9, t0
   # %var21 = getelementptr i32, ptr %vec, i32 %i.1_for.cond.0

   mv t0, x4
   mv t1, x8
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv a0, t0
   # %var22 = load i32, ptr %var21

   mv t0, a0
   lw a0, 0(t0)
   # store i32 %var22, ptr %var17

   sw a0, 0(x9)
   # br label %for.step.0

   # phi start 
   # phi end 
   j vector..init_for.step.0

   .section .text
   .globl vector..init_for.step.0
vector..init_for.step.0:
   # %var24 = add i32 %i.1_for.cond.0, 1

   li t1, 1
   add x8, x8, t1
   # br label %for.cond.0

   # phi start 
   # phi end 
   j vector..init_for.cond.0

   .section .text
   .globl vector..init_for.back.0
vector..init_for.back.0:
   # ret void

   addi sp, sp, 144
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   # phi start 
   # phi end 
   ret

   .section .text
   .globl __init
__init:
   addi sp, sp, -144
   sw t0, 132(sp)
   sw t1, 136(sp)
   # phi start 
   # phi end 
   sw t2, 140(sp)

   .section .text
   .globl __init_entry
__init_entry:
   # ret void

   addi sp, sp, 144
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   # phi start 
   # phi end 
   ret

   .section .text
   .globl main
main:
   addi sp, sp, -156
   sw t0, 144(sp)
   sw t1, 148(sp)
   # phi start 
   # phi end 
   sw t2, 152(sp)

   .section .text
   .globl main_entry
main_entry:
   # call void @__init()

   sw ra, 140(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   call __init
   lw ra, 140(sp)
   sw a0, 128(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   # %var104 = call ptr @_malloc(i32 4)

   sw ra, 140(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   li a0, 4
   call _malloc
   lw ra, 140(sp)
   mv x3, a0
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   # %var105 = call ptr @__array.alloca(i32 4, i32 1, i32 1, i32 10)

   sw ra, 140(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x3, 12(sp)
   li a3, 10
   li a0, 4
   li a1, 1
   li a2, 1
   call __array.alloca
   lw ra, 140(sp)
   mv x4, a0
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x3, 12(sp)
   # br label %for.cond.3

   # phi start 
   li x8, 0
   # phi end 
   j main_for.cond.3

   .section .text
   .globl main_for.cond.3
main_for.cond.3:
   # %var108 = icmp slt i32 %i.4_for.cond.3, 10

   li t1, 10
   sub t2, x8, t1
   sltz    x9, t2
   # br i1 %var108, label %for.body.3, label %for.back.3

   bne      x9, x0, .+8
   j main_for.back.3
   # phi start 
   # phi end 
   j main_for.body.3

   .section .text
   .globl main_for.body.3
main_for.body.3:
   # %var111 = getelementptr i32, ptr %var105, i32 %i.4_for.cond.3

   mv t0, x4
   mv t1, x8
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x9, t0
   # %var114 = sub i32 9, %i.4_for.cond.3

   li t0, 9
   sub a0, t0, x8
   # store i32 %var114, ptr %var111

   sw a0, 0(x9)
   # br label %for.step.3

   # phi start 
   # phi end 
   j main_for.step.3

   .section .text
   .globl main_for.step.3
main_for.step.3:
   # %var116 = add i32 %i.4_for.cond.3, 1

   li t1, 1
   add x8, x8, t1
   # br label %for.cond.3

   # phi start 
   # phi end 
   j main_for.cond.3

   .section .text
   .globl main_for.back.3
main_for.back.3:
   # call void @vector..init(ptr %var104, ptr %var105)

   sw ra, 140(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x3, 12(sp)
   mv a0, x3
   mv a1, x4
   call vector..init
   lw ra, 140(sp)
   sw a0, 132(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x3, 12(sp)
   # %var121 = call ptr @vector..tostring(ptr %var104)

   sw ra, 140(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   mv a0, x3
   call vector..tostring
   lw ra, 140(sp)
   mv x3, a0
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   # call void @println(ptr %var121)

   sw ra, 140(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   mv a0, x3
   call println
   lw ra, 140(sp)
   sw a0, 136(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   # ret i32 0

   li a0, 0
   addi sp, sp, 156
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   # phi start 
   # phi end 
   ret

   .section .text
   .globl vector..getDim
vector..getDim:
   addi sp, sp, -144
   sw t0, 132(sp)
   sw t1, 136(sp)
   sw t2, 140(sp)
   # phi start 
   # phi end 
   mv x4, a0

   .section .text
   .globl vector..getDim_entry
vector..getDim_entry:
   # %var26 = getelementptr %class..vector, ptr %_this, i32 0, i32 0

   mv t0, x4
   li t1, 0
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x4, t0
   # %var27 = load ptr, ptr %var26

   mv t0, x4
   lw x4, 0(t0)
   # %var28 = icmp eq ptr %var27, null

   li t1, 0
   sub t2, x4, t1
   seqz    x4, t2
   # br i1 %var28, label %if.then.1, label %if.else.1

   bne      x4, x0, .+8
   j vector..getDim_if.else.1
   # phi start 
   # phi end 
   j vector..getDim_if.then.1

   .section .text
   .globl vector..getDim_if.then.1
vector..getDim_if.then.1:
   # ret i32 0

   li a0, 0
   addi sp, sp, 144
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   # phi start 
   # phi end 
   ret

   .section .text
   .globl vector..getDim_if.else.1
vector..getDim_if.else.1:
   # br label %if.back.1

   # phi start 
   # phi end 
   j vector..getDim_if.back.1

   .section .text
   .globl vector..getDim_if.back.1
vector..getDim_if.back.1:
   # %var30 = getelementptr %class..vector, ptr %_this, i32 0, i32 0

   mv t0, x4
   li t1, 0
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x3, t0
   # %var31 = load ptr, ptr %var30

   mv t0, x3
   lw x3, 0(t0)
   # %var32 = call i32 @array.size(ptr %var31)

   sw ra, 128(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   mv a0, x3
   call array.size
   lw ra, 128(sp)
   mv x3, a0
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   # ret i32 %var32

   mv a0, x3
   addi sp, sp, 144
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   # phi start 
   # phi end 
   ret

   .section .text
   .globl vector..copy
vector..copy:
   addi sp, sp, -144
   sw t0, 132(sp)
   sw t1, 136(sp)
   sw t2, 140(sp)
   mv x4, a0
   # phi start 
   # phi end 
   mv x3, a1

   .section .text
   .globl vector..copy_entry
vector..copy_entry:
   # %var71 = icmp eq ptr %rhs, null

   li t1, 0
   sub t2, x3, t1
   seqz    x8, t2
   # br i1 %var71, label %if.then.3, label %if.else.3

   bne      x8, x0, .+8
   j vector..copy_if.else.3
   # phi start 
   # phi end 
   j vector..copy_if.then.3

   .section .text
   .globl vector..copy_if.then.3
vector..copy_if.then.3:
   # ret i1 false

   li a0, 0
   addi sp, sp, 144
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   # phi start 
   # phi end 
   ret

   .section .text
   .globl vector..copy_if.else.3
vector..copy_if.else.3:
   # br label %if.back.3

   # phi start 
   # phi end 
   j vector..copy_if.back.3

   .section .text
   .globl vector..copy_if.back.3
vector..copy_if.back.3:
   # %var73 = call i32 @vector..getDim(ptr %rhs)

   sw ra, 128(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   mv a0, x3
   call vector..getDim
   lw ra, 128(sp)
   mv x8, a0
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x3, 12(sp)
   lw x4, 16(sp)
   # %var74 = icmp eq i32 %var73, 0

   li t1, 0
   sub t2, x8, t1
   seqz    x8, t2
   # br i1 %var74, label %if.then.4, label %if.else.4

   bne      x8, x0, .+8
   j vector..copy_if.else.4
   # phi start 
   # phi end 
   j vector..copy_if.then.4

   .section .text
   .globl vector..copy_if.then.4
vector..copy_if.then.4:
   # %var76 = getelementptr %class..vector, ptr %_this, i32 0, i32 0

   mv t0, x4
   li t1, 0
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x3, t0
   # store ptr null, ptr %var76

   li t0, 0
   sw t0, 0(x3)
   # br label %if.back.4

   # phi start 
   # phi end 
   j vector..copy_if.back.4

   .section .text
   .globl vector..copy_if.else.4
vector..copy_if.else.4:
   # %var79 = getelementptr %class..vector, ptr %_this, i32 0, i32 0

   mv t0, x4
   li t1, 0
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x8, t0
   # %var83 = call i32 @vector..getDim(ptr %rhs)

   sw ra, 128(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x8, 32(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   mv a0, x3
   call vector..getDim
   lw ra, 128(sp)
   mv x9, a0
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x8, 32(sp)
   lw x3, 12(sp)
   lw x4, 16(sp)
   # %var81 = call ptr @__array.alloca(i32 4, i32 1, i32 1, i32 %var83)

   sw ra, 128(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x8, 32(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   li a0, 4
   li a1, 1
   mv a3, x9
   li a2, 1
   call __array.alloca
   lw ra, 128(sp)
   mv x9, a0
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x8, 32(sp)
   lw x3, 12(sp)
   lw x4, 16(sp)
   # store ptr %var81, ptr %var79

   sw x9, 0(x8)
   # br label %for.cond.2

   # phi start 
   li x8, 0
   # phi end 
   j vector..copy_for.cond.2

   .section .text
   .globl vector..copy_for.cond.2
vector..copy_for.cond.2:
   # %var87 = call i32 @vector..getDim(ptr %_this)

   sw ra, 128(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x8, 32(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   mv a0, x4
   call vector..getDim
   lw ra, 128(sp)
   mv x9, a0
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x8, 32(sp)
   lw x3, 12(sp)
   lw x4, 16(sp)
   # %var88 = icmp slt i32 %i.3_for.cond.2, %var87

   sub t2, x8, x9
   sltz    x9, t2
   # br i1 %var88, label %for.body.2, label %for.back.2

   bne      x9, x0, .+8
   j vector..copy_for.back.2
   # phi start 
   # phi end 
   j vector..copy_for.body.2

   .section .text
   .globl vector..copy_for.body.2
vector..copy_for.body.2:
   # %var90 = getelementptr %class..vector, ptr %_this, i32 0, i32 0

   mv t0, x4
   li t1, 0
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x9, t0
   # %var91 = load ptr, ptr %var90

   mv t0, x9
   lw x9, 0(t0)
   # %var93 = getelementptr i32, ptr %var91, i32 %i.3_for.cond.2

   mv t0, x9
   mv t1, x8
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x9, t0
   # %var96 = getelementptr %class..vector, ptr %rhs, i32 0, i32 0

   mv t0, x3
   li t1, 0
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv a0, t0
   # %var97 = load ptr, ptr %var96

   mv t0, a0
   lw a0, 0(t0)
   # %var99 = getelementptr i32, ptr %var97, i32 %i.3_for.cond.2

   mv t0, a0
   mv t1, x8
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv a0, t0
   # %var100 = load i32, ptr %var99

   mv t0, a0
   lw a0, 0(t0)
   # store i32 %var100, ptr %var93

   sw a0, 0(x9)
   # br label %for.step.2

   # phi start 
   # phi end 
   j vector..copy_for.step.2

   .section .text
   .globl vector..copy_for.step.2
vector..copy_for.step.2:
   # %var102 = add i32 %i.3_for.cond.2, 1

   li t1, 1
   add x8, x8, t1
   # br label %for.cond.2

   # phi start 
   # phi end 
   j vector..copy_for.cond.2

   .section .text
   .globl vector..copy_for.back.2
vector..copy_for.back.2:
   # br label %if.back.4

   # phi start 
   # phi end 
   j vector..copy_if.back.4

   .section .text
   .globl vector..copy_if.back.4
vector..copy_if.back.4:
   # ret i1 true

   li a0, 1
   addi sp, sp, 144
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   # phi start 
   # phi end 
   ret

   .section .rodata
@.str..1:
   .asciz ", "

   .section .rodata
@.str..2:
   .asciz " )"

   .section .rodata
@.str..0:
   .asciz "( "

