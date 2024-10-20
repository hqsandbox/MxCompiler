   .section .text
   .globl printBoard
printBoard:
   addi sp, sp, -160
   sw t0, 148(sp)
   sw t1, 152(sp)
   # phi start 
   # phi end 
   sw t2, 156(sp)

   .section .text
   .globl printBoard_entry
printBoard_entry:
   # br label %for.cond.0

   # phi start 
   li x3, 0
   # phi end 
   j printBoard_for.cond.0

   .section .text
   .globl printBoard_for.cond.0
printBoard_for.cond.0:
   # %var5 = load i32, ptr @N

   la t0, @N
   lw x4, 0(t0)
   # %var6 = icmp slt i32 %i.1_for.cond.0, %var5

   sub t2, x3, x4
   sltz    x4, t2
   # br i1 %var6, label %for.body.0, label %for.back.0

   bne      x4, x0, .+8
   j printBoard_for.back.0
   # phi start 
   # phi end 
   j printBoard_for.body.0

   .section .text
   .globl printBoard_for.body.0
printBoard_for.body.0:
   # br label %for.cond.1

   # phi start 
   li x4, 0
   # phi end 
   j printBoard_for.cond.1

   .section .text
   .globl printBoard_for.cond.1
printBoard_for.cond.1:
   # %var9 = load i32, ptr @N

   la t0, @N
   lw x8, 0(t0)
   # %var10 = icmp slt i32 %j.1_for.cond.1, %var9

   sub t2, x4, x8
   sltz    x8, t2
   # br i1 %var10, label %for.body.1, label %for.back.1

   bne      x8, x0, .+8
   j printBoard_for.back.1
   # phi start 
   # phi end 
   j printBoard_for.body.1

   .section .text
   .globl printBoard_for.body.1
printBoard_for.body.1:
   # %var11 = load ptr, ptr @col

   la t0, @col
   lw x8, 0(t0)
   # %var13 = getelementptr i32, ptr %var11, i32 %i.1_for.cond.0

   li t2, 4
   mul x3, x3, t2
   add x8, x3, x8
   mv x8, x8
   # %var14 = load i32, ptr %var13

   mv t0, x8
   lw x8, 0(t0)
   # %var16 = icmp eq i32 %var14, %j.1_for.cond.1

   sub t2, x8, x4
   seqz    x8, t2
   # br i1 %var16, label %if.then.0, label %if.else.0

   bne      x8, x0, .+8
   j printBoard_if.else.0
   # phi start 
   # phi end 
   j printBoard_if.then.0

   .section .text
   .globl printBoard_if.then.0
