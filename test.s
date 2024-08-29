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
   addi sp, sp, -208
   sw t0, 196(sp)
   sw t1, 200(sp)
   sw t2, 204(sp)

   .section .text
   .globl main_entry
main_entry:
   # call void @__init()

   sw ra, 192(sp)
   call __init
   lw ra, 192(sp)
   sw a0, 0(sp)
   # %var1 = load i32, ptr @n

   la t0, @n
   lw t1, 0(t0)
   sw t1, 4(sp)
   # %var2 = call i32 @getInt()

   sw ra, 192(sp)
   call getInt
   lw ra, 192(sp)
   sw a0, 8(sp)
   # store i32 %var2, ptr @n

   lw t0, 8(sp)
   la t1, @n
   sw t0, 0(t1)
   # %var3 = load i32, ptr @p

   la t0, @p
   lw t1, 0(t0)
   sw t1, 12(sp)
   # %var4 = call i32 @getInt()

   sw ra, 192(sp)
   call getInt
   lw ra, 192(sp)
   sw a0, 16(sp)
   # store i32 %var4, ptr @p

   lw t0, 16(sp)
   la t1, @p
   sw t0, 0(t1)
   # %var5 = load i32, ptr @k

   la t0, @k
   lw t1, 0(t0)
   sw t1, 20(sp)
   # %var6 = call i32 @getInt()

   sw ra, 192(sp)
   call getInt
   lw ra, 192(sp)
   sw a0, 24(sp)
   # store i32 %var6, ptr @k

   lw t0, 24(sp)
   la t1, @k
   sw t0, 0(t1)
   # %var7 = load i32, ptr @p

   la t0, @p
   lw t1, 0(t0)
   sw t1, 28(sp)
   # %var8 = load i32, ptr @k

   la t0, @k
   lw t1, 0(t0)
   sw t1, 32(sp)
   # %var9 = sub i32 %var7, %var8

   lw t0, 28(sp)
   lw t1, 32(sp)
   sub t2, t0, t1
   sw t2, 36(sp)
   # %var10 = icmp sgt i32 %var9, 1

   lw t0, 36(sp)
   li t1, 1
   sub t2, t0, t1
   sgtz    t0, t2
   sw t0, 40(sp)
   # br i1 %var10, label %if.then.0, label %if.else.0

   lw t0, 40(sp)
   bne      t0, x0, .+8
   j main_if.else.0
   j main_if.then.0

   .section .text
   .globl main_if.then.0
main_if.then.0:
   # call void @print(ptr @.str..0)

   sw ra, 192(sp)
   la a0, @.str..0
   call print
   lw ra, 192(sp)
   sw a0, 44(sp)
   # br label %if.back.0

   j main_if.back.0

   .section .text
   .globl main_if.else.0
main_if.else.0:
   # br label %if.back.0

   j main_if.back.0

   .section .text
   .globl main_if.back.0
main_if.back.0:
   # %var12 = load i32, ptr @i

   la t0, @i
   lw t1, 0(t0)
   sw t1, 48(sp)
   # %var13 = load i32, ptr @p

   la t0, @p
   lw t1, 0(t0)
   sw t1, 52(sp)
   # %var14 = load i32, ptr @k

   la t0, @k
   lw t1, 0(t0)
   sw t1, 56(sp)
   # %var15 = sub i32 %var13, %var14

   lw t0, 52(sp)
   lw t1, 56(sp)
   sub t2, t0, t1
   sw t2, 60(sp)
   # store i32 %var15, ptr @i

   lw t0, 60(sp)
   la t1, @i
   sw t0, 0(t1)
   # br label %for.cond.0

   j main_for.cond.0

   .section .text
   .globl main_for.cond.0
