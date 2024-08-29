   .section .text
   .globl Queue_int..push
Queue_int..push:
   addi sp, sp, -156
   sw t0, 144(sp)
   sw t1, 148(sp)
   sw t2, 152(sp)

   .section .text
   .globl Queue_int..push_entry
Queue_int..push_entry:
   # %_this.1 = alloca ptr

   addi t0, sp, 4
   sw t0, 0(sp)
   # store ptr %_this, ptr %_this.1

   mv t0, a0
   lw t1, 0(sp)
   sw t0, 0(t1)
   # %v.1 = alloca i32

   addi t0, sp, 12
   sw t0, 8(sp)
   # store i32 %v, ptr %v.1

   mv t0, a1
   lw t1, 8(sp)
   sw t0, 0(t1)
   # %var0 = load ptr, ptr %_this.1

   lw t0, 0(sp)
   lw t1, 0(t0)
   sw t1, 16(sp)
   # %var1 = call i32 @Queue_int..size(ptr %var0)

   sw ra, 140(sp)
   lw a0, 16(sp)
   call Queue_int..size
   lw ra, 140(sp)
   sw a0, 20(sp)
   # %var2 = load ptr, ptr %_this.1

   lw t0, 0(sp)
   lw t1, 0(t0)
   sw t1, 24(sp)
   # %var3 = getelementptr %class..Queue_int, ptr %var2, i32 0, i32 0

   lw t0, 24(sp)
   li t1, 0
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 28(sp)
   # %var4 = load ptr, ptr %var3

   lw t0, 28(sp)
   lw t1, 0(t0)
   sw t1, 32(sp)
   # %var5 = call i32 @array.size(ptr %var4)

   sw ra, 140(sp)
   lw a0, 32(sp)
   call array.size
   lw ra, 140(sp)
   sw a0, 36(sp)
   # %var6 = sub i32 %var5, 1

   lw t0, 36(sp)
   li t1, 1
   sub t2, t0, t1
   sw t2, 40(sp)
   # %var7 = icmp eq i32 %var1, %var6

   lw t0, 20(sp)
   lw t1, 40(sp)
   sub t2, t0, t1
   seqz    t0, t2
   sw t0, 44(sp)
   # br i1 %var7, label %if.then.0, label %if.else.0

   lw t0, 44(sp)
   bne      t0, x0, .+8
   j Queue_int..push_if.else.0
   j Queue_int..push_if.then.0

   .section .text
   .globl Queue_int..push_if.then.0
Queue_int..push_if.then.0:
   # %var8 = load ptr, ptr %_this.1

   lw t0, 0(sp)
   lw t1, 0(t0)
   sw t1, 48(sp)
   # call void @Queue_int..doubleStorage(ptr %var8)

   sw ra, 140(sp)
   lw a0, 48(sp)
   call Queue_int..doubleStorage
   lw ra, 140(sp)
   sw a0, 52(sp)
   # br label %if.back.0

   j Queue_int..push_if.back.0

   .section .text
   .globl Queue_int..push_if.else.0
Queue_int..push_if.else.0:
   # br label %if.back.0

   j Queue_int..push_if.back.0

   .section .text
   .globl Queue_int..push_if.back.0
Queue_int..push_if.back.0:
   # %var10 = load ptr, ptr %_this.1

   lw t0, 0(sp)
   lw t1, 0(t0)
   sw t1, 56(sp)
   # %var11 = getelementptr %class..Queue_int, ptr %var10, i32 0, i32 0

   lw t0, 56(sp)
   li t1, 0
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 60(sp)
   # %var12 = load ptr, ptr %var11

   lw t0, 60(sp)
   lw t1, 0(t0)
   sw t1, 64(sp)
   # %var13 = load ptr, ptr %_this.1

   lw t0, 0(sp)
   lw t1, 0(t0)
   sw t1, 68(sp)
   # %var14 = getelementptr %class..Queue_int, ptr %var13, i32 0, i32 2

   lw t0, 68(sp)
   li t1, 2
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 72(sp)
   # %var15 = load i32, ptr %var14

   lw t0, 72(sp)
   lw t1, 0(t0)
   sw t1, 76(sp)
   # %var16 = getelementptr i32, ptr %var12, i32 %var15

   lw t0, 64(sp)
   lw t1, 76(sp)
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 80(sp)
   # %var17 = load i32, ptr %var16

   lw t0, 80(sp)
   lw t1, 0(t0)
   sw t1, 84(sp)
   # %var18 = load i32, ptr %v.1

   lw t0, 8(sp)
   lw t1, 0(t0)
   sw t1, 88(sp)
   # store i32 %var18, ptr %var16

   lw t0, 88(sp)
   lw t1, 80(sp)
   sw t0, 0(t1)
   # %var19 = load ptr, ptr %_this.1

   lw t0, 0(sp)
   lw t1, 0(t0)
   sw t1, 92(sp)
   # %var20 = getelementptr %class..Queue_int, ptr %var19, i32 0, i32 2

   lw t0, 92(sp)
   li t1, 2
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 96(sp)
   # %var21 = load i32, ptr %var20

   lw t0, 96(sp)
   lw t1, 0(t0)
   sw t1, 100(sp)
   # %var22 = load ptr, ptr %_this.1

   lw t0, 0(sp)
   lw t1, 0(t0)
   sw t1, 104(sp)
   # %var23 = getelementptr %class..Queue_int, ptr %var22, i32 0, i32 2

   lw t0, 104(sp)
   li t1, 2
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 108(sp)
   # %var24 = load i32, ptr %var23

   lw t0, 108(sp)
   lw t1, 0(t0)
   sw t1, 112(sp)
   # %var25 = add i32 %var24, 1

   lw t0, 112(sp)
   li t1, 1
   add t2, t0, t1
   sw t2, 116(sp)
   # %var26 = load ptr, ptr %_this.1

   lw t0, 0(sp)
   lw t1, 0(t0)
   sw t1, 120(sp)
   # %var27 = getelementptr %class..Queue_int, ptr %var26, i32 0, i32 0

   lw t0, 120(sp)
   li t1, 0
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 124(sp)
   # %var28 = load ptr, ptr %var27

   lw t0, 124(sp)
   lw t1, 0(t0)
   sw t1, 128(sp)
   # %var29 = call i32 @array.size(ptr %var28)

   sw ra, 140(sp)
   lw a0, 128(sp)
   call array.size
   lw ra, 140(sp)
   sw a0, 132(sp)
   # %var30 = srem i32 %var25, %var29

   lw t0, 116(sp)
   lw t1, 132(sp)
   rem t2, t0, t1
   sw t2, 136(sp)
   # store i32 %var30, ptr %var20

   lw t0, 136(sp)
   lw t1, 96(sp)
   sw t0, 0(t1)
   # ret void

   addi sp, sp, 156
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   ret

   .section .text
   .globl Queue_int..pop