printBoard_if.then.0:
   # call void @print(ptr @.str..0)

   sw ra, 144(sp)
   sw a0, 40(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   la a0, @.str..0
   call print
   lw ra, 144(sp)
   sw a0, 128(sp)
   lw a0, 40(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x3, 12(sp)
   lw x4, 16(sp)
   # br label %if.back.0

   # phi start 
   # phi end 
   j printBoard_if.back.0

   .section .text
   .globl printBoard_if.else.0
printBoard_if.else.0:
   # call void @print(ptr @.str..1)

   sw ra, 144(sp)
   sw a0, 40(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   la a0, @.str..1
   call print
   lw ra, 144(sp)
   sw a0, 132(sp)
   lw a0, 40(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x3, 12(sp)
   lw x4, 16(sp)
   # br label %if.back.0

   # phi start 
   # phi end 
   j printBoard_if.back.0

   .section .text
   .globl printBoard_if.back.0
printBoard_if.back.0:
   # br label %for.step.1

   # phi start 
   # phi end 
   j printBoard_for.step.1

   .section .text
   .globl printBoard_for.step.1
printBoard_for.step.1:
   # %var20 = add i32 %j.1_for.cond.1, 1

   li t1, 1
   add x4, x4, t1
   # br label %for.cond.1

   # phi start 
   # phi end 
   j printBoard_for.cond.1

   .section .text
   .globl printBoard_for.back.1
printBoard_for.back.1:
   # call void @println(ptr @.str..2)

   sw ra, 144(sp)
   sw a0, 40(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x3, 12(sp)
   la a0, @.str..2
   call println
   lw ra, 144(sp)
   sw a0, 136(sp)
   lw a0, 40(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x3, 12(sp)
   # br label %for.step.0

   # phi start 
   # phi end 
   j printBoard_for.step.0

   .section .text
   .globl printBoard_for.step.0
printBoard_for.step.0:
   # %var23 = add i32 %i.1_for.cond.0, 1

   li t1, 1
   add x3, x3, t1
   # br label %for.cond.0

   # phi start 
   # phi end 
   j printBoard_for.cond.0

   .section .text
   .globl printBoard_for.back.0
printBoard_for.back.0:
   # call void @println(ptr @.str..3)

   sw ra, 144(sp)
   sw a0, 40(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   la a0, @.str..3
   call println
   lw ra, 144(sp)
   sw a0, 140(sp)
   lw a0, 40(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   # ret void

   addi sp, sp, 160
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   # phi start 
   # phi end 
   ret

   .section .text
   .globl search
search:
   addi sp, sp, -152
   sw t0, 140(sp)
   sw t1, 144(sp)
   sw t2, 148(sp)
   # phi start 
   # phi end 
   mv x3, a0

   .section .text
   .globl search_entry
search_entry:
   # %var26 = load i32, ptr @N

   la t0, @N
   lw x4, 0(t0)
   # %var27 = icmp eq i32 %c, %var26

   sub t2, x3, x4
   seqz    x4, t2
   # br i1 %var27, label %if.then.1, label %if.else.1

   bne      x4, x0, .+8
   j search_if.else.1
   # phi start 
   # phi end 
   j search_if.then.1

   .section .text
   .globl search_if.then.1
search_if.then.1:
   # call void @printBoard()

   sw ra, 136(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   call printBoard
   lw ra, 136(sp)
   sw a0, 128(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   # br label %if.back.1

   # phi start 
   # phi end 
   j search_if.back.1

   .section .text
   .globl search_if.else.1
search_if.else.1:
   # br label %for.cond.2

   # phi start 
   li x4, 0
   # phi end 
   j search_for.cond.2

   .section .text
   .globl search_for.cond.2
search_for.cond.2:
   # %var31 = load i32, ptr @N

   la t0, @N
   lw x8, 0(t0)
   # %var32 = icmp slt i32 %r.1_for.cond.2, %var31

   sub t2, x4, x8
   sltz    x8, t2
   # br i1 %var32, label %for.body.2, label %for.back.2

   bne      x8, x0, .+8
   j search_for.back.2
   # phi start 
   # phi end 
   j search_for.body.2

   .section .text
   .globl search_for.body.2
search_for.body.2:
   # %var33 = load ptr, ptr @row

   la t0, @row
   lw x8, 0(t0)
   # %var35 = getelementptr i32, ptr %var33, i32 %r.1_for.cond.2

   li t2, 4
   mul x4, x4, t2
   add x8, x4, x8
   mv x8, x8
   # %var36 = load i32, ptr %var35

   mv t0, x8
   lw x8, 0(t0)
   # %var37 = icmp eq i32 %var36, 0

   li t1, 0
   sub t2, x8, t1
   seqz    x8, t2
   # br i1 %var37, label %land.next..0, label %for.body.2_and_land.end..0

   bne      x8, x0, .+8
   j search_for.body.2_and_land.end..0
   # phi start 
   # phi end 
   j search_land.next..0

   .section .text
   .globl search_land.next..0
search_land.next..0:
   # %var39 = load ptr, ptr @d

   la t0, @d
   lw x8, 0(t0)
   # %var40 = getelementptr ptr, ptr %var39, i32 0

   li t1, 0
   li t2, 4
   mul t1, t1, t2
   add x8, t1, x8
   mv x8, x8
   # %var41 = load ptr, ptr %var40

   mv t0, x8
   lw x8, 0(t0)
   # %var44 = add i32 %r.1_for.cond.2, %c

   add x9, x4, x3
   # %var45 = getelementptr i32, ptr %var41, i32 %var44

   li t2, 4
   mul x9, x9, t2
   add x8, x9, x8
   mv x8, x8
   # %var46 = load i32, ptr %var45

   mv t0, x8
   lw x8, 0(t0)
   # %var47 = icmp eq i32 %var46, 0

   li t1, 0
   sub t2, x8, t1
   seqz    x8, t2
   # br label %land.end..0

   # phi start 
   # phi end 
   j search_land.end..0

   .section .text
   .globl search_land.end..0
search_land.end..0:
   # br i1 %var38_land.end..0, label %land.next..1, label %land.end..0_and_land.end..1

   bne      x8, x0, .+8
   j search_land.end..0_and_land.end..1
   # phi start 
   # phi end 
   j search_land.next..1

   .section .text
   .globl search_land.next..1
search_land.next..1:
   # %var50 = load ptr, ptr @d

   la t0, @d
   lw x8, 0(t0)
   # %var51 = getelementptr ptr, ptr %var50, i32 1

   li t1, 1
   li t2, 4
   mul t1, t1, t2
   add x8, t1, x8
   mv x8, x8
   # %var52 = load ptr, ptr %var51

   mv t0, x8
   lw x8, 0(t0)
   # %var54 = load i32, ptr @N

   la t0, @N
   lw x9, 0(t0)
   # %var55 = add i32 %r.1_for.cond.2, %var54

   add x9, x4, x9
   # %var56 = sub i32 %var55, 1

   li t1, 1
   sub x9, x9, t1
   # %var58 = sub i32 %var56, %c

   sub x9, x9, x3
   # %var59 = getelementptr i32, ptr %var52, i32 %var58

   li t2, 4
   mul x9, x9, t2
   add x8, x9, x8
   mv x8, x8
   # %var60 = load i32, ptr %var59

   mv t0, x8
   lw x8, 0(t0)
   # %var61 = icmp eq i32 %var60, 0

   li t1, 0
   sub t2, x8, t1
   seqz    x8, t2
   # br label %land.end..1

   # phi start 
   # phi end 
   j search_land.end..1

   .section .text
   .globl search_land.end..1
search_land.end..1:
   # br i1 %var49_land.end..1, label %if.then.2, label %if.else.2

   bne      x8, x0, .+8
   j search_if.else.2
   # phi start 
   # phi end 
   j search_if.then.2

   .section .text
   .globl search_if.then.2
search_if.then.2:
   # %var63 = load ptr, ptr @d

   la t0, @d
   lw x8, 0(t0)
   # %var64 = getelementptr ptr, ptr %var63, i32 1

   li t1, 1
   li t2, 4
   mul t1, t1, t2
   add x8, t1, x8
   mv x8, x8
   # %var65 = load ptr, ptr %var64

   mv t0, x8
   lw x8, 0(t0)
   # %var67 = load i32, ptr @N

   la t0, @N
   lw x9, 0(t0)
   # %var68 = add i32 %r.1_for.cond.2, %var67

   add x9, x4, x9
   # %var69 = sub i32 %var68, 1

   li t1, 1
   sub x9, x9, t1
   # %var71 = sub i32 %var69, %c

   sub x9, x9, x3
   # %var72 = getelementptr i32, ptr %var65, i32 %var71

   li t2, 4
   mul x9, x9, t2
   add x8, x9, x8
   mv x8, x8
   # store i32 1, ptr %var72

   li t0, 1
   sw t0, 0(x8)
   # %var74 = load ptr, ptr @d

   la t0, @d
   lw x8, 0(t0)
   # %var75 = getelementptr ptr, ptr %var74, i32 0

   li t1, 0
   li t2, 4
   mul t1, t1, t2
   add x8, t1, x8
   mv x8, x8
   # %var76 = load ptr, ptr %var75

   mv t0, x8
   lw x8, 0(t0)
   # %var79 = add i32 %r.1_for.cond.2, %c

   add x9, x4, x3
   # %var80 = getelementptr i32, ptr %var76, i32 %var79

   li t2, 4
   mul x9, x9, t2
   add x8, x9, x8
   mv x8, x8
   # store i32 1, ptr %var80

   li t0, 1
   sw t0, 0(x8)
   # %var82 = load ptr, ptr @row

   la t0, @row
   lw x8, 0(t0)
   # %var84 = getelementptr i32, ptr %var82, i32 %r.1_for.cond.2

   li t2, 4
   mul x4, x4, t2
   add x8, x4, x8
   mv x8, x8
   # store i32 1, ptr %var84

   li t0, 1
   sw t0, 0(x8)
   # %var86 = load ptr, ptr @col

   la t0, @col
   lw x8, 0(t0)
   # %var88 = getelementptr i32, ptr %var86, i32 %c

   li t2, 4
   mul x3, x3, t2
   add x8, x3, x8
   mv x8, x8
   # store i32 %r.1_for.cond.2, ptr %var88

   sw x4, 0(x8)
   # %var93 = add i32 %c, 1

   li t1, 1
   add x8, x3, t1
   # call void @search(i32 %var93)

   sw ra, 136(sp)
   sw a0, 40(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   mv a0, x8
   call search
   lw ra, 136(sp)
   sw a0, 132(sp)
   lw a0, 40(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x3, 12(sp)
   lw x4, 16(sp)
   # %var94 = load ptr, ptr @row

   la t0, @row
   lw x8, 0(t0)
   # %var96 = getelementptr i32, ptr %var94, i32 %r.1_for.cond.2

   li t2, 4
   mul x4, x4, t2
   add x8, x4, x8
   mv x8, x8
   # store i32 0, ptr %var96

   li t0, 0
   sw t0, 0(x8)
   # %var98 = load ptr, ptr @d

   la t0, @d
   lw x8, 0(t0)
   # %var99 = getelementptr ptr, ptr %var98, i32 0

   li t1, 0
   li t2, 4
   mul t1, t1, t2
   add x8, t1, x8
   mv x8, x8
   # %var100 = load ptr, ptr %var99

   mv t0, x8
   lw x8, 0(t0)
   # %var103 = add i32 %r.1_for.cond.2, %c

   add x9, x4, x3
   # %var104 = getelementptr i32, ptr %var100, i32 %var103

   li t2, 4
   mul x9, x9, t2
   add x8, x9, x8
   mv x8, x8
   # store i32 0, ptr %var104

   li t0, 0
   sw t0, 0(x8)
   # %var106 = load ptr, ptr @d

   la t0, @d
   lw x8, 0(t0)
   # %var107 = getelementptr ptr, ptr %var106, i32 1

   li t1, 1
   li t2, 4
   mul t1, t1, t2
   add x8, t1, x8
   mv x8, x8
   # %var108 = load ptr, ptr %var107

   mv t0, x8
   lw x8, 0(t0)
   # %var110 = load i32, ptr @N

   la t0, @N
   lw x9, 0(t0)
   # %var111 = add i32 %r.1_for.cond.2, %var110

   add x9, x4, x9
   # %var112 = sub i32 %var111, 1

   li t1, 1
   sub x9, x9, t1
   # %var114 = sub i32 %var112, %c

   sub x9, x9, x3
   # %var115 = getelementptr i32, ptr %var108, i32 %var114

   li t2, 4
   mul x9, x9, t2
   add x8, x9, x8
   mv x8, x8
   # store i32 0, ptr %var115

   li t0, 0
   sw t0, 0(x8)
   # br label %if.back.2

   # phi start 
   # phi end 
   j search_if.back.2

   .section .text
   .globl search_if.else.2
search_if.else.2:
   # br label %if.back.2

   # phi start 
   # phi end 
   j search_if.back.2

   .section .text
   .globl search_if.back.2
search_if.back.2:
   # br label %for.step.2

   # phi start 
   # phi end 
   j search_for.step.2

   .section .text
   .globl search_for.step.2
search_for.step.2:
   # %var118 = add i32 %r.1_for.cond.2, 1

   li t1, 1
   add x4, x4, t1
   # br label %for.cond.2

   # phi start 
   # phi end 
   j search_for.cond.2

   .section .text
   .globl search_for.back.2
search_for.back.2:
   # br label %if.back.1

   # phi start 
   # phi end 
   j search_if.back.1

   .section .text
   .globl search_if.back.1
search_if.back.1:
   # ret void

   addi sp, sp, 152
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   # phi start 
   # phi end 
   ret

   .section .text
   .globl search_for.body.2_and_land.end..0
search_for.body.2_and_land.end..0:
   # br label %land.end..0

   # phi start 
   # phi end 
   j search_land.end..0

   .section .text
   .globl search_land.end..0_and_land.end..1
search_land.end..0_and_land.end..1:
   # br label %land.end..1

   # phi start 
   # phi end 
   j search_land.end..1

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
   # %var0 = call ptr @__array.alloca(i32 4, i32 1, i32 1, i32 8)

   sw ra, 128(sp)
   sw a0, 40(sp)
   sw a1, 44(sp)
   sw a2, 48(sp)
   sw a3, 52(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   li a2, 1
   li a0, 4
   li a1, 1
   li a3, 8
   call __array.alloca
   lw ra, 128(sp)
   mv x3, a0
   lw a0, 40(sp)
   lw a1, 44(sp)
   lw a2, 48(sp)
   lw a3, 52(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   # store ptr %var0, ptr @row

   la t1, @row
   sw x3, 0(t1)
   # %var1 = call ptr @__array.alloca(i32 4, i32 1, i32 1, i32 8)

   sw ra, 128(sp)
   sw a0, 40(sp)
   sw a1, 44(sp)
   sw a2, 48(sp)
   sw a3, 52(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   li a1, 1
   li a2, 1
   li a3, 8
   li a0, 4
   call __array.alloca
   lw ra, 128(sp)
   mv x3, a0
   lw a0, 40(sp)
   lw a1, 44(sp)
   lw a2, 48(sp)
   lw a3, 52(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   # store ptr %var1, ptr @col

   la t1, @col
   sw x3, 0(t1)
   # %var2 = call ptr @__array.alloca(i32 4, i32 2, i32 1, i32 2)

   sw ra, 128(sp)
   sw a0, 40(sp)
   sw a1, 44(sp)
   sw a2, 48(sp)
   sw a3, 52(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   li a2, 1
   li a3, 2
   li a1, 2
   li a0, 4
   call __array.alloca
   lw ra, 128(sp)
   mv x3, a0
   lw a0, 40(sp)
   lw a1, 44(sp)
   lw a2, 48(sp)
   lw a3, 52(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   # store ptr %var2, ptr @d

   la t1, @d
   sw x3, 0(t1)
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
   addi sp, sp, -152
   sw t0, 140(sp)
   sw t1, 144(sp)
   # phi start 
   # phi end 
   sw t2, 148(sp)

   .section .text
   .globl main_entry
main_entry:
   # call void @__init()

   sw ra, 136(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   call __init
   lw ra, 136(sp)
   sw a0, 128(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   # br label %for.cond.3

   # phi start 
   li x3, 0
   # phi end 
   j main_for.cond.3

   .section .text
   .globl main_for.cond.3
main_for.cond.3:
   # %var122 = icmp slt i32 %i.2_for.cond.3, 8

   li t1, 8
   sub t2, x3, t1
   sltz    x4, t2
   # br i1 %var122, label %for.body.3, label %for.back.3

   bne      x4, x0, .+8
   j main_for.back.3
   # phi start 
   # phi end 
   j main_for.body.3

   .section .text
   .globl main_for.body.3
main_for.body.3:
   # %var123 = load ptr, ptr @row

   la t0, @row
   lw x4, 0(t0)
   # %var125 = getelementptr i32, ptr %var123, i32 %i.2_for.cond.3

   li t2, 4
   mul x3, x3, t2
   add x4, x3, x4
   mv x4, x4
   # store i32 0, ptr %var125

   li t0, 0
   sw t0, 0(x4)
   # %var127 = load ptr, ptr @col

   la t0, @col
   lw x4, 0(t0)
   # %var129 = getelementptr i32, ptr %var127, i32 %i.2_for.cond.3

   li t2, 4
   mul x3, x3, t2
   add x4, x3, x4
   mv x4, x4
   # store i32 0, ptr %var129

   li t0, 0
   sw t0, 0(x4)
   # br label %for.step.3

   # phi start 
   # phi end 
   j main_for.step.3

   .section .text
   .globl main_for.step.3
main_for.step.3:
   # %var132 = add i32 %i.2_for.cond.3, 1

   li t1, 1
   add x3, x3, t1
   # br label %for.cond.3

   # phi start 
   # phi end 
   j main_for.cond.3

   .section .text
   .globl main_for.back.3
main_for.back.3:
   # br label %for.cond.4

   # phi start 
   li x3, 0
   # phi end 
   j main_for.cond.4

   .section .text
   .globl main_for.cond.4
main_for.cond.4:
   # %var135 = icmp slt i32 %i.2_for.cond.4, 2

   li t1, 2
   sub t2, x3, t1
   sltz    x4, t2
   # br i1 %var135, label %for.body.4, label %for.back.4

   bne      x4, x0, .+8
   j main_for.back.4
   # phi start 
   # phi end 
   j main_for.body.4

   .section .text
   .globl main_for.body.4
main_for.body.4:
   # %var136 = load ptr, ptr @d

   la t0, @d
   lw x4, 0(t0)
   # %var138 = getelementptr ptr, ptr %var136, i32 %i.2_for.cond.4

   li t2, 4
   mul x3, x3, t2
   add x4, x3, x4
   mv x4, x4
   # %var141 = add i32 8, 8

   li t0, 8
   li t1, 8
   add x8, t0, t1
   # %var142 = sub i32 %var141, 1

   li t1, 1
   sub x8, x8, t1
   # %var140 = call ptr @__array.alloca(i32 4, i32 1, i32 1, i32 %var142)

   sw ra, 136(sp)
   sw a0, 40(sp)
   sw a1, 44(sp)
   sw a2, 48(sp)
   sw a3, 52(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   mv a3, x8
   li a1, 1
   li a0, 4
   li a2, 1
   call __array.alloca
   lw ra, 136(sp)
   mv x8, a0
   lw a0, 40(sp)
   lw a1, 44(sp)
   lw a2, 48(sp)
   lw a3, 52(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x3, 12(sp)
   lw x4, 16(sp)
   # store ptr %var140, ptr %var138

   sw x8, 0(x4)
   # br label %for.cond.5

   # phi start 
   li x4, 0
   # phi end 
   j main_for.cond.5

   .section .text
   .globl main_for.cond.5
main_for.cond.5:
   # %var145 = add i32 8, 8

   li t0, 8
   li t1, 8
   add x8, t0, t1
   # %var146 = sub i32 %var145, 1

   li t1, 1
   sub x8, x8, t1
   # %var147 = icmp slt i32 %j.2_for.cond.5, %var146

   sub t2, x4, x8
   sltz    x8, t2
   # br i1 %var147, label %for.body.5, label %for.back.5

   bne      x8, x0, .+8
   j main_for.back.5
   # phi start 
   # phi end 
   j main_for.body.5

   .section .text
   .globl main_for.body.5
main_for.body.5:
   # %var148 = load ptr, ptr @d

   la t0, @d
   lw x8, 0(t0)
   # %var150 = getelementptr ptr, ptr %var148, i32 %i.2_for.cond.4

   li t2, 4
   mul x3, x3, t2
   add x8, x3, x8
   mv x8, x8
   # %var151 = load ptr, ptr %var150

   mv t0, x8
   lw x8, 0(t0)
   # %var153 = getelementptr i32, ptr %var151, i32 %j.2_for.cond.5

   li t2, 4
   mul x4, x4, t2
   add x8, x4, x8
   mv x8, x8
   # store i32 0, ptr %var153

   li t0, 0
   sw t0, 0(x8)
   # br label %for.step.5

   # phi start 
   # phi end 
   j main_for.step.5

   .section .text
   .globl main_for.step.5
main_for.step.5:
   # %var156 = add i32 %j.2_for.cond.5, 1

   li t1, 1
   add x4, x4, t1
   # br label %for.cond.5

   # phi start 
   # phi end 
   j main_for.cond.5

   .section .text
   .globl main_for.back.5
main_for.back.5:
   # br label %for.step.4

   # phi start 
   # phi end 
   j main_for.step.4

   .section .text
   .globl main_for.step.4
main_for.step.4:
   # %var158 = add i32 %i.2_for.cond.4, 1

   li t1, 1
   add x3, x3, t1
   # br label %for.cond.4

   # phi start 
   # phi end 
   j main_for.cond.4

   .section .text
   .globl main_for.back.4
main_for.back.4:
   # call void @search(i32 0)

   sw ra, 136(sp)
   sw a0, 40(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   li a0, 0
   call search
   lw ra, 136(sp)
   sw a0, 132(sp)
   lw a0, 40(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   # ret i32 0

   li a0, 0
   addi sp, sp, 152
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   # phi start 
   # phi end 
   ret

   .section .data
   .globl @col
@col:
   .word 0

   .section .data
   .globl @d
@d:
   .word 0

   .section .data
   .globl @row
@row:
   .word 0

   .section .data
   .globl @N
@N:
   .word 8

   .section .rodata
@.str..1:
   .asciz " ."

   .section .rodata
@.str..2:
   .asciz ""

   .section .rodata
@.str..0:
   .asciz " O"

   .section .rodata
@.str..3:
   .asciz ""

