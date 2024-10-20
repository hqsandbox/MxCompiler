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
   addi sp, sp, -176
   sw t0, 164(sp)
   sw t1, 168(sp)
   # phi start 
   # phi end 
   sw t2, 172(sp)

   .section .text
   .globl main_entry
main_entry:
   # call void @__init()

   sw ra, 160(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x3, 12(sp)
   call __init
   lw ra, 160(sp)
   sw a0, 128(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x3, 12(sp)
   # %var9 = call i32 @getInt()

   sw ra, 160(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x3, 12(sp)
   call getInt
   lw ra, 160(sp)
   mv x4, a0
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x3, 12(sp)
   # %var16 = sub i32 %var9, 1

   li t1, 1
   sub x8, x4, t1
   # %var19 = sub i32 %var9, 1

   li t1, 1
   sub x9, x4, t1
   # %var28 = mul i32 %var9, %var9

   mul a0, x4, x4
   # %var25 = call ptr @__array.alloca(i32 4, i32 1, i32 1, i32 %var28)

   sw ra, 160(sp)
   sw a0, 40(sp)
   sw a1, 44(sp)
   sw a2, 48(sp)
   sw a3, 52(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x8, 32(sp)
   sw x9, 36(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   mv a3, a0
   li a1, 1
   li a2, 1
   li a0, 4
   call __array.alloca
   lw ra, 160(sp)
   mv a0, a0
   lw a0, 40(sp)
   lw a1, 44(sp)
   lw a2, 48(sp)
   lw a3, 52(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x8, 32(sp)
   lw x9, 36(sp)
   lw x3, 12(sp)
   lw x4, 16(sp)
   # br label %for.cond.0

   # phi start 
   li a1, 0
   # phi end 
   j main_for.cond.0

   .section .text
   .globl main_for.cond.0
main_for.cond.0:
   # %var33 = mul i32 %var9, %var9

   mul a2, x4, x4
   # %var34 = icmp slt i32 %i.1_for.cond.0, %var33

   sub t2, a1, a2
   sltz    a2, t2
   # br i1 %var34, label %for.body.0, label %for.back.0

   bne      a2, x0, .+8
   j main_for.back.0
   # phi start 
   # phi end 
   j main_for.body.0

   .section .text
   .globl main_for.body.0
main_for.body.0:
   # %var37 = getelementptr i32, ptr %var25, i32 %i.1_for.cond.0

   mv t0, a0
   mv t1, a1
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv a2, t0
   # store i32 0, ptr %var37

   li t0, 0
   sw t0, 0(a2)
   # br label %for.step.0

   # phi start 
   # phi end 
   j main_for.step.0

   .section .text
   .globl main_for.step.0
main_for.step.0:
   # %var40 = add i32 %i.1_for.cond.0, 1

   li t1, 1
   add a1, a1, t1
   # br label %for.cond.0

   # phi start 
   # phi end 
   j main_for.cond.0

   .section .text
   .globl main_for.back.0
main_for.back.0:
   # %var45 = mul i32 %var9, %var9

   mul a1, x4, x4
   # %var42 = call ptr @__array.alloca(i32 4, i32 1, i32 1, i32 %var45)

   sw ra, 160(sp)
   sw a0, 40(sp)
   sw a1, 44(sp)
   sw a2, 48(sp)
   sw a3, 52(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x8, 32(sp)
   sw x9, 36(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   sw a0, 40(sp)
   li a0, 4
   mv a3, a1
   li a2, 1
   li a1, 1
   call __array.alloca
   lw ra, 160(sp)
   mv a1, a0
   lw a0, 40(sp)
   lw a1, 44(sp)
   lw a2, 48(sp)
   lw a3, 52(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x8, 32(sp)
   lw x9, 36(sp)
   lw x3, 12(sp)
   lw x4, 16(sp)
   lw a0, 40(sp)
   # br label %for.cond.1

   # phi start 
   li a2, 0
   # phi end 
   j main_for.cond.1

   .section .text
   .globl main_for.cond.1
main_for.cond.1:
   # %var50 = mul i32 %var9, %var9

   mul a3, x4, x4
   # %var51 = icmp slt i32 %i.1_for.cond.1, %var50

   sub t2, a2, a3
   sltz    a3, t2
   # br i1 %var51, label %for.body.1, label %for.back.1

   bne      a3, x0, .+8
   j main_for.back.1
   # phi start 
   # phi end 
   j main_for.body.1

   .section .text
   .globl main_for.body.1
main_for.body.1:
   # %var54 = getelementptr i32, ptr %var42, i32 %i.1_for.cond.1

   mv t0, a1
   mv t1, a2
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv a3, t0
   # store i32 0, ptr %var54

   li t0, 0
   sw t0, 0(a3)
   # br label %for.step.1

   # phi start 
   # phi end 
   j main_for.step.1

   .section .text
   .globl main_for.step.1
main_for.step.1:
   # %var57 = add i32 %i.1_for.cond.1, 1

   li t1, 1
   add a2, a2, t1
   # br label %for.cond.1

   # phi start 
   # phi end 
   j main_for.cond.1

   .section .text
   .globl main_for.back.1
main_for.back.1:
   # %var59 = call ptr @__array.alloca(i32 4, i32 2, i32 1, i32 %var9)

   sw ra, 160(sp)
   sw a0, 40(sp)
   sw a1, 44(sp)
   sw a2, 48(sp)
   sw a3, 52(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x8, 32(sp)
   sw a1, 44(sp)
   sw x9, 36(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   sw a0, 40(sp)
   li a0, 4
   li a1, 2
   li a2, 1
   mv a3, x4
   call __array.alloca
   lw ra, 160(sp)
   mv a2, a0
   lw a0, 40(sp)
   lw a1, 44(sp)
   lw a2, 48(sp)
   lw a3, 52(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x8, 32(sp)
   lw a1, 44(sp)
   lw x9, 36(sp)
   lw x3, 12(sp)
   lw x4, 16(sp)
   lw a0, 40(sp)
   # br label %for.cond.2

   # phi start 
   li a3, 0
   # phi end 
   j main_for.cond.2

   .section .text
   .globl main_for.cond.2
main_for.cond.2:
   # %var64 = icmp slt i32 %i.1_for.cond.2, %var9

   sub t2, a3, x4
   sltz    a4, t2
   # br i1 %var64, label %for.body.2, label %for.back.2

   bne      a4, x0, .+8
   j main_for.back.2
   # phi start 
   # phi end 
   j main_for.body.2

   .section .text
   .globl main_for.body.2
main_for.body.2:
   # %var67 = getelementptr ptr, ptr %var59, i32 %i.1_for.cond.2

   mv t0, a2
   mv t1, a3
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv a4, t0
   # %var69 = call ptr @__array.alloca(i32 4, i32 1, i32 1, i32 %var9)

   sw ra, 160(sp)
   sw a0, 40(sp)
   sw a1, 44(sp)
   sw a2, 48(sp)
   sw a3, 52(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x8, 32(sp)
   sw a1, 44(sp)
   sw x9, 36(sp)
   sw a2, 48(sp)
   sw a3, 52(sp)
   sw a4, 56(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   sw a0, 40(sp)
   li a2, 1
   li a0, 4
   mv a3, x4
   li a1, 1
   call __array.alloca
   lw ra, 160(sp)
   mv a5, a0
   lw a0, 40(sp)
   lw a1, 44(sp)
   lw a2, 48(sp)
   lw a3, 52(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x8, 32(sp)
   lw a1, 44(sp)
   lw x9, 36(sp)
   lw a2, 48(sp)
   lw a3, 52(sp)
   lw a4, 56(sp)
   lw x3, 12(sp)
   lw x4, 16(sp)
   lw a0, 40(sp)
   # store ptr %var69, ptr %var67

   sw a5, 0(a4)
   # br label %for.cond.3

   # phi start 
   li a4, 0
   # phi end 
   j main_for.cond.3

   .section .text
   .globl main_for.cond.3
main_for.cond.3:
   # %var74 = icmp slt i32 %j.1_for.cond.3, %var9

   sub t2, a4, x4
   sltz    a5, t2
   # br i1 %var74, label %for.body.3, label %for.back.3

   bne      a5, x0, .+8
   j main_for.back.3
   # phi start 
   # phi end 
   j main_for.body.3

   .section .text
   .globl main_for.body.3
main_for.body.3:
   # %var77 = getelementptr ptr, ptr %var59, i32 %i.1_for.cond.2

   mv t0, a2
   mv t1, a3
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv a5, t0
   # %var78 = load ptr, ptr %var77

   mv t0, a5
   lw a5, 0(t0)
   # %var80 = getelementptr i32, ptr %var78, i32 %j.1_for.cond.3

   mv t0, a5
   mv t1, a4
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv a5, t0
   # %var82 = sub i32 0, 1

   li t0, 0
   li t1, 1
   sub a6, t0, t1
   # store i32 %var82, ptr %var80

   sw a6, 0(a5)
   # br label %for.step.3

   # phi start 
   # phi end 
   j main_for.step.3

   .section .text
   .globl main_for.step.3
main_for.step.3:
   # %var84 = add i32 %j.1_for.cond.3, 1

   li t1, 1
   add a4, a4, t1
   # br label %for.cond.3

   # phi start 
   # phi end 
   j main_for.cond.3

   .section .text
   .globl main_for.back.3
main_for.back.3:
   # br label %for.step.2

   # phi start 
   # phi end 
   j main_for.step.2

   .section .text
   .globl main_for.step.2
main_for.step.2:
   # %var86 = add i32 %i.1_for.cond.2, 1

   li t1, 1
   add a3, a3, t1
   # br label %for.cond.2

   # phi start 
   # phi end 
   j main_for.cond.2

   .section .text
   .globl main_for.back.2
main_for.back.2:
   # %var88 = getelementptr i32, ptr %var25, i32 0

   mv t0, a0
   li t1, 0
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv a3, t0
   # store i32 0, ptr %var88

   li t0, 0
   sw t0, 0(a3)
   # %var92 = getelementptr i32, ptr %var42, i32 0

   mv t0, a1
   li t1, 0
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv a3, t0
   # store i32 0, ptr %var92

   li t0, 0
   sw t0, 0(a3)
   # %var97 = getelementptr ptr, ptr %var59, i32 0

   mv t0, a2
   li t1, 0
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv a3, t0
   # %var98 = load ptr, ptr %var97

   mv t0, a3
   lw a3, 0(t0)
   # %var100 = getelementptr i32, ptr %var98, i32 0

   mv t0, a3
   li t1, 0
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x3, t0
   # store i32 0, ptr %var100

   li t0, 0
   sw t0, 0(x3)
   # br label %while.cond.0

   # phi start 
   li x18, 0
   li a7, 0
   li x3, 0
   li a4, 0
   li t2, 0
   sw t2, 132(sp)
   li x20, 0
   li x19, 0
   li a3, 0
   li a6, 0
   li t2, 0
   sw t2, 136(sp)
   li a5, 0
   # phi end 
   j main_while.cond.0

   .section .text
   .globl main_while.cond.0
main_while.cond.0:
   # %var107 = icmp sle i32 %head.1_while.cond.0, %tail.1_while.cond.0

   sub t2, a6, x18
   sltz    x21, t2
   seqz    t1, t2
   or x21, x21, t1
   # br i1 %var107, label %while.body.0, label %while.cond.0_and_while.back.0

   bne      x21, x0, .+8
   j main_while.cond.0_and_while.back.0
   # phi start 
   # phi end 
   j main_while.body.0

   .section .text
   .globl main_while.body.0
main_while.body.0:
   # %var112 = getelementptr i32, ptr %var25, i32 %head.1_while.cond.0

   mv t0, a0
   mv t1, a6
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x21, t0
   # %var113 = load i32, ptr %var112

   mv t0, x21
   lw x21, 0(t0)
   # %var114 = getelementptr ptr, ptr %var59, i32 %var113

   mv t0, a2
   mv t1, x21
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x21, t0
   # %var115 = load ptr, ptr %var114

   mv t0, x21
   lw x21, 0(t0)
   # %var118 = getelementptr i32, ptr %var42, i32 %head.1_while.cond.0

   mv t0, a1
   mv t1, a6
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x22, t0
   # %var119 = load i32, ptr %var118

   mv t0, x22
   lw x22, 0(t0)
   # %var120 = getelementptr i32, ptr %var115, i32 %var119

   mv t0, x21
   mv t1, x22
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x21, t0
   # %var121 = load i32, ptr %var120

   mv t0, x21
   lw t1, 0(t0)
   sw t1, 140(sp)
   # %var125 = getelementptr i32, ptr %var25, i32 %head.1_while.cond.0

   mv t0, a0
   mv t1, a6
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x21, t0
   # %var126 = load i32, ptr %var125

   mv t0, x21
   lw x21, 0(t0)
   # %var127 = sub i32 %var126, 1

   li t1, 1
   sub x21, x21, t1
   # %var131 = getelementptr i32, ptr %var42, i32 %head.1_while.cond.0

   mv t0, a1
   mv t1, a6
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x22, t0
   # %var132 = load i32, ptr %var131

   mv t0, x22
   lw x22, 0(t0)
   # %var133 = sub i32 %var132, 2

   li t1, 2
   sub x22, x22, t1
   # %var134 = call i1 @check(i32 %var127, i32 %var9)

   sw ra, 160(sp)
   sw a0, 40(sp)
   sw a1, 44(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x8, 32(sp)
   sw x9, 36(sp)
   sw x19, 76(sp)
   sw a0, 40(sp)
   sw a1, 44(sp)
   sw a2, 48(sp)
   sw a3, 52(sp)
   sw a4, 56(sp)
   sw a5, 60(sp)
   sw a6, 64(sp)
   sw a7, 68(sp)
   sw x21, 84(sp)
   sw x20, 80(sp)
   sw x22, 88(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   sw x18, 72(sp)
   mv a1, x4
   mv a0, x21
   call check
   lw ra, 160(sp)
   mv x23, a0
   lw a0, 40(sp)
   lw a1, 44(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x8, 32(sp)
   lw x9, 36(sp)
   lw x19, 76(sp)
   lw a0, 40(sp)
   lw a1, 44(sp)
   lw a2, 48(sp)
   lw a3, 52(sp)
   lw a4, 56(sp)
   lw a5, 60(sp)
   lw a6, 64(sp)
   lw a7, 68(sp)
   lw x21, 84(sp)
   lw x20, 80(sp)
   lw x22, 88(sp)
   lw x3, 12(sp)
   lw x4, 16(sp)
   lw x18, 72(sp)
   # br i1 %var134, label %land.next..1, label %while.body.0_and_land.end..1

   bne      x23, x0, .+8
   j main_while.body.0_and_land.end..1
   # phi start 
   # phi end 
   j main_land.next..1

   .section .text
   .globl main_land.next..1
main_land.next..1:
   # %var138 = call i1 @check(i32 %var133, i32 %var9)

   sw ra, 160(sp)
   sw a0, 40(sp)
   sw a1, 44(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x8, 32(sp)
   sw x9, 36(sp)
   sw x19, 76(sp)
   sw a0, 40(sp)
   sw a1, 44(sp)
   sw a2, 48(sp)
   sw a3, 52(sp)
   sw a4, 56(sp)
   sw a5, 60(sp)
   sw a6, 64(sp)
   sw a7, 68(sp)
   sw x21, 84(sp)
   sw x20, 80(sp)
   sw x22, 88(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   sw x18, 72(sp)
   mv a1, x4
   mv a0, x22
   call check
   lw ra, 160(sp)
   mv x23, a0
   lw a0, 40(sp)
   lw a1, 44(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x8, 32(sp)
   lw x9, 36(sp)
   lw x19, 76(sp)
   lw a0, 40(sp)
   lw a1, 44(sp)
   lw a2, 48(sp)
   lw a3, 52(sp)
   lw a4, 56(sp)
   lw a5, 60(sp)
   lw a6, 64(sp)
   lw a7, 68(sp)
   lw x21, 84(sp)
   lw x20, 80(sp)
   lw x22, 88(sp)
   lw x3, 12(sp)
   lw x4, 16(sp)
   lw x18, 72(sp)
   # br label %land.end..1

   # phi start 
   # phi end 
   j main_land.end..1

   .section .text
   .globl main_land.end..1
main_land.end..1:
   # br i1 %var137_land.end..1, label %land.next..2, label %land.end..1_and_land.end..2

   bne      x23, x0, .+8
   j main_land.end..1_and_land.end..2
   # phi start 
   # phi end 
   j main_land.next..2

   .section .text
   .globl main_land.next..2
main_land.next..2:
   # %var145 = getelementptr ptr, ptr %var59, i32 %var127

   mv t0, a2
   mv t1, x21
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x23, t0
   # %var146 = load ptr, ptr %var145

   mv t0, x23
   lw x23, 0(t0)
   # %var148 = getelementptr i32, ptr %var146, i32 %var133

   mv t0, x23
   mv t1, x22
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x23, t0
   # %var149 = load i32, ptr %var148

   mv t0, x23
   lw x23, 0(t0)
   # %var150 = sub i32 0, 1

   li t0, 0
   li t1, 1
   sub x24, t0, t1
   # %var151 = icmp eq i32 %var149, %var150

   sub t2, x23, x24
   seqz    x23, t2
   # br label %land.end..2

   # phi start 
   # phi end 
   j main_land.end..2

   .section .text
   .globl main_land.end..2
main_land.end..2:
   # br i1 %var142_land.end..2, label %if.then.0, label %if.else.0

   bne      x23, x0, .+8
   j main_if.else.0
   # phi start 
   # phi end 
   j main_if.then.0

   .section .text
   .globl main_if.then.0
main_if.then.0:
   # %var155 = add i32 %tail.1_while.cond.0, 1

   li t1, 1
   add a7, x18, t1
   # %var158 = getelementptr i32, ptr %var25, i32 %var155

   mv t0, a0
   mv t1, a7
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x18, t0
   # store i32 %var127, ptr %var158

   sw x21, 0(x18)
   # %var163 = getelementptr i32, ptr %var42, i32 %var155

   mv t0, a1
   mv t1, a7
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x18, t0
   # store i32 %var133, ptr %var163

   sw x22, 0(x18)
   # %var168 = getelementptr ptr, ptr %var59, i32 %var127

   mv t0, a2
   mv t1, x21
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x18, t0
   # %var169 = load ptr, ptr %var168

   mv t0, x18
   lw x18, 0(t0)
   # %var171 = getelementptr i32, ptr %var169, i32 %var133

   mv t0, x18
   mv t1, x22
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x18, t0
   # %var174 = add i32 %var121, 1

   lw t0, 140(sp)
   li t1, 1
   add x23, t0, t1
   # store i32 %var174, ptr %var171

   sw x23, 0(x18)
   # %var177 = icmp eq i32 %var127, %var16

   sub t2, x21, x8
   seqz    x18, t2
   # br i1 %var177, label %land.next..3, label %if.then.0_and_land.end..3

   bne      x18, x0, .+8
   j main_if.then.0_and_land.end..3
   # phi start 
   # phi end 
   j main_land.next..3

   .section .text
   .globl main_land.next..3
main_land.next..3:
   # %var181 = icmp eq i32 %var133, %var19

   sub t2, x22, x9
   seqz    x18, t2
   # br label %land.end..3

   # phi start 
   # phi end 
   j main_land.end..3

   .section .text
   .globl main_land.end..3
main_land.end..3:
   # br i1 %var178_land.end..3, label %if.then.1, label %if.else.1

   bne      x18, x0, .+8
   j main_if.else.1
   # phi start 
   # phi end 
   j main_if.then.1

   .section .text
   .globl main_if.then.1
main_if.then.1:
   # br label %if.back.1

   # phi start 
   li a5, 1
   # phi end 
   j main_if.back.1

   .section .text
   .globl main_if.else.1
main_if.else.1:
   # br label %if.back.1

   # phi start 
   # phi end 
   j main_if.back.1

   .section .text
   .globl main_if.back.1
main_if.back.1:
   # br label %if.back.0

   # phi start 
   # phi end 
   j main_if.back.0

   .section .text
   .globl main_if.else.0
main_if.else.0:
   # br label %if.back.0

   # phi start 
   mv t6, a7
   mv a7, x18
   mv x18, t6
   # phi end 
   j main_if.back.0

   .section .text
   .globl main_if.back.0
main_if.back.0:
   # %var187 = getelementptr i32, ptr %var25, i32 %head.1_while.cond.0

   mv t0, a0
   mv t1, a6
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x21, t0
   # %var188 = load i32, ptr %var187

   mv t0, x21
   lw x21, 0(t0)
   # %var189 = sub i32 %var188, 1

   li t1, 1
   sub x21, x21, t1
   # %var193 = getelementptr i32, ptr %var42, i32 %head.1_while.cond.0

   mv t0, a1
   mv t1, a6
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x22, t0
   # %var194 = load i32, ptr %var193

   mv t0, x22
   lw x22, 0(t0)
   # %var195 = add i32 %var194, 2

   li t1, 2
   add x22, x22, t1
   # %var196 = call i1 @check(i32 %var189, i32 %var9)

   sw ra, 160(sp)
   sw a0, 40(sp)
   sw a1, 44(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x8, 32(sp)
   sw x9, 36(sp)
   sw x19, 76(sp)
   sw a0, 40(sp)
   sw a1, 44(sp)
   sw a2, 48(sp)
   sw a3, 52(sp)
   sw a4, 56(sp)
   sw a5, 60(sp)
   sw a6, 64(sp)
   sw a7, 68(sp)
   sw x21, 84(sp)
   sw x20, 80(sp)
   sw x22, 88(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   sw x18, 72(sp)
   mv a1, x4
   mv a0, x21
   call check
   lw ra, 160(sp)
   mv x23, a0
   lw a0, 40(sp)
   lw a1, 44(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x8, 32(sp)
   lw x9, 36(sp)
   lw x19, 76(sp)
   lw a0, 40(sp)
   lw a1, 44(sp)
   lw a2, 48(sp)
   lw a3, 52(sp)
   lw a4, 56(sp)
   lw a5, 60(sp)
   lw a6, 64(sp)
   lw a7, 68(sp)
   lw x21, 84(sp)
   lw x20, 80(sp)
   lw x22, 88(sp)
   lw x3, 12(sp)
   lw x4, 16(sp)
   lw x18, 72(sp)
   # br i1 %var196, label %land.next..4, label %if.back.0_and_land.end..4

   bne      x23, x0, .+8
   j main_if.back.0_and_land.end..4
   # phi start 
   # phi end 
   j main_land.next..4

   .section .text
   .globl main_land.next..4
main_land.next..4:
   # %var200 = call i1 @check(i32 %var195, i32 %var9)

   sw ra, 160(sp)
   sw a0, 40(sp)
   sw a1, 44(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x8, 32(sp)
   sw x9, 36(sp)
   sw x19, 76(sp)
   sw a0, 40(sp)
   sw a1, 44(sp)
   sw a2, 48(sp)
   sw a3, 52(sp)
   sw a4, 56(sp)
   sw a5, 60(sp)
   sw a6, 64(sp)
   sw a7, 68(sp)
   sw x21, 84(sp)
   sw x20, 80(sp)
   sw x22, 88(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   sw x18, 72(sp)
   mv a1, x4
   mv a0, x22
   call check
   lw ra, 160(sp)
   mv x23, a0
   lw a0, 40(sp)
   lw a1, 44(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x8, 32(sp)
   lw x9, 36(sp)
   lw x19, 76(sp)
   lw a0, 40(sp)
   lw a1, 44(sp)
   lw a2, 48(sp)
   lw a3, 52(sp)
   lw a4, 56(sp)
   lw a5, 60(sp)
   lw a6, 64(sp)
   lw a7, 68(sp)
   lw x21, 84(sp)
   lw x20, 80(sp)
   lw x22, 88(sp)
   lw x3, 12(sp)
   lw x4, 16(sp)
   lw x18, 72(sp)
   # br label %land.end..4

   # phi start 
   # phi end 
   j main_land.end..4

   .section .text
   .globl main_land.end..4
main_land.end..4:
   # br i1 %var199_land.end..4, label %land.next..5, label %land.end..4_and_land.end..5

   bne      x23, x0, .+8
   j main_land.end..4_and_land.end..5
   # phi start 
   # phi end 
   j main_land.next..5

   .section .text
   .globl main_land.next..5
main_land.next..5:
   # %var207 = getelementptr ptr, ptr %var59, i32 %var189

   mv t0, a2
   mv t1, x21
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x23, t0
   # %var208 = load ptr, ptr %var207

   mv t0, x23
   lw x23, 0(t0)
   # %var210 = getelementptr i32, ptr %var208, i32 %var195

   mv t0, x23
   mv t1, x22
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x23, t0
   # %var211 = load i32, ptr %var210

   mv t0, x23
   lw x23, 0(t0)
   # %var212 = sub i32 0, 1

   li t0, 0
   li t1, 1
   sub x24, t0, t1
   # %var213 = icmp eq i32 %var211, %var212

   sub t2, x23, x24
   seqz    x23, t2
   # br label %land.end..5

   # phi start 
   # phi end 
   j main_land.end..5

   .section .text
   .globl main_land.end..5
main_land.end..5:
   # br i1 %var204_land.end..5, label %if.then.2, label %if.else.2

   bne      x23, x0, .+8
   j main_if.else.2
   # phi start 
   # phi end 
   j main_if.then.2

   .section .text
   .globl main_if.then.2
main_if.then.2:
   # %var217 = add i32 %tail.1_if.back.0, 1

   li t1, 1
   add a4, a7, t1
   # %var220 = getelementptr i32, ptr %var25, i32 %var217

   mv t0, a0
   mv t1, a4
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv a7, t0
   # store i32 %var189, ptr %var220

   sw x21, 0(a7)
   # %var225 = getelementptr i32, ptr %var42, i32 %var217

   mv t0, a1
   mv t1, a4
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv a7, t0
   # store i32 %var195, ptr %var225

   sw x22, 0(a7)
   # %var230 = getelementptr ptr, ptr %var59, i32 %var189

   mv t0, a2
   mv t1, x21
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv a7, t0
   # %var231 = load ptr, ptr %var230

   mv t0, a7
   lw a7, 0(t0)
   # %var233 = getelementptr i32, ptr %var231, i32 %var195

   mv t0, a7
   mv t1, x22
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv a7, t0
   # %var236 = add i32 %var121, 1

   lw t0, 140(sp)
   li t1, 1
   add x23, t0, t1
   # store i32 %var236, ptr %var233

   sw x23, 0(a7)
   # %var239 = icmp eq i32 %var189, %var16

   sub t2, x21, x8
   seqz    a7, t2
   # br i1 %var239, label %land.next..6, label %if.then.2_and_land.end..6

   bne      a7, x0, .+8
   j main_if.then.2_and_land.end..6
   # phi start 
   # phi end 
   j main_land.next..6

   .section .text
   .globl main_land.next..6
main_land.next..6:
   # %var243 = icmp eq i32 %var195, %var19

   sub t2, x22, x9
   seqz    a7, t2
   # br label %land.end..6

   # phi start 
   # phi end 
   j main_land.end..6

   .section .text
   .globl main_land.end..6
main_land.end..6:
   # br i1 %var240_land.end..6, label %if.then.3, label %if.else.3

   bne      a7, x0, .+8
   j main_if.else.3
   # phi start 
   # phi end 
   j main_if.then.3

   .section .text
   .globl main_if.then.3
main_if.then.3:
   # br label %if.back.3

   # phi start 
   li a5, 1
   # phi end 
   j main_if.back.3

   .section .text
   .globl main_if.else.3
main_if.else.3:
   # br label %if.back.3

   # phi start 
   # phi end 
   j main_if.back.3

   .section .text
   .globl main_if.back.3
main_if.back.3:
   # br label %if.back.2

   # phi start 
   mv t2, a7
   sw t2, 144(sp)
   # phi end 
   j main_if.back.2

   .section .text
   .globl main_if.else.2
main_if.else.2:
   # br label %if.back.2

   # phi start 
   mv t2, a4
   sw t2, 144(sp)
   mv a4, a7
   # phi end 
   j main_if.back.2

   .section .text
   .globl main_if.back.2
main_if.back.2:
   # %var249 = getelementptr i32, ptr %var25, i32 %head.1_while.cond.0

   mv t0, a0
   mv t1, a6
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv a7, t0
   # %var250 = load i32, ptr %var249

   mv t0, a7
   lw a7, 0(t0)
   # %var251 = add i32 %var250, 1

   li t1, 1
   add a7, a7, t1
   # %var255 = getelementptr i32, ptr %var42, i32 %head.1_while.cond.0

   mv t0, a1
   mv t1, a6
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x21, t0
   # %var256 = load i32, ptr %var255

   mv t0, x21
   lw x21, 0(t0)
   # %var257 = sub i32 %var256, 2

   li t1, 2
   sub x21, x21, t1
   # %var258 = call i1 @check(i32 %var251, i32 %var9)

   sw ra, 160(sp)
   sw a0, 40(sp)
   sw a1, 44(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x8, 32(sp)
   sw x9, 36(sp)
   sw x19, 76(sp)
   sw a0, 40(sp)
   sw a1, 44(sp)
   sw a2, 48(sp)
   sw a3, 52(sp)
   sw a4, 56(sp)
   sw a5, 60(sp)
   sw a6, 64(sp)
   sw a7, 68(sp)
   sw x21, 84(sp)
   sw x20, 80(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   sw x18, 72(sp)
   mv a0, a7
   mv a1, x4
   call check
   lw ra, 160(sp)
   mv x22, a0
   lw a0, 40(sp)
   lw a1, 44(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x8, 32(sp)
   lw x9, 36(sp)
   lw x19, 76(sp)
   lw a0, 40(sp)
   lw a1, 44(sp)
   lw a2, 48(sp)
   lw a3, 52(sp)
   lw a4, 56(sp)
   lw a5, 60(sp)
   lw a6, 64(sp)
   lw a7, 68(sp)
   lw x21, 84(sp)
   lw x20, 80(sp)
   lw x3, 12(sp)
   lw x4, 16(sp)
   lw x18, 72(sp)
   # br i1 %var258, label %land.next..7, label %if.back.2_and_land.end..7

   bne      x22, x0, .+8
   j main_if.back.2_and_land.end..7
   # phi start 
   # phi end 
   j main_land.next..7

   .section .text
   .globl main_land.next..7
main_land.next..7:
   # %var262 = call i1 @check(i32 %var257, i32 %var9)

   sw ra, 160(sp)
   sw a0, 40(sp)
   sw a1, 44(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x8, 32(sp)
   sw x9, 36(sp)
   sw x19, 76(sp)
   sw a0, 40(sp)
   sw a1, 44(sp)
   sw a2, 48(sp)
   sw a3, 52(sp)
   sw a4, 56(sp)
   sw a5, 60(sp)
   sw a6, 64(sp)
   sw a7, 68(sp)
   sw x21, 84(sp)
   sw x20, 80(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   sw x18, 72(sp)
   mv a0, x21
   mv a1, x4
   call check
   lw ra, 160(sp)
   mv x22, a0
   lw a0, 40(sp)
   lw a1, 44(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x8, 32(sp)
   lw x9, 36(sp)
   lw x19, 76(sp)
   lw a0, 40(sp)
   lw a1, 44(sp)
   lw a2, 48(sp)
   lw a3, 52(sp)
   lw a4, 56(sp)
   lw a5, 60(sp)
   lw a6, 64(sp)
   lw a7, 68(sp)
   lw x21, 84(sp)
   lw x20, 80(sp)
   lw x3, 12(sp)
   lw x4, 16(sp)
   lw x18, 72(sp)
   # br label %land.end..7

   # phi start 
   # phi end 
   j main_land.end..7

   .section .text
   .globl main_land.end..7
main_land.end..7:
   # br i1 %var261_land.end..7, label %land.next..8, label %land.end..7_and_land.end..8

   bne      x22, x0, .+8
   j main_land.end..7_and_land.end..8
   # phi start 
   # phi end 
   j main_land.next..8

   .section .text
   .globl main_land.next..8
main_land.next..8:
   # %var269 = getelementptr ptr, ptr %var59, i32 %var251

   mv t0, a2
   mv t1, a7
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x22, t0
   # %var270 = load ptr, ptr %var269

   mv t0, x22
   lw x22, 0(t0)
   # %var272 = getelementptr i32, ptr %var270, i32 %var257

   mv t0, x22
   mv t1, x21
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x22, t0
   # %var273 = load i32, ptr %var272

   mv t0, x22
   lw x22, 0(t0)
   # %var274 = sub i32 0, 1

   li t0, 0
   li t1, 1
   sub x23, t0, t1
   # %var275 = icmp eq i32 %var273, %var274

   sub t2, x22, x23
   seqz    x22, t2
   # br label %land.end..8

   # phi start 
   # phi end 
   j main_land.end..8

   .section .text
   .globl main_land.end..8
main_land.end..8:
   # br i1 %var266_land.end..8, label %if.then.4, label %if.else.4

   bne      x22, x0, .+8
   j main_if.else.4
   # phi start 
   # phi end 
   j main_if.then.4

   .section .text
   .globl main_if.then.4
main_if.then.4:
   # %var279 = add i32 %tail.1_if.back.2, 1

   li t1, 1
   add a4, a4, t1
   # %var282 = getelementptr i32, ptr %var25, i32 %var279

   mv t0, a0
   mv t1, a4
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x22, t0
   # store i32 %var251, ptr %var282

   sw a7, 0(x22)
   # %var287 = getelementptr i32, ptr %var42, i32 %var279

   mv t0, a1
   mv t1, a4
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x22, t0
   # store i32 %var257, ptr %var287

   sw x21, 0(x22)
   # %var292 = getelementptr ptr, ptr %var59, i32 %var251

   mv t0, a2
   mv t1, a7
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x22, t0
   # %var293 = load ptr, ptr %var292

   mv t0, x22
   lw x22, 0(t0)
   # %var295 = getelementptr i32, ptr %var293, i32 %var257

   mv t0, x22
   mv t1, x21
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x22, t0
   # %var298 = add i32 %var121, 1

   lw t0, 140(sp)
   li t1, 1
   add x23, t0, t1
   # store i32 %var298, ptr %var295

   sw x23, 0(x22)
   # %var301 = icmp eq i32 %var251, %var16

   sub t2, a7, x8
   seqz    a7, t2
   # br i1 %var301, label %land.next..9, label %if.then.4_and_land.end..9

   bne      a7, x0, .+8
   j main_if.then.4_and_land.end..9
   # phi start 
   # phi end 
   j main_land.next..9

   .section .text
   .globl main_land.next..9
main_land.next..9:
   # %var305 = icmp eq i32 %var257, %var19

   sub t2, x21, x9
   seqz    a7, t2
   # br label %land.end..9

   # phi start 
   # phi end 
   j main_land.end..9

   .section .text
   .globl main_land.end..9
main_land.end..9:
   # br i1 %var302_land.end..9, label %if.then.5, label %if.else.5

   bne      a7, x0, .+8
   j main_if.else.5
   # phi start 
   # phi end 
   j main_if.then.5

   .section .text
   .globl main_if.then.5
main_if.then.5:
   # br label %if.back.5

   # phi start 
   li a5, 1
   # phi end 
   j main_if.back.5

   .section .text
   .globl main_if.else.5
main_if.else.5:
   # br label %if.back.5

   # phi start 
   # phi end 
   j main_if.back.5

   .section .text
   .globl main_if.back.5
main_if.back.5:
   # br label %if.back.4

   # phi start 
   # phi end 
   j main_if.back.4

   .section .text
   .globl main_if.else.4
main_if.else.4:
   # br label %if.back.4

   # phi start 
   lw t0, 136(sp)
   mv a7, t0
   # phi end 
   j main_if.back.4

   .section .text
   .globl main_if.back.4
main_if.back.4:
   # %var311 = getelementptr i32, ptr %var25, i32 %head.1_while.cond.0

   mv t0, a0
   mv t1, a6
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x21, t0
   # %var312 = load i32, ptr %var311

   mv t0, x21
   lw x21, 0(t0)
   # %var313 = add i32 %var312, 1

   li t1, 1
   add x21, x21, t1
   # %var317 = getelementptr i32, ptr %var42, i32 %head.1_while.cond.0

   mv t0, a1
   mv t1, a6
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x22, t0
   # %var318 = load i32, ptr %var317

   mv t0, x22
   lw x22, 0(t0)
   # %var319 = add i32 %var318, 2

   li t1, 2
   add x22, x22, t1
   # %var320 = call i1 @check(i32 %var313, i32 %var9)

   sw ra, 160(sp)
   sw a0, 40(sp)
   sw a1, 44(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x8, 32(sp)
   sw x9, 36(sp)
   sw x19, 76(sp)
   sw a0, 40(sp)
   sw a1, 44(sp)
   sw a2, 48(sp)
   sw a3, 52(sp)
   sw a4, 56(sp)
   sw a5, 60(sp)
   sw a6, 64(sp)
   sw a7, 68(sp)
   sw x21, 84(sp)
   sw x20, 80(sp)
   sw x22, 88(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   sw x18, 72(sp)
   mv a1, x4
   mv a0, x21
   call check
   lw ra, 160(sp)
   mv x23, a0
   lw a0, 40(sp)
   lw a1, 44(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x8, 32(sp)
   lw x9, 36(sp)
   lw x19, 76(sp)
   lw a0, 40(sp)
   lw a1, 44(sp)
   lw a2, 48(sp)
   lw a3, 52(sp)
   lw a4, 56(sp)
   lw a5, 60(sp)
   lw a6, 64(sp)
   lw a7, 68(sp)
   lw x21, 84(sp)
   lw x20, 80(sp)
   lw x22, 88(sp)
   lw x3, 12(sp)
   lw x4, 16(sp)
   lw x18, 72(sp)
   # br i1 %var320, label %land.next..10, label %if.back.4_and_land.end..10

   bne      x23, x0, .+8
   j main_if.back.4_and_land.end..10
   # phi start 
   # phi end 
   j main_land.next..10

   .section .text
   .globl main_land.next..10
main_land.next..10:
   # %var324 = call i1 @check(i32 %var319, i32 %var9)

   sw ra, 160(sp)
   sw a0, 40(sp)
   sw a1, 44(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x8, 32(sp)
   sw x9, 36(sp)
   sw x19, 76(sp)
   sw a0, 40(sp)
   sw a1, 44(sp)
   sw a2, 48(sp)
   sw a3, 52(sp)
   sw a4, 56(sp)
   sw a5, 60(sp)
   sw a6, 64(sp)
   sw a7, 68(sp)
   sw x21, 84(sp)
   sw x20, 80(sp)
   sw x22, 88(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   sw x18, 72(sp)
   mv a0, x22
   mv a1, x4
   call check
   lw ra, 160(sp)
   mv x23, a0
   lw a0, 40(sp)
   lw a1, 44(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x8, 32(sp)
   lw x9, 36(sp)
   lw x19, 76(sp)
   lw a0, 40(sp)
   lw a1, 44(sp)
   lw a2, 48(sp)
   lw a3, 52(sp)
   lw a4, 56(sp)
   lw a5, 60(sp)
   lw a6, 64(sp)
   lw a7, 68(sp)
   lw x21, 84(sp)
   lw x20, 80(sp)
   lw x22, 88(sp)
   lw x3, 12(sp)
   lw x4, 16(sp)
   lw x18, 72(sp)
   # br label %land.end..10

   # phi start 
   # phi end 
   j main_land.end..10

   .section .text
   .globl main_land.end..10
main_land.end..10:
   # br i1 %var323_land.end..10, label %land.next..11, label %land.end..10_and_land.end..11

   bne      x23, x0, .+8
   j main_land.end..10_and_land.end..11
   # phi start 
   # phi end 
   j main_land.next..11

   .section .text
   .globl main_land.next..11
main_land.next..11:
   # %var331 = getelementptr ptr, ptr %var59, i32 %var313

   mv t0, a2
   mv t1, x21
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x23, t0
   # %var332 = load ptr, ptr %var331

   mv t0, x23
   lw x23, 0(t0)
   # %var334 = getelementptr i32, ptr %var332, i32 %var319

   mv t0, x23
   mv t1, x22
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x23, t0
   # %var335 = load i32, ptr %var334

   mv t0, x23
   lw x23, 0(t0)
   # %var336 = sub i32 0, 1

   li t0, 0
   li t1, 1
   sub x24, t0, t1
   # %var337 = icmp eq i32 %var335, %var336

   sub t2, x23, x24
   seqz    x23, t2
   # br label %land.end..11

   # phi start 
   # phi end 
   j main_land.end..11

   .section .text
   .globl main_land.end..11
main_land.end..11:
   # br i1 %var328_land.end..11, label %if.then.6, label %if.else.6

   bne      x23, x0, .+8
   j main_if.else.6
   # phi start 
   # phi end 
   j main_if.then.6

   .section .text
   .globl main_if.then.6
main_if.then.6:
   # %var341 = add i32 %tail.1_if.back.4, 1

   li t1, 1
   add a4, a4, t1
   # %var344 = getelementptr i32, ptr %var25, i32 %var341

   mv t0, a0
   mv t1, a4
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x19, t0
   # store i32 %var313, ptr %var344

   sw x21, 0(x19)
   # %var349 = getelementptr i32, ptr %var42, i32 %var341

   mv t0, a1
   mv t1, a4
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x19, t0
   # store i32 %var319, ptr %var349

   sw x22, 0(x19)
   # %var354 = getelementptr ptr, ptr %var59, i32 %var313

   mv t0, a2
   mv t1, x21
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x19, t0
   # %var355 = load ptr, ptr %var354

   mv t0, x19
   lw x19, 0(t0)
   # %var357 = getelementptr i32, ptr %var355, i32 %var319

   mv t0, x19
   mv t1, x22
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x19, t0
   # %var360 = add i32 %var121, 1

   lw t0, 140(sp)
   li t1, 1
   add x23, t0, t1
   # store i32 %var360, ptr %var357

   sw x23, 0(x19)
   # %var363 = icmp eq i32 %var313, %var16

   sub t2, x21, x8
   seqz    x19, t2
   # br i1 %var363, label %land.next..12, label %if.then.6_and_land.end..12

   bne      x19, x0, .+8
   j main_if.then.6_and_land.end..12
   # phi start 
   # phi end 
   j main_land.next..12

   .section .text
   .globl main_land.next..12
main_land.next..12:
   # %var367 = icmp eq i32 %var319, %var19

   sub t2, x22, x9
   seqz    x19, t2
   # br label %land.end..12

   # phi start 
   # phi end 
   j main_land.end..12

   .section .text
   .globl main_land.end..12
main_land.end..12:
   # br i1 %var364_land.end..12, label %if.then.7, label %if.else.7

   bne      x19, x0, .+8
   j main_if.else.7
   # phi start 
   # phi end 
   j main_if.then.7

   .section .text
   .globl main_if.then.7
main_if.then.7:
   # br label %if.back.7

   # phi start 
   li a5, 1
   # phi end 
   j main_if.back.7

   .section .text
   .globl main_if.else.7
main_if.else.7:
   # br label %if.back.7

   # phi start 
   # phi end 
   j main_if.back.7

   .section .text
   .globl main_if.back.7
main_if.back.7:
   # br label %if.back.6

   # phi start 
   mv t6, x19
   mv x19, a4
   mv a4, t6
   # phi end 
   j main_if.back.6

   .section .text
   .globl main_if.else.6
main_if.else.6:
   # br label %if.back.6

   # phi start 
   mv t6, a4
   mv a4, x19
   mv x19, t6
   # phi end 
   j main_if.back.6

   .section .text
   .globl main_if.back.6
main_if.back.6:
   # %var373 = getelementptr i32, ptr %var25, i32 %head.1_while.cond.0

   mv t0, a0
   mv t1, a6
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x21, t0
   # %var374 = load i32, ptr %var373

   mv t0, x21
   lw x21, 0(t0)
   # %var375 = sub i32 %var374, 2

   li t1, 2
   sub x21, x21, t1
   # %var379 = getelementptr i32, ptr %var42, i32 %head.1_while.cond.0

   mv t0, a1
   mv t1, a6
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x22, t0
   # %var380 = load i32, ptr %var379

   mv t0, x22
   lw x22, 0(t0)
   # %var381 = sub i32 %var380, 1

   li t1, 1
   sub x22, x22, t1
   # %var382 = call i1 @check(i32 %var375, i32 %var9)

   sw ra, 160(sp)
   sw a0, 40(sp)
   sw a1, 44(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x8, 32(sp)
   sw x9, 36(sp)
   sw x19, 76(sp)
   sw a0, 40(sp)
   sw a1, 44(sp)
   sw a2, 48(sp)
   sw a3, 52(sp)
   sw a4, 56(sp)
   sw a5, 60(sp)
   sw a6, 64(sp)
   sw x21, 84(sp)
   sw a7, 68(sp)
   sw x20, 80(sp)
   sw x22, 88(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   sw x18, 72(sp)
   mv a1, x4
   mv a0, x21
   call check
   lw ra, 160(sp)
   mv x23, a0
   lw a0, 40(sp)
   lw a1, 44(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x8, 32(sp)
   lw x9, 36(sp)
   lw x19, 76(sp)
   lw a0, 40(sp)
   lw a1, 44(sp)
   lw a2, 48(sp)
   lw a3, 52(sp)
   lw a4, 56(sp)
   lw a5, 60(sp)
   lw a6, 64(sp)
   lw x21, 84(sp)
   lw a7, 68(sp)
   lw x20, 80(sp)
   lw x22, 88(sp)
   lw x3, 12(sp)
   lw x4, 16(sp)
   lw x18, 72(sp)
   # br i1 %var382, label %land.next..13, label %if.back.6_and_land.end..13

   bne      x23, x0, .+8
   j main_if.back.6_and_land.end..13
   # phi start 
   # phi end 
   j main_land.next..13

   .section .text
   .globl main_land.next..13
main_land.next..13:
   # %var386 = call i1 @check(i32 %var381, i32 %var9)

   sw ra, 160(sp)
   sw a0, 40(sp)
   sw a1, 44(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x8, 32(sp)
   sw x9, 36(sp)
   sw x19, 76(sp)
   sw a0, 40(sp)
   sw a1, 44(sp)
   sw a2, 48(sp)
   sw a3, 52(sp)
   sw a4, 56(sp)
   sw a5, 60(sp)
   sw a6, 64(sp)
   sw x21, 84(sp)
   sw a7, 68(sp)
   sw x20, 80(sp)
   sw x22, 88(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   sw x18, 72(sp)
   mv a1, x4
   mv a0, x22
   call check
   lw ra, 160(sp)
   mv x23, a0
   lw a0, 40(sp)
   lw a1, 44(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x8, 32(sp)
   lw x9, 36(sp)
   lw x19, 76(sp)
   lw a0, 40(sp)
   lw a1, 44(sp)
   lw a2, 48(sp)
   lw a3, 52(sp)
   lw a4, 56(sp)
   lw a5, 60(sp)
   lw a6, 64(sp)
   lw x21, 84(sp)
   lw a7, 68(sp)
   lw x20, 80(sp)
   lw x22, 88(sp)
   lw x3, 12(sp)
   lw x4, 16(sp)
   lw x18, 72(sp)
   # br label %land.end..13

   # phi start 
   # phi end 
   j main_land.end..13

   .section .text
   .globl main_land.end..13
main_land.end..13:
   # br i1 %var385_land.end..13, label %land.next..14, label %land.end..13_and_land.end..14

   bne      x23, x0, .+8
   j main_land.end..13_and_land.end..14
   # phi start 
   # phi end 
   j main_land.next..14

   .section .text
   .globl main_land.next..14
main_land.next..14:
   # %var393 = getelementptr ptr, ptr %var59, i32 %var375

   mv t0, a2
   mv t1, x21
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x23, t0
   # %var394 = load ptr, ptr %var393

   mv t0, x23
   lw x23, 0(t0)
   # %var396 = getelementptr i32, ptr %var394, i32 %var381

   mv t0, x23
   mv t1, x22
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x23, t0
   # %var397 = load i32, ptr %var396

   mv t0, x23
   lw x23, 0(t0)
   # %var398 = sub i32 0, 1

   li t0, 0
   li t1, 1
   sub x24, t0, t1
   # %var399 = icmp eq i32 %var397, %var398

   sub t2, x23, x24
   seqz    x23, t2
   # br label %land.end..14

   # phi start 
   # phi end 
   j main_land.end..14

   .section .text
   .globl main_land.end..14
main_land.end..14:
   # br i1 %var390_land.end..14, label %if.then.8, label %if.else.8

   bne      x23, x0, .+8
   j main_if.else.8
   # phi start 
   # phi end 
   j main_if.then.8

   .section .text
   .globl main_if.then.8
main_if.then.8:
   # %var403 = add i32 %tail.1_if.back.6, 1

   li t1, 1
   add x19, x19, t1
   # %var406 = getelementptr i32, ptr %var25, i32 %var403

   mv t0, a0
   mv t1, x19
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x23, t0
   # store i32 %var375, ptr %var406

   sw x21, 0(x23)
   # %var411 = getelementptr i32, ptr %var42, i32 %var403

   mv t0, a1
   mv t1, x19
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x23, t0
   # store i32 %var381, ptr %var411

   sw x22, 0(x23)
   # %var416 = getelementptr ptr, ptr %var59, i32 %var375

   mv t0, a2
   mv t1, x21
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x23, t0
   # %var417 = load ptr, ptr %var416

   mv t0, x23
   lw x23, 0(t0)
   # %var419 = getelementptr i32, ptr %var417, i32 %var381

   mv t0, x23
   mv t1, x22
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x23, t0
   # %var422 = add i32 %var121, 1

   lw t0, 140(sp)
   li t1, 1
   add x24, t0, t1
   # store i32 %var422, ptr %var419

   sw x24, 0(x23)
   # %var425 = icmp eq i32 %var375, %var16

   sub t2, x21, x8
   seqz    x21, t2
   # br i1 %var425, label %land.next..15, label %if.then.8_and_land.end..15

   bne      x21, x0, .+8
   j main_if.then.8_and_land.end..15
   # phi start 
   # phi end 
   j main_land.next..15

   .section .text
   .globl main_land.next..15
main_land.next..15:
   # %var429 = icmp eq i32 %var381, %var19

   sub t2, x22, x9
   seqz    x21, t2
   # br label %land.end..15

   # phi start 
   # phi end 
   j main_land.end..15

   .section .text
   .globl main_land.end..15
main_land.end..15:
   # br i1 %var426_land.end..15, label %if.then.9, label %if.else.9

   bne      x21, x0, .+8
   j main_if.else.9
   # phi start 
   # phi end 
   j main_if.then.9

   .section .text
   .globl main_if.then.9
main_if.then.9:
   # br label %if.back.9

   # phi start 
   li a5, 1
   # phi end 
   j main_if.back.9

   .section .text
   .globl main_if.else.9
main_if.else.9:
   # br label %if.back.9

   # phi start 
   # phi end 
   j main_if.back.9

   .section .text
   .globl main_if.back.9
main_if.back.9:
   # br label %if.back.8

   # phi start 
   # phi end 
   j main_if.back.8

   .section .text
   .globl main_if.else.8
main_if.else.8:
   # br label %if.back.8

   # phi start 
   lw t0, 132(sp)
   mv x21, t0
   # phi end 
   j main_if.back.8

   .section .text
   .globl main_if.back.8
main_if.back.8:
   # %var435 = getelementptr i32, ptr %var25, i32 %head.1_while.cond.0

   mv t0, a0
   mv t1, a6
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x22, t0
   # %var436 = load i32, ptr %var435

   mv t0, x22
   lw x22, 0(t0)
   # %var437 = sub i32 %var436, 2

   li t1, 2
   sub x22, x22, t1
   # %var441 = getelementptr i32, ptr %var42, i32 %head.1_while.cond.0

   mv t0, a1
   mv t1, a6
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x23, t0
   # %var442 = load i32, ptr %var441

   mv t0, x23
   lw x23, 0(t0)
   # %var443 = add i32 %var442, 1

   li t1, 1
   add x23, x23, t1
   # %var444 = call i1 @check(i32 %var437, i32 %var9)

   sw ra, 160(sp)
   sw a0, 40(sp)
   sw a1, 44(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x8, 32(sp)
   sw x9, 36(sp)
   sw x19, 76(sp)
   sw a0, 40(sp)
   sw a1, 44(sp)
   sw a2, 48(sp)
   sw a3, 52(sp)
   sw a4, 56(sp)
   sw a5, 60(sp)
   sw a6, 64(sp)
   sw a7, 68(sp)
   sw x21, 84(sp)
   sw x20, 80(sp)
   sw x23, 92(sp)
   sw x22, 88(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   sw x18, 72(sp)
   mv a1, x4
   mv a0, x22
   call check
   lw ra, 160(sp)
   mv x24, a0
   lw a0, 40(sp)
   lw a1, 44(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x8, 32(sp)
   lw x9, 36(sp)
   lw x19, 76(sp)
   lw a0, 40(sp)
   lw a1, 44(sp)
   lw a2, 48(sp)
   lw a3, 52(sp)
   lw a4, 56(sp)
   lw a5, 60(sp)
   lw a6, 64(sp)
   lw a7, 68(sp)
   lw x21, 84(sp)
   lw x20, 80(sp)
   lw x23, 92(sp)
   lw x22, 88(sp)
   lw x3, 12(sp)
   lw x4, 16(sp)
   lw x18, 72(sp)
   # br i1 %var444, label %land.next..16, label %if.back.8_and_land.end..16

   bne      x24, x0, .+8
   j main_if.back.8_and_land.end..16
   # phi start 
   # phi end 
   j main_land.next..16

   .section .text
   .globl main_land.next..16
main_land.next..16:
   # %var448 = call i1 @check(i32 %var443, i32 %var9)

   sw ra, 160(sp)
   sw a0, 40(sp)
   sw a1, 44(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x8, 32(sp)
   sw x9, 36(sp)
   sw x19, 76(sp)
   sw a0, 40(sp)
   sw a1, 44(sp)
   sw a2, 48(sp)
   sw a3, 52(sp)
   sw a4, 56(sp)
   sw a5, 60(sp)
   sw a6, 64(sp)
   sw a7, 68(sp)
   sw x21, 84(sp)
   sw x20, 80(sp)
   sw x23, 92(sp)
   sw x22, 88(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   sw x18, 72(sp)
   mv a0, x23
   mv a1, x4
   call check
   lw ra, 160(sp)
   mv x24, a0
   lw a0, 40(sp)
   lw a1, 44(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x8, 32(sp)
   lw x9, 36(sp)
   lw x19, 76(sp)
   lw a0, 40(sp)
   lw a1, 44(sp)
   lw a2, 48(sp)
   lw a3, 52(sp)
   lw a4, 56(sp)
   lw a5, 60(sp)
   lw a6, 64(sp)
   lw a7, 68(sp)
   lw x21, 84(sp)
   lw x20, 80(sp)
   lw x23, 92(sp)
   lw x22, 88(sp)
   lw x3, 12(sp)
   lw x4, 16(sp)
   lw x18, 72(sp)
   # br label %land.end..16

   # phi start 
   # phi end 
   j main_land.end..16

   .section .text
   .globl main_land.end..16
main_land.end..16:
   # br i1 %var447_land.end..16, label %land.next..17, label %land.end..16_and_land.end..17

   bne      x24, x0, .+8
   j main_land.end..16_and_land.end..17
   # phi start 
   # phi end 
   j main_land.next..17

   .section .text
   .globl main_land.next..17
main_land.next..17:
   # %var455 = getelementptr ptr, ptr %var59, i32 %var437

   mv t0, a2
   mv t1, x22
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x24, t0
   # %var456 = load ptr, ptr %var455

   mv t0, x24
   lw x24, 0(t0)
   # %var458 = getelementptr i32, ptr %var456, i32 %var443

   mv t0, x24
   mv t1, x23
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x24, t0
   # %var459 = load i32, ptr %var458

   mv t0, x24
   lw x24, 0(t0)
   # %var460 = sub i32 0, 1

   li t0, 0
   li t1, 1
   sub t2, t0, t1
   sw t2, 148(sp)
   # %var461 = icmp eq i32 %var459, %var460

   lw t1, 148(sp)
   sub t2, x24, t1
   seqz    x24, t2
   # br label %land.end..17

   # phi start 
   # phi end 
   j main_land.end..17

   .section .text
   .globl main_land.end..17
main_land.end..17:
   # br i1 %var452_land.end..17, label %if.then.10, label %if.else.10

   bne      x24, x0, .+8
   j main_if.else.10
   # phi start 
   # phi end 
   j main_if.then.10

   .section .text
   .globl main_if.then.10
main_if.then.10:
   # %var465 = add i32 %tail.1_if.back.8, 1

   li t1, 1
   add x3, x19, t1
   # %var468 = getelementptr i32, ptr %var25, i32 %var465

   mv t0, a0
   mv t1, x3
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x19, t0
   # store i32 %var437, ptr %var468

   sw x22, 0(x19)
   # %var473 = getelementptr i32, ptr %var42, i32 %var465

   mv t0, a1
   mv t1, x3
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x19, t0
   # store i32 %var443, ptr %var473

   sw x23, 0(x19)
   # %var478 = getelementptr ptr, ptr %var59, i32 %var437

   mv t0, a2
   mv t1, x22
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x19, t0
   # %var479 = load ptr, ptr %var478

   mv t0, x19
   lw x19, 0(t0)
   # %var481 = getelementptr i32, ptr %var479, i32 %var443

   mv t0, x19
   mv t1, x23
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x19, t0
   # %var484 = add i32 %var121, 1

   lw t0, 140(sp)
   li t1, 1
   add x24, t0, t1
   # store i32 %var484, ptr %var481

   sw x24, 0(x19)
   # %var487 = icmp eq i32 %var437, %var16

   sub t2, x22, x8
   seqz    x19, t2
   # br i1 %var487, label %land.next..18, label %if.then.10_and_land.end..18

   bne      x19, x0, .+8
   j main_if.then.10_and_land.end..18
   # phi start 
   # phi end 
   j main_land.next..18

   .section .text
   .globl main_land.next..18
main_land.next..18:
   # %var491 = icmp eq i32 %var443, %var19

   sub t2, x23, x9
   seqz    x19, t2
   # br label %land.end..18

   # phi start 
   # phi end 
   j main_land.end..18

   .section .text
   .globl main_land.end..18
main_land.end..18:
   # br i1 %var488_land.end..18, label %if.then.11, label %if.else.11

   bne      x19, x0, .+8
   j main_if.else.11
   # phi start 
   # phi end 
   j main_if.then.11

   .section .text
   .globl main_if.then.11
main_if.then.11:
   # br label %if.back.11

   # phi start 
   li a5, 1
   # phi end 
   j main_if.back.11

   .section .text
   .globl main_if.else.11
main_if.else.11:
   # br label %if.back.11

   # phi start 
   # phi end 
   j main_if.back.11

   .section .text
   .globl main_if.back.11
main_if.back.11:
   # br label %if.back.10

   # phi start 
   mv t6, x3
   mv x3, x19
   mv x19, a5
   mv a5, t6
   # phi end 
   j main_if.back.10

   .section .text
   .globl main_if.else.10
main_if.else.10:
   # br label %if.back.10

   # phi start 
   mv t6, a5
   mv a5, x19
   mv x19, t6
   # phi end 
   j main_if.back.10

   .section .text
   .globl main_if.back.10
main_if.back.10:
   # %var497 = getelementptr i32, ptr %var25, i32 %head.1_while.cond.0

   mv t0, a0
   mv t1, a6
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x22, t0
   # %var498 = load i32, ptr %var497

   mv t0, x22
   lw x22, 0(t0)
   # %var499 = add i32 %var498, 2

   li t1, 2
   add x22, x22, t1
   # %var503 = getelementptr i32, ptr %var42, i32 %head.1_while.cond.0

   mv t0, a1
   mv t1, a6
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x23, t0
   # %var504 = load i32, ptr %var503

   mv t0, x23
   lw x23, 0(t0)
   # %var505 = sub i32 %var504, 1

   li t1, 1
   sub x23, x23, t1
   # %var506 = call i1 @check(i32 %var499, i32 %var9)

   sw ra, 160(sp)
   sw a0, 40(sp)
   sw a1, 44(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x8, 32(sp)
   sw x9, 36(sp)
   sw x19, 76(sp)
   sw a0, 40(sp)
   sw a1, 44(sp)
   sw a2, 48(sp)
   sw a3, 52(sp)
   sw a4, 56(sp)
   sw a5, 60(sp)
   sw a6, 64(sp)
   sw a7, 68(sp)
   sw x21, 84(sp)
   sw x20, 80(sp)
   sw x23, 92(sp)
   sw x22, 88(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   sw x18, 72(sp)
   mv a0, x22
   mv a1, x4
   call check
   lw ra, 160(sp)
   mv x24, a0
   lw a0, 40(sp)
   lw a1, 44(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x8, 32(sp)
   lw x9, 36(sp)
   lw x19, 76(sp)
   lw a0, 40(sp)
   lw a1, 44(sp)
   lw a2, 48(sp)
   lw a3, 52(sp)
   lw a4, 56(sp)
   lw a5, 60(sp)
   lw a6, 64(sp)
   lw a7, 68(sp)
   lw x21, 84(sp)
   lw x20, 80(sp)
   lw x23, 92(sp)
   lw x22, 88(sp)
   lw x3, 12(sp)
   lw x4, 16(sp)
   lw x18, 72(sp)
   # br i1 %var506, label %land.next..19, label %if.back.10_and_land.end..19

   bne      x24, x0, .+8
   j main_if.back.10_and_land.end..19
   # phi start 
   # phi end 
   j main_land.next..19

   .section .text
   .globl main_land.next..19
main_land.next..19:
   # %var510 = call i1 @check(i32 %var505, i32 %var9)

   sw ra, 160(sp)
   sw a0, 40(sp)
   sw a1, 44(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x8, 32(sp)
   sw x9, 36(sp)
   sw x19, 76(sp)
   sw a0, 40(sp)
   sw a1, 44(sp)
   sw a2, 48(sp)
   sw a3, 52(sp)
   sw a4, 56(sp)
   sw a5, 60(sp)
   sw a6, 64(sp)
   sw a7, 68(sp)
   sw x21, 84(sp)
   sw x20, 80(sp)
   sw x23, 92(sp)
   sw x22, 88(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   sw x18, 72(sp)
   mv a1, x4
   mv a0, x23
   call check
   lw ra, 160(sp)
   mv x24, a0
   lw a0, 40(sp)
   lw a1, 44(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x8, 32(sp)
   lw x9, 36(sp)
   lw x19, 76(sp)
   lw a0, 40(sp)
   lw a1, 44(sp)
   lw a2, 48(sp)
   lw a3, 52(sp)
   lw a4, 56(sp)
   lw a5, 60(sp)
   lw a6, 64(sp)
   lw a7, 68(sp)
   lw x21, 84(sp)
   lw x20, 80(sp)
   lw x23, 92(sp)
   lw x22, 88(sp)
   lw x3, 12(sp)
   lw x4, 16(sp)
   lw x18, 72(sp)
   # br label %land.end..19

   # phi start 
   # phi end 
   j main_land.end..19

   .section .text
   .globl main_land.end..19
main_land.end..19:
   # br i1 %var509_land.end..19, label %land.next..20, label %land.end..19_and_land.end..20

   bne      x24, x0, .+8
   j main_land.end..19_and_land.end..20
   # phi start 
   # phi end 
   j main_land.next..20

   .section .text
   .globl main_land.next..20
main_land.next..20:
   # %var517 = getelementptr ptr, ptr %var59, i32 %var499

   mv t0, a2
   mv t1, x22
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x24, t0
   # %var518 = load ptr, ptr %var517

   mv t0, x24
   lw x24, 0(t0)
   # %var520 = getelementptr i32, ptr %var518, i32 %var505

   mv t0, x24
   mv t1, x23
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x24, t0
   # %var521 = load i32, ptr %var520

   mv t0, x24
   lw x24, 0(t0)
   # %var522 = sub i32 0, 1

   li t0, 0
   li t1, 1
   sub x25, t0, t1
   # %var523 = icmp eq i32 %var521, %var522

   sub t2, x24, x25
   seqz    x24, t2
   # br label %land.end..20

   # phi start 
   # phi end 
   j main_land.end..20

   .section .text
   .globl main_land.end..20
main_land.end..20:
   # br i1 %var514_land.end..20, label %if.then.12, label %if.else.12

   bne      x24, x0, .+8
   j main_if.else.12
   # phi start 
   # phi end 
   j main_if.then.12

   .section .text
   .globl main_if.then.12
main_if.then.12:
   # %var527 = add i32 %tail.1_if.back.10, 1

   li t1, 1
   add a5, a5, t1
   # %var530 = getelementptr i32, ptr %var25, i32 %var527

   mv t0, a0
   mv t1, a5
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x20, t0
   # store i32 %var499, ptr %var530

   sw x22, 0(x20)
   # %var535 = getelementptr i32, ptr %var42, i32 %var527

   mv t0, a1
   mv t1, a5
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x20, t0
   # store i32 %var505, ptr %var535

   sw x23, 0(x20)
   # %var540 = getelementptr ptr, ptr %var59, i32 %var499

   mv t0, a2
   mv t1, x22
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x20, t0
   # %var541 = load ptr, ptr %var540

   mv t0, x20
   lw x20, 0(t0)
   # %var543 = getelementptr i32, ptr %var541, i32 %var505

   mv t0, x20
   mv t1, x23
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x20, t0
   # %var546 = add i32 %var121, 1

   lw t0, 140(sp)
   li t1, 1
   add x24, t0, t1
   # store i32 %var546, ptr %var543

   sw x24, 0(x20)
   # %var549 = icmp eq i32 %var499, %var16

   sub t2, x22, x8
   seqz    x20, t2
   # br i1 %var549, label %land.next..21, label %if.then.12_and_land.end..21

   bne      x20, x0, .+8
   j main_if.then.12_and_land.end..21
   # phi start 
   # phi end 
   j main_land.next..21

   .section .text
   .globl main_land.next..21
main_land.next..21:
   # %var553 = icmp eq i32 %var505, %var19

   sub t2, x23, x9
   seqz    x20, t2
   # br label %land.end..21

   # phi start 
   # phi end 
   j main_land.end..21

   .section .text
   .globl main_land.end..21
main_land.end..21:
   # br i1 %var550_land.end..21, label %if.then.13, label %if.else.13

   bne      x20, x0, .+8
   j main_if.else.13
   # phi start 
   # phi end 
   j main_if.then.13

   .section .text
   .globl main_if.then.13
main_if.then.13:
   # br label %if.back.13

   # phi start 
   li x19, 1
   # phi end 
   j main_if.back.13

   .section .text
   .globl main_if.else.13
main_if.else.13:
   # br label %if.back.13

   # phi start 
   # phi end 
   j main_if.back.13

   .section .text
   .globl main_if.back.13
main_if.back.13:
   # br label %if.back.12

   # phi start 
   mv t6, a5
   mv a5, x20
   mv x20, x19
   mv x19, t6
   # phi end 
   j main_if.back.12

   .section .text
   .globl main_if.else.12
main_if.else.12:
   # br label %if.back.12

   # phi start 
   mv t6, a5
   mv a5, x20
   mv x20, x19
   mv x19, t6
   # phi end 
   j main_if.back.12

   .section .text
   .globl main_if.back.12
main_if.back.12:
   # %var559 = getelementptr i32, ptr %var25, i32 %head.1_while.cond.0

   mv t0, a0
   mv t1, a6
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x22, t0
   # %var560 = load i32, ptr %var559

   mv t0, x22
   lw x22, 0(t0)
   # %var561 = add i32 %var560, 2

   li t1, 2
   add x22, x22, t1
   # %var565 = getelementptr i32, ptr %var42, i32 %head.1_while.cond.0

   mv t0, a1
   mv t1, a6
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x23, t0
   # %var566 = load i32, ptr %var565

   mv t0, x23
   lw x23, 0(t0)
   # %var567 = add i32 %var566, 1

   li t1, 1
   add x23, x23, t1
   # %var568 = call i1 @check(i32 %var561, i32 %var9)

   sw ra, 160(sp)
   sw a0, 40(sp)
   sw a1, 44(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x8, 32(sp)
   sw x9, 36(sp)
   sw x19, 76(sp)
   sw a0, 40(sp)
   sw a1, 44(sp)
   sw a2, 48(sp)
   sw a3, 52(sp)
   sw a4, 56(sp)
   sw a5, 60(sp)
   sw a6, 64(sp)
   sw a7, 68(sp)
   sw x21, 84(sp)
   sw x20, 80(sp)
   sw x23, 92(sp)
   sw x22, 88(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   sw x18, 72(sp)
   mv a1, x4
   mv a0, x22
   call check
   lw ra, 160(sp)
   mv x24, a0
   lw a0, 40(sp)
   lw a1, 44(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x8, 32(sp)
   lw x9, 36(sp)
   lw x19, 76(sp)
   lw a0, 40(sp)
   lw a1, 44(sp)
   lw a2, 48(sp)
   lw a3, 52(sp)
   lw a4, 56(sp)
   lw a5, 60(sp)
   lw a6, 64(sp)
   lw a7, 68(sp)
   lw x21, 84(sp)
   lw x20, 80(sp)
   lw x23, 92(sp)
   lw x22, 88(sp)
   lw x3, 12(sp)
   lw x4, 16(sp)
   lw x18, 72(sp)
   # br i1 %var568, label %land.next..22, label %if.back.12_and_land.end..22

   bne      x24, x0, .+8
   j main_if.back.12_and_land.end..22
   # phi start 
   # phi end 
   j main_land.next..22

   .section .text
   .globl main_land.next..22
main_land.next..22:
   # %var572 = call i1 @check(i32 %var567, i32 %var9)

   sw ra, 160(sp)
   sw a0, 40(sp)
   sw a1, 44(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x8, 32(sp)
   sw x9, 36(sp)
   sw x19, 76(sp)
   sw a0, 40(sp)
   sw a1, 44(sp)
   sw a2, 48(sp)
   sw a3, 52(sp)
   sw a4, 56(sp)
   sw a5, 60(sp)
   sw a6, 64(sp)
   sw a7, 68(sp)
   sw x21, 84(sp)
   sw x20, 80(sp)
   sw x23, 92(sp)
   sw x22, 88(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   sw x18, 72(sp)
   mv a1, x4
   mv a0, x23
   call check
   lw ra, 160(sp)
   mv x24, a0
   lw a0, 40(sp)
   lw a1, 44(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x8, 32(sp)
   lw x9, 36(sp)
   lw x19, 76(sp)
   lw a0, 40(sp)
   lw a1, 44(sp)
   lw a2, 48(sp)
   lw a3, 52(sp)
   lw a4, 56(sp)
   lw a5, 60(sp)
   lw a6, 64(sp)
   lw a7, 68(sp)
   lw x21, 84(sp)
   lw x20, 80(sp)
   lw x23, 92(sp)
   lw x22, 88(sp)
   lw x3, 12(sp)
   lw x4, 16(sp)
   lw x18, 72(sp)
   # br label %land.end..22

   # phi start 
   # phi end 
   j main_land.end..22

   .section .text
   .globl main_land.end..22
main_land.end..22:
   # br i1 %var571_land.end..22, label %land.next..23, label %land.end..22_and_land.end..23

   bne      x24, x0, .+8
   j main_land.end..22_and_land.end..23
   # phi start 
   # phi end 
   j main_land.next..23

   .section .text
   .globl main_land.next..23
main_land.next..23:
   # %var579 = getelementptr ptr, ptr %var59, i32 %var561

   mv t0, a2
   mv t1, x22
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x24, t0
   # %var580 = load ptr, ptr %var579

   mv t0, x24
   lw x24, 0(t0)
   # %var582 = getelementptr i32, ptr %var580, i32 %var567

   mv t0, x24
   mv t1, x23
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x24, t0
   # %var583 = load i32, ptr %var582

   mv t0, x24
   lw x24, 0(t0)
   # %var584 = sub i32 0, 1

   li t0, 0
   li t1, 1
   sub x25, t0, t1
   # %var585 = icmp eq i32 %var583, %var584

   sub t2, x24, x25
   seqz    x24, t2
   # br label %land.end..23

   # phi start 
   # phi end 
   j main_land.end..23

   .section .text
   .globl main_land.end..23
main_land.end..23:
   # br i1 %var576_land.end..23, label %if.then.14, label %if.else.14

   bne      x24, x0, .+8
   j main_if.else.14
   # phi start 
   # phi end 
   j main_if.then.14

   .section .text
   .globl main_if.then.14
main_if.then.14:
   # %var589 = add i32 %tail.1_if.back.12, 1

   li t1, 1
   add a3, x19, t1
   # %var592 = getelementptr i32, ptr %var25, i32 %var589

   mv t0, a0
   mv t1, a3
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x19, t0
   # store i32 %var561, ptr %var592

   sw x22, 0(x19)
   # %var597 = getelementptr i32, ptr %var42, i32 %var589

   mv t0, a1
   mv t1, a3
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x19, t0
   # store i32 %var567, ptr %var597

   sw x23, 0(x19)
   # %var602 = getelementptr ptr, ptr %var59, i32 %var561

   mv t0, a2
   mv t1, x22
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x19, t0
   # %var603 = load ptr, ptr %var602

   mv t0, x19
   lw x19, 0(t0)
   # %var605 = getelementptr i32, ptr %var603, i32 %var567

   mv t0, x19
   mv t1, x23
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x19, t0
   # %var608 = add i32 %var121, 1

   lw t0, 140(sp)
   li t1, 1
   add x24, t0, t1
   # store i32 %var608, ptr %var605

   sw x24, 0(x19)
   # %var611 = icmp eq i32 %var561, %var16

   sub t2, x22, x8
   seqz    x19, t2
   # br i1 %var611, label %land.next..24, label %if.then.14_and_land.end..24

   bne      x19, x0, .+8
   j main_if.then.14_and_land.end..24
   # phi start 
   # phi end 
   j main_land.next..24

   .section .text
   .globl main_land.next..24
main_land.next..24:
   # %var615 = icmp eq i32 %var567, %var19

   sub t2, x23, x9
   seqz    x19, t2
   # br label %land.end..24

   # phi start 
   # phi end 
   j main_land.end..24

   .section .text
   .globl main_land.end..24
main_land.end..24:
   # br i1 %var612_land.end..24, label %if.then.15, label %if.else.15

   bne      x19, x0, .+8
   j main_if.else.15
   # phi start 
   # phi end 
   j main_if.then.15

   .section .text
   .globl main_if.then.15
main_if.then.15:
   # br label %if.back.15

   # phi start 
   li x20, 1
   # phi end 
   j main_if.back.15

   .section .text
   .globl main_if.else.15
main_if.else.15:
   # br label %if.back.15

   # phi start 
   # phi end 
   j main_if.back.15

   .section .text
   .globl main_if.back.15
main_if.back.15:
   # br label %if.back.14

   # phi start 
   mv t6, a3
   mv a3, x19
   mv x19, t6
   # phi end 
   j main_if.back.14

   .section .text
   .globl main_if.else.14
main_if.else.14:
   # br label %if.back.14

   # phi start 
   # phi end 
   j main_if.back.14

   .section .text
   .globl main_if.back.14
main_if.back.14:
   # %var619 = icmp eq i32 %ok.1_if.back.14, 1

   li t1, 1
   sub t2, x20, t1
   seqz    x22, t2
   # br i1 %var619, label %if.then.16, label %if.else.16

   bne      x22, x0, .+8
   j main_if.else.16
   # phi start 
   # phi end 
   j main_if.then.16

   .section .text
   .globl main_if.then.16
main_if.then.16:
   # br label %while.back.0

   # phi start 
   mv x3, x20
   # phi end 
   j main_while.back.0

   .section .text
   .globl main_if.else.16
main_if.else.16:
   # br label %if.back.16

   # phi start 
   # phi end 
   j main_if.back.16

   .section .text
   .globl main_if.back.16
main_if.back.16:
   # %var622 = add i32 %head.1_while.cond.0, 1

   li t1, 1
   add a6, a6, t1
   # br label %while.cond.0

   # phi start 
   mv t2, a7
   sw t2, 136(sp)
   mv t2, x21
   sw t2, 132(sp)
   mv a7, x18
   mv x18, x19
   mv x19, a4
   lw t0, 144(sp)
   mv a4, t0
   mv t6, x20
   mv x20, a5
   mv a5, t6
   # phi end 
   j main_while.cond.0

   .section .text
   .globl main_while.back.0
main_while.back.0:
   # %var624 = icmp eq i32 %ok.1_while.back.0, 1

   li t1, 1
   sub t2, x3, t1
   seqz    x3, t2
   # br i1 %var624, label %if.then.17, label %if.else.17

   bne      x3, x0, .+8
   j main_if.else.17
   # phi start 
   # phi end 
   j main_if.then.17

   .section .text
   .globl main_if.then.17
main_if.then.17:
   # %var629 = getelementptr ptr, ptr %var59, i32 %var16

   mv t0, a2
   mv t1, x8
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x3, t0
   # %var630 = load ptr, ptr %var629

   mv t0, x3
   lw x3, 0(t0)
   # %var632 = getelementptr i32, ptr %var630, i32 %var19

   mv t0, x3
   mv t1, x9
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x3, t0
   # %var633 = load i32, ptr %var632

   mv t0, x3
   lw x3, 0(t0)
   # %var626 = call ptr @toString(i32 %var633)

   sw ra, 160(sp)
   sw a0, 40(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   mv a0, x3
   call toString
   lw ra, 160(sp)
   mv x3, a0
   lw a0, 40(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   # call void @println(ptr %var626)

   sw ra, 160(sp)
   sw a0, 40(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   mv a0, x3
   call println
   lw ra, 160(sp)
   sw a0, 152(sp)
   lw a0, 40(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   # br label %if.back.17

   # phi start 
   # phi end 
   j main_if.back.17

   .section .text
   .globl main_if.else.17
main_if.else.17:
   # call void @print(ptr @.str..0)

   sw ra, 160(sp)
   sw a0, 40(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   la a0, @.str..0
   call print
   lw ra, 160(sp)
   sw a0, 156(sp)
   lw a0, 40(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   # br label %if.back.17

   # phi start 
   # phi end 
   j main_if.back.17

   .section .text
   .globl main_if.back.17
main_if.back.17:
   # ret i32 0

   li a0, 0
   addi sp, sp, 176
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   # phi start 
   # phi end 
   ret

   .section .text
   .globl main_while.cond.0_and_while.back.0
main_while.cond.0_and_while.back.0:
   # br label %while.back.0

   # phi start 
   mv x3, a5
   # phi end 
   j main_while.back.0

   .section .text
   .globl main_while.body.0_and_land.end..1
main_while.body.0_and_land.end..1:
   # br label %land.end..1

   # phi start 
   # phi end 
   j main_land.end..1

   .section .text
   .globl main_land.end..1_and_land.end..2
main_land.end..1_and_land.end..2:
   # br label %land.end..2

   # phi start 
   # phi end 
   j main_land.end..2

   .section .text
   .globl main_if.then.0_and_land.end..3
main_if.then.0_and_land.end..3:
   # br label %land.end..3

   # phi start 
   # phi end 
   j main_land.end..3

   .section .text
   .globl main_if.back.0_and_land.end..4
main_if.back.0_and_land.end..4:
   # br label %land.end..4

   # phi start 
   # phi end 
   j main_land.end..4

   .section .text
   .globl main_land.end..4_and_land.end..5
main_land.end..4_and_land.end..5:
   # br label %land.end..5

   # phi start 
   # phi end 
   j main_land.end..5

   .section .text
   .globl main_if.then.2_and_land.end..6
main_if.then.2_and_land.end..6:
   # br label %land.end..6

   # phi start 
   # phi end 
   j main_land.end..6

   .section .text
   .globl main_if.back.2_and_land.end..7
main_if.back.2_and_land.end..7:
   # br label %land.end..7

   # phi start 
   # phi end 
   j main_land.end..7

   .section .text
   .globl main_land.end..7_and_land.end..8
main_land.end..7_and_land.end..8:
   # br label %land.end..8

   # phi start 
   # phi end 
   j main_land.end..8

   .section .text
   .globl main_if.then.4_and_land.end..9
main_if.then.4_and_land.end..9:
   # br label %land.end..9

   # phi start 
   # phi end 
   j main_land.end..9

   .section .text
   .globl main_if.back.4_and_land.end..10
main_if.back.4_and_land.end..10:
   # br label %land.end..10

   # phi start 
   # phi end 
   j main_land.end..10

   .section .text
   .globl main_land.end..10_and_land.end..11
main_land.end..10_and_land.end..11:
   # br label %land.end..11

   # phi start 
   # phi end 
   j main_land.end..11

   .section .text
   .globl main_if.then.6_and_land.end..12
main_if.then.6_and_land.end..12:
   # br label %land.end..12

   # phi start 
   # phi end 
   j main_land.end..12

   .section .text
   .globl main_if.back.6_and_land.end..13
main_if.back.6_and_land.end..13:
   # br label %land.end..13

   # phi start 
   # phi end 
   j main_land.end..13

   .section .text
   .globl main_land.end..13_and_land.end..14
main_land.end..13_and_land.end..14:
   # br label %land.end..14

   # phi start 
   # phi end 
   j main_land.end..14

   .section .text
   .globl main_if.then.8_and_land.end..15
main_if.then.8_and_land.end..15:
   # br label %land.end..15

   # phi start 
   # phi end 
   j main_land.end..15

   .section .text
   .globl main_if.back.8_and_land.end..16
main_if.back.8_and_land.end..16:
   # br label %land.end..16

   # phi start 
   # phi end 
   j main_land.end..16

   .section .text
   .globl main_land.end..16_and_land.end..17
main_land.end..16_and_land.end..17:
   # br label %land.end..17

   # phi start 
   # phi end 
   j main_land.end..17

   .section .text
   .globl main_if.then.10_and_land.end..18
main_if.then.10_and_land.end..18:
   # br label %land.end..18

   # phi start 
   # phi end 
   j main_land.end..18

   .section .text
   .globl main_if.back.10_and_land.end..19
main_if.back.10_and_land.end..19:
   # br label %land.end..19

   # phi start 
   # phi end 
   j main_land.end..19

   .section .text
   .globl main_land.end..19_and_land.end..20
main_land.end..19_and_land.end..20:
   # br label %land.end..20

   # phi start 
   # phi end 
   j main_land.end..20

   .section .text
   .globl main_if.then.12_and_land.end..21
main_if.then.12_and_land.end..21:
   # br label %land.end..21

   # phi start 
   # phi end 
   j main_land.end..21

   .section .text
   .globl main_if.back.12_and_land.end..22
main_if.back.12_and_land.end..22:
   # br label %land.end..22

   # phi start 
   # phi end 
   j main_land.end..22

   .section .text
   .globl main_land.end..22_and_land.end..23
main_land.end..22_and_land.end..23:
   # br label %land.end..23

   # phi start 
   # phi end 
   j main_land.end..23

   .section .text
   .globl main_if.then.14_and_land.end..24
main_if.then.14_and_land.end..24:
   # br label %land.end..24

   # phi start 
   # phi end 
   j main_land.end..24

   .section .text
   .globl check
check:
   addi sp, sp, -144
   sw t0, 132(sp)
   sw t1, 136(sp)
   sw t2, 140(sp)
   mv x4, a0
   # phi start 
   # phi end 
   mv x3, a1

   .section .text
   .globl check_entry
check_entry:
   # %var2 = icmp slt i32 %a, %N

   sub t2, x4, x3
   sltz    x3, t2
   # br i1 %var2, label %land.next..0, label %entry_and_land.end..0

   bne      x3, x0, .+8
   j check_entry_and_land.end..0
   # phi start 
   # phi end 
   j check_land.next..0

   .section .text
   .globl check_land.next..0
check_land.next..0:
   # %var5 = icmp sge i32 %a, 0

   li t1, 0
   sub t2, x4, t1
   sgtz    x3, t2
   seqz    t1, t2
   or x3, x3, t1
   # br label %land.end..0

   # phi start 
   # phi end 
   j check_land.end..0

   .section .text
   .globl check_land.end..0
check_land.end..0:
   # ret i1 %var3_land.end..0

   mv a0, x3
   addi sp, sp, 144
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   # phi start 
   # phi end 
   ret

   .section .text
   .globl check_entry_and_land.end..0
check_entry_and_land.end..0:
   # br label %land.end..0

   # phi start 
   # phi end 
   j check_land.end..0

   .section .rodata
@.str..0:
   .asciz "no solution!\n"

