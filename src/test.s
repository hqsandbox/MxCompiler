   .section .text
   .globl add
add:
   addi sp, sp, -32
   mv x3, a0
   # phi start 
   # phi end 
   mv x4, a1

   .section .text
   .globl add_entry
add_entry:
   # %var125 = and i32 %x, 65535

   li t1, 65535
   and s0, x3, t1
   # %var127 = and i32 %y, 65535

   li t1, 65535
   and s1, x4, t1
   # %var128 = add i32 %var125, %var127

   add s0, s0, s1
   # %var130 = ashr i32 %x, 16

   srai x3, x3, 16
   # %var131 = and i32 %var130, 65535

   li t1, 65535
   and x3, x3, t1
   # %var133 = ashr i32 %y, 16

   srai x4, x4, 16
   # %var134 = and i32 %var133, 65535

   li t1, 65535
   and x4, x4, t1
   # %var135 = add i32 %var131, %var134

   add x3, x3, x4
   # %var137 = ashr i32 %var128, 16

   srai x4, s0, 16
   # %var138 = add i32 %var135, %var137

   add x3, x3, x4
   # %var139 = and i32 %var138, 65535

   li t1, 65535
   and x3, x3, t1
   # %var141 = shl i32 %var139, 16

   slli x3, x3, 16
   # %var143 = and i32 %var128, 65535

   li t1, 65535
   and x4, s0, t1
   # %var144 = or i32 %var141, %var143

   or x3, x3, x4
   # ret i32 %var144

   mv a0, x3
   addi sp, sp, 32
   # phi start 
   # phi end 
   ret

   .section .text
   .globl nextText
nextText:
   addi sp, sp, -32
   mv x3, a0
   # phi start 
   # phi end 
   mv x4, a1

   .section .text
   .globl nextText_entry
nextText_entry:
   # %var489 = sub i32 %length, 1

   addi x4, x4, -1
   # br label %for.cond.10

   # phi start 
   # phi end 
   j nextText_for.cond.10

   .section .text
   .globl nextText_for.cond.10
nextText_for.cond.10:
   # %var491 = icmp sge i32 %i.5_for.cond.10, 0

   li t1, 0
   sub t2, x4, t1
   sgtz    s0, t2
   seqz    t1, t2
   or s0, s0, t1
   # br i1 %var491, label %for.body.10, label %for.back.10

   bne      s0, x0, .+8
   j nextText_for.back.10
   # phi start 
   # phi end 
   j nextText_for.body.10

   .section .text
   .globl nextText_for.body.10
nextText_for.body.10:
   # %var494 = getelementptr i32, ptr %now, i32 %i.5_for.cond.10

   slli t1, x4, 2
   add s0, t1, x3
   # %var499 = getelementptr i32, ptr %now, i32 %i.5_for.cond.10

   slli t1, x4, 2
   add s1, t1, x3
   # %var500 = load i32, ptr %var499

   lw s1, 0(s1)
   # %var496 = call i32 @nextLetter(i32 %var500)

   sw ra, 16(sp)
   sw x3, 0(sp)
   sw x4, 4(sp)
   sw s0, 8(sp)
   mv a0, s1
   call nextLetter
   lw ra, 16(sp)
   mv s1, a0
   lw x3, 0(sp)
   lw x4, 4(sp)
   lw s0, 8(sp)
   # store i32 %var496, ptr %var494

   sw s1, 0(s0)
   # %var503 = getelementptr i32, ptr %now, i32 %i.5_for.cond.10

   slli t1, x4, 2
   add s0, t1, x3
   # %var504 = load i32, ptr %var503

   lw s0, 0(s0)
   # %var505 = sub i32 0, 1

   li s1, -1
   # %var506 = icmp eq i32 %var504, %var505

   sub t2, s0, s1
   seqz    s0, t2
   # br i1 %var506, label %if.then.14, label %if.else.14

   bne      s0, x0, .+8
   j nextText_if.else.14
   # phi start 
   # phi end 
   j nextText_if.then.14

   .section .text
   .globl nextText_if.then.14
nextText_if.then.14:
   # %var509 = getelementptr i32, ptr %now, i32 %i.5_for.cond.10

   slli t1, x4, 2
   add s0, t1, x3
   # store i32 48, ptr %var509

   li t0, 48
   sw t0, 0(s0)
   # br label %if.back.14

   # phi start 
   # phi end 
   j nextText_if.back.14

   .section .text
   .globl nextText_if.else.14
nextText_if.else.14:
   # ret i1 true

   li a0, 1
   addi sp, sp, 32
   # phi start 
   # phi end 
   ret

   .section .text
   .globl nextText_if.back.14
nextText_if.back.14:
   # br label %for.step.10

   # phi start 
   # phi end 
   j nextText_for.step.10

   .section .text
   .globl nextText_for.step.10
nextText_for.step.10:
   # %var512 = sub i32 %i.5_for.cond.10, 1

   addi x4, x4, -1
   # br label %for.cond.10

   # phi start 
   # phi end 
   j nextText_for.cond.10

   .section .text
   .globl nextText_for.back.10
nextText_for.back.10:
   # ret i1 false

   li a0, 0
   addi sp, sp, 32
   # phi start 
   # phi end 
   ret

   .section .text
   .globl main
main:
   # phi start 
   # phi end 
   addi sp, sp, -40

   .section .text
   .globl main_entry
main_entry:
   # call void @__init()

   sw ra, 24(sp)
   call __init
   lw ra, 24(sp)
   sw a0, 12(sp)
   # br label %while.cond.1

   # phi start 
   li x3, 0
   # phi end 
   j main_while.cond.1

   .section .text
   .globl main_while.cond.1
main_while.cond.1:
   # br i1 true, label %while.body.1, label %while.cond.1_and_while.back.1

   # phi start 
   # phi end 
   j main_while.body.1

   .section .text
   .globl main_while.body.1
main_while.body.1:
   # %var619 = call i32 @getInt()

   sw ra, 24(sp)
   sw x3, 0(sp)
   call getInt
   lw ra, 24(sp)
   mv x4, a0
   lw x3, 0(sp)
   # %var621 = icmp eq i32 %var619, 0

   li t1, 0
   sub t2, x4, t1
   seqz    s0, t2
   # br i1 %var621, label %if.then.20, label %if.else.20

   bne      s0, x0, .+8
   j main_if.else.20
   # phi start 
   # phi end 
   j main_if.then.20

   .section .text
   .globl main_if.then.20
main_if.then.20:
   # br label %while.back.1

   # phi start 
   # phi end 
   j main_while.back.1

   .section .text
   .globl main_if.else.20
main_if.else.20:
   # br label %if.back.20

   # phi start 
   # phi end 
   j main_if.back.20

   .section .text
   .globl main_if.back.20
main_if.back.20:
   # %var623 = icmp eq i32 %var619, 1

   li t1, 1
   sub t2, x4, t1
   seqz    s0, t2
   # br i1 %var623, label %if.then.21, label %if.else.21

   bne      s0, x0, .+8
   j main_if.else.21
   # phi start 
   # phi end 
   j main_if.then.21

   .section .text
   .globl main_if.then.21
main_if.then.21:
   # %var625 = call ptr @getString()

   sw ra, 24(sp)
   call getString
   lw ra, 24(sp)
   mv x3, a0
   # %var626 = call ptr @string.copy(ptr %var625)

   sw ra, 24(sp)
   mv a0, x3
   call string.copy
   lw ra, 24(sp)
   mv x3, a0
   # call void @computeSHA1(ptr %var626)

   sw ra, 24(sp)
   sw x3, 0(sp)
   mv a0, x3
   call computeSHA1
   lw ra, 24(sp)
   sw a0, 16(sp)
   lw x3, 0(sp)
   # br label %if.back.21

   # phi start 
   # phi end 
   j main_if.back.21

   .section .text
   .globl main_if.else.21
main_if.else.21:
   # %var630 = icmp eq i32 %var619, 2

   li t1, 2
   sub t2, x4, t1
   seqz    x4, t2
   # br i1 %var630, label %if.then.22, label %if.else.22

   bne      x4, x0, .+8
   j main_if.else.22
   # phi start 
   # phi end 
   j main_if.then.22

   .section .text
   .globl main_if.then.22
main_if.then.22:
   # %var632 = call ptr @getString()

   sw ra, 24(sp)
   call getString
   lw ra, 24(sp)
   mv x3, a0
   # %var633 = call ptr @string.copy(ptr %var632)

   sw ra, 24(sp)
   mv a0, x3
   call string.copy
   lw ra, 24(sp)
   mv x3, a0
   # call void @crackSHA1(ptr %var633)

   sw ra, 24(sp)
   sw x3, 0(sp)
   mv a0, x3
   call crackSHA1
   lw ra, 24(sp)
   sw a0, 20(sp)
   lw x3, 0(sp)
   # br label %if.back.22

   # phi start 
   # phi end 
   j main_if.back.22

   .section .text
   .globl main_if.else.22
main_if.else.22:
   # br label %if.back.22

   # phi start 
   # phi end 
   j main_if.back.22

   .section .text
   .globl main_if.back.22
main_if.back.22:
   # br label %if.back.21

   # phi start 
   # phi end 
   j main_if.back.21

   .section .text
   .globl main_if.back.21
main_if.back.21:
   # br label %while.cond.1

   # phi start 
   # phi end 
   j main_while.cond.1

   .section .text
   .globl main_while.back.1
main_while.back.1:
   # ret i32 0

   li a0, 0
   addi sp, sp, 40
   # phi start 
   # phi end 
   ret

   .section .text
   .globl main_while.cond.1_and_while.back.1
main_while.cond.1_and_while.back.1:
   # br label %while.back.1

   # phi start 
   # phi end 
   j main_while.back.1

   .section .text
   .globl hex2int
hex2int:
   addi sp, sp, -44
   # phi start 
   # phi end 
   mv x3, a0

   .section .text
   .globl hex2int_entry
hex2int_entry:
   # br label %for.cond.0

   # phi start 
   li s0, 0
   li a0, 0
   li s1, 0
   li x4, 0
   # phi end 
   j hex2int_for.cond.0

   .section .text
   .globl hex2int_for.cond.0
hex2int_for.cond.0:
   # %var3 = call i32 @string.length(ptr %x)

   sw ra, 28(sp)
   sw x3, 0(sp)
   sw x4, 4(sp)
   sw s0, 8(sp)
   sw s1, 12(sp)
   sw a0, 16(sp)
   mv a0, x3
   call string.length
   lw ra, 28(sp)
   mv a1, a0
   lw x3, 0(sp)
   lw x4, 4(sp)
   lw s0, 8(sp)
   lw s1, 12(sp)
   lw a0, 16(sp)
   # %var4 = icmp slt i32 %i.1_for.cond.0, %var3

   sub t2, s0, a1
   sltz    a1, t2
   # br i1 %var4, label %for.body.0, label %for.back.0

   bne      a1, x0, .+8
   j hex2int_for.back.0
   # phi start 
   # phi end 
   j hex2int_for.body.0

   .section .text
   .globl hex2int_for.body.0
hex2int_for.body.0:
   # %var7 = call i32 @string.ord(ptr %x, i32 %i.1_for.cond.0)

   sw ra, 28(sp)
   sw x3, 0(sp)
   sw x4, 4(sp)
   sw s0, 8(sp)
   sw s1, 12(sp)
   sw a0, 16(sp)
   mv a0, x3
   mv a1, s0
   call string.ord
   lw ra, 28(sp)
   mv a1, a0
   lw x3, 0(sp)
   lw x4, 4(sp)
   lw s0, 8(sp)
   lw s1, 12(sp)
   lw a0, 16(sp)
   # %var9 = icmp sge i32 %var7, 48

   li t1, 48
   sub t2, a1, t1
   sgtz    a2, t2
   seqz    t1, t2
   or a2, a2, t1
   # br i1 %var9, label %land.next..0, label %for.body.0_and_land.end..0

   bne      a2, x0, .+8
   j hex2int_for.body.0_and_land.end..0
   # phi start 
   # phi end 
   j hex2int_land.next..0

   .section .text
   .globl hex2int_land.next..0
hex2int_land.next..0:
   # %var12 = icmp sle i32 %var7, 57

   li t1, 57
   sub t2, a1, t1
   sltz    a2, t2
   seqz    t1, t2
   or a2, a2, t1
   # br label %land.end..0

   # phi start 
   # phi end 
   j hex2int_land.end..0

   .section .text
   .globl hex2int_land.end..0
hex2int_land.end..0:
   # br i1 %var10_land.end..0, label %if.then.0, label %if.else.0

   bne      a2, x0, .+8
   j hex2int_if.else.0
   # phi start 
   # phi end 
   j hex2int_if.then.0

   .section .text
   .globl hex2int_if.then.0