Queue_int..pop:
   addi sp, sp, -108
   sw t0, 96(sp)
   sw t1, 100(sp)
   sw t2, 104(sp)

   .section .text
   .globl Queue_int..pop_entry
Queue_int..pop_entry:
   # %_this.3 = alloca ptr

   addi t0, sp, 4
   sw t0, 0(sp)
   # store ptr %_this, ptr %_this.3

   mv t0, a0
   lw t1, 0(sp)
   sw t0, 0(t1)
   # %var39 = load ptr, ptr %_this.3

   lw t0, 0(sp)
   lw t1, 0(t0)
   sw t1, 8(sp)
   # %var40 = call i32 @Queue_int..size(ptr %var39)

   sw ra, 92(sp)
   lw a0, 8(sp)
   call Queue_int..size
   lw ra, 92(sp)
   sw a0, 12(sp)
   # %var41 = icmp eq i32 %var40, 0

   lw t0, 12(sp)
   li t1, 0
   sub t2, t0, t1
   seqz    t0, t2
   sw t0, 16(sp)
   # br i1 %var41, label %if.then.1, label %if.else.1

   lw t0, 16(sp)
   bne      t0, x0, .+8
   j Queue_int..pop_if.else.1
   j Queue_int..pop_if.then.1

   .section .text
   .globl Queue_int..pop_if.then.1
Queue_int..pop_if.then.1:
   # call void @println(ptr @.str..0)

   sw ra, 92(sp)
   la a0, @.str..0
   call println
   lw ra, 92(sp)
   sw a0, 20(sp)
   # br label %if.back.1

   j Queue_int..pop_if.back.1

   .section .text
   .globl Queue_int..pop_if.else.1
Queue_int..pop_if.else.1:
   # br label %if.back.1

   j Queue_int..pop_if.back.1

   .section .text
   .globl Queue_int..pop_if.back.1
Queue_int..pop_if.back.1:
   # %res.1 = alloca i32

   addi t0, sp, 28
   sw t0, 24(sp)
   # %var43 = load ptr, ptr %_this.3

   lw t0, 0(sp)
   lw t1, 0(t0)
   sw t1, 32(sp)
   # %var44 = call i32 @Queue_int..top(ptr %var43)

   sw ra, 92(sp)
   lw a0, 32(sp)
   call Queue_int..top
   lw ra, 92(sp)
   sw a0, 36(sp)
   # store i32 %var44, ptr %res.1

   lw t0, 36(sp)
   lw t1, 24(sp)
   sw t0, 0(t1)
   # %var45 = load ptr, ptr %_this.3

   lw t0, 0(sp)
   lw t1, 0(t0)
   sw t1, 40(sp)
   # %var46 = getelementptr %class..Queue_int, ptr %var45, i32 0, i32 1

   lw t0, 40(sp)
   li t1, 1
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 44(sp)
   # %var47 = load i32, ptr %var46

   lw t0, 44(sp)
   lw t1, 0(t0)
   sw t1, 48(sp)
   # %var48 = load ptr, ptr %_this.3

   lw t0, 0(sp)
   lw t1, 0(t0)
   sw t1, 52(sp)
   # %var49 = getelementptr %class..Queue_int, ptr %var48, i32 0, i32 1

   lw t0, 52(sp)
   li t1, 1
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 56(sp)
   # %var50 = load i32, ptr %var49

   lw t0, 56(sp)
   lw t1, 0(t0)
   sw t1, 60(sp)
   # %var51 = add i32 %var50, 1

   lw t0, 60(sp)
   li t1, 1
   add t2, t0, t1
   sw t2, 64(sp)
   # %var52 = load ptr, ptr %_this.3

   lw t0, 0(sp)
   lw t1, 0(t0)
   sw t1, 68(sp)
   # %var53 = getelementptr %class..Queue_int, ptr %var52, i32 0, i32 0

   lw t0, 68(sp)
   li t1, 0
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 72(sp)
   # %var54 = load ptr, ptr %var53

   lw t0, 72(sp)
   lw t1, 0(t0)
   sw t1, 76(sp)
   # %var55 = call i32 @array.size(ptr %var54)

   sw ra, 92(sp)
   lw a0, 76(sp)
   call array.size
   lw ra, 92(sp)
   sw a0, 80(sp)
   # %var56 = srem i32 %var51, %var55

   lw t0, 64(sp)
   lw t1, 80(sp)
   rem t2, t0, t1
   sw t2, 84(sp)
   # store i32 %var56, ptr %var46

   lw t0, 84(sp)
   lw t1, 44(sp)
   sw t0, 0(t1)
   # %var57 = load i32, ptr %res.1

   lw t0, 24(sp)
   lw t1, 0(t0)
   sw t1, 88(sp)
   # ret i32 %var57

   lw a0, 88(sp)
   addi sp, sp, 108
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   ret

   .section .text
   .globl Queue_int..Queue_int
