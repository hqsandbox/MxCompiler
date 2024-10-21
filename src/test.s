   .section .text
   .globl Queue_int..push
Queue_int..push:
   addi sp, sp, -148
   sw t0, 136(sp)
   sw t1, 140(sp)
   sw t2, 144(sp)
   mv x4, a0
   # phi start 
   # phi end 
   mv x3, a1

   .section .text
   .globl Queue_int..push_entry
Queue_int..push_entry:
   # %var1 = call i32 @Queue_int..size(ptr %_this)

   sw ra, 132(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   mv a0, x4
   call Queue_int..size
   lw ra, 132(sp)
   mv x8, a0
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x3, 12(sp)
   lw x4, 16(sp)
   # %var3 = getelementptr %class..Queue_int, ptr %_this, i32 0, i32 0

   mv t0, x4
   li t1, 0
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x9, t0
   # %var4 = load ptr, ptr %var3

   mv t0, x9
   lw x9, 0(t0)
   # %var5 = call i32 @array.size(ptr %var4)

   sw ra, 132(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x8, 32(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   mv a0, x9
   call array.size
   lw ra, 132(sp)
   mv x9, a0
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x8, 32(sp)
   lw x3, 12(sp)
   lw x4, 16(sp)
   # %var6 = sub i32 %var5, 1

   li t1, 1
   sub x9, x9, t1
   # %var7 = icmp eq i32 %var1, %var6

   sub t2, x8, x9
   seqz    x8, t2
   # br i1 %var7, label %if.then.0, label %if.else.0

   bne      x8, x0, .+8
   j Queue_int..push_if.else.0
   # phi start 
   # phi end 
   j Queue_int..push_if.then.0

   .section .text
   .globl Queue_int..push_if.then.0
Queue_int..push_if.then.0:
   # call void @Queue_int..doubleStorage(ptr %_this)

   sw ra, 132(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   mv a0, x4
   call Queue_int..doubleStorage
   lw ra, 132(sp)
   sw a0, 128(sp)
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
   j Queue_int..push_if.back.0

   .section .text
   .globl Queue_int..push_if.else.0
Queue_int..push_if.else.0:
   # br label %if.back.0

   # phi start 
   # phi end 
   j Queue_int..push_if.back.0

   .section .text
   .globl Queue_int..push_if.back.0
Queue_int..push_if.back.0:
   # %var11 = getelementptr %class..Queue_int, ptr %_this, i32 0, i32 0

   mv t0, x4
   li t1, 0
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x8, t0
   # %var12 = load ptr, ptr %var11

   mv t0, x8
   lw x8, 0(t0)
   # %var14 = getelementptr %class..Queue_int, ptr %_this, i32 0, i32 2

   mv t0, x4
   li t1, 2
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x9, t0
   # %var15 = load i32, ptr %var14

   mv t0, x9
   lw x9, 0(t0)
   # %var16 = getelementptr i32, ptr %var12, i32 %var15

   mv t0, x8
   mv t1, x9
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x8, t0
   # store i32 %v, ptr %var16

   sw x3, 0(x8)
   # %var20 = getelementptr %class..Queue_int, ptr %_this, i32 0, i32 2

   mv t0, x4
   li t1, 2
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x3, t0
   # %var23 = getelementptr %class..Queue_int, ptr %_this, i32 0, i32 2

   mv t0, x4
   li t1, 2
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x8, t0
   # %var24 = load i32, ptr %var23

   mv t0, x8
   lw x8, 0(t0)
   # %var25 = add i32 %var24, 1

   li t1, 1
   add x8, x8, t1
   # %var27 = getelementptr %class..Queue_int, ptr %_this, i32 0, i32 0

   mv t0, x4
   li t1, 0
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x4, t0
   # %var28 = load ptr, ptr %var27

   mv t0, x4
   lw x4, 0(t0)
   # %var29 = call i32 @array.size(ptr %var28)

   sw ra, 132(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x8, 32(sp)
   sw x3, 12(sp)
   mv a0, x4
   call array.size
   lw ra, 132(sp)
   mv x4, a0
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x8, 32(sp)
   lw x3, 12(sp)
   # %var30 = srem i32 %var25, %var29

   rem x4, x8, x4
   # store i32 %var30, ptr %var20

   sw x4, 0(x3)
   # ret void

   addi sp, sp, 148
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   # phi start 
   # phi end 
   ret

   .section .text
   .globl Queue_int..pop
Queue_int..pop:
   addi sp, sp, -148
   sw t0, 136(sp)
   sw t1, 140(sp)
   sw t2, 144(sp)
   # phi start 
   # phi end 
   mv x3, a0

   .section .text
   .globl Queue_int..pop_entry
Queue_int..pop_entry:
   # %var40 = call i32 @Queue_int..size(ptr %_this)

   sw ra, 132(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x3, 12(sp)
   mv a0, x3
   call Queue_int..size
   lw ra, 132(sp)
   mv x4, a0
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x3, 12(sp)
   # %var41 = icmp eq i32 %var40, 0

   li t1, 0
   sub t2, x4, t1
   seqz    x4, t2
   # br i1 %var41, label %if.then.1, label %if.else.1

   bne      x4, x0, .+8
   j Queue_int..pop_if.else.1
   # phi start 
   # phi end 
   j Queue_int..pop_if.then.1

   .section .text
   .globl Queue_int..pop_if.then.1
Queue_int..pop_if.then.1:
   # call void @println(ptr @.str..0)

   sw ra, 132(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x3, 12(sp)
   la a0, @.str..0
   call println
   lw ra, 132(sp)
   sw a0, 128(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x3, 12(sp)
   # br label %if.back.1

   # phi start 
   # phi end 
   j Queue_int..pop_if.back.1

   .section .text
   .globl Queue_int..pop_if.else.1
Queue_int..pop_if.else.1:
   # br label %if.back.1

   # phi start 
   # phi end 
   j Queue_int..pop_if.back.1

   .section .text
   .globl Queue_int..pop_if.back.1
Queue_int..pop_if.back.1:
   # %var44 = call i32 @Queue_int..top(ptr %_this)

   sw ra, 132(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x3, 12(sp)
   mv a0, x3
   call Queue_int..top
   lw ra, 132(sp)
   mv x4, a0
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x3, 12(sp)
   # %var46 = getelementptr %class..Queue_int, ptr %_this, i32 0, i32 1

   mv t0, x3
   li t1, 1
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x8, t0
   # %var49 = getelementptr %class..Queue_int, ptr %_this, i32 0, i32 1

   mv t0, x3
   li t1, 1
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x9, t0
   # %var50 = load i32, ptr %var49

   mv t0, x9
   lw x9, 0(t0)
   # %var51 = add i32 %var50, 1

   li t1, 1
   add x9, x9, t1
   # %var53 = getelementptr %class..Queue_int, ptr %_this, i32 0, i32 0

   mv t0, x3
   li t1, 0
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x3, t0
   # %var54 = load ptr, ptr %var53

   mv t0, x3
   lw x3, 0(t0)
   # %var55 = call i32 @array.size(ptr %var54)

   sw ra, 132(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x8, 32(sp)
   sw x9, 36(sp)
   sw x4, 16(sp)
   mv a0, x3
   call array.size
   lw ra, 132(sp)
   mv x3, a0
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x8, 32(sp)
   lw x9, 36(sp)
   lw x4, 16(sp)
   # %var56 = srem i32 %var51, %var55

   rem x3, x9, x3
   # store i32 %var56, ptr %var46

   sw x3, 0(x8)
   # ret i32 %var44

   mv a0, x4
   addi sp, sp, 148
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   # phi start 
   # phi end 
   ret

   .section .text
   .globl Queue_int..Queue_int
Queue_int..Queue_int:
   addi sp, sp, -144
   sw t0, 132(sp)
   sw t1, 136(sp)
   sw t2, 140(sp)
   # phi start 
   # phi end 
   mv x3, a0

   .section .text
   .globl Queue_int..Queue_int_entry
Queue_int..Queue_int_entry:
   # %var127 = getelementptr %class..Queue_int, ptr %_this, i32 0, i32 1

   mv t0, x3
   li t1, 1
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x4, t0
   # store i32 0, ptr %var127

   li t0, 0
   sw t0, 0(x4)
   # %var130 = getelementptr %class..Queue_int, ptr %_this, i32 0, i32 2

   mv t0, x3
   li t1, 2
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x4, t0
   # store i32 0, ptr %var130

   li t0, 0
   sw t0, 0(x4)
   # %var133 = getelementptr %class..Queue_int, ptr %_this, i32 0, i32 0

   mv t0, x3
   li t1, 0
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x3, t0
   # %var135 = call ptr @__array.alloca(i32 4, i32 1, i32 1, i32 16)

   sw ra, 128(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x3, 12(sp)
   li a2, 1
   li a3, 16
   li a1, 1
   li a0, 4
   call __array.alloca
   lw ra, 128(sp)
   mv x4, a0
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x3, 12(sp)
   # store ptr %var135, ptr %var133

   sw x4, 0(x3)
   # ret void

   addi sp, sp, 144
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   # phi start 
   # phi end 
   ret

   .section .text
   .globl Queue_int..top
Queue_int..top:
   addi sp, sp, -144
   sw t0, 132(sp)
   sw t1, 136(sp)
   sw t2, 140(sp)
   # phi start 
   # phi end 
   mv x3, a0

   .section .text
   .globl Queue_int..top_entry
Queue_int..top_entry:
   # %var32 = getelementptr %class..Queue_int, ptr %_this, i32 0, i32 0

   mv t0, x3
   li t1, 0
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x4, t0
   # %var33 = load ptr, ptr %var32

   mv t0, x4
   lw x4, 0(t0)
   # %var35 = getelementptr %class..Queue_int, ptr %_this, i32 0, i32 1

   mv t0, x3
   li t1, 1
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x3, t0
   # %var36 = load i32, ptr %var35

   mv t0, x3
   lw x3, 0(t0)
   # %var37 = getelementptr i32, ptr %var33, i32 %var36

   mv t0, x4
   mv t1, x3
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x3, t0
   # %var38 = load i32, ptr %var37

   mv t0, x3
   lw x3, 0(t0)
   # ret i32 %var38

   mv a0, x3
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
   .globl Queue_int..size
Queue_int..size:
   addi sp, sp, -144
   sw t0, 132(sp)
   sw t1, 136(sp)
   sw t2, 140(sp)
   # phi start 
   # phi end 
   mv x3, a0

   .section .text
   .globl Queue_int..size_entry
Queue_int..size_entry:
   # %var59 = getelementptr %class..Queue_int, ptr %_this, i32 0, i32 2

   mv t0, x3
   li t1, 2
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x4, t0
   # %var60 = load i32, ptr %var59

   mv t0, x4
   lw x4, 0(t0)
   # %var62 = getelementptr %class..Queue_int, ptr %_this, i32 0, i32 0

   mv t0, x3
   li t1, 0
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x8, t0
   # %var63 = load ptr, ptr %var62

   mv t0, x8
   lw x8, 0(t0)
   # %var64 = call i32 @array.size(ptr %var63)

   sw ra, 128(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   mv a0, x8
   call array.size
   lw ra, 128(sp)
   mv x8, a0
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x3, 12(sp)
   lw x4, 16(sp)
   # %var65 = add i32 %var60, %var64

   add x4, x4, x8
   # %var67 = getelementptr %class..Queue_int, ptr %_this, i32 0, i32 1

   mv t0, x3
   li t1, 1
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x8, t0
   # %var68 = load i32, ptr %var67

   mv t0, x8
   lw x8, 0(t0)
   # %var69 = sub i32 %var65, %var68

   sub x4, x4, x8
   # %var71 = getelementptr %class..Queue_int, ptr %_this, i32 0, i32 0

   mv t0, x3
   li t1, 0
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x3, t0
   # %var72 = load ptr, ptr %var71

   mv t0, x3
   lw x3, 0(t0)
   # %var73 = call i32 @array.size(ptr %var72)

   sw ra, 128(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x4, 16(sp)
   mv a0, x3
   call array.size
   lw ra, 128(sp)
   mv x3, a0
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x4, 16(sp)
   # %var74 = srem i32 %var69, %var73

   rem x3, x4, x3
   # ret i32 %var74

   mv a0, x3
   addi sp, sp, 144
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   # phi start 
   # phi end 
   ret

   .section .text
   .globl Queue_int..doubleStorage
Queue_int..doubleStorage:
   addi sp, sp, -144
   sw t0, 132(sp)
   sw t1, 136(sp)
   sw t2, 140(sp)
   # phi start 
   # phi end 
   mv x3, a0

   .section .text
   .globl Queue_int..doubleStorage_entry
Queue_int..doubleStorage_entry:
   # %var76 = getelementptr %class..Queue_int, ptr %_this, i32 0, i32 0

   mv t0, x3
   li t1, 0
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x4, t0
   # %var77 = load ptr, ptr %var76

   mv t0, x4
   lw x4, 0(t0)
   # %var79 = getelementptr %class..Queue_int, ptr %_this, i32 0, i32 1

   mv t0, x3
   li t1, 1
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x8, t0
   # %var80 = load i32, ptr %var79

   mv t0, x8
   lw x8, 0(t0)
   # %var82 = getelementptr %class..Queue_int, ptr %_this, i32 0, i32 2

   mv t0, x3
   li t1, 2
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv x9, t0
   # %var83 = load i32, ptr %var82

   mv t0, x9
   lw x9, 0(t0)
   # %var85 = getelementptr %class..Queue_int, ptr %_this, i32 0, i32 0

   mv t0, x3
   li t1, 0
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv a0, t0
   # %var89 = call i32 @array.size(ptr %var77)

   sw ra, 128(sp)
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
   mv a0, x4
   call array.size
   lw ra, 128(sp)
   mv a1, a0
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
   # %var90 = mul i32 %var89, 2

   li t1, 2
   mul a1, a1, t1
   # %var87 = call ptr @__array.alloca(i32 4, i32 1, i32 1, i32 %var90)

   sw ra, 128(sp)
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
   li a2, 1
   mv a3, a1
   li a1, 1
   call __array.alloca
   lw ra, 128(sp)
   mv a1, a0
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
   # store ptr %var87, ptr %var85

   sw a1, 0(a0)
   # %var92 = getelementptr %class..Queue_int, ptr %_this, i32 0, i32 1

   mv t0, x3
   li t1, 1
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv a0, t0
   # store i32 0, ptr %var92

   li t0, 0
   sw t0, 0(a0)
   # %var95 = getelementptr %class..Queue_int, ptr %_this, i32 0, i32 2

   mv t0, x3
   li t1, 2
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv a0, t0
   # store i32 0, ptr %var95

   li t0, 0
   sw t0, 0(a0)
   # br label %while.cond.0

   # phi start 
   # phi end 
   j Queue_int..doubleStorage_while.cond.0

   .section .text
   .globl Queue_int..doubleStorage_while.cond.0
Queue_int..doubleStorage_while.cond.0:
   # %var103 = icmp ne i32 %i.1_while.cond.0, %var83

   sub t2, x8, x9
   snez    a0, t2
   # br i1 %var103, label %while.body.0, label %while.back.0

   bne      a0, x0, .+8
   j Queue_int..doubleStorage_while.back.0
   # phi start 
   # phi end 
   j Queue_int..doubleStorage_while.body.0

   .section .text
   .globl Queue_int..doubleStorage_while.body.0
Queue_int..doubleStorage_while.body.0:
   # %var105 = getelementptr %class..Queue_int, ptr %_this, i32 0, i32 0

   mv t0, x3
   li t1, 0
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv a0, t0
   # %var106 = load ptr, ptr %var105

   mv t0, a0
   lw a0, 0(t0)
   # %var108 = getelementptr %class..Queue_int, ptr %_this, i32 0, i32 2

   mv t0, x3
   li t1, 2
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv a1, t0
   # %var109 = load i32, ptr %var108

   mv t0, a1
   lw a1, 0(t0)
   # %var110 = getelementptr i32, ptr %var106, i32 %var109

   mv t0, a0
   mv t1, a1
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv a0, t0
   # %var114 = getelementptr i32, ptr %var77, i32 %i.1_while.cond.0

   mv t0, x4
   mv t1, x8
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv a1, t0
   # %var115 = load i32, ptr %var114

   mv t0, a1
   lw a1, 0(t0)
   # store i32 %var115, ptr %var110

   sw a1, 0(a0)
   # %var117 = getelementptr %class..Queue_int, ptr %_this, i32 0, i32 2

   mv t0, x3
   li t1, 2
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   mv a0, t0
   # %var118 = load i32, ptr %var117

   mv t0, a0
   lw a1, 0(t0)
   # %var119 = add i32 %var118, 1

   li t1, 1
   add a1, a1, t1
   # store i32 %var119, ptr %var117

   sw a1, 0(a0)
   # %var122 = add i32 %i.1_while.cond.0, 1

   li t1, 1
   add x8, x8, t1
   # %var124 = call i32 @array.size(ptr %var77)

   sw ra, 128(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x8, 32(sp)
   sw x9, 36(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   mv a0, x4
   call array.size
   lw ra, 128(sp)
   mv a0, a0
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x8, 32(sp)
   lw x9, 36(sp)
   lw x3, 12(sp)
   lw x4, 16(sp)
   # %var125 = srem i32 %var122, %var124

   rem x8, x8, a0
   # br label %while.cond.0

   # phi start 
   # phi end 
   j Queue_int..doubleStorage_while.cond.0

   .section .text
   .globl Queue_int..doubleStorage_while.back.0
Queue_int..doubleStorage_while.back.0:
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
   # %var137 = call ptr @_malloc(i32 12)

   sw ra, 160(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x3, 12(sp)
   li a0, 12
   call _malloc
   lw ra, 160(sp)
   mv x4, a0
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x3, 12(sp)
   # call void @Queue_int..Queue_int(ptr %var137)

   sw ra, 160(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   mv a0, x4
   call Queue_int..Queue_int
   lw ra, 160(sp)
   sw a0, 132(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x3, 12(sp)
   lw x4, 16(sp)
   # br label %for.cond.0

   # phi start 
   li x8, 0
   # phi end 
   j main_for.cond.0

   .section .text
   .globl main_for.cond.0
main_for.cond.0:
   # %var142 = icmp slt i32 %i.2_for.cond.0, 100

   li t1, 100
   sub t2, x8, t1
   sltz    x9, t2
   # br i1 %var142, label %for.body.0, label %for.back.0

   bne      x9, x0, .+8
   j main_for.back.0
   # phi start 
   # phi end 
   j main_for.body.0

   .section .text
   .globl main_for.body.0
main_for.body.0:
   # call void @Queue_int..push(ptr %var137, i32 %i.2_for.cond.0)

   sw ra, 160(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x8, 32(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   mv a1, x8
   mv a0, x4
   call Queue_int..push
   lw ra, 160(sp)
   sw a0, 136(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x8, 32(sp)
   lw x3, 12(sp)
   lw x4, 16(sp)
   # br label %for.step.0

   # phi start 
   # phi end 
   j main_for.step.0

   .section .text
   .globl main_for.step.0
main_for.step.0:
   # %var146 = add i32 %i.2_for.cond.0, 1

   li t1, 1
   add x8, x8, t1
   # br label %for.cond.0

   # phi start 
   # phi end 
   j main_for.cond.0

   .section .text
   .globl main_for.back.0
main_for.back.0:
   # %var148 = call i32 @Queue_int..size(ptr %var137)

   sw ra, 160(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   mv a0, x4
   call Queue_int..size
   lw ra, 160(sp)
   mv x8, a0
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x3, 12(sp)
   lw x4, 16(sp)
   # %var150 = icmp ne i32 %var148, 100

   li t1, 100
   sub t2, x8, t1
   snez    x8, t2
   # br i1 %var150, label %if.then.2, label %if.else.2

   bne      x8, x0, .+8
   j main_if.else.2
   # phi start 
   # phi end 
   j main_if.then.2

   .section .text
   .globl main_if.then.2
main_if.then.2:
   # call void @println(ptr @.str..1)

   sw ra, 160(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   la a0, @.str..1
   call println
   lw ra, 160(sp)
   sw a0, 140(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   # ret i32 1

   li a0, 1
   addi sp, sp, 176
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   # phi start 
   # phi end 
   ret

   .section .text
   .globl main_if.else.2
main_if.else.2:
   # br label %if.back.2

   # phi start 
   # phi end 
   j main_if.back.2

   .section .text
   .globl main_if.back.2
main_if.back.2:
   # br label %for.cond.1

   # phi start 
   li x8, 0
   # phi end 
   j main_for.cond.1

   .section .text
   .globl main_for.cond.1
main_for.cond.1:
   # %var155 = icmp slt i32 %i.2_for.cond.1, 100

   li t1, 100
   sub t2, x8, t1
   sltz    x9, t2
   # br i1 %var155, label %for.body.1, label %for.back.1

   bne      x9, x0, .+8
   j main_for.back.1
   # phi start 
   # phi end 
   j main_for.body.1

   .section .text
   .globl main_for.body.1
main_for.body.1:
   # %var157 = call i32 @Queue_int..top(ptr %var137)

   sw ra, 160(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x8, 32(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   mv a0, x4
   call Queue_int..top
   lw ra, 160(sp)
   mv x9, a0
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x8, 32(sp)
   lw x3, 12(sp)
   lw x4, 16(sp)
   # %var160 = icmp ne i32 %var157, %i.2_for.cond.1

   sub t2, x9, x8
   snez    x9, t2
   # br i1 %var160, label %if.then.3, label %if.else.3

   bne      x9, x0, .+8
   j main_if.else.3
   # phi start 
   # phi end 
   j main_if.then.3

   .section .text
   .globl main_if.then.3
main_if.then.3:
   # call void @println(ptr @.str..2)

   sw ra, 160(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   la a0, @.str..2
   call println
   lw ra, 160(sp)
   sw a0, 144(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   # ret i32 1

   li a0, 1
   addi sp, sp, 176
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   # phi start 
   # phi end 
   ret

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
   # %var163 = call i32 @Queue_int..pop(ptr %var137)

   sw ra, 160(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x8, 32(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   mv a0, x4
   call Queue_int..pop
   lw ra, 160(sp)
   mv x9, a0
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x8, 32(sp)
   lw x3, 12(sp)
   lw x4, 16(sp)
   # %var165 = icmp ne i32 %var163, %i.2_for.cond.1

   sub t2, x9, x8
   snez    x9, t2
   # br i1 %var165, label %if.then.4, label %if.else.4

   bne      x9, x0, .+8
   j main_if.else.4
   # phi start 
   # phi end 
   j main_if.then.4

   .section .text
   .globl main_if.then.4
main_if.then.4:
   # call void @println(ptr @.str..3)

   sw ra, 160(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   la a0, @.str..3
   call println
   lw ra, 160(sp)
   sw a0, 148(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   # ret i32 1

   li a0, 1
   addi sp, sp, 176
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   # phi start 
   # phi end 
   ret

   .section .text
   .globl main_if.else.4
main_if.else.4:
   # br label %if.back.4

   # phi start 
   # phi end 
   j main_if.back.4

   .section .text
   .globl main_if.back.4
main_if.back.4:
   # %var168 = call i32 @Queue_int..size(ptr %var137)

   sw ra, 160(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x8, 32(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   mv a0, x4
   call Queue_int..size
   lw ra, 160(sp)
   mv x9, a0
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x8, 32(sp)
   lw x3, 12(sp)
   lw x4, 16(sp)
   # %var171 = sub i32 100, %i.2_for.cond.1

   li t0, 100
   sub a0, t0, x8
   # %var172 = sub i32 %var171, 1

   li t1, 1
   sub a0, a0, t1
   # %var173 = icmp ne i32 %var168, %var172

   sub t2, x9, a0
   snez    x9, t2
   # br i1 %var173, label %if.then.5, label %if.else.5

   bne      x9, x0, .+8
   j main_if.else.5
   # phi start 
   # phi end 
   j main_if.then.5

   .section .text
   .globl main_if.then.5
main_if.then.5:
   # call void @println(ptr @.str..4)

   sw ra, 160(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   la a0, @.str..4
   call println
   lw ra, 160(sp)
   sw a0, 152(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   # ret i32 1

   li a0, 1
   addi sp, sp, 176
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   # phi start 
   # phi end 
   ret

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
   # br label %for.step.1

   # phi start 
   # phi end 
   j main_for.step.1

   .section .text
   .globl main_for.step.1
main_for.step.1:
   # %var176 = add i32 %i.2_for.cond.1, 1

   li t1, 1
   add x8, x8, t1
   # br label %for.cond.1

   # phi start 
   # phi end 
   j main_for.cond.1

   .section .text
   .globl main_for.back.1
main_for.back.1:
   # call void @println(ptr @.str..5)

   sw ra, 160(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   la a0, @.str..5
   call println
   lw ra, 160(sp)
   sw a0, 156(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   # ret i32 0

   li a0, 0
   addi sp, sp, 176
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   # phi start 
   # phi end 
   ret

   .section .rodata
@.str..1:
   .asciz "q.size() != N after pushes"

   .section .rodata
@.str..2:
   .asciz "Head != i"

   .section .rodata
@.str..0:
   .asciz "Warning: Queue_int::pop: empty queue"

   .section .rodata
@.str..5:
   .asciz "Passed tests."

   .section .rodata
@.str..3:
   .asciz "Failed: q.pop() != i"

   .section .rodata
@.str..4:
   .asciz "q.size() != N - i - 1"