hex2int_if.then.0:
   # %var16 = mul i32 %result.1_for.cond.0, 16

   li t1, 16
   mul s1, s1, t1
   # %var18 = add i32 %var16, %var7

   add s1, s1, a1
   # %var19 = sub i32 %var18, 48

   addi s1, s1, -48
   # br label %if.back.0

   # phi start 
   mv t6, s1
   mv s1, a0
   mv a0, x4
   mv x4, t6
   # phi end 
   j hex2int_if.back.0

   .section .text
   .globl hex2int_if.else.0
hex2int_if.else.0:
   # %var21 = icmp sge i32 %var7, 65

   li t1, 65
   sub t2, a1, t1
   sgtz    a0, t2
   seqz    t1, t2
   or a0, a0, t1
   # br i1 %var21, label %land.next..1, label %if.else.0_and_land.end..1

   bne      a0, x0, .+8
   j hex2int_if.else.0_and_land.end..1
   # phi start 
   # phi end 
   j hex2int_land.next..1

   .section .text
   .globl hex2int_land.next..1
hex2int_land.next..1:
   # %var24 = icmp sle i32 %var7, 70

   li t1, 70
   sub t2, a1, t1
   sltz    a0, t2
   seqz    t1, t2
   or a0, a0, t1
   # br label %land.end..1

   # phi start 
   # phi end 
   j hex2int_land.end..1

   .section .text
   .globl hex2int_land.end..1
hex2int_land.end..1:
   # br i1 %var22_land.end..1, label %if.then.1, label %if.else.1

   bne      a0, x0, .+8
   j hex2int_if.else.1
   # phi start 
   # phi end 
   j hex2int_if.then.1

   .section .text
   .globl hex2int_if.then.1
hex2int_if.then.1:
   # %var28 = mul i32 %result.1_for.cond.0, 16

   li t1, 16
   mul s1, s1, t1
   # %var30 = add i32 %var28, %var7

   add s1, s1, a1
   # %var31 = sub i32 %var30, 65

   addi s1, s1, -65
   # %var32 = add i32 %var31, 10

   addi s1, s1, 10
   # br label %if.back.1

   # phi start 
   # phi end 
   j hex2int_if.back.1

   .section .text
   .globl hex2int_if.else.1
hex2int_if.else.1:
   # %var34 = icmp sge i32 %var7, 97

   li t1, 97
   sub t2, a1, t1
   sgtz    x4, t2
   seqz    t1, t2
   or x4, x4, t1
   # br i1 %var34, label %land.next..2, label %if.else.1_and_land.end..2

   bne      x4, x0, .+8
   j hex2int_if.else.1_and_land.end..2
   # phi start 
   # phi end 
   j hex2int_land.next..2

   .section .text
   .globl hex2int_land.next..2
hex2int_land.next..2:
   # %var37 = icmp sle i32 %var7, 102

   li t1, 102
   sub t2, a1, t1
   sltz    x4, t2
   seqz    t1, t2
   or x4, x4, t1
   # br label %land.end..2

   # phi start 
   # phi end 
   j hex2int_land.end..2

   .section .text
   .globl hex2int_land.end..2
hex2int_land.end..2:
   # br i1 %var35_land.end..2, label %if.then.2, label %if.else.2

   bne      x4, x0, .+8
   j hex2int_if.else.2
   # phi start 
   # phi end 
   j hex2int_if.then.2

   .section .text
   .globl hex2int_if.then.2
hex2int_if.then.2:
   # %var41 = mul i32 %result.1_for.cond.0, 16

   li t1, 16
   mul s1, s1, t1
   # %var43 = add i32 %var41, %var7

   add s1, s1, a1
   # %var44 = sub i32 %var43, 97

   addi s1, s1, -97
   # %var45 = add i32 %var44, 10

   addi s1, s1, 10
   # br label %if.back.2

   # phi start 
   # phi end 
   j hex2int_if.back.2

   .section .text
   .globl hex2int_if.else.2
hex2int_if.else.2:
   # ret i32 0

   li a0, 0
   addi sp, sp, 44
   # phi start 
   # phi end 
   ret

   .section .text
   .globl hex2int_if.back.2
hex2int_if.back.2:
   # br label %if.back.1

   # phi start 
   # phi end 
   j hex2int_if.back.1

   .section .text
   .globl hex2int_if.back.1
hex2int_if.back.1:
   # br label %if.back.0

   # phi start 
   mv t6, s1
   mv s1, a0
   mv a0, x4
   mv x4, t6
   # phi end 
   j hex2int_if.back.0

   .section .text
   .globl hex2int_if.back.0
hex2int_if.back.0:
   # br label %for.step.0

   # phi start 
   # phi end 
   j hex2int_for.step.0

   .section .text
   .globl hex2int_for.step.0
hex2int_for.step.0:
   # %var47 = add i32 %i.1_for.cond.0, 1

   addi s0, s0, 1
   # br label %for.cond.0

   # phi start 
   mv t6, x4
   mv x4, a0
   mv a0, s1
   mv s1, t6
   # phi end 
   j hex2int_for.cond.0

   .section .text
   .globl hex2int_for.back.0
hex2int_for.back.0:
   # ret i32 %result.1_for.cond.0

   mv a0, s1
   addi sp, sp, 44
   # phi start 
   # phi end 
   ret

   .section .text
   .globl hex2int_for.body.0_and_land.end..0
hex2int_for.body.0_and_land.end..0:
   # br label %land.end..0

   # phi start 
   # phi end 
   j hex2int_land.end..0

   .section .text
   .globl hex2int_if.else.0_and_land.end..1
hex2int_if.else.0_and_land.end..1:
   # br label %land.end..1

   # phi start 
   # phi end 
   j hex2int_land.end..1

   .section .text
   .globl hex2int_if.else.1_and_land.end..2
hex2int_if.else.1_and_land.end..2:
   # br label %land.end..2

   # phi start 
   # phi end 
   j hex2int_land.end..2

   .section .text
   .globl crackSHA1
crackSHA1:
   addi sp, sp, -64
   # phi start 
   # phi end 
   mv x4, a0

   .section .text
   .globl crackSHA1_entry
crackSHA1_entry:
   # %var534 = call ptr @__array.alloca(i32 4, i32 1, i32 1, i32 5)

   sw ra, 48(sp)
   sw x3, 0(sp)
   sw x4, 4(sp)
   li a1, 1
   li a0, 4
   li a3, 5
   li a2, 1
   call __array.alloca
   lw ra, 48(sp)
   mv s0, a0
   lw x3, 0(sp)
   lw x4, 4(sp)
   # %var536 = call i32 @string.length(ptr %input)

   sw ra, 48(sp)
   sw x3, 0(sp)
   sw x4, 4(sp)
   sw s0, 8(sp)
   mv a0, x4
   call string.length
   lw ra, 48(sp)
   mv s1, a0
   lw x3, 0(sp)
   lw x4, 4(sp)
   lw s0, 8(sp)
   # %var537 = icmp ne i32 %var536, 40

   li t1, 40
   sub t2, s1, t1
   snez    s1, t2
   # br i1 %var537, label %if.then.17, label %if.else.17

   bne      s1, x0, .+8
   j crackSHA1_if.else.17
   # phi start 
   # phi end 
   j crackSHA1_if.then.17

   .section .text
   .globl crackSHA1_if.then.17
crackSHA1_if.then.17:
   # call void @println(ptr @.str..5)

   sw ra, 48(sp)
   la a0, @.str..5
   call println
   lw ra, 48(sp)
   sw a0, 32(sp)
   # ret void

   addi sp, sp, 64
   # phi start 
   # phi end 
   ret

   .section .text
   .globl crackSHA1_if.else.17
crackSHA1_if.else.17:
   # br label %if.back.17

   # phi start 
   # phi end 
   j crackSHA1_if.back.17

   .section .text
   .globl crackSHA1_if.back.17
crackSHA1_if.back.17:
   # br label %for.cond.12

   # phi start 
   li s1, 0
   # phi end 
   j crackSHA1_for.cond.12

   .section .text
   .globl crackSHA1_for.cond.12
crackSHA1_for.cond.12:
   # %var541 = icmp slt i32 %i.7_for.cond.12, 5

   li t1, 5
   sub t2, s1, t1
   sltz    a0, t2
   # br i1 %var541, label %for.body.12, label %for.back.12

   bne      a0, x0, .+8
   j crackSHA1_for.back.12
   # phi start 
   # phi end 
   j crackSHA1_for.body.12

   .section .text
   .globl crackSHA1_for.body.12
crackSHA1_for.body.12:
   # %var544 = getelementptr i32, ptr %var534, i32 %i.7_for.cond.12

   slli t1, s1, 2
   add a0, t1, s0
   # store i32 0, ptr %var544

   li t0, 0
   sw t0, 0(a0)
   # br label %for.step.12

   # phi start 
   # phi end 
   j crackSHA1_for.step.12

   .section .text
   .globl crackSHA1_for.step.12
crackSHA1_for.step.12:
   # %var547 = add i32 %i.7_for.cond.12, 1

   addi s1, s1, 1
   # br label %for.cond.12

   # phi start 
   # phi end 
   j crackSHA1_for.cond.12

   .section .text
   .globl crackSHA1_for.back.12
crackSHA1_for.back.12:
   # br label %for.cond.13

   # phi start 
   li s1, 0
   # phi end 
   j crackSHA1_for.cond.13

   .section .text
   .globl crackSHA1_for.cond.13
crackSHA1_for.cond.13:
   # %var550 = icmp slt i32 %i.7_for.cond.13, 40

   li t1, 40
   sub t2, s1, t1
   sltz    a0, t2
   # br i1 %var550, label %for.body.13, label %for.back.13

   bne      a0, x0, .+8
   j crackSHA1_for.back.13
   # phi start 
   # phi end 
   j crackSHA1_for.body.13

   .section .text
   .globl crackSHA1_for.body.13
crackSHA1_for.body.13:
   # %var553 = sdiv i32 %i.7_for.cond.13, 8

   li t1, 8
   div a0, s1, t1
   # %var554 = getelementptr i32, ptr %var534, i32 %var553

   slli t1, a0, 2
   add a0, t1, s0
   # %var558 = sdiv i32 %i.7_for.cond.13, 8

   li t1, 8
   div a1, s1, t1
   # %var559 = getelementptr i32, ptr %var534, i32 %var558

   slli t1, a1, 2
   add a1, t1, s0
   # %var560 = load i32, ptr %var559

   lw a1, 0(a1)
   # %var565 = add i32 %i.7_for.cond.13, 4

   addi a2, s1, 4
   # %var566 = call ptr @string.substring(ptr %input, i32 %i.7_for.cond.13, i32 %var565)

   sw ra, 48(sp)
   sw a1, 20(sp)
   sw x3, 0(sp)
   sw x4, 4(sp)
   sw s0, 8(sp)
   sw s1, 12(sp)
   sw a0, 16(sp)
   mv a0, x4
   mv a1, s1
   call string.substring
   lw ra, 48(sp)
   mv a2, a0
   lw a1, 20(sp)
   lw x3, 0(sp)
   lw x4, 4(sp)
   lw s0, 8(sp)
   lw s1, 12(sp)
   lw a0, 16(sp)
   # %var561 = call i32 @hex2int(ptr %var566)

   sw ra, 48(sp)
   sw a1, 20(sp)
   sw x3, 0(sp)
   sw x4, 4(sp)
   sw s0, 8(sp)
   sw s1, 12(sp)
   sw a0, 16(sp)
   mv a0, a2
   call hex2int
   lw ra, 48(sp)
   mv a2, a0
   lw a1, 20(sp)
   lw x3, 0(sp)
   lw x4, 4(sp)
   lw s0, 8(sp)
   lw s1, 12(sp)
   lw a0, 16(sp)
   # %var568 = sdiv i32 %i.7_for.cond.13, 4

   li t1, 4
   div a3, s1, t1
   # %var569 = srem i32 %var568, 2

   li t1, 2
   rem a3, a3, t1
   # %var570 = sub i32 1, %var569

   li t0, 1
   sub a3, t0, a3
   # %var571 = mul i32 %var570, 16

   li t1, 16
   mul a3, a3, t1
   # %var572 = shl i32 %var561, %var571

   sll a2, a2, a3
   # %var573 = or i32 %var560, %var572

   or a1, a1, a2
   # store i32 %var573, ptr %var554

   sw a1, 0(a0)
   # br label %for.step.13

   # phi start 
   # phi end 
   j crackSHA1_for.step.13

   .section .text
   .globl crackSHA1_for.step.13
crackSHA1_for.step.13:
   # %var576 = add i32 %i.7_for.cond.13, 4

   addi s1, s1, 4
   # br label %for.cond.13

   # phi start 
   # phi end 
   j crackSHA1_for.cond.13

   .section .text
   .globl crackSHA1_for.back.13
crackSHA1_for.back.13:
   # br label %for.cond.14

   # phi start 
   li s1, 1
   li x4, 0
   # phi end 
   j crackSHA1_for.cond.14

   .section .text
   .globl crackSHA1_for.cond.14