Queue_int..Queue_int:
   addi sp, sp, -64
   sw t0, 52(sp)
   sw t1, 56(sp)
   sw t2, 60(sp)

   .section .text
   .globl Queue_int..Queue_int_entry
Queue_int..Queue_int_entry:
   # %_this.6 = alloca ptr

   addi t0, sp, 4
   sw t0, 0(sp)
   # store ptr %_this, ptr %_this.6

   mv t0, a0
   lw t1, 0(sp)
   sw t0, 0(t1)
   # %var126 = load ptr, ptr %_this.6

   lw t0, 0(sp)
   lw t1, 0(t0)
   sw t1, 8(sp)
   # %var127 = getelementptr %class..Queue_int, ptr %var126, i32 0, i32 1

   lw t0, 8(sp)
   li t1, 1
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 12(sp)
   # %var128 = load i32, ptr %var127

   lw t0, 12(sp)
   lw t1, 0(t0)
   sw t1, 16(sp)
   # store i32 0, ptr %var127

   li t0, 0
   lw t1, 12(sp)
   sw t0, 0(t1)
   # %var129 = load ptr, ptr %_this.6

   lw t0, 0(sp)
   lw t1, 0(t0)
   sw t1, 20(sp)
   # %var130 = getelementptr %class..Queue_int, ptr %var129, i32 0, i32 2

   lw t0, 20(sp)
   li t1, 2
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 24(sp)
   # %var131 = load i32, ptr %var130

   lw t0, 24(sp)
   lw t1, 0(t0)
   sw t1, 28(sp)
   # store i32 0, ptr %var130

   li t0, 0
   lw t1, 24(sp)
   sw t0, 0(t1)
   # %var132 = load ptr, ptr %_this.6

   lw t0, 0(sp)
   lw t1, 0(t0)
   sw t1, 32(sp)
   # %var133 = getelementptr %class..Queue_int, ptr %var132, i32 0, i32 0

   lw t0, 32(sp)
   li t1, 0
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 36(sp)
   # %var134 = load ptr, ptr %var133

   lw t0, 36(sp)
   lw t1, 0(t0)
   sw t1, 40(sp)
   # %var135 = call ptr @__array.alloca(i32 4, i32 1, i32 1, i32 16)

   sw ra, 48(sp)
   li a0, 4
   li a1, 1
   li a2, 1
   li a3, 16
   call __array.alloca
   lw ra, 48(sp)
   sw a0, 44(sp)
   # store ptr %var135, ptr %var133

   lw t0, 44(sp)
   lw t1, 36(sp)
   sw t0, 0(t1)
   # ret void

   addi sp, sp, 64
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   ret

   .section .text
   .globl Queue_int..top
Queue_int..top:
   addi sp, sp, -56
   sw t0, 44(sp)
   sw t1, 48(sp)
   sw t2, 52(sp)

   .section .text
   .globl Queue_int..top_entry
Queue_int..top_entry:
   # %_this.2 = alloca ptr

   addi t0, sp, 4
   sw t0, 0(sp)
   # store ptr %_this, ptr %_this.2

   mv t0, a0
   lw t1, 0(sp)
   sw t0, 0(t1)
   # %var31 = load ptr, ptr %_this.2

   lw t0, 0(sp)
   lw t1, 0(t0)
   sw t1, 8(sp)
   # %var32 = getelementptr %class..Queue_int, ptr %var31, i32 0, i32 0

   lw t0, 8(sp)
   li t1, 0
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 12(sp)
   # %var33 = load ptr, ptr %var32

   lw t0, 12(sp)
   lw t1, 0(t0)
   sw t1, 16(sp)
   # %var34 = load ptr, ptr %_this.2

   lw t0, 0(sp)
   lw t1, 0(t0)
   sw t1, 20(sp)
   # %var35 = getelementptr %class..Queue_int, ptr %var34, i32 0, i32 1

   lw t0, 20(sp)
   li t1, 1
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 24(sp)
   # %var36 = load i32, ptr %var35

   lw t0, 24(sp)
   lw t1, 0(t0)
   sw t1, 28(sp)
   # %var37 = getelementptr i32, ptr %var33, i32 %var36

   lw t0, 16(sp)
   lw t1, 28(sp)
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 32(sp)
   # %var38 = load i32, ptr %var37

   lw t0, 32(sp)
   lw t1, 0(t0)
   sw t1, 36(sp)
   # ret i32 %var38

   lw a0, 36(sp)
   addi sp, sp, 56
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
   .globl Queue_int..size
Queue_int..size:
   addi sp, sp, -92
   sw t0, 80(sp)
   sw t1, 84(sp)
   sw t2, 88(sp)

   .section .text
   .globl Queue_int..size_entry