main_for.cond.0:
   # %var16 = load i32, ptr @i

   la t0, @i
   lw t1, 0(t0)
   sw t1, 64(sp)
   # %var17 = load i32, ptr @p

   la t0, @p
   lw t1, 0(t0)
   sw t1, 68(sp)
   # %var18 = load i32, ptr @k

   la t0, @k
   lw t1, 0(t0)
   sw t1, 72(sp)
   # %var19 = add i32 %var17, %var18

   lw t0, 68(sp)
   lw t1, 72(sp)
   add t2, t0, t1
   sw t2, 76(sp)
   # %var20 = icmp sle i32 %var16, %var19

   lw t0, 64(sp)
   lw t1, 76(sp)
   sub t2, t0, t1
   sltz    t0, t2
   seqz    t1, t2
   or t0, t0, t1
   sw t0, 80(sp)
   # br i1 %var20, label %for.body.0, label %for.back.0

   lw t0, 80(sp)
   bne      t0, x0, .+8
   j main_for.back.0
   j main_for.body.0

   .section .text
   .globl main_for.body.0
main_for.body.0:
   # %var21 = load i32, ptr @i

   la t0, @i
   lw t1, 0(t0)
   sw t1, 84(sp)
   # %var22 = icmp sle i32 1, %var21

   li t0, 1
   lw t1, 84(sp)
   sub t2, t0, t1
   sltz    t0, t2
   seqz    t1, t2
   or t0, t0, t1
   sw t0, 88(sp)
   # %var23 = alloca i1

   addi t0, sp, 96
   sw t0, 92(sp)
   # store i1 %var22, ptr %var23

   lw t0, 88(sp)
   lw t1, 92(sp)
   sw t0, 0(t1)
   # br i1 %var22, label %land.next..0, label %land.end..0

   lw t0, 88(sp)
   bne      t0, x0, .+8
   j main_land.end..0
   j main_land.next..0

   .section .text
   .globl main_land.next..0
main_land.next..0:
   # %var24 = load i32, ptr @i

   la t0, @i
   lw t1, 0(t0)
   sw t1, 100(sp)
   # %var25 = load i32, ptr @n

   la t0, @n
   lw t1, 0(t0)
   sw t1, 104(sp)
   # %var26 = icmp sle i32 %var24, %var25

   lw t0, 100(sp)
   lw t1, 104(sp)
   sub t2, t0, t1
   sltz    t0, t2
   seqz    t1, t2
   or t0, t0, t1
   sw t0, 108(sp)
   # store i1 %var26, ptr %var23

   lw t0, 108(sp)
   lw t1, 92(sp)
   sw t0, 0(t1)
   # br label %land.end..0

   j main_land.end..0

   .section .text
   .globl main_land.end..0
main_land.end..0:
   # %var27 = load i1, ptr %var23

   lw t0, 92(sp)
   lw t1, 0(t0)
   sw t1, 112(sp)
   # br i1 %var27, label %if.then.1, label %if.else.1

   lw t0, 112(sp)
   bne      t0, x0, .+8
   j main_if.else.1
   j main_if.then.1

   .section .text
   .globl main_if.then.1
main_if.then.1:
   # %var28 = load i32, ptr @i

   la t0, @i
   lw t1, 0(t0)
   sw t1, 116(sp)
   # %var29 = load i32, ptr @p

   la t0, @p
   lw t1, 0(t0)
   sw t1, 120(sp)
   # %var30 = icmp eq i32 %var28, %var29

   lw t0, 116(sp)
   lw t1, 120(sp)
   sub t2, t0, t1
   seqz    t0, t2
   sw t0, 124(sp)
   # br i1 %var30, label %if.then.2, label %if.else.2

   lw t0, 124(sp)
   bne      t0, x0, .+8
   j main_if.else.2
   j main_if.then.2

   .section .text
   .globl main_if.then.2