crackSHA1_for.cond.14:
   # %var580 = icmp sle i32 %digit.3_for.cond.14, 4

   li t1, 4
   sub t2, s1, t1
   sltz    a0, t2
   seqz    t1, t2
   or a0, a0, t1
   # br i1 %var580, label %for.body.14, label %for.back.14

   bne      a0, x0, .+8
   j crackSHA1_for.back.14
   # phi start 
   # phi end 
   j crackSHA1_for.body.14

   .section .text
   .globl crackSHA1_for.body.14
crackSHA1_for.body.14:
   # br label %for.cond.15

   # phi start 
   li a0, 0
   # phi end 
   j crackSHA1_for.cond.15

   .section .text
   .globl crackSHA1_for.cond.15
crackSHA1_for.cond.15:
   # %var584 = icmp slt i32 %i.7_for.cond.15, %digit.3_for.cond.14

   sub t2, a0, s1
   sltz    a1, t2
   # br i1 %var584, label %for.body.15, label %for.back.15

   bne      a1, x0, .+8
   j crackSHA1_for.back.15
   # phi start 
   # phi end 
   j crackSHA1_for.body.15

   .section .text
   .globl crackSHA1_for.body.15
crackSHA1_for.body.15:
   # %var585 = load ptr, ptr @inputBuffer

   la t0, @inputBuffer
   lw a1, 0(t0)
   # %var587 = getelementptr i32, ptr %var585, i32 %i.7_for.cond.15

   slli t1, a0, 2
   add a1, t1, a1
   # store i32 48, ptr %var587

   li t0, 48
   sw t0, 0(a1)
   # br label %for.step.15

   # phi start 
   # phi end 
   j crackSHA1_for.step.15

   .section .text
   .globl crackSHA1_for.step.15
crackSHA1_for.step.15:
   # %var590 = add i32 %i.7_for.cond.15, 1

   addi a0, a0, 1
   # br label %for.cond.15

   # phi start 
   # phi end 
   j crackSHA1_for.cond.15

   .section .text
   .globl crackSHA1_for.back.15
crackSHA1_for.back.15:
   # br label %while.cond.0

   # phi start 
   # phi end 
   j crackSHA1_while.cond.0

   .section .text
   .globl crackSHA1_while.cond.0
crackSHA1_while.cond.0:
   # br i1 true, label %while.body.0, label %while.cond.0_and_while.back.0

   # phi start 
   # phi end 
   j crackSHA1_while.body.0

   .section .text
   .globl crackSHA1_while.body.0
crackSHA1_while.body.0:
   # %var592 = load ptr, ptr @inputBuffer

   la t0, @inputBuffer
   lw x4, 0(t0)
   # %var591 = call ptr @sha1(ptr %var592, i32 %digit.3_for.cond.14)

   sw ra, 48(sp)
   sw x3, 0(sp)
   sw s0, 8(sp)
   sw s1, 12(sp)
   mv a0, x4
   mv a1, s1
   call sha1
   lw ra, 48(sp)
   mv x4, a0
   lw x3, 0(sp)
   lw s0, 8(sp)
   lw s1, 12(sp)
   # %var594 = call i1 @array_equal(ptr %var591, ptr %var534)

   sw ra, 48(sp)
   sw x3, 0(sp)
   sw x4, 4(sp)
   sw s0, 8(sp)
   sw s1, 12(sp)
   mv a1, s0
   mv a0, x4
   call array_equal
   lw ra, 48(sp)
   
   lw x3, 0(sp)
   lw x4, 4(sp)
   lw s0, 8(sp)
   lw s1, 12(sp)
   # br i1 %var594, label %if.then.18, label %if.else.18

   bne      a0, x0, .+8
   j crackSHA1_if.else.18
   # phi start 
   # phi end 
   j crackSHA1_if.then.18

   .section .text
   .globl crackSHA1_if.then.18
crackSHA1_if.then.18:
   # br label %for.cond.16

   # phi start 
   li x3, 0
   # phi end 
   j crackSHA1_for.cond.16

   .section .text
   .globl crackSHA1_for.cond.16
crackSHA1_for.cond.16:
   # %var600 = icmp slt i32 %i.7_for.cond.16, %digit.3_for.cond.14

   sub t2, x3, s1
   sltz    x4, t2
   # br i1 %var600, label %for.body.16, label %for.back.16

   bne      x4, x0, .+8
   j crackSHA1_for.back.16
   # phi start 
   # phi end 
   j crackSHA1_for.body.16

   .section .text
   .globl crackSHA1_for.body.16
crackSHA1_for.body.16:
   # %var603 = load ptr, ptr @inputBuffer

   la t0, @inputBuffer
   lw x4, 0(t0)
   # %var605 = getelementptr i32, ptr %var603, i32 %i.7_for.cond.16

   slli t1, x3, 2
   add x4, t1, x4
   # %var606 = load i32, ptr %var605

   lw x4, 0(x4)
   # %var602 = call ptr @int2chr(i32 %var606)

   sw ra, 48(sp)
   sw x3, 0(sp)
   sw s1, 12(sp)
   mv a0, x4
   call int2chr
   lw ra, 48(sp)
   mv x4, a0
   lw x3, 0(sp)
   lw s1, 12(sp)
   # call void @print(ptr %var602)

   sw ra, 48(sp)
   sw x3, 0(sp)
   sw s1, 12(sp)
   mv a0, x4
   call print
   lw ra, 48(sp)
   sw a0, 36(sp)
   lw x3, 0(sp)
   lw s1, 12(sp)
   # br label %for.step.16

   # phi start 
   # phi end 
   j crackSHA1_for.step.16

   .section .text
   .globl crackSHA1_for.step.16
crackSHA1_for.step.16:
   # %var608 = add i32 %i.7_for.cond.16, 1

   addi x3, x3, 1
   # br label %for.cond.16

   # phi start 
   # phi end 
   j crackSHA1_for.cond.16

   .section .text
   .globl crackSHA1_for.back.16
crackSHA1_for.back.16:
   # call void @println(ptr @.str..6)

   sw ra, 48(sp)
   la a0, @.str..6
   call println
   lw ra, 48(sp)
   sw a0, 40(sp)
   # ret void

   addi sp, sp, 64
   # phi start 
   # phi end 
   ret

   .section .text
   .globl crackSHA1_if.else.18
crackSHA1_if.else.18:
   # br label %if.back.18

   # phi start 
   # phi end 
   j crackSHA1_if.back.18

   .section .text
   .globl crackSHA1_if.back.18
crackSHA1_if.back.18:
   # %var611 = load ptr, ptr @inputBuffer

   la t0, @inputBuffer
   lw a0, 0(t0)
   # %var610 = call i1 @nextText(ptr %var611, i32 %digit.3_for.cond.14)

   sw ra, 48(sp)
   sw x3, 0(sp)
   sw x4, 4(sp)
   sw s0, 8(sp)
   sw s1, 12(sp)
   mv a1, s1
   call nextText
   lw ra, 48(sp)
   
   lw x3, 0(sp)
   lw x4, 4(sp)
   lw s0, 8(sp)
   lw s1, 12(sp)
   # %var613 = xor i1 %var610, true

   xori a0, a0, 1
   # br i1 %var613, label %if.then.19, label %if.else.19

   bne      a0, x0, .+8
   j crackSHA1_if.else.19
   # phi start 
   # phi end 
   j crackSHA1_if.then.19

   .section .text
   .globl crackSHA1_if.then.19
crackSHA1_if.then.19:
   # br label %while.back.0

   # phi start 
   # phi end 
   j crackSHA1_while.back.0

   .section .text
   .globl crackSHA1_if.else.19
crackSHA1_if.else.19:
   # br label %if.back.19

   # phi start 
   # phi end 
   j crackSHA1_if.back.19

   .section .text
   .globl crackSHA1_if.back.19
crackSHA1_if.back.19:
   # br label %while.cond.0

   # phi start 
   # phi end 
   j crackSHA1_while.cond.0

   .section .text
   .globl crackSHA1_while.back.0
crackSHA1_while.back.0:
   # br label %for.step.14

   # phi start 
   # phi end 
   j crackSHA1_for.step.14

   .section .text
   .globl crackSHA1_for.step.14
crackSHA1_for.step.14:
   # %var615 = add i32 %digit.3_for.cond.14, 1

   addi s1, s1, 1
   # br label %for.cond.14

   # phi start 
   # phi end 
   j crackSHA1_for.cond.14

   .section .text
   .globl crackSHA1_for.back.14
crackSHA1_for.back.14:
   # call void @println(ptr @.str..7)

   sw ra, 48(sp)
   la a0, @.str..7
   call println
   lw ra, 48(sp)
   sw a0, 44(sp)
   # ret void

   addi sp, sp, 64
   # phi start 
   # phi end 
   ret

   .section .text
   .globl crackSHA1_while.cond.0_and_while.back.0
crackSHA1_while.cond.0_and_while.back.0:
   # br label %while.back.0

   # phi start 
   # phi end 
   j crackSHA1_while.back.0

   .section .text
   .globl toStringHex
toStringHex:
   addi sp, sp, -36
   # phi start 
   # phi end 
   mv x3, a0

   .section .text
   .globl toStringHex_entry
toStringHex_entry:
   # br label %for.cond.1

   # phi start 
   li s0, 28
   la x4, @.str..2
   # phi end 
   j toStringHex_for.cond.1

   .section .text
   .globl toStringHex_for.cond.1
toStringHex_for.cond.1:
   # %var63 = icmp sge i32 %i.2_for.cond.1, 0

   li t1, 0
   sub t2, s0, t1
   sgtz    s1, t2
   seqz    t1, t2
   or s1, s1, t1
   # br i1 %var63, label %for.body.1, label %for.back.1

   bne      s1, x0, .+8
   j toStringHex_for.back.1
   # phi start 
   # phi end 
   j toStringHex_for.body.1

   .section .text
   .globl toStringHex_for.body.1
toStringHex_for.body.1:
   # %var66 = ashr i32 %x, %i.2_for.cond.1

   sra s1, x3, s0
   # %var67 = and i32 %var66, 15

   andi s1, s1, 15
   # %var69 = icmp slt i32 %var67, 10

   li t1, 10
   sub t2, s1, t1
   sltz    a0, t2
   # br i1 %var69, label %if.then.4, label %if.else.4

   bne      a0, x0, .+8
   j toStringHex_if.else.4
   # phi start 
   # phi end 
   j toStringHex_if.then.4

   .section .text
   .globl toStringHex_if.then.4
toStringHex_if.then.4:
   # %var74 = add i32 48, %var67

   addi s1, s1, 48
   # %var72 = call ptr @int2chr(i32 %var74)

   sw ra, 20(sp)
   sw x3, 0(sp)
   sw x4, 4(sp)
   sw s0, 8(sp)
   mv a0, s1
   call int2chr
   lw ra, 20(sp)
   mv s1, a0
   lw x3, 0(sp)
   lw x4, 4(sp)
   lw s0, 8(sp)
   # %var75 = call ptr @string.add(ptr %ret.1_for.cond.1, ptr %var72)

   sw ra, 20(sp)
   sw x3, 0(sp)
   sw s0, 8(sp)
   mv a1, s1
   mv a0, x4
   call string.add
   lw ra, 20(sp)
   mv x4, a0
   lw x3, 0(sp)
   lw s0, 8(sp)
   # %var76 = call ptr @string.copy(ptr %var75)

   sw ra, 20(sp)
   sw x3, 0(sp)
   sw s0, 8(sp)
   mv a0, x4
   call string.copy
   lw ra, 20(sp)
   mv x4, a0
   lw x3, 0(sp)
   lw s0, 8(sp)
   # br label %if.back.4

   # phi start 
   # phi end 
   j toStringHex_if.back.4

   .section .text
   .globl toStringHex_if.else.4
toStringHex_if.else.4:
   # %var81 = add i32 65, %var67

   addi s1, s1, 65
   # %var82 = sub i32 %var81, 10

   addi s1, s1, -10
   # %var79 = call ptr @int2chr(i32 %var82)

   sw ra, 20(sp)
   sw x3, 0(sp)
   sw x4, 4(sp)
   sw s0, 8(sp)
   mv a0, s1
   call int2chr
   lw ra, 20(sp)
   mv s1, a0
   lw x3, 0(sp)
   lw x4, 4(sp)
   lw s0, 8(sp)
   # %var83 = call ptr @string.add(ptr %ret.1_for.cond.1, ptr %var79)

   sw ra, 20(sp)
   sw x3, 0(sp)
   sw s0, 8(sp)
   mv a0, x4
   mv a1, s1
   call string.add
   lw ra, 20(sp)
   mv x4, a0
   lw x3, 0(sp)
   lw s0, 8(sp)
   # %var84 = call ptr @string.copy(ptr %var83)

   sw ra, 20(sp)
   sw x3, 0(sp)
   sw s0, 8(sp)
   mv a0, x4
   call string.copy
   lw ra, 20(sp)
   mv x4, a0
   lw x3, 0(sp)
   lw s0, 8(sp)
   # br label %if.back.4

   # phi start 
   # phi end 
   j toStringHex_if.back.4

   .section .text
   .globl toStringHex_if.back.4