Queue_int..size_entry:
   # %_this.4 = alloca ptr

   addi t0, sp, 4
   sw t0, 0(sp)
   # store ptr %_this, ptr %_this.4

   mv t0, a0
   lw t1, 0(sp)
   sw t0, 0(t1)
   # %var58 = load ptr, ptr %_this.4

   lw t0, 0(sp)
   lw t1, 0(t0)
   sw t1, 8(sp)
   # %var59 = getelementptr %class..Queue_int, ptr %var58, i32 0, i32 2

   lw t0, 8(sp)
   li t1, 2
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 12(sp)
   # %var60 = load i32, ptr %var59

   lw t0, 12(sp)
   lw t1, 0(t0)
   sw t1, 16(sp)
   # %var61 = load ptr, ptr %_this.4

   lw t0, 0(sp)
   lw t1, 0(t0)
   sw t1, 20(sp)
   # %var62 = getelementptr %class..Queue_int, ptr %var61, i32 0, i32 0

   lw t0, 20(sp)
   li t1, 0
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 24(sp)
   # %var63 = load ptr, ptr %var62

   lw t0, 24(sp)
   lw t1, 0(t0)
   sw t1, 28(sp)
   # %var64 = call i32 @array.size(ptr %var63)

   sw ra, 76(sp)
   lw a0, 28(sp)
   call array.size
   lw ra, 76(sp)
   sw a0, 32(sp)
   # %var65 = add i32 %var60, %var64

   lw t0, 16(sp)
   lw t1, 32(sp)
   add t2, t0, t1
   sw t2, 36(sp)
   # %var66 = load ptr, ptr %_this.4

   lw t0, 0(sp)
   lw t1, 0(t0)
   sw t1, 40(sp)
   # %var67 = getelementptr %class..Queue_int, ptr %var66, i32 0, i32 1

   lw t0, 40(sp)
   li t1, 1
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 44(sp)
   # %var68 = load i32, ptr %var67

   lw t0, 44(sp)
   lw t1, 0(t0)
   sw t1, 48(sp)
   # %var69 = sub i32 %var65, %var68

   lw t0, 36(sp)
   lw t1, 48(sp)
   sub t2, t0, t1
   sw t2, 52(sp)
   # %var70 = load ptr, ptr %_this.4

   lw t0, 0(sp)
   lw t1, 0(t0)
   sw t1, 56(sp)
   # %var71 = getelementptr %class..Queue_int, ptr %var70, i32 0, i32 0

   lw t0, 56(sp)
   li t1, 0
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 60(sp)
   # %var72 = load ptr, ptr %var71

   lw t0, 60(sp)
   lw t1, 0(t0)
   sw t1, 64(sp)
   # %var73 = call i32 @array.size(ptr %var72)

   sw ra, 76(sp)
   lw a0, 64(sp)
   call array.size
   lw ra, 76(sp)
   sw a0, 68(sp)
   # %var74 = srem i32 %var69, %var73

   lw t0, 52(sp)
   lw t1, 68(sp)
   rem t2, t0, t1
   sw t2, 72(sp)
   # ret i32 %var74

   lw a0, 72(sp)
   addi sp, sp, 92
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   ret

   .section .text
   .globl Queue_int..doubleStorage
Queue_int..doubleStorage:
   addi sp, sp, -260
   sw t0, 248(sp)
   sw t1, 252(sp)
   sw t2, 256(sp)

   .section .text
   .globl Queue_int..doubleStorage_entry
