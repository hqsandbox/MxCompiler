   .section .text
   .globl __init
__init:
   addi sp, sp, -144
   sw t0, 132(sp)
   sw t1, 136(sp)
   sw t2, 140(sp)

   .section .text
   .globl __init_entry
__init_entry:
   # ret void

   addi sp, sp, 144
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   ret

   .section .text
   .globl gcd
gcd:
   addi sp, sp, -144
   sw t0, 132(sp)
   sw t1, 136(sp)
   sw t2, 140(sp)

   .section .text
   .globl gcd_entry
gcd_entry:
   # %var2 = srem i32 %x, %y

   rem x8, x3, x4
   # %var3 = icmp eq i32 %var2, 0

   li t1, 0
   sub t2, x8, t1
   seqz    x8, t2
   # br i1 %var3, label %if.then.0, label %if.else.0

   bne      x8, x0, .+8
   j gcd_if.else.0
   j gcd_if.then.0

   .section .text
   .globl gcd_if.then.0
gcd_if.then.0:
   # ret i32 %y

   mv a0, x4
   addi sp, sp, 144
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   ret

   .section .text
   .globl gcd_if.else.0
gcd_if.else.0:
   # %var9 = srem i32 %x, %y

   rem x3, x3, x4
   # %var5 = call i32 @gcd5(i32 %y, i32 %var9)

   sw ra, 128(sp)
   sw a0, 40(sp)
   sw a1, 44(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   mv a1, x3
   mv a0, x4
   call gcd5
   lw ra, 128(sp)
   mv x3, a0
   lw a0, 40(sp)
   lw a1, 44(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   # ret i32 %var5

   mv a0, x3
   addi sp, sp, 144
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   ret

   .section .text
   .globl gcd1
gcd1:
   addi sp, sp, -144
   sw t0, 132(sp)
   sw t1, 136(sp)
   sw t2, 140(sp)

   .section .text
   .globl gcd1_entry
gcd1_entry:
   # %var12 = srem i32 %x, %y

   rem x8, x3, x4
   # %var13 = icmp eq i32 %var12, 0

   li t1, 0
   sub t2, x8, t1
   seqz    x8, t2
   # br i1 %var13, label %if.then.1, label %if.else.1

   bne      x8, x0, .+8
   j gcd1_if.else.1
   j gcd1_if.then.1

   .section .text
   .globl gcd1_if.then.1
gcd1_if.then.1:
   # ret i32 %y

   mv a0, x4
   addi sp, sp, 144
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   ret

   .section .text
   .globl gcd1_if.else.1
gcd1_if.else.1:
   # %var19 = srem i32 %x, %y

   rem x3, x3, x4
   # %var15 = call i32 @gcd(i32 %y, i32 %var19)

   sw ra, 128(sp)
   sw a0, 40(sp)
   sw a1, 44(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   mv a0, x4
   mv a1, x3
   call gcd
   lw ra, 128(sp)
   mv x3, a0
   lw a0, 40(sp)
   lw a1, 44(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   # ret i32 %var15

   mv a0, x3
   addi sp, sp, 144
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   ret

   .section .text
   .globl gcd2
gcd2:
   addi sp, sp, -144
   sw t0, 132(sp)
   sw t1, 136(sp)
   sw t2, 140(sp)

   .section .text
   .globl gcd2_entry
gcd2_entry:
   # %var22 = srem i32 %x, %y

   rem x8, x3, x4
   # %var23 = icmp eq i32 %var22, 0

   li t1, 0
   sub t2, x8, t1
   seqz    x8, t2
   # br i1 %var23, label %if.then.2, label %if.else.2

   bne      x8, x0, .+8
   j gcd2_if.else.2
   j gcd2_if.then.2

   .section .text
   .globl gcd2_if.then.2
gcd2_if.then.2:
   # ret i32 %y

   mv a0, x4
   addi sp, sp, 144
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   ret

   .section .text
   .globl gcd2_if.else.2
gcd2_if.else.2:
   # %var29 = srem i32 %x, %y

   rem x3, x3, x4
   # %var25 = call i32 @gcd1(i32 %y, i32 %var29)

   sw ra, 128(sp)
   sw a0, 40(sp)
   sw a1, 44(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   mv a1, x3
   mv a0, x4
   call gcd1
   lw ra, 128(sp)
   mv x3, a0
   lw a0, 40(sp)
   lw a1, 44(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   # ret i32 %var25

   mv a0, x3
   addi sp, sp, 144
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   ret

   .section .text
   .globl main
main:
   addi sp, sp, -160
   sw t0, 148(sp)
   sw t1, 152(sp)
   sw t2, 156(sp)

   .section .text
   .globl main_entry
main_entry:
   # call void @__init()

   sw ra, 144(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   call __init
   lw ra, 144(sp)
   sw a0, 128(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   # %var63 = call i32 @gcd(i32 10, i32 1)

   sw ra, 144(sp)
   sw a0, 40(sp)
   sw a1, 44(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   li a1, 1
   li a0, 10
   call gcd
   lw ra, 144(sp)
   mv x3, a0
   lw a0, 40(sp)
   lw a1, 44(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   # %var62 = call ptr @toString(i32 %var63)

   sw ra, 144(sp)
   sw a0, 40(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   mv a0, x3
   call toString
   lw ra, 144(sp)
   mv x3, a0
   lw a0, 40(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   # call void @println(ptr %var62)

   sw ra, 144(sp)
   sw a0, 40(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   mv a0, x3
   call println
   lw ra, 144(sp)
   sw a0, 132(sp)
   lw a0, 40(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   # %var66 = call i32 @gcd(i32 34986, i32 3087)

   sw ra, 144(sp)
   sw a0, 40(sp)
   sw a1, 44(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   li a1, 3087
   li a0, 34986
   call gcd
   lw ra, 144(sp)
   mv x3, a0
   lw a0, 40(sp)
   lw a1, 44(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   # %var65 = call ptr @toString(i32 %var66)

   sw ra, 144(sp)
   sw a0, 40(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   mv a0, x3
   call toString
   lw ra, 144(sp)
   mv x3, a0
   lw a0, 40(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   # call void @println(ptr %var65)

   sw ra, 144(sp)
   sw a0, 40(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   mv a0, x3
   call println
   lw ra, 144(sp)
   sw a0, 136(sp)
   lw a0, 40(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   # %var69 = call i32 @gcd(i32 2907, i32 1539)

   sw ra, 144(sp)
   sw a0, 40(sp)
   sw a1, 44(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   li a0, 2907
   li a1, 1539
   call gcd
   lw ra, 144(sp)
   mv x3, a0
   lw a0, 40(sp)
   lw a1, 44(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   # %var68 = call ptr @toString(i32 %var69)

   sw ra, 144(sp)
   sw a0, 40(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   mv a0, x3
   call toString
   lw ra, 144(sp)
   mv x3, a0
   lw a0, 40(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   # call void @println(ptr %var68)

   sw ra, 144(sp)
   sw a0, 40(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   mv a0, x3
   call println
   lw ra, 144(sp)
   sw a0, 140(sp)
   lw a0, 40(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   # ret i32 0

   li a0, 0
   addi sp, sp, 160
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   ret

   .section .text
   .globl gcd3
gcd3:
   addi sp, sp, -144
   sw t0, 132(sp)
   sw t1, 136(sp)
   sw t2, 140(sp)

   .section .text
   .globl gcd3_entry
gcd3_entry:
   # %var32 = srem i32 %x, %y

   rem x8, x3, x4
   # %var33 = icmp eq i32 %var32, 0

   li t1, 0
   sub t2, x8, t1
   seqz    x8, t2
   # br i1 %var33, label %if.then.3, label %if.else.3

   bne      x8, x0, .+8
   j gcd3_if.else.3
   j gcd3_if.then.3

   .section .text
   .globl gcd3_if.then.3
gcd3_if.then.3:
   # ret i32 %y

   mv a0, x4
   addi sp, sp, 144
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   ret

   .section .text
   .globl gcd3_if.else.3
gcd3_if.else.3:
   # %var39 = srem i32 %x, %y

   rem x3, x3, x4
   # %var35 = call i32 @gcd2(i32 %y, i32 %var39)

   sw ra, 128(sp)
   sw a0, 40(sp)
   sw a1, 44(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   mv a1, x3
   mv a0, x4
   call gcd2
   lw ra, 128(sp)
   mv x3, a0
   lw a0, 40(sp)
   lw a1, 44(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   # ret i32 %var35

   mv a0, x3
   addi sp, sp, 144
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   ret

   .section .text
   .globl gcd4
gcd4:
   addi sp, sp, -144
   sw t0, 132(sp)
   sw t1, 136(sp)
   sw t2, 140(sp)

   .section .text
   .globl gcd4_entry
gcd4_entry:
   # %var42 = srem i32 %x, %y

   rem x8, x3, x4
   # %var43 = icmp eq i32 %var42, 0

   li t1, 0
   sub t2, x8, t1
   seqz    x8, t2
   # br i1 %var43, label %if.then.4, label %if.else.4

   bne      x8, x0, .+8
   j gcd4_if.else.4
   j gcd4_if.then.4

   .section .text
   .globl gcd4_if.then.4
gcd4_if.then.4:
   # ret i32 %y

   mv a0, x4
   addi sp, sp, 144
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   ret

   .section .text
   .globl gcd4_if.else.4
gcd4_if.else.4:
   # %var49 = srem i32 %x, %y

   rem x3, x3, x4
   # %var45 = call i32 @gcd(i32 %y, i32 %var49)

   sw ra, 128(sp)
   sw a0, 40(sp)
   sw a1, 44(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   mv a0, x4
   mv a1, x3
   call gcd
   lw ra, 128(sp)
   mv x3, a0
   lw a0, 40(sp)
   lw a1, 44(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   # ret i32 %var45

   mv a0, x3
   addi sp, sp, 144
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   ret

   .section .text
   .globl gcd5
gcd5:
   addi sp, sp, -144
   sw t0, 132(sp)
   sw t1, 136(sp)
   sw t2, 140(sp)

   .section .text
   .globl gcd5_entry
gcd5_entry:
   # %var52 = srem i32 %x, %y

   rem x8, x3, x4
   # %var53 = icmp eq i32 %var52, 0

   li t1, 0
   sub t2, x8, t1
   seqz    x8, t2
   # br i1 %var53, label %if.then.5, label %if.else.5

   bne      x8, x0, .+8
   j gcd5_if.else.5
   j gcd5_if.then.5

   .section .text
   .globl gcd5_if.then.5
gcd5_if.then.5:
   # ret i32 %y

   mv a0, x4
   addi sp, sp, 144
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   ret

   .section .text
   .globl gcd5_if.else.5
gcd5_if.else.5:
   # %var59 = srem i32 %x, %y

   rem x3, x3, x4
   # %var55 = call i32 @gcd2(i32 %y, i32 %var59)

   sw ra, 128(sp)
   sw a0, 40(sp)
   sw a1, 44(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   mv a1, x3
   mv a0, x4
   call gcd2
   lw ra, 128(sp)
   mv x3, a0
   lw a0, 40(sp)
   lw a1, 44(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   # ret i32 %var55

   mv a0, x3
   addi sp, sp, 144
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   ret