toStringHex_if.back.4:
   # br label %for.step.1

   # phi start 
   # phi end 
   j toStringHex_for.step.1

   .section .text
   .globl toStringHex_for.step.1
toStringHex_for.step.1:
   # %var87 = sub i32 %i.2_for.cond.1, 4

   addi s0, s0, -4
   # br label %for.cond.1

   # phi start 
   # phi end 
   j toStringHex_for.cond.1

   .section .text
   .globl toStringHex_for.back.1
toStringHex_for.back.1:
   # ret ptr %ret.1_for.cond.1

   mv a0, x4
   addi sp, sp, 36
   # phi start 
   # phi end 
   ret

   .section .text
   .globl computeSHA1
computeSHA1:
   addi sp, sp, -40
   # phi start 
   # phi end 
   mv x3, a0

   .section .text
   .globl computeSHA1_entry
computeSHA1_entry:
   # br label %for.cond.8

   # phi start 
   li x4, 0
   # phi end 
   j computeSHA1_for.cond.8

   .section .text
   .globl computeSHA1_for.cond.8
computeSHA1_for.cond.8:
   # %var449 = call i32 @string.length(ptr %input)

   sw ra, 24(sp)
   sw x3, 0(sp)
   sw x4, 4(sp)
   mv a0, x3
   call string.length
   lw ra, 24(sp)
   mv s0, a0
   lw x3, 0(sp)
   lw x4, 4(sp)
   # %var450 = icmp slt i32 %i.4_for.cond.8, %var449

   sub t2, x4, s0
   sltz    s0, t2
   # br i1 %var450, label %for.body.8, label %for.back.8

   bne      s0, x0, .+8
   j computeSHA1_for.back.8
   # phi start 
   # phi end 
   j computeSHA1_for.body.8

   .section .text
   .globl computeSHA1_for.body.8
computeSHA1_for.body.8:
   # %var451 = load ptr, ptr @inputBuffer

   la t0, @inputBuffer
   lw s0, 0(t0)
   # %var453 = getelementptr i32, ptr %var451, i32 %i.4_for.cond.8

   slli t1, x4, 2
   add s0, t1, s0
   # %var457 = call i32 @string.ord(ptr %input, i32 %i.4_for.cond.8)

   sw ra, 24(sp)
   sw x3, 0(sp)
   sw x4, 4(sp)
   sw s0, 8(sp)
   mv a1, x4
   mv a0, x3
   call string.ord
   lw ra, 24(sp)
   mv s1, a0
   lw x3, 0(sp)
   lw x4, 4(sp)
   lw s0, 8(sp)
   # store i32 %var457, ptr %var453

   sw s1, 0(s0)
   # br label %for.step.8

   # phi start 
   # phi end 
   j computeSHA1_for.step.8

   .section .text
   .globl computeSHA1_for.step.8
computeSHA1_for.step.8:
   # %var459 = add i32 %i.4_for.cond.8, 1

   addi x4, x4, 1
   # br label %for.cond.8

   # phi start 
   # phi end 
   j computeSHA1_for.cond.8

   .section .text
   .globl computeSHA1_for.back.8
computeSHA1_for.back.8:
   # %var461 = load ptr, ptr @inputBuffer

   la t0, @inputBuffer
   lw x4, 0(t0)
   # %var463 = call i32 @string.length(ptr %input)

   sw ra, 24(sp)
   sw x4, 4(sp)
   mv a0, x3
   call string.length
   lw ra, 24(sp)
   mv x3, a0
   lw x4, 4(sp)
   # %var460 = call ptr @sha1(ptr %var461, i32 %var463)

   sw ra, 24(sp)
   mv a0, x4
   mv a1, x3
   call sha1
   lw ra, 24(sp)
   mv x3, a0
   # br label %for.cond.9

   # phi start 
   li x4, 0
   # phi end 
   j computeSHA1_for.cond.9

   .section .text
   .globl computeSHA1_for.cond.9
computeSHA1_for.cond.9:
   # %var467 = call i32 @array.size(ptr %var460)

   sw ra, 24(sp)
   sw x3, 0(sp)
   sw x4, 4(sp)
   mv a0, x3
   call array.size
   lw ra, 24(sp)
   mv s0, a0
   lw x3, 0(sp)
   lw x4, 4(sp)
   # %var468 = icmp slt i32 %i.4_for.cond.9, %var467

   sub t2, x4, s0
   sltz    s0, t2
   # br i1 %var468, label %for.body.9, label %for.back.9

   bne      s0, x0, .+8
   j computeSHA1_for.back.9
   # phi start 
   # phi end 
   j computeSHA1_for.body.9

   .section .text
   .globl computeSHA1_for.body.9
computeSHA1_for.body.9:
   # %var473 = getelementptr i32, ptr %var460, i32 %i.4_for.cond.9

   slli t1, x4, 2
   add s0, t1, x3
   # %var474 = load i32, ptr %var473

   lw s0, 0(s0)
   # %var470 = call ptr @toStringHex(i32 %var474)

   sw ra, 24(sp)
   sw x3, 0(sp)
   sw x4, 4(sp)
   mv a0, s0
   call toStringHex
   lw ra, 24(sp)
   mv s0, a0
   lw x3, 0(sp)
   lw x4, 4(sp)
   # call void @print(ptr %var470)

   sw ra, 24(sp)
   sw x3, 0(sp)
   sw x4, 4(sp)
   mv a0, s0
   call print
   lw ra, 24(sp)
   sw a0, 16(sp)
   lw x3, 0(sp)
   lw x4, 4(sp)
   # br label %for.step.9

   # phi start 
   # phi end 
   j computeSHA1_for.step.9

   .section .text
   .globl computeSHA1_for.step.9
computeSHA1_for.step.9:
   # %var476 = add i32 %i.4_for.cond.9, 1

   addi x4, x4, 1
   # br label %for.cond.9

   # phi start 
   # phi end 
   j computeSHA1_for.cond.9

   .section .text
   .globl computeSHA1_for.back.9
computeSHA1_for.back.9:
   # call void @println(ptr @.str..4)

   sw ra, 24(sp)
   la a0, @.str..4
   call println
   lw ra, 24(sp)
   sw a0, 20(sp)
   # ret void

   addi sp, sp, 40
   # phi start 
   # phi end 
   ret

   .section .text
   .globl sha1
sha1:
   addi sp, sp, -88
   mv x3, a0
   # phi start 
   # phi end 
   mv x4, a1

   .section .text
   .globl sha1_entry
sha1_entry:
   # %var159 = add i32 %length, 64

   addi s0, x4, 64
   # %var160 = sub i32 %var159, 56

   addi s0, s0, -56
   # %var161 = sdiv i32 %var160, 64

   li t1, 64
   div s0, s0, t1
   # %var162 = add i32 %var161, 1

   addi s0, s0, 1
   # %var164 = load i32, ptr @MAXCHUNK

   la t0, @MAXCHUNK
   lw s1, 0(t0)
   # %var165 = icmp sgt i32 %var162, %var164

   sub t2, s0, s1
   sgtz    s1, t2
   # br i1 %var165, label %if.then.7, label %if.else.7

   bne      s1, x0, .+8
   j sha1_if.else.7
   # phi start 
   # phi end 
   j sha1_if.then.7

   .section .text
   .globl sha1_if.then.7
sha1_if.then.7:
   # call void @println(ptr @.str..3)

   sw ra, 72(sp)
   la a0, @.str..3
   call println
   lw ra, 72(sp)
   sw a0, 68(sp)
   # ret ptr null

   li a0, 0
   addi sp, sp, 88
   # phi start 
   # phi end 
   ret

   .section .text
   .globl sha1_if.else.7
sha1_if.else.7:
   # br label %if.back.7

   # phi start 
   # phi end 
   j sha1_if.back.7

   .section .text
   .globl sha1_if.back.7
sha1_if.back.7:
   # br label %for.cond.2

   # phi start 
   li s1, 0
   # phi end 
   j sha1_for.cond.2

   .section .text
   .globl sha1_for.cond.2
sha1_for.cond.2:
   # %var170 = icmp slt i32 %i.3_for.cond.2, %var162

   sub t2, s1, s0
   sltz    a0, t2
   # br i1 %var170, label %for.body.2, label %for.back.2

   bne      a0, x0, .+8
   j sha1_for.back.2
   # phi start 
   # phi end 
   j sha1_for.body.2

   .section .text
   .globl sha1_for.body.2
sha1_for.body.2:
   # br label %for.cond.3

   # phi start 
   li a0, 0
   # phi end 
   j sha1_for.cond.3

   .section .text
   .globl sha1_for.cond.3
sha1_for.cond.3:
   # %var173 = icmp slt i32 %j.1_for.cond.3, 80

   li t1, 80
   sub t2, a0, t1
   sltz    a1, t2
   # br i1 %var173, label %for.body.3, label %for.back.3

   bne      a1, x0, .+8
   j sha1_for.back.3
   # phi start 
   # phi end 
   j sha1_for.body.3

   .section .text
   .globl sha1_for.body.3
sha1_for.body.3:
   # %var174 = load ptr, ptr @chunks

   la t0, @chunks
   lw a1, 0(t0)
   # %var176 = getelementptr ptr, ptr %var174, i32 %i.3_for.cond.2

   slli t1, s1, 2
   add a1, t1, a1
   # %var177 = load ptr, ptr %var176

   lw a1, 0(a1)
   # %var179 = getelementptr i32, ptr %var177, i32 %j.1_for.cond.3

   slli t1, a0, 2
   add a1, t1, a1
   # store i32 0, ptr %var179

   li t0, 0
   sw t0, 0(a1)
   # br label %for.step.3

   # phi start 
   # phi end 
   j sha1_for.step.3

   .section .text
   .globl sha1_for.step.3
sha1_for.step.3:
   # %var182 = add i32 %j.1_for.cond.3, 1

   addi a0, a0, 1
   # br label %for.cond.3

   # phi start 
   # phi end 
   j sha1_for.cond.3

   .section .text
   .globl sha1_for.back.3
sha1_for.back.3:
   # br label %for.step.2

   # phi start 
   # phi end 
   j sha1_for.step.2

   .section .text
   .globl sha1_for.step.2
sha1_for.step.2:
   # %var184 = add i32 %i.3_for.cond.2, 1

   addi s1, s1, 1
   # br label %for.cond.2

   # phi start 
   # phi end 
   j sha1_for.cond.2

   .section .text
   .globl sha1_for.back.2
sha1_for.back.2:
   # br label %for.cond.4

   # phi start 
   li s1, 0
   # phi end 
   j sha1_for.cond.4

   .section .text
   .globl sha1_for.cond.4
sha1_for.cond.4:
   # %var188 = icmp slt i32 %i.3_for.cond.4, %length

   sub t2, s1, x4
   sltz    a0, t2
   # br i1 %var188, label %for.body.4, label %for.back.4

   bne      a0, x0, .+8
   j sha1_for.back.4
   # phi start 
   # phi end 
   j sha1_for.body.4

   .section .text
   .globl sha1_for.body.4
sha1_for.body.4:
   # %var189 = load ptr, ptr @chunks

   la t0, @chunks
   lw a0, 0(t0)
   # %var191 = sdiv i32 %i.3_for.cond.4, 64

   li t1, 64
   div a1, s1, t1
   # %var192 = getelementptr ptr, ptr %var189, i32 %var191

   slli t1, a1, 2
   add a0, t1, a0
   # %var193 = load ptr, ptr %var192

   lw a0, 0(a0)
   # %var195 = srem i32 %i.3_for.cond.4, 64

   li t1, 64
   rem a1, s1, t1
   # %var196 = sdiv i32 %var195, 4

   li t1, 4
   div a1, a1, t1
   # %var197 = getelementptr i32, ptr %var193, i32 %var196

   slli t1, a1, 2
   add a0, t1, a0
   # %var199 = load ptr, ptr @chunks

   la t0, @chunks
   lw a1, 0(t0)
   # %var201 = sdiv i32 %i.3_for.cond.4, 64

   li t1, 64
   div a2, s1, t1
   # %var202 = getelementptr ptr, ptr %var199, i32 %var201

   slli t1, a2, 2
   add a1, t1, a1
   # %var203 = load ptr, ptr %var202

   lw a1, 0(a1)
   # %var205 = srem i32 %i.3_for.cond.4, 64

   li t1, 64
   rem a2, s1, t1
   # %var206 = sdiv i32 %var205, 4

   li t1, 4
   div a2, a2, t1
   # %var207 = getelementptr i32, ptr %var203, i32 %var206

   slli t1, a2, 2
   add a1, t1, a1
   # %var208 = load i32, ptr %var207

   lw a1, 0(a1)
   # %var211 = getelementptr i32, ptr %input, i32 %i.3_for.cond.4

   slli t1, s1, 2
   add a2, t1, x3
   # %var212 = load i32, ptr %var211

   lw a2, 0(a2)
   # %var214 = srem i32 %i.3_for.cond.4, 4

   li t1, 4
   rem a3, s1, t1
   # %var215 = sub i32 3, %var214

   li t0, 3
   sub a3, t0, a3
   # %var216 = mul i32 %var215, 8

   li t1, 8
   mul a3, a3, t1
   # %var217 = shl i32 %var212, %var216

   sll a2, a2, a3
   # %var218 = or i32 %var208, %var217

   or a1, a1, a2
   # store i32 %var218, ptr %var197

   sw a1, 0(a0)
   # br label %for.step.4

   # phi start 
   # phi end 
   j sha1_for.step.4

   .section .text
   .globl sha1_for.step.4