Queue_int..doubleStorage_entry:
   # %_this.5 = alloca ptr

   addi t0, sp, 4
   sw t0, 0(sp)
   # store ptr %_this, ptr %_this.5

   mv t0, a0
   lw t1, 0(sp)
   sw t0, 0(t1)
   # %copy.1 = alloca ptr

   addi t0, sp, 12
   sw t0, 8(sp)
   # %var75 = load ptr, ptr %_this.5

   lw t0, 0(sp)
   lw t1, 0(t0)
   sw t1, 16(sp)
   # %var76 = getelementptr %class..Queue_int, ptr %var75, i32 0, i32 0

   lw t0, 16(sp)
   li t1, 0
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 20(sp)
   # %var77 = load ptr, ptr %var76

   lw t0, 20(sp)
   lw t1, 0(t0)
   sw t1, 24(sp)
   # store ptr %var77, ptr %copy.1

   lw t0, 24(sp)
   lw t1, 8(sp)
   sw t0, 0(t1)
   # %begCopy.1 = alloca i32

   addi t0, sp, 32
   sw t0, 28(sp)
   # %var78 = load ptr, ptr %_this.5

   lw t0, 0(sp)
   lw t1, 0(t0)
   sw t1, 36(sp)
   # %var79 = getelementptr %class..Queue_int, ptr %var78, i32 0, i32 1

   lw t0, 36(sp)
   li t1, 1
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 40(sp)
   # %var80 = load i32, ptr %var79

   lw t0, 40(sp)
   lw t1, 0(t0)
   sw t1, 44(sp)
   # store i32 %var80, ptr %begCopy.1

   lw t0, 44(sp)
   lw t1, 28(sp)
   sw t0, 0(t1)
   # %endCopy.1 = alloca i32

   addi t0, sp, 52
   sw t0, 48(sp)
   # %var81 = load ptr, ptr %_this.5

   lw t0, 0(sp)
   lw t1, 0(t0)
   sw t1, 56(sp)
   # %var82 = getelementptr %class..Queue_int, ptr %var81, i32 0, i32 2

   lw t0, 56(sp)
   li t1, 2
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 60(sp)
   # %var83 = load i32, ptr %var82

   lw t0, 60(sp)
   lw t1, 0(t0)
   sw t1, 64(sp)
   # store i32 %var83, ptr %endCopy.1

   lw t0, 64(sp)
   lw t1, 48(sp)
   sw t0, 0(t1)
   # %var84 = load ptr, ptr %_this.5

   lw t0, 0(sp)
   lw t1, 0(t0)
   sw t1, 68(sp)
   # %var85 = getelementptr %class..Queue_int, ptr %var84, i32 0, i32 0

   lw t0, 68(sp)
   li t1, 0
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 72(sp)
   # %var86 = load ptr, ptr %var85

   lw t0, 72(sp)
   lw t1, 0(t0)
   sw t1, 76(sp)
   # %var88 = load ptr, ptr %copy.1

   lw t0, 8(sp)
   lw t1, 0(t0)
   sw t1, 80(sp)
   # %var89 = call i32 @array.size(ptr %var88)

   sw ra, 244(sp)
   lw a0, 80(sp)
   call array.size
   lw ra, 244(sp)
   sw a0, 84(sp)
   # %var90 = mul i32 %var89, 2

   lw t0, 84(sp)
   li t1, 2
   mul t2, t0, t1
   sw t2, 88(sp)
   # %var87 = call ptr @__array.alloca(i32 4, i32 1, i32 1, i32 %var90)

   sw ra, 244(sp)
   li a0, 4
   li a1, 1
   li a2, 1
   lw a3, 88(sp)
   call __array.alloca
   lw ra, 244(sp)
   sw a0, 92(sp)
   # store ptr %var87, ptr %var85

   lw t0, 92(sp)
   lw t1, 72(sp)
   sw t0, 0(t1)
   # %var91 = load ptr, ptr %_this.5

   lw t0, 0(sp)
   lw t1, 0(t0)
   sw t1, 96(sp)
   # %var92 = getelementptr %class..Queue_int, ptr %var91, i32 0, i32 1

   lw t0, 96(sp)
   li t1, 1
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 100(sp)
   # %var93 = load i32, ptr %var92

   lw t0, 100(sp)
   lw t1, 0(t0)
   sw t1, 104(sp)
   # store i32 0, ptr %var92

   li t0, 0
   lw t1, 100(sp)
   sw t0, 0(t1)
   # %var94 = load ptr, ptr %_this.5

   lw t0, 0(sp)
   lw t1, 0(t0)
   sw t1, 108(sp)
   # %var95 = getelementptr %class..Queue_int, ptr %var94, i32 0, i32 2

   lw t0, 108(sp)
   li t1, 2
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 112(sp)
   # %var96 = load i32, ptr %var95

   lw t0, 112(sp)
   lw t1, 0(t0)
   sw t1, 116(sp)
   # store i32 0, ptr %var95

   li t0, 0
   lw t1, 112(sp)
   sw t0, 0(t1)
   # %i.1 = alloca i32

   addi t0, sp, 124
   sw t0, 120(sp)
   # %var97 = load i32, ptr %begCopy.1

   lw t0, 28(sp)
   lw t1, 0(t0)
   sw t1, 128(sp)
   # store i32 %var97, ptr %i.1

   lw t0, 128(sp)
   lw t1, 120(sp)
   sw t0, 0(t1)
   # %var98 = load i32, ptr %i.1

   lw t0, 120(sp)
   lw t1, 0(t0)
   sw t1, 132(sp)
   # %var99 = load i32, ptr %endCopy.1

   lw t0, 48(sp)
   lw t1, 0(t0)
   sw t1, 136(sp)
   # %var100 = icmp ne i32 %var98, %var99

   lw t0, 132(sp)
   lw t1, 136(sp)
   sub t2, t0, t1
   snez    t0, t2
   sw t0, 140(sp)
   # br label %while.cond.0

   j Queue_int..doubleStorage_while.cond.0

   .section .text
   .globl Queue_int..doubleStorage_while.cond.0
Queue_int..doubleStorage_while.cond.0:
   # %var101 = load i32, ptr %i.1

   lw t0, 120(sp)
   lw t1, 0(t0)
   sw t1, 144(sp)
   # %var102 = load i32, ptr %endCopy.1

   lw t0, 48(sp)
   lw t1, 0(t0)
   sw t1, 148(sp)
   # %var103 = icmp ne i32 %var101, %var102

   lw t0, 144(sp)
   lw t1, 148(sp)
   sub t2, t0, t1
   snez    t0, t2
   sw t0, 152(sp)
   # br i1 %var103, label %while.body.0, label %while.back.0

   lw t0, 152(sp)
   bne      t0, x0, .+8
   j Queue_int..doubleStorage_while.back.0
   j Queue_int..doubleStorage_while.body.0

   .section .text
   .globl Queue_int..doubleStorage_while.body.0