main_if.then.2:
   # call void @print(ptr @.str..1)

   sw ra, 192(sp)
   la a0, @.str..1
   call print
   lw ra, 192(sp)
   sw a0, 128(sp)
   # %var34 = load i32, ptr @i

   la t0, @i
   lw t1, 0(t0)
   sw t1, 132(sp)
   # %var33 = call ptr @toString(i32 %var34)

   sw ra, 192(sp)
   lw a0, 132(sp)
   call toString
   lw ra, 192(sp)
   sw a0, 136(sp)
   # call void @print(ptr %var33)

   sw ra, 192(sp)
   lw a0, 136(sp)
   call print
   lw ra, 192(sp)
   sw a0, 140(sp)
   # call void @print(ptr @.str..2)

   sw ra, 192(sp)
   la a0, @.str..2
   call print
   lw ra, 192(sp)
   sw a0, 144(sp)
   # br label %if.back.2

   j main_if.back.2

   .section .text
   .globl main_if.else.2
main_if.else.2:
   # %var37 = load i32, ptr @i

   la t0, @i
   lw t1, 0(t0)
   sw t1, 148(sp)
   # call void @printInt(i32 %var37)

   sw ra, 192(sp)
   lw a0, 148(sp)
   call printInt
   lw ra, 192(sp)
   sw a0, 152(sp)
   # call void @print(ptr @.str..3)

   sw ra, 192(sp)
   la a0, @.str..3
   call print
   lw ra, 192(sp)
   sw a0, 156(sp)
   # br label %if.back.2

   j main_if.back.2

   .section .text
   .globl main_if.back.2
main_if.back.2:
   # br label %if.back.1

   j main_if.back.1

   .section .text
   .globl main_if.else.1
main_if.else.1:
   # br label %if.back.1

   j main_if.back.1

   .section .text
   .globl main_if.back.1
main_if.back.1:
   # br label %for.step.0

   j main_for.step.0

   .section .text
   .globl main_for.step.0
main_for.step.0:
   # %var39 = load i32, ptr @i

   la t0, @i
   lw t1, 0(t0)
   sw t1, 160(sp)
   # %var40 = add i32 %var39, 1

   lw t0, 160(sp)
   li t1, 1
   add t2, t0, t1
   sw t2, 164(sp)
   # store i32 %var40, ptr @i

   lw t0, 164(sp)
   la t1, @i
   sw t0, 0(t1)
   # br label %for.cond.0

   j main_for.cond.0

   .section .text
   .globl main_for.back.0
main_for.back.0:
   # %var41 = load i32, ptr @p

   la t0, @p
   lw t1, 0(t0)
   sw t1, 168(sp)
   # %var42 = load i32, ptr @k

   la t0, @k
   lw t1, 0(t0)
   sw t1, 172(sp)
   # %var43 = add i32 %var41, %var42

   lw t0, 168(sp)
   lw t1, 172(sp)
   add t2, t0, t1
   sw t2, 176(sp)
   # %var44 = load i32, ptr @n

   la t0, @n
   lw t1, 0(t0)
   sw t1, 180(sp)
   # %var45 = icmp slt i32 %var43, %var44

   lw t0, 176(sp)
   lw t1, 180(sp)
   sub t2, t0, t1
   sltz    t0, t2
   sw t0, 184(sp)
   # br i1 %var45, label %if.then.3, label %if.else.3

   lw t0, 184(sp)
   bne      t0, x0, .+8
   j main_if.else.3
   j main_if.then.3

   .section .text
   .globl main_if.then.3
main_if.then.3:
   # call void @print(ptr @.str..4)

   sw ra, 192(sp)
   la a0, @.str..4
   call print
   lw ra, 192(sp)
   sw a0, 188(sp)
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
   # ret i32 0

   li a0, 0
   addi sp, sp, 208
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   ret

   .section .data
   .globl @p
@p:
   .word 0

   .section .data
   .globl @i
@i:
   .word 0

   .section .data
   .globl @k
@k:
   .word 0

   .section .data
   .globl @n
@n:
   .word 0

   .section .rodata
@.str..1:
   .asciz "("

   .section .rodata
@.str..2:
   .asciz ") "

   .section .rodata
@.str..0:
   .asciz "<< "

   .section .rodata
@.str..3:
   .asciz " "

   .section .rodata
@.str..4:
   .asciz ">> "