sha1_for.step.4:
   # %var220 = add i32 %i.3_for.cond.4, 1

   addi s1, s1, 1
   # br label %for.cond.4

   # phi start 
   # phi end 
   j sha1_for.cond.4

   .section .text
   .globl sha1_for.back.4
sha1_for.back.4:
   # %var221 = load ptr, ptr @chunks

   la t0, @chunks
   lw x3, 0(t0)
   # %var223 = sdiv i32 %i.3_for.cond.4, 64

   li t1, 64
   div a0, s1, t1
   # %var224 = getelementptr ptr, ptr %var221, i32 %var223

   slli t1, a0, 2
   add x3, t1, x3
   # %var225 = load ptr, ptr %var224

   lw x3, 0(x3)
   # %var227 = srem i32 %i.3_for.cond.4, 64

   li t1, 64
   rem a0, s1, t1
   # %var228 = sdiv i32 %var227, 4

   li t1, 4
   div a0, a0, t1
   # %var229 = getelementptr i32, ptr %var225, i32 %var228

   slli t1, a0, 2
   add x3, t1, x3
   # %var231 = load ptr, ptr @chunks

   la t0, @chunks
   lw a0, 0(t0)
   # %var233 = sdiv i32 %i.3_for.cond.4, 64

   li t1, 64
   div a1, s1, t1
   # %var234 = getelementptr ptr, ptr %var231, i32 %var233

   slli t1, a1, 2
   add a0, t1, a0
   # %var235 = load ptr, ptr %var234

   lw a0, 0(a0)
   # %var237 = srem i32 %i.3_for.cond.4, 64

   li t1, 64
   rem a1, s1, t1
   # %var238 = sdiv i32 %var237, 4

   li t1, 4
   div a1, a1, t1
   # %var239 = getelementptr i32, ptr %var235, i32 %var238

   slli t1, a1, 2
   add a0, t1, a0
   # %var240 = load i32, ptr %var239

   lw a0, 0(a0)
   # %var242 = srem i32 %i.3_for.cond.4, 4

   li t1, 4
   rem s1, s1, t1
   # %var243 = sub i32 3, %var242

   li t0, 3
   sub s1, t0, s1
   # %var244 = mul i32 %var243, 8

   li t1, 8
   mul s1, s1, t1
   # %var245 = shl i32 128, %var244

   li t0, 128
   sll s1, t0, s1
   # %var246 = or i32 %var240, %var245

   or s1, a0, s1
   # store i32 %var246, ptr %var229

   sw s1, 0(x3)
   # %var247 = load ptr, ptr @chunks

   la t0, @chunks
   lw x3, 0(t0)
   # %var249 = sub i32 %var162, 1

   addi s1, s0, -1
   # %var250 = getelementptr ptr, ptr %var247, i32 %var249

   slli t1, s1, 2
   add x3, t1, x3
   # %var251 = load ptr, ptr %var250

   lw x3, 0(x3)
   # %var252 = getelementptr i32, ptr %var251, i32 15

   addi x3, x3, 60
   # %var255 = shl i32 %length, 3

   slli s1, x4, 3
   # store i32 %var255, ptr %var252

   sw s1, 0(x3)
   # %var256 = load ptr, ptr @chunks

   la t0, @chunks
   lw x3, 0(t0)
   # %var258 = sub i32 %var162, 1

   addi s1, s0, -1
   # %var259 = getelementptr ptr, ptr %var256, i32 %var258

   slli t1, s1, 2
   add x3, t1, x3
   # %var260 = load ptr, ptr %var259

   lw x3, 0(x3)
   # %var261 = getelementptr i32, ptr %var260, i32 14

   addi x3, x3, 56
   # %var264 = ashr i32 %length, 29

   srai x4, x4, 29
   # %var265 = and i32 %var264, 7

   andi x4, x4, 7
   # store i32 %var265, ptr %var261

   sw x4, 0(x3)
   # %var266 = call i32 @lohi(i32 43913, i32 61389)

   sw ra, 72(sp)
   sw s0, 8(sp)
   li a1, 61389
   li a0, 43913
   call lohi
   lw ra, 72(sp)
   mv x3, a0
   lw s0, 8(sp)
   # %var267 = call i32 @lohi(i32 56574, i32 39098)

   sw ra, 72(sp)
   sw x3, 0(sp)
   sw s0, 8(sp)
   li a1, 39098
   li a0, 56574
   call lohi
   lw ra, 72(sp)
   mv x4, a0
   lw x3, 0(sp)
   lw s0, 8(sp)
   # %var268 = call i32 @lohi(i32 57840, i32 50130)

   sw ra, 72(sp)
   sw x3, 0(sp)
   sw x4, 4(sp)
   sw s0, 8(sp)
   li a1, 50130
   li a0, 57840
   call lohi
   lw ra, 72(sp)
   mv s1, a0
   lw x3, 0(sp)
   lw x4, 4(sp)
   lw s0, 8(sp)
   # br label %for.cond.5

   # phi start 
   li a4, 0
   li a5, 271733878
   mv a3, x4
   li a0, 0
   li a2, 0
   mv a1, s1
   li s1, 1732584193
   mv x4, x3
   li x3, 0
   # phi end 
   j sha1_for.cond.5

   .section .text
   .globl sha1_for.cond.5
sha1_for.cond.5:
   # %var272 = icmp slt i32 %i.3_for.cond.5, %var162

   sub t2, a0, s0
   sltz    a6, t2
   # br i1 %var272, label %for.body.5, label %for.back.5

   bne      a6, x0, .+8
   j sha1_for.back.5
   # phi start 
   # phi end 
   j sha1_for.body.5

   .section .text
   .globl sha1_for.body.5
sha1_for.body.5:
   # br label %for.cond.6

   # phi start 
   li a6, 16
   # phi end 
   j sha1_for.cond.6

   .section .text
   .globl sha1_for.cond.6
sha1_for.cond.6:
   # %var275 = icmp slt i32 %j.1_for.cond.6, 80

   li t1, 80
   sub t2, a6, t1
   sltz    a7, t2
   # br i1 %var275, label %for.body.6, label %for.back.6

   bne      a7, x0, .+8
   j sha1_for.back.6
   # phi start 
   # phi end 
   j sha1_for.body.6

   .section .text
   .globl sha1_for.body.6
sha1_for.body.6:
   # %var276 = load ptr, ptr @chunks

   la t0, @chunks
   lw a7, 0(t0)
   # %var278 = getelementptr ptr, ptr %var276, i32 %i.3_for.cond.5

   slli t1, a0, 2
   add a7, t1, a7
   # %var279 = load ptr, ptr %var278

   lw a7, 0(a7)
   # %var281 = getelementptr i32, ptr %var279, i32 %j.1_for.cond.6

   slli t1, a6, 2
   add a7, t1, a7
   # %var284 = load ptr, ptr @chunks

   la t0, @chunks
   lw s2, 0(t0)
   # %var286 = getelementptr ptr, ptr %var284, i32 %i.3_for.cond.5

   slli t1, a0, 2
   add s2, t1, s2
   # %var287 = load ptr, ptr %var286

   lw s2, 0(s2)
   # %var289 = sub i32 %j.1_for.cond.6, 3

   addi s3, a6, -3
   # %var290 = getelementptr i32, ptr %var287, i32 %var289

   slli t1, s3, 2
   add s2, t1, s2
   # %var291 = load i32, ptr %var290

   lw s2, 0(s2)
   # %var292 = load ptr, ptr @chunks

   la t0, @chunks
   lw s3, 0(t0)
   # %var294 = getelementptr ptr, ptr %var292, i32 %i.3_for.cond.5

   slli t1, a0, 2
   add s3, t1, s3
   # %var295 = load ptr, ptr %var294

   lw s3, 0(s3)
   # %var297 = sub i32 %j.1_for.cond.6, 8

   addi s4, a6, -8
   # %var298 = getelementptr i32, ptr %var295, i32 %var297

   slli t1, s4, 2
   add s3, t1, s3
   # %var299 = load i32, ptr %var298

   lw s3, 0(s3)
   # %var300 = xor i32 %var291, %var299

   xor s2, s2, s3
   # %var301 = load ptr, ptr @chunks

   la t0, @chunks
   lw s3, 0(t0)
   # %var303 = getelementptr ptr, ptr %var301, i32 %i.3_for.cond.5

   slli t1, a0, 2
   add s3, t1, s3
   # %var304 = load ptr, ptr %var303

   lw s3, 0(s3)
   # %var306 = sub i32 %j.1_for.cond.6, 14

   addi s4, a6, -14
   # %var307 = getelementptr i32, ptr %var304, i32 %var306

   slli t1, s4, 2
   add s3, t1, s3
   # %var308 = load i32, ptr %var307

   lw s3, 0(s3)
   # %var309 = xor i32 %var300, %var308

   xor s2, s2, s3
   # %var310 = load ptr, ptr @chunks

   la t0, @chunks
   lw s3, 0(t0)
   # %var312 = getelementptr ptr, ptr %var310, i32 %i.3_for.cond.5

   slli t1, a0, 2
   add s3, t1, s3
   # %var313 = load ptr, ptr %var312

   lw s3, 0(s3)
   # %var315 = sub i32 %j.1_for.cond.6, 16

   addi s4, a6, -16
   # %var316 = getelementptr i32, ptr %var313, i32 %var315

   slli t1, s4, 2
   add s3, t1, s3
   # %var317 = load i32, ptr %var316

   lw s3, 0(s3)
   # %var318 = xor i32 %var309, %var317

   xor s2, s2, s3
   # %var283 = call i32 @rotate_left(i32 %var318, i32 1)

   sw ra, 72(sp)
   sw a1, 20(sp)
   sw a2, 24(sp)
   sw a3, 28(sp)
   sw a4, 32(sp)
   sw a5, 36(sp)
   sw a6, 40(sp)
   sw a7, 44(sp)
   sw x3, 0(sp)
   sw x4, 4(sp)
   sw s0, 8(sp)
   sw s1, 12(sp)
   sw a0, 16(sp)
   mv a0, s2
   li a1, 1
   call rotate_left
   lw ra, 72(sp)
   mv s2, a0
   lw a1, 20(sp)
   lw a2, 24(sp)
   lw a3, 28(sp)
   lw a4, 32(sp)
   lw a5, 36(sp)
   lw a6, 40(sp)
   lw a7, 44(sp)
   lw x3, 0(sp)
   lw x4, 4(sp)
   lw s0, 8(sp)
   lw s1, 12(sp)
   lw a0, 16(sp)
   # store i32 %var283, ptr %var281

   sw s2, 0(a7)
   # br label %for.step.6

   # phi start 
   # phi end 
   j sha1_for.step.6

   .section .text
   .globl sha1_for.step.6
sha1_for.step.6:
   # %var320 = add i32 %j.1_for.cond.6, 1

   addi a6, a6, 1
   # br label %for.cond.6

   # phi start 
   # phi end 
   j sha1_for.cond.6

   .section .text
   .globl sha1_for.back.6
sha1_for.back.6:
   # br label %for.cond.7

   # phi start 
   mv a7, a2
   mv s3, s1
   li s4, 0
   mv s5, a4
   mv a6, a1
   mv s2, a5
   mv a4, a3
   mv a2, x4
   # phi end 
   j sha1_for.cond.7

   .section .text
   .globl sha1_for.cond.7
sha1_for.cond.7:
   # %var328 = icmp slt i32 %j.1_for.cond.7, 80

   li t1, 80
   sub t2, s4, t1
   sltz    s6, t2
   # br i1 %var328, label %for.body.7, label %for.back.7

   bne      s6, x0, .+8
   j sha1_for.back.7
   # phi start 
   # phi end 
   j sha1_for.body.7

   .section .text
   .globl sha1_for.body.7