Queue_int..doubleStorage_while.body.0:
   # %var104 = load ptr, ptr %_this.5

   lw t0, 0(sp)
   lw t1, 0(t0)
   sw t1, 156(sp)
   # %var105 = getelementptr %class..Queue_int, ptr %var104, i32 0, i32 0

   lw t0, 156(sp)
   li t1, 0
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 160(sp)
   # %var106 = load ptr, ptr %var105

   lw t0, 160(sp)
   lw t1, 0(t0)
   sw t1, 164(sp)
   # %var107 = load ptr, ptr %_this.5

   lw t0, 0(sp)
   lw t1, 0(t0)
   sw t1, 168(sp)
   # %var108 = getelementptr %class..Queue_int, ptr %var107, i32 0, i32 2

   lw t0, 168(sp)
   li t1, 2
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 172(sp)
   # %var109 = load i32, ptr %var108

   lw t0, 172(sp)
   lw t1, 0(t0)
   sw t1, 176(sp)
   # %var110 = getelementptr i32, ptr %var106, i32 %var109

   lw t0, 164(sp)
   lw t1, 176(sp)
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 180(sp)
   # %var111 = load i32, ptr %var110

   lw t0, 180(sp)
   lw t1, 0(t0)
   sw t1, 184(sp)
   # %var112 = load ptr, ptr %copy.1

   lw t0, 8(sp)
   lw t1, 0(t0)
   sw t1, 188(sp)
   # %var113 = load i32, ptr %i.1

   lw t0, 120(sp)
   lw t1, 0(t0)
   sw t1, 192(sp)
   # %var114 = getelementptr i32, ptr %var112, i32 %var113

   lw t0, 188(sp)
   lw t1, 192(sp)
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 196(sp)
   # %var115 = load i32, ptr %var114

   lw t0, 196(sp)
   lw t1, 0(t0)
   sw t1, 200(sp)
   # store i32 %var115, ptr %var110

   lw t0, 200(sp)
   lw t1, 180(sp)
   sw t0, 0(t1)
   # %var116 = load ptr, ptr %_this.5

   lw t0, 0(sp)
   lw t1, 0(t0)
   sw t1, 204(sp)
   # %var117 = getelementptr %class..Queue_int, ptr %var116, i32 0, i32 2

   lw t0, 204(sp)
   li t1, 2
   li t2, 4
   mul t1, t1, t2
   add t0, t1, t0
   sw t0, 208(sp)
   # %var118 = load i32, ptr %var117

   lw t0, 208(sp)
   lw t1, 0(t0)
   sw t1, 212(sp)
   # %var119 = add i32 %var118, 1

   lw t0, 212(sp)
   li t1, 1
   add t2, t0, t1
   sw t2, 216(sp)
   # store i32 %var119, ptr %var117

   lw t0, 216(sp)
   lw t1, 208(sp)
   sw t0, 0(t1)
   # %var120 = load i32, ptr %i.1

   lw t0, 120(sp)
   lw t1, 0(t0)
   sw t1, 220(sp)
   # %var121 = load i32, ptr %i.1

   lw t0, 120(sp)
   lw t1, 0(t0)
   sw t1, 224(sp)
   # %var122 = add i32 %var121, 1

   lw t0, 224(sp)
   li t1, 1
   add t2, t0, t1
   sw t2, 228(sp)
   # %var123 = load ptr, ptr %copy.1

   lw t0, 8(sp)
   lw t1, 0(t0)
   sw t1, 232(sp)
   # %var124 = call i32 @array.size(ptr %var123)

   sw ra, 244(sp)
   lw a0, 232(sp)
   call array.size
   lw ra, 244(sp)
   sw a0, 236(sp)
   # %var125 = srem i32 %var122, %var124

   lw t0, 228(sp)
   lw t1, 236(sp)
   rem t2, t0, t1
   sw t2, 240(sp)
   # store i32 %var125, ptr %i.1

   lw t0, 240(sp)
   lw t1, 120(sp)
   sw t0, 0(t1)
   # br label %while.cond.0

   j Queue_int..doubleStorage_while.cond.0

   .section .text
   .globl Queue_int..doubleStorage_while.back.0
Queue_int..doubleStorage_while.back.0:
   # ret void

   addi sp, sp, 260
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   ret

   .section .text
   .globl main
main:
   addi sp, sp, -220
   sw t0, 208(sp)
   sw t1, 212(sp)
   sw t2, 216(sp)

   .section .text
   .globl main_entry
main_entry:
   # call void @__init()

   sw ra, 204(sp)
   call __init
   lw ra, 204(sp)
   sw a0, 0(sp)
   # %q.1 = alloca ptr

   addi t0, sp, 8
   sw t0, 4(sp)
   # %var137 = call ptr @_malloc(i32 12)

   sw ra, 204(sp)
   li a0, 12
   call _malloc
   lw ra, 204(sp)
   sw a0, 12(sp)
   # call void @Queue_int..Queue_int(ptr %var137)

   sw ra, 204(sp)
   lw a0, 12(sp)
   call Queue_int..Queue_int
   lw ra, 204(sp)
   sw a0, 16(sp)
   # store ptr %var137, ptr %q.1

   lw t0, 12(sp)
   lw t1, 4(sp)
   sw t0, 0(t1)
   # %i.2 = alloca i32

   addi t0, sp, 24
   sw t0, 20(sp)
   # store i32 0, ptr %i.2

   li t0, 0
   lw t1, 20(sp)
   sw t0, 0(t1)
   # %N.1 = alloca i32

   addi t0, sp, 32
   sw t0, 28(sp)
   # store i32 100, ptr %N.1

   li t0, 100
   lw t1, 28(sp)
   sw t0, 0(t1)
   # %var139 = load i32, ptr %i.2

   lw t0, 20(sp)
   lw t1, 0(t0)
   sw t1, 36(sp)
   # store i32 0, ptr %i.2

   li t0, 0
   lw t1, 20(sp)
   sw t0, 0(t1)
   # br label %for.cond.0

   j main_for.cond.0

   .section .text
   .globl main_for.cond.0