sha1_for.body.7:
   # %var330 = icmp slt i32 %j.1_for.cond.7, 20

   li t1, 20
   sub t2, s4, t1
   sltz    x3, t2
   # br i1 %var330, label %if.then.8, label %if.else.8

   bne      x3, x0, .+8
   j sha1_if.else.8
   # phi start 
   # phi end 
   j sha1_if.then.8

   .section .text
   .globl sha1_if.then.8
sha1_if.then.8:
   # %var334 = and i32 %b.1_for.cond.7, %c.1_for.cond.7

   and x3, a2, a4
   # %var336 = xor i32 %b.1_for.cond.7, -1

   xori a7, a2, -1
   # %var338 = and i32 %var336, %d.1_for.cond.7

   and a7, a7, s2
   # %var339 = or i32 %var334, %var338

   or x3, x3, a7
   # br label %if.back.8

   # phi start 
   mv a7, x3
   li x3, 1518500249
   # phi end 
   j sha1_if.back.8

   .section .text
   .globl sha1_if.else.8
sha1_if.else.8:
   # %var342 = icmp slt i32 %j.1_for.cond.7, 40

   li t1, 40
   sub t2, s4, t1
   sltz    x3, t2
   # br i1 %var342, label %if.then.9, label %if.else.9

   bne      x3, x0, .+8
   j sha1_if.else.9
   # phi start 
   # phi end 
   j sha1_if.then.9

   .section .text
   .globl sha1_if.then.9
sha1_if.then.9:
   # %var346 = xor i32 %b.1_for.cond.7, %c.1_for.cond.7

   xor x3, a2, a4
   # %var348 = xor i32 %var346, %d.1_for.cond.7

   xor x3, x3, s2
   # br label %if.back.9

   # phi start 
   mv a7, x3
   li x3, 1859775393
   # phi end 
   j sha1_if.back.9

   .section .text
   .globl sha1_if.else.9
sha1_if.else.9:
   # %var351 = icmp slt i32 %j.1_for.cond.7, 60

   li t1, 60
   sub t2, s4, t1
   sltz    x3, t2
   # br i1 %var351, label %if.then.10, label %if.else.10

   bne      x3, x0, .+8
   j sha1_if.else.10
   # phi start 
   # phi end 
   j sha1_if.then.10

   .section .text
   .globl sha1_if.then.10
sha1_if.then.10:
   # %var355 = and i32 %b.1_for.cond.7, %c.1_for.cond.7

   and x3, a2, a4
   # %var358 = and i32 %b.1_for.cond.7, %d.1_for.cond.7

   and a7, a2, s2
   # %var359 = or i32 %var355, %var358

   or x3, x3, a7
   # %var362 = and i32 %c.1_for.cond.7, %d.1_for.cond.7

   and a7, a4, s2
   # %var363 = or i32 %var359, %var362

   or x3, x3, a7
   # %var365 = call i32 @lohi(i32 48348, i32 36635)

   sw ra, 72(sp)
   sw s3, 52(sp)
   sw s4, 56(sp)
   sw a0, 16(sp)
   sw a1, 20(sp)
   sw a2, 24(sp)
   sw a3, 28(sp)
   sw a4, 32(sp)
   sw a5, 36(sp)
   sw a6, 40(sp)
   sw x3, 0(sp)
   sw x4, 4(sp)
   sw s0, 8(sp)
   sw s1, 12(sp)
   sw s2, 48(sp)
   li a1, 36635
   li a0, 48348
   call lohi
   lw ra, 72(sp)
   mv a7, a0
   lw s3, 52(sp)
   lw s4, 56(sp)
   lw a0, 16(sp)
   lw a1, 20(sp)
   lw a2, 24(sp)
   lw a3, 28(sp)
   lw a4, 32(sp)
   lw a5, 36(sp)
   lw a6, 40(sp)
   lw x3, 0(sp)
   lw x4, 4(sp)
   lw s0, 8(sp)
   lw s1, 12(sp)
   lw s2, 48(sp)
   # br label %if.back.10

   # phi start 
   mv t6, a7
   mv a7, x3
   mv x3, t6
   # phi end 
   j sha1_if.back.10

   .section .text
   .globl sha1_if.else.10
sha1_if.else.10:
   # %var369 = xor i32 %b.1_for.cond.7, %c.1_for.cond.7

   xor x3, a2, a4
   # %var371 = xor i32 %var369, %d.1_for.cond.7

   xor x3, x3, s2
   # %var373 = call i32 @lohi(i32 49622, i32 51810)

   sw ra, 72(sp)
   sw s3, 52(sp)
   sw s4, 56(sp)
   sw a0, 16(sp)
   sw a1, 20(sp)
   sw a2, 24(sp)
   sw a3, 28(sp)
   sw a4, 32(sp)
   sw a5, 36(sp)
   sw a6, 40(sp)
   sw x3, 0(sp)
   sw x4, 4(sp)
   sw s0, 8(sp)
   sw s1, 12(sp)
   sw s2, 48(sp)
   li a0, 49622
   li a1, 51810
   call lohi
   lw ra, 72(sp)
   mv a7, a0
   lw s3, 52(sp)
   lw s4, 56(sp)
   lw a0, 16(sp)
   lw a1, 20(sp)
   lw a2, 24(sp)
   lw a3, 28(sp)
   lw a4, 32(sp)
   lw a5, 36(sp)
   lw a6, 40(sp)
   lw x3, 0(sp)
   lw x4, 4(sp)
   lw s0, 8(sp)
   lw s1, 12(sp)
   lw s2, 48(sp)
   # br label %if.back.10

   # phi start 
   mv t6, a7
   mv a7, x3
   mv x3, t6
   # phi end 
   j sha1_if.back.10

   .section .text
   .globl sha1_if.back.10
sha1_if.back.10:
   # br label %if.back.9

   # phi start 
   # phi end 
   j sha1_if.back.9

   .section .text
   .globl sha1_if.back.9
sha1_if.back.9:
   # br label %if.back.8

   # phi start 
   # phi end 
   j sha1_if.back.8

   .section .text
   .globl sha1_if.back.8
sha1_if.back.8:
   # %var377 = call i32 @rotate_left(i32 %a.1_for.cond.7, i32 5)

   sw ra, 72(sp)
   sw s3, 52(sp)
   sw s4, 56(sp)
   sw a0, 16(sp)
   sw a1, 20(sp)
   sw a2, 24(sp)
   sw a3, 28(sp)
   sw a4, 32(sp)
   sw a5, 36(sp)
   sw a6, 40(sp)
   sw a7, 44(sp)
   sw x3, 0(sp)
   sw x4, 4(sp)
   sw s0, 8(sp)
   sw s1, 12(sp)
   sw s2, 48(sp)
   mv a0, s3
   li a1, 5
   call rotate_left
   lw ra, 72(sp)
   mv s5, a0
   lw s3, 52(sp)
   lw s4, 56(sp)
   lw a0, 16(sp)
   lw a1, 20(sp)
   lw a2, 24(sp)
   lw a3, 28(sp)
   lw a4, 32(sp)
   lw a5, 36(sp)
   lw a6, 40(sp)
   lw a7, 44(sp)
   lw x3, 0(sp)
   lw x4, 4(sp)
   lw s0, 8(sp)
   lw s1, 12(sp)
   lw s2, 48(sp)
   # %var376 = call i32 @add(i32 %var377, i32 %e.1_for.cond.7)

   sw ra, 72(sp)
   sw s3, 52(sp)
   sw s4, 56(sp)
   sw a0, 16(sp)
   sw a1, 20(sp)
   sw a2, 24(sp)
   sw a3, 28(sp)
   sw a4, 32(sp)
   sw a5, 36(sp)
   sw a7, 44(sp)
   sw x3, 0(sp)
   sw x4, 4(sp)
   sw s0, 8(sp)
   sw s1, 12(sp)
   sw s2, 48(sp)
   mv a1, a6
   mv a0, s5
   call add
   lw ra, 72(sp)
   mv a6, a0
   lw s3, 52(sp)
   lw s4, 56(sp)
   lw a0, 16(sp)
   lw a1, 20(sp)
   lw a2, 24(sp)
   lw a3, 28(sp)
   lw a4, 32(sp)
   lw a5, 36(sp)
   lw a7, 44(sp)
   lw x3, 0(sp)
   lw x4, 4(sp)
   lw s0, 8(sp)
   lw s1, 12(sp)
   lw s2, 48(sp)
   # %var380 = call i32 @add(i32 %f.1_if.back.8, i32 %k.1_if.back.8)

   sw ra, 72(sp)
   sw s3, 52(sp)
   sw s4, 56(sp)
   sw a0, 16(sp)
   sw a1, 20(sp)
   sw a2, 24(sp)
   sw a3, 28(sp)
   sw a4, 32(sp)
   sw a5, 36(sp)
   sw a6, 40(sp)
   sw a7, 44(sp)
   sw x3, 0(sp)
   sw x4, 4(sp)
   sw s0, 8(sp)
   sw s1, 12(sp)
   sw s2, 48(sp)
   mv a1, x3
   mv a0, a7
   call add
   lw ra, 72(sp)
   mv s5, a0
   lw s3, 52(sp)
   lw s4, 56(sp)
   lw a0, 16(sp)
   lw a1, 20(sp)
   lw a2, 24(sp)
   lw a3, 28(sp)
   lw a4, 32(sp)
   lw a5, 36(sp)
   lw a6, 40(sp)
   lw a7, 44(sp)
   lw x3, 0(sp)
   lw x4, 4(sp)
   lw s0, 8(sp)
   lw s1, 12(sp)
   lw s2, 48(sp)
   # %var375 = call i32 @add(i32 %var376, i32 %var380)

   sw ra, 72(sp)
   sw s3, 52(sp)
   sw s4, 56(sp)
   sw a0, 16(sp)
   sw a1, 20(sp)
   sw a2, 24(sp)
   sw a3, 28(sp)
   sw a4, 32(sp)
   sw a5, 36(sp)
   sw a7, 44(sp)
   sw x3, 0(sp)
   sw x4, 4(sp)
   sw s0, 8(sp)
   sw s1, 12(sp)
   sw s2, 48(sp)
   mv a1, s5
   mv a0, a6
   call add
   lw ra, 72(sp)
   mv a6, a0
   lw s3, 52(sp)
   lw s4, 56(sp)
   lw a0, 16(sp)
   lw a1, 20(sp)
   lw a2, 24(sp)
   lw a3, 28(sp)
   lw a4, 32(sp)
   lw a5, 36(sp)
   lw a7, 44(sp)
   lw x3, 0(sp)
   lw x4, 4(sp)
   lw s0, 8(sp)
   lw s1, 12(sp)
   lw s2, 48(sp)
   # %var383 = load ptr, ptr @chunks

   la t0, @chunks
   lw s5, 0(t0)
   # %var385 = getelementptr ptr, ptr %var383, i32 %i.3_for.cond.5

   slli t1, a0, 2
   add s5, t1, s5
   # %var386 = load ptr, ptr %var385

   lw s5, 0(s5)
   # %var388 = getelementptr i32, ptr %var386, i32 %j.1_for.cond.7

   slli t1, s4, 2
   add s5, t1, s5
   # %var389 = load i32, ptr %var388

   lw s5, 0(s5)
   # %var374 = call i32 @add(i32 %var375, i32 %var389)

   sw ra, 72(sp)
   sw s3, 52(sp)
   sw s4, 56(sp)
   sw a0, 16(sp)
   sw a1, 20(sp)
   sw a2, 24(sp)
   sw a3, 28(sp)
   sw a4, 32(sp)
   sw a5, 36(sp)
   sw a7, 44(sp)
   sw x3, 0(sp)
   sw x4, 4(sp)
   sw s0, 8(sp)
   sw s1, 12(sp)
   sw s2, 48(sp)
   mv a0, a6
   mv a1, s5
   call add
   lw ra, 72(sp)
   mv a6, a0
   lw s3, 52(sp)
   lw s4, 56(sp)
   lw a0, 16(sp)
   lw a1, 20(sp)
   lw a2, 24(sp)
   lw a3, 28(sp)
   lw a4, 32(sp)
   lw a5, 36(sp)
   lw a7, 44(sp)
   lw x3, 0(sp)
   lw x4, 4(sp)
   lw s0, 8(sp)
   lw s1, 12(sp)
   lw s2, 48(sp)
   # %var395 = call i32 @rotate_left(i32 %b.1_for.cond.7, i32 30)

   sw ra, 72(sp)
   sw s3, 52(sp)
   sw s4, 56(sp)
   sw a0, 16(sp)
   sw a1, 20(sp)
   sw a3, 28(sp)
   sw a4, 32(sp)
   sw a5, 36(sp)
   sw a6, 40(sp)
   sw a7, 44(sp)
   sw x3, 0(sp)
   sw x4, 4(sp)
   sw s0, 8(sp)
   sw s1, 12(sp)
   sw s2, 48(sp)
   mv a0, a2
   li a1, 30
   call rotate_left
   lw ra, 72(sp)
   mv a2, a0
   lw s3, 52(sp)
   lw s4, 56(sp)
   lw a0, 16(sp)
   lw a1, 20(sp)
   lw a3, 28(sp)
   lw a4, 32(sp)
   lw a5, 36(sp)
   lw a6, 40(sp)
   lw a7, 44(sp)
   lw x3, 0(sp)
   lw x4, 4(sp)
   lw s0, 8(sp)
   lw s1, 12(sp)
   lw s2, 48(sp)
   # br label %for.step.7

   # phi start 
   # phi end 
   j sha1_for.step.7

   .section .text
   .globl sha1_for.step.7