main_for.cond.0:
   # %var140 = load i32, ptr %i.2

   lw t0, 20(sp)
   lw t1, 0(t0)
   sw t1, 40(sp)
   # %var141 = load i32, ptr %N.1

   lw t0, 28(sp)
   lw t1, 0(t0)
   sw t1, 44(sp)
   # %var142 = icmp slt i32 %var140, %var141

   lw t0, 40(sp)
   lw t1, 44(sp)
   sub t2, t0, t1
   sltz    t0, t2
   sw t0, 48(sp)
   # br i1 %var142, label %for.body.0, label %for.back.0

   lw t0, 48(sp)
   bne      t0, x0, .+8
   j main_for.back.0
   j main_for.body.0

   .section .text
   .globl main_for.body.0
main_for.body.0:
   # %var143 = load ptr, ptr %q.1

   lw t0, 4(sp)
   lw t1, 0(t0)
   sw t1, 52(sp)
   # %var144 = load i32, ptr %i.2

   lw t0, 20(sp)
   lw t1, 0(t0)
   sw t1, 56(sp)
   # call void @Queue_int..push(ptr %var143, i32 %var144)

   sw ra, 204(sp)
   lw a0, 52(sp)
   lw a1, 56(sp)
   call Queue_int..push
   lw ra, 204(sp)
   sw a0, 60(sp)
   # br label %for.step.0

   j main_for.step.0

   .section .text
   .globl main_for.step.0
main_for.step.0:
   # %var145 = load i32, ptr %i.2

   lw t0, 20(sp)
   lw t1, 0(t0)
   sw t1, 64(sp)
   # %var146 = add i32 %var145, 1

   lw t0, 64(sp)
   li t1, 1
   add t2, t0, t1
   sw t2, 68(sp)
   # store i32 %var146, ptr %i.2

   lw t0, 68(sp)
   lw t1, 20(sp)
   sw t0, 0(t1)
   # br label %for.cond.0

   j main_for.cond.0

   .section .text
   .globl main_for.back.0
main_for.back.0:
   # %var147 = load ptr, ptr %q.1

   lw t0, 4(sp)
   lw t1, 0(t0)
   sw t1, 72(sp)
   # %var148 = call i32 @Queue_int..size(ptr %var147)

   sw ra, 204(sp)
   lw a0, 72(sp)
   call Queue_int..size
   lw ra, 204(sp)
   sw a0, 76(sp)
   # %var149 = load i32, ptr %N.1

   lw t0, 28(sp)
   lw t1, 0(t0)
   sw t1, 80(sp)
   # %var150 = icmp ne i32 %var148, %var149

   lw t0, 76(sp)
   lw t1, 80(sp)
   sub t2, t0, t1
   snez    t0, t2
   sw t0, 84(sp)
   # br i1 %var150, label %if.then.2, label %if.else.2

   lw t0, 84(sp)
   bne      t0, x0, .+8
   j main_if.else.2
   j main_if.then.2

   .section .text
   .globl main_if.then.2
main_if.then.2:
   # call void @println(ptr @.str..1)

   sw ra, 204(sp)
   la a0, @.str..1
   call println
   lw ra, 204(sp)
   sw a0, 88(sp)
   # ret i32 1

   li a0, 1
   addi sp, sp, 220
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   ret
   # br label %if.back.2

   j main_if.back.2

   .section .text
   .globl main_if.else.2
main_if.else.2:
   # br label %if.back.2

   j main_if.back.2

   .section .text
   .globl main_if.back.2
main_if.back.2:
   # %var152 = load i32, ptr %i.2

   lw t0, 20(sp)
   lw t1, 0(t0)
   sw t1, 92(sp)
   # store i32 0, ptr %i.2

   li t0, 0
   lw t1, 20(sp)
   sw t0, 0(t1)
   # br label %for.cond.1

   j main_for.cond.1

   .section .text
   .globl main_for.cond.1
main_for.cond.1:
   # %var153 = load i32, ptr %i.2

   lw t0, 20(sp)
   lw t1, 0(t0)
   sw t1, 96(sp)
   # %var154 = load i32, ptr %N.1

   lw t0, 28(sp)
   lw t1, 0(t0)
   sw t1, 100(sp)
   # %var155 = icmp slt i32 %var153, %var154

   lw t0, 96(sp)
   lw t1, 100(sp)
   sub t2, t0, t1
   sltz    t0, t2
   sw t0, 104(sp)
   # br i1 %var155, label %for.body.1, label %for.back.1

   lw t0, 104(sp)
   bne      t0, x0, .+8
   j main_for.back.1
   j main_for.body.1

   .section .text
   .globl main_for.body.1
main_for.body.1:
   # %head.1 = alloca i32

   addi t0, sp, 112
   sw t0, 108(sp)
   # %var156 = load ptr, ptr %q.1

   lw t0, 4(sp)
   lw t1, 0(t0)
   sw t1, 116(sp)
   # %var157 = call i32 @Queue_int..top(ptr %var156)

   sw ra, 204(sp)
   lw a0, 116(sp)
   call Queue_int..top
   lw ra, 204(sp)
   sw a0, 120(sp)
   # store i32 %var157, ptr %head.1

   lw t0, 120(sp)
   lw t1, 108(sp)
   sw t0, 0(t1)
   # %var158 = load i32, ptr %head.1

   lw t0, 108(sp)
   lw t1, 0(t0)
   sw t1, 124(sp)
   # %var159 = load i32, ptr %i.2

   lw t0, 20(sp)
   lw t1, 0(t0)
   sw t1, 128(sp)
   # %var160 = icmp ne i32 %var158, %var159

   lw t0, 124(sp)
   lw t1, 128(sp)
   sub t2, t0, t1
   snez    t0, t2
   sw t0, 132(sp)
   # br i1 %var160, label %if.then.3, label %if.else.3

   lw t0, 132(sp)
   bne      t0, x0, .+8
   j main_if.else.3
   j main_if.then.3

   .section .text
   .globl main_if.then.3