sha1_for.step.7:
   # %var402 = add i32 %j.1_for.cond.7, 1

   addi s4, s4, 1
   # br label %for.cond.7

   # phi start 
   mv s5, a6
   mv t6, s3
   mv s3, a6
   mv a6, s2
   mv s2, a4
   mv a4, a2
   mv a2, t6
   # phi end 
   j sha1_for.cond.7

   .section .text
   .globl sha1_for.back.7
sha1_for.back.7:
   # %var404 = call i32 @add(i32 %h0.1_for.cond.5, i32 %a.1_for.cond.7)

   sw ra, 72(sp)
   sw s5, 60(sp)
   sw a0, 16(sp)
   sw a1, 20(sp)
   sw a2, 24(sp)
   sw a3, 28(sp)
   sw a4, 32(sp)
   sw a5, 36(sp)
   sw a6, 40(sp)
   sw a7, 44(sp)
   sw x3, 0(sp)
   sw x4, 4(sp)
   sw s0, 8(sp)
   sw s2, 48(sp)
   mv a1, s3
   mv a0, s1
   call add
   lw ra, 72(sp)
   mv s1, a0
   lw s5, 60(sp)
   lw a0, 16(sp)
   lw a1, 20(sp)
   lw a2, 24(sp)
   lw a3, 28(sp)
   lw a4, 32(sp)
   lw a5, 36(sp)
   lw a6, 40(sp)
   lw a7, 44(sp)
   lw x3, 0(sp)
   lw x4, 4(sp)
   lw s0, 8(sp)
   lw s2, 48(sp)
   # %var408 = call i32 @add(i32 %h1.1_for.cond.5, i32 %b.1_for.cond.7)

   sw ra, 72(sp)
   sw a1, 20(sp)
   sw a3, 28(sp)
   sw s5, 60(sp)
   sw a4, 32(sp)
   sw a5, 36(sp)
   sw a6, 40(sp)
   sw a7, 44(sp)
   sw x3, 0(sp)
   sw s0, 8(sp)
   sw s1, 12(sp)
   sw a0, 16(sp)
   sw s2, 48(sp)
   mv a0, x4
   mv a1, a2
   call add
   lw ra, 72(sp)
   mv x4, a0
   lw a1, 20(sp)
   lw a3, 28(sp)
   lw s5, 60(sp)
   lw a4, 32(sp)
   lw a5, 36(sp)
   lw a6, 40(sp)
   lw a7, 44(sp)
   lw x3, 0(sp)
   lw s0, 8(sp)
   lw s1, 12(sp)
   lw a0, 16(sp)
   lw s2, 48(sp)
   # %var412 = call i32 @add(i32 %h2.1_for.cond.5, i32 %c.1_for.cond.7)

   sw ra, 72(sp)
   sw a1, 20(sp)
   sw s5, 60(sp)
   sw a5, 36(sp)
   sw a6, 40(sp)
   sw a7, 44(sp)
   sw x3, 0(sp)
   sw x4, 4(sp)
   sw s0, 8(sp)
   sw s1, 12(sp)
   sw a0, 16(sp)
   sw s2, 48(sp)
   mv a1, a4
   mv a0, a3
   call add
   lw ra, 72(sp)
   mv a2, a0
   lw a1, 20(sp)
   lw s5, 60(sp)
   lw a5, 36(sp)
   lw a6, 40(sp)
   lw a7, 44(sp)
   lw x3, 0(sp)
   lw x4, 4(sp)
   lw s0, 8(sp)
   lw s1, 12(sp)
   lw a0, 16(sp)
   lw s2, 48(sp)
   # %var416 = call i32 @add(i32 %h3.1_for.cond.5, i32 %d.1_for.cond.7)

   sw ra, 72(sp)
   sw a1, 20(sp)
   sw a2, 24(sp)
   sw s5, 60(sp)
   sw a6, 40(sp)
   sw a7, 44(sp)
   sw x3, 0(sp)
   sw x4, 4(sp)
   sw s0, 8(sp)
   sw s1, 12(sp)
   sw a0, 16(sp)
   mv a0, a5
   mv a1, s2
   call add
   lw ra, 72(sp)
   mv a3, a0
   lw a1, 20(sp)
   lw a2, 24(sp)
   lw s5, 60(sp)
   lw a6, 40(sp)
   lw a7, 44(sp)
   lw x3, 0(sp)
   lw x4, 4(sp)
   lw s0, 8(sp)
   lw s1, 12(sp)
   lw a0, 16(sp)
   # %var420 = call i32 @add(i32 %h4.1_for.cond.5, i32 %e.1_for.cond.7)

   sw ra, 72(sp)
   sw a2, 24(sp)
   sw a3, 28(sp)
   sw s5, 60(sp)
   sw a7, 44(sp)
   sw x3, 0(sp)
   sw x4, 4(sp)
   sw s0, 8(sp)
   sw s1, 12(sp)
   sw a0, 16(sp)
   mv a0, a1
   mv a1, a6
   call add
   lw ra, 72(sp)
   mv a1, a0
   lw a2, 24(sp)
   lw a3, 28(sp)
   lw s5, 60(sp)
   lw a7, 44(sp)
   lw x3, 0(sp)
   lw x4, 4(sp)
   lw s0, 8(sp)
   lw s1, 12(sp)
   lw a0, 16(sp)
   # br label %for.step.5

   # phi start 
   # phi end 
   j sha1_for.step.5

   .section .text
   .globl sha1_for.step.5
sha1_for.step.5:
   # %var424 = add i32 %i.3_for.cond.5, 1

   addi a0, a0, 1
   # br label %for.cond.5

   # phi start 
   mv a4, s5
   mv a5, a3
   mv a3, a2
   mv a2, a7
   # phi end 
   j sha1_for.cond.5

   .section .text
   .globl sha1_for.back.5
sha1_for.back.5:
   # %var425 = load ptr, ptr @outputBuffer

   la t0, @outputBuffer
   lw x3, 0(t0)
   # %var426 = getelementptr i32, ptr %var425, i32 0

   addi x3, x3, 0
   # store i32 %h0.1_for.cond.5, ptr %var426

   sw s1, 0(x3)
   # %var429 = load ptr, ptr @outputBuffer

   la t0, @outputBuffer
   lw x3, 0(t0)
   # %var430 = getelementptr i32, ptr %var429, i32 1

   addi x3, x3, 4
   # store i32 %h1.1_for.cond.5, ptr %var430

   sw x4, 0(x3)
   # %var433 = load ptr, ptr @outputBuffer

   la t0, @outputBuffer
   lw x3, 0(t0)
   # %var434 = getelementptr i32, ptr %var433, i32 2

   addi x3, x3, 8
   # store i32 %h2.1_for.cond.5, ptr %var434

   sw a3, 0(x3)
   # %var437 = load ptr, ptr @outputBuffer

   la t0, @outputBuffer
   lw x3, 0(t0)
   # %var438 = getelementptr i32, ptr %var437, i32 3

   addi x3, x3, 12
   # store i32 %h3.1_for.cond.5, ptr %var438

   sw a5, 0(x3)
   # %var441 = load ptr, ptr @outputBuffer

   la t0, @outputBuffer
   lw x3, 0(t0)
   # %var442 = getelementptr i32, ptr %var441, i32 4

   addi x3, x3, 16
   # store i32 %h4.1_for.cond.5, ptr %var442

   sw a1, 0(x3)
   # %var445 = load ptr, ptr @outputBuffer

   la t0, @outputBuffer
   lw x3, 0(t0)
   # ret ptr %var445

   mv a0, x3
   addi sp, sp, 88
   # phi start 
   # phi end 
   ret

   .section .text
   .globl int2chr
int2chr:
   addi sp, sp, -28
   # phi start 
   # phi end 
   mv x3, a0

   .section .text
   .globl int2chr_entry
int2chr_entry:
   # %var50 = icmp sge i32 %x, 32

   li t1, 32
   sub t2, x3, t1
   sgtz    x4, t2
   seqz    t1, t2
   or x4, x4, t1
   # br i1 %var50, label %land.next..3, label %entry_and_land.end..3

   bne      x4, x0, .+8
   j int2chr_entry_and_land.end..3
   # phi start 
   # phi end 
   j int2chr_land.next..3

   .section .text
   .globl int2chr_land.next..3
int2chr_land.next..3:
   # %var53 = icmp sle i32 %x, 126

   li t1, 126
   sub t2, x3, t1
   sltz    x4, t2
   seqz    t1, t2
   or x4, x4, t1
   # br label %land.end..3

   # phi start 
   # phi end 
   j int2chr_land.end..3

   .section .text
   .globl int2chr_land.end..3
int2chr_land.end..3:
   # br i1 %var51_land.end..3, label %if.then.3, label %if.else.3

   bne      x4, x0, .+8
   j int2chr_if.else.3
   # phi start 
   # phi end 
   j int2chr_if.then.3

   .section .text
   .globl int2chr_if.then.3
int2chr_if.then.3:
   # %var55 = load ptr, ptr @asciiTable

   la t0, @asciiTable
   lw x4, 0(t0)
   # %var57 = sub i32 %x, 32

   addi s0, x3, -32
   # %var59 = sub i32 %x, 31

   addi x3, x3, -31
   # %var60 = call ptr @string.substring(ptr %var55, i32 %var57, i32 %var59)

   sw ra, 12(sp)
   mv a1, s0
   mv a0, x4
   mv a2, x3
   call string.substring
   lw ra, 12(sp)
   mv x3, a0
   # ret ptr %var60

   mv a0, x3
   addi sp, sp, 28
   # phi start 
   # phi end 
   ret

   .section .text
   .globl int2chr_if.else.3
int2chr_if.else.3:
   # br label %if.back.3

   # phi start 
   # phi end 
   j int2chr_if.back.3

   .section .text
   .globl int2chr_if.back.3
int2chr_if.back.3:
   # ret ptr @.str..1

   la a0, @.str..1
   addi sp, sp, 28
   # phi start 
   # phi end 
   ret

   .section .text
   .globl int2chr_entry_and_land.end..3
int2chr_entry_and_land.end..3:
   # br label %land.end..3

   # phi start 
   # phi end 
   j int2chr_land.end..3

   .section .text
   .globl array_equal
array_equal:
   addi sp, sp, -36
   mv x3, a0
   # phi start 
   # phi end 
   mv x4, a1

   .section .text
   .globl array_equal_entry
array_equal_entry:
   # %var514 = call i32 @array.size(ptr %a)

   sw ra, 20(sp)
   sw x3, 0(sp)
   sw x4, 4(sp)
   mv a0, x3
   call array.size
   lw ra, 20(sp)
   mv s0, a0
   lw x3, 0(sp)
   lw x4, 4(sp)
   # %var516 = call i32 @array.size(ptr %b)

   sw ra, 20(sp)
   sw x3, 0(sp)
   sw x4, 4(sp)
   sw s0, 8(sp)
   mv a0, x4
   call array.size
   lw ra, 20(sp)
   mv s1, a0
   lw x3, 0(sp)
   lw x4, 4(sp)
   lw s0, 8(sp)
   # %var517 = icmp ne i32 %var514, %var516

   sub t2, s0, s1
   snez    s0, t2
   # br i1 %var517, label %if.then.15, label %if.else.15

   bne      s0, x0, .+8
   j array_equal_if.else.15
   # phi start 
   # phi end 
   j array_equal_if.then.15

   .section .text
   .globl array_equal_if.then.15
array_equal_if.then.15:
   # ret i1 false

   li a0, 0
   addi sp, sp, 36
   # phi start 
   # phi end 
   ret

   .section .text
   .globl array_equal_if.else.15
array_equal_if.else.15:
   # br label %if.back.15

   # phi start 
   # phi end 
   j array_equal_if.back.15

   .section .text
   .globl array_equal_if.back.15
array_equal_if.back.15:
   # br label %for.cond.11

   # phi start 
   li s0, 0
   # phi end 
   j array_equal_for.cond.11

   .section .text
   .globl array_equal_for.cond.11
array_equal_for.cond.11:
   # %var521 = call i32 @array.size(ptr %a)

   sw ra, 20(sp)
   sw x3, 0(sp)
   sw x4, 4(sp)
   sw s0, 8(sp)
   mv a0, x3
   call array.size
   lw ra, 20(sp)
   mv s1, a0
   lw x3, 0(sp)
   lw x4, 4(sp)
   lw s0, 8(sp)
   # %var522 = icmp slt i32 %i.6_for.cond.11, %var521

   sub t2, s0, s1
   sltz    s1, t2
   # br i1 %var522, label %for.body.11, label %for.back.11

   bne      s1, x0, .+8
   j array_equal_for.back.11
   # phi start 
   # phi end 
   j array_equal_for.body.11

   .section .text
   .globl array_equal_for.body.11
array_equal_for.body.11:
   # %var525 = getelementptr i32, ptr %a, i32 %i.6_for.cond.11

   slli t1, s0, 2
   add s1, t1, x3
   # %var526 = load i32, ptr %var525

   lw s1, 0(s1)
   # %var529 = getelementptr i32, ptr %b, i32 %i.6_for.cond.11

   slli t1, s0, 2
   add a0, t1, x4
   # %var530 = load i32, ptr %var529

   lw a0, 0(a0)
   # %var531 = icmp ne i32 %var526, %var530

   sub t2, s1, a0
   snez    s1, t2
   # br i1 %var531, label %if.then.16, label %if.else.16

   bne      s1, x0, .+8
   j array_equal_if.else.16
   # phi start 
   # phi end 
   j array_equal_if.then.16

   .section .text
   .globl array_equal_if.then.16
array_equal_if.then.16:
   # ret i1 false

   li a0, 0
   addi sp, sp, 36
   # phi start 
   # phi end 
   ret

   .section .text
   .globl array_equal_if.else.16
array_equal_if.else.16:
   # br label %if.back.16

   # phi start 
   # phi end 
   j array_equal_if.back.16

   .section .text
   .globl array_equal_if.back.16
array_equal_if.back.16:
   # br label %for.step.11

   # phi start 
   # phi end 
   j array_equal_for.step.11

   .section .text
   .globl array_equal_for.step.11
array_equal_for.step.11:
   # %var533 = add i32 %i.6_for.cond.11, 1

   addi s0, s0, 1
   # br label %for.cond.11

   # phi start 
   # phi end 
   j array_equal_for.cond.11

   .section .text
   .globl array_equal_for.back.11
array_equal_for.back.11:
   # ret i1 true

   li a0, 1
   addi sp, sp, 36
   # phi start 
   # phi end 
   ret

   .section .text
   .globl rotate_left
rotate_left:
   addi sp, sp, -32
   mv x3, a0
   # phi start 
   # phi end 
   mv x4, a1

   .section .text
   .globl rotate_left_entry
rotate_left_entry:
   # %var90 = icmp eq i32 %shift, 1

   li t1, 1
   sub t2, x4, t1
   seqz    s0, t2
   # br i1 %var90, label %if.then.5, label %if.else.5

   bne      s0, x0, .+8
   j rotate_left_if.else.5
   # phi start 
   # phi end 
   j rotate_left_if.then.5

   .section .text
   .globl rotate_left_if.then.5
rotate_left_if.then.5:
   # %var92 = and i32 %x, 2147483647

   li t1, 2147483647
   and x4, x3, t1
   # %var93 = shl i32 %var92, 1

   slli x4, x4, 1
   # %var95 = ashr i32 %x, 31

   srai x3, x3, 31
   # %var96 = and i32 %var95, 1

   andi x3, x3, 1
   # %var97 = or i32 %var93, %var96

   or x3, x4, x3
   # ret i32 %var97

   mv a0, x3
   addi sp, sp, 32
   # phi start 
   # phi end 
   ret

   .section .text
   .globl rotate_left_if.else.5
rotate_left_if.else.5:
   # br label %if.back.5

   # phi start 
   # phi end 
   j rotate_left_if.back.5

   .section .text
   .globl rotate_left_if.back.5
rotate_left_if.back.5:
   # %var99 = icmp eq i32 %shift, 31

   li t1, 31
   sub t2, x4, t1
   seqz    s0, t2
   # br i1 %var99, label %if.then.6, label %if.else.6

   bne      s0, x0, .+8
   j rotate_left_if.else.6
   # phi start 
   # phi end 
   j rotate_left_if.then.6

   .section .text
   .globl rotate_left_if.then.6
rotate_left_if.then.6:
   # %var101 = and i32 %x, 1

   andi x4, x3, 1
   # %var102 = shl i32 %var101, 31

   slli x4, x4, 31
   # %var104 = ashr i32 %x, 1

   srai x3, x3, 1
   # %var105 = and i32 %var104, 2147483647

   li t1, 2147483647
   and x3, x3, t1
   # %var106 = or i32 %var102, %var105

   or x3, x4, x3
   # ret i32 %var106

   mv a0, x3
   addi sp, sp, 32
   # phi start 
   # phi end 
   ret

   .section .text
   .globl rotate_left_if.else.6
rotate_left_if.else.6:
   # br label %if.back.6

   # phi start 
   # phi end 
   j rotate_left_if.back.6

   .section .text
   .globl rotate_left_if.back.6
rotate_left_if.back.6:
   # %var109 = sub i32 32, %shift

   li t0, 32
   sub s0, t0, x4
   # %var110 = shl i32 1, %var109

   li t0, 1
   sll s0, t0, s0
   # %var111 = sub i32 %var110, 1

   addi s0, s0, -1
   # %var112 = and i32 %x, %var111

   and s0, x3, s0
   # %var114 = shl i32 %var112, %shift

   sll s0, s0, x4
   # %var117 = sub i32 32, %shift

   li t0, 32
   sub s1, t0, x4
   # %var118 = ashr i32 %x, %var117

   sra x3, x3, s1
   # %var120 = shl i32 1, %shift

   li t0, 1
   sll x4, t0, x4
   # %var121 = sub i32 %var120, 1

   addi x4, x4, -1
   # %var122 = and i32 %var118, %var121

   and x3, x3, x4
   # %var123 = or i32 %var114, %var122

   or x3, s0, x3
   # ret i32 %var123

   mv a0, x3
   addi sp, sp, 32
   # phi start 
   # phi end 
   ret

   .section .text
   .globl lohi
lohi:
   addi sp, sp, -24
   mv x4, a0
   # phi start 
   # phi end 
   mv x3, a1

   .section .text
   .globl lohi_entry
lohi_entry:
   # %var147 = shl i32 %hi, 16

   slli x3, x3, 16
   # %var148 = or i32 %lo, %var147

   or x3, x4, x3
   # ret i32 %var148

   mv a0, x3
   addi sp, sp, 24
   # phi start 
   # phi end 
   ret

   .section .text
   .globl __init
__init:
   # phi start 
   # phi end 
   addi sp, sp, -20

   .section .text
   .globl __init_entry
__init_entry:
   # store ptr @.str..0, ptr @asciiTable

   la t0, @.str..0
   la t1, @asciiTable
   sw t0, 0(t1)
   # %var149 = load i32, ptr @MAXCHUNK

   la t0, @MAXCHUNK
   lw x3, 0(t0)
   # %var150 = sub i32 %var149, 1

   addi x3, x3, -1
   # %var151 = mul i32 %var150, 64

   li t1, 64
   mul x3, x3, t1
   # %var152 = sub i32 %var151, 16

   addi x3, x3, -16
   # store i32 %var152, ptr @MAXLENGTH

   la t1, @MAXLENGTH
   sw x3, 0(t1)
   # %var154 = load i32, ptr @MAXCHUNK

   la t0, @MAXCHUNK
   lw x3, 0(t0)
   # %var153 = call ptr @__array.alloca(i32 4, i32 2, i32 2, i32 %var154, i32 80)

   sw ra, 4(sp)
   li a0, 4
   mv a3, x3
   li a1, 2
   li a4, 80
   li a2, 2
   call __array.alloca
   lw ra, 4(sp)
   mv x3, a0
   # store ptr %var153, ptr @chunks

   la t1, @chunks
   sw x3, 0(t1)
   # %var156 = load i32, ptr @MAXLENGTH

   la t0, @MAXLENGTH
   lw x3, 0(t0)
   # %var155 = call ptr @__array.alloca(i32 4, i32 1, i32 1, i32 %var156)

   sw ra, 4(sp)
   li a0, 4
   mv a3, x3
   li a2, 1
   li a1, 1
   call __array.alloca
   lw ra, 4(sp)
   mv x3, a0
   # store ptr %var155, ptr @inputBuffer

   la t1, @inputBuffer
   sw x3, 0(t1)
   # %var157 = call ptr @__array.alloca(i32 4, i32 1, i32 1, i32 5)

   sw ra, 4(sp)
   li a1, 1
   li a3, 5
   li a0, 4
   li a2, 1
   call __array.alloca
   lw ra, 4(sp)
   mv x3, a0
   # store ptr %var157, ptr @outputBuffer

   la t1, @outputBuffer
   sw x3, 0(t1)
   # ret void

   addi sp, sp, 20
   # phi start 
   # phi end 
   ret

   .section .text
   .globl nextLetter
nextLetter:
   addi sp, sp, -24
   # phi start 
   # phi end 
   mv x3, a0

   .section .text
   .globl nextLetter_entry
nextLetter_entry:
   # %var479 = icmp eq i32 %now, 122

   li t1, 122
   sub t2, x3, t1
   seqz    x4, t2
   # br i1 %var479, label %if.then.11, label %if.else.11

   bne      x4, x0, .+8
   j nextLetter_if.else.11
   # phi start 
   # phi end 
   j nextLetter_if.then.11

   .section .text
   .globl nextLetter_if.then.11
nextLetter_if.then.11:
   # %var480 = sub i32 0, 1

   li x3, -1
   # ret i32 %var480

   mv a0, x3
   addi sp, sp, 24
   # phi start 
   # phi end 
   ret

   .section .text
   .globl nextLetter_if.else.11
nextLetter_if.else.11:
   # br label %if.back.11

   # phi start 
   # phi end 
   j nextLetter_if.back.11

   .section .text
   .globl nextLetter_if.back.11
nextLetter_if.back.11:
   # %var482 = icmp eq i32 %now, 90

   li t1, 90
   sub t2, x3, t1
   seqz    x4, t2
   # br i1 %var482, label %if.then.12, label %if.else.12

   bne      x4, x0, .+8
   j nextLetter_if.else.12
   # phi start 
   # phi end 
   j nextLetter_if.then.12

   .section .text
   .globl nextLetter_if.then.12
nextLetter_if.then.12:
   # ret i32 97

   li a0, 97
   addi sp, sp, 24
   # phi start 
   # phi end 
   ret

   .section .text
   .globl nextLetter_if.else.12
nextLetter_if.else.12:
   # br label %if.back.12

   # phi start 
   # phi end 
   j nextLetter_if.back.12

   .section .text
   .globl nextLetter_if.back.12
nextLetter_if.back.12:
   # %var484 = icmp eq i32 %now, 57

   li t1, 57
   sub t2, x3, t1
   seqz    x4, t2
   # br i1 %var484, label %if.then.13, label %if.else.13

   bne      x4, x0, .+8
   j nextLetter_if.else.13
   # phi start 
   # phi end 
   j nextLetter_if.then.13

   .section .text
   .globl nextLetter_if.then.13
nextLetter_if.then.13:
   # ret i32 65

   li a0, 65
   addi sp, sp, 24
   # phi start 
   # phi end 
   ret

   .section .text
   .globl nextLetter_if.else.13
nextLetter_if.else.13:
   # br label %if.back.13

   # phi start 
   # phi end 
   j nextLetter_if.back.13

   .section .text
   .globl nextLetter_if.back.13
nextLetter_if.back.13:
   # %var486 = add i32 %now, 1

   addi x3, x3, 1
   # ret i32 %var486

   mv a0, x3
   addi sp, sp, 24
   # phi start 
   # phi end 
   ret

   .section .data
   .globl @outputBuffer
@outputBuffer:
   .word 0

   .section .data
   .globl @inputBuffer
@inputBuffer:
   .word 0

   .section .data
   .globl @MAXCHUNK
@MAXCHUNK:
   .word 100

   .section .data
   .globl @chunks
@chunks:
   .word 0

   .section .data
   .globl @MAXLENGTH
@MAXLENGTH:
   .word 0

   .section .data
   .globl @asciiTable
@asciiTable:
   .word 0

   .section .rodata
@.str..7:
   .asciz "Not Found!"

   .section .rodata
@.str..5:
   .asciz "Invalid input"

   .section .rodata
@.str..6:
   .asciz ""

   .section .rodata
@.str..3:
   .asciz "nChunk > MAXCHUNK!"

   .section .rodata
@.str..4:
   .asciz ""

   .section .rodata
@.str..1:
   .asciz ""

   .section .rodata
@.str..2:
   .asciz ""

   .section .rodata
@.str..0:
   .asciz " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~"