main_if.then.3:
   # call void @println(ptr @.str..2)

   sw ra, 204(sp)
   la a0, @.str..2
   call println
   lw ra, 204(sp)
   sw a0, 136(sp)
   # ret i32 1

   li a0, 1
   addi sp, sp, 220
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   ret
   # br label %if.back.3

   j main_if.back.3

   .section .text
   .globl main_if.else.3
main_if.else.3:
   # br label %if.back.3

   j main_if.back.3

   .section .text
   .globl main_if.back.3
main_if.back.3:
   # %var162 = load ptr, ptr %q.1

   lw t0, 4(sp)
   lw t1, 0(t0)
   sw t1, 140(sp)
   # %var163 = call i32 @Queue_int..pop(ptr %var162)

   sw ra, 204(sp)
   lw a0, 140(sp)
   call Queue_int..pop
   lw ra, 204(sp)
   sw a0, 144(sp)
   # %var164 = load i32, ptr %i.2

   lw t0, 20(sp)
   lw t1, 0(t0)
   sw t1, 148(sp)
   # %var165 = icmp ne i32 %var163, %var164

   lw t0, 144(sp)
   lw t1, 148(sp)
   sub t2, t0, t1
   snez    t0, t2
   sw t0, 152(sp)
   # br i1 %var165, label %if.then.4, label %if.else.4

   lw t0, 152(sp)
   bne      t0, x0, .+8
   j main_if.else.4
   j main_if.then.4

   .section .text
   .globl main_if.then.4
main_if.then.4:
   # call void @println(ptr @.str..3)

   sw ra, 204(sp)
   la a0, @.str..3
   call println
   lw ra, 204(sp)
   sw a0, 156(sp)
   # ret i32 1

   li a0, 1
   addi sp, sp, 220
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   ret
   # br label %if.back.4

   j main_if.back.4

   .section .text
   .globl main_if.else.4
main_if.else.4:
   # br label %if.back.4

   j main_if.back.4

   .section .text
   .globl main_if.back.4
main_if.back.4:
   # %var167 = load ptr, ptr %q.1

   lw t0, 4(sp)
   lw t1, 0(t0)
   sw t1, 160(sp)
   # %var168 = call i32 @Queue_int..size(ptr %var167)

   sw ra, 204(sp)
   lw a0, 160(sp)
   call Queue_int..size
   lw ra, 204(sp)
   sw a0, 164(sp)
   # %var169 = load i32, ptr %N.1

   lw t0, 28(sp)
   lw t1, 0(t0)
   sw t1, 168(sp)
   # %var170 = load i32, ptr %i.2

   lw t0, 20(sp)
   lw t1, 0(t0)
   sw t1, 172(sp)
   # %var171 = sub i32 %var169, %var170

   lw t0, 168(sp)
   lw t1, 172(sp)
   sub t2, t0, t1
   sw t2, 176(sp)
   # %var172 = sub i32 %var171, 1

   lw t0, 176(sp)
   li t1, 1
   sub t2, t0, t1
   sw t2, 180(sp)
   # %var173 = icmp ne i32 %var168, %var172

   lw t0, 164(sp)
   lw t1, 180(sp)
   sub t2, t0, t1
   snez    t0, t2
   sw t0, 184(sp)
   # br i1 %var173, label %if.then.5, label %if.else.5

   lw t0, 184(sp)
   bne      t0, x0, .+8
   j main_if.else.5
   j main_if.then.5

   .section .text
   .globl main_if.then.5
main_if.then.5:
   # call void @println(ptr @.str..4)

   sw ra, 204(sp)
   la a0, @.str..4
   call println
   lw ra, 204(sp)
   sw a0, 188(sp)
   # ret i32 1

   li a0, 1
   addi sp, sp, 220
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   ret
   # br label %if.back.5

   j main_if.back.5

   .section .text
   .globl main_if.else.5
main_if.else.5:
   # br label %if.back.5

   j main_if.back.5

   .section .text
   .globl main_if.back.5
main_if.back.5:
   # br label %for.step.1

   j main_for.step.1

   .section .text
   .globl main_for.step.1
main_for.step.1:
   # %var175 = load i32, ptr %i.2

   lw t0, 20(sp)
   lw t1, 0(t0)
   sw t1, 192(sp)
   # %var176 = add i32 %var175, 1

   lw t0, 192(sp)
   li t1, 1
   add t2, t0, t1
   sw t2, 196(sp)
   # store i32 %var176, ptr %i.2

   lw t0, 196(sp)
   lw t1, 20(sp)
   sw t0, 0(t1)
   # br label %for.cond.1

   j main_for.cond.1

   .section .text
   .globl main_for.back.1
main_for.back.1:
   # call void @println(ptr @.str..5)

   sw ra, 204(sp)
   la a0, @.str..5
   call println
   lw ra, 204(sp)
   sw a0, 200(sp)
   # ret i32 0

   li a0, 0
   addi sp, sp, 220
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
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

