   .section .text
   .globl EdgeList..nVertices
EdgeList..nVertices:
   addi sp, sp, -144
   sw t0, 132(sp)
   sw t1, 136(sp)
   sw t2, 140(sp)

   .section .text
   .globl EdgeList..nVertices_entry
EdgeList..nVertices_entry:
   # %var230 = getelementptr %class..EdgeList, ptr %_this, i32 0, i32 2

   li t1, 2
   li t2, 4
   mul t1, t1, t2
   add x3, t1, x3
   mv x3, x3
   # %var231 = load ptr, ptr %var230

   lw x3, 0(t0)
   # %var232 = call i32 @array.size(ptr %var231)

   sw ra, 128(sp)
   sw a0, 40(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x3, 12(sp)
   mv a0, x3
   call array.size
   lw ra, 128(sp)
   mv x3, a0
   lw a0, 40(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x3, 12(sp)
   # ret i32 %var232

   addi sp, sp, 144
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   ret

   .section .text
   .globl EdgeList..nEdges
EdgeList..nEdges:
   addi sp, sp, -144
   sw t0, 132(sp)
   sw t1, 136(sp)
   sw t2, 140(sp)

   .section .text
   .globl EdgeList..nEdges_entry
EdgeList..nEdges_entry:
   # %var234 = getelementptr %class..EdgeList, ptr %_this, i32 0, i32 0

   li t1, 0
   li t2, 4
   mul t1, t1, t2
   add x3, t1, x3
   mv x3, x3
   # %var235 = load ptr, ptr %var234

   lw x3, 0(t0)
   # %var236 = call i32 @array.size(ptr %var235)

   sw ra, 128(sp)
   sw a0, 40(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x3, 12(sp)
   mv a0, x3
   call array.size
   lw ra, 128(sp)
   mv x3, a0
   lw a0, 40(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x3, 12(sp)
   # ret i32 %var236

   addi sp, sp, 144
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   ret

   .section .text
   .globl init
init:
   addi sp, sp, -148
   sw t0, 136(sp)
   sw t1, 140(sp)
   sw t2, 144(sp)

   .section .text
   .globl init_entry
init_entry:
   # %var238 = call i32 @getInt()

   sw ra, 132(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x3, 12(sp)
   call getInt
   lw ra, 132(sp)
   mv x3, a0
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x3, 12(sp)
   # store i32 %var238, ptr @n

   la t1, @n
   sw x3, 0(t1)
   # %var240 = call i32 @getInt()

   sw ra, 132(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x3, 12(sp)
   call getInt
   lw ra, 132(sp)
   mv x3, a0
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x3, 12(sp)
   # store i32 %var240, ptr @m

   la t1, @m
   sw x3, 0(t1)
   # %var242 = call ptr @_malloc(i32 16)

   sw ra, 132(sp)
   sw a0, 40(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x3, 12(sp)
   li a0, 16
   call _malloc
   lw ra, 132(sp)
   mv x3, a0
   lw a0, 40(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x3, 12(sp)
   # store ptr %var242, ptr @g

   la t1, @g
   sw x3, 0(t1)
   # %var243 = load ptr, ptr @g

   la t0, @g
   lw x3, 0(t0)
   # %var244 = load i32, ptr @n

   la t0, @n
   lw x4, 0(t0)
   # %var245 = load i32, ptr @m

   la t0, @m
   lw x8, 0(t0)
   # call void @EdgeList..init(ptr %var243, i32 %var244, i32 %var245)

   sw ra, 132(sp)
   sw a0, 40(sp)
   sw a1, 44(sp)
   sw a2, 48(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   mv a0, x3
   mv a2, x8
   mv a1, x4
   call EdgeList..init
   lw ra, 132(sp)
   sw a0, 128(sp)
   lw a0, 40(sp)
   lw a1, 44(sp)
   lw a2, 48(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   # br label %for.cond.2

   li x3, 0
   j init_for.cond.2

   .section .text
   .globl init_for.cond.2
init_for.cond.2:
   # %var248 = load i32, ptr @m

   la t0, @m
   lw x4, 0(t0)
   # %var249 = icmp slt i32 %i.3_for.cond.2, %var248

   sub t2, x3, x4
   sltz    x4, t2
   # br i1 %var249, label %for.body.2, label %for.back.2

   bne      x4, x0, .+8
   j init_for.back.2
   j init_for.body.2

   .section .text
   .globl init_for.body.2
init_for.body.2:
   # %var250 = call i32 @getInt()

   sw ra, 132(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   call getInt
   lw ra, 132(sp)
   mv x4, a0
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x3, 12(sp)
   lw x4, 16(sp)
   # %var251 = call i32 @getInt()

   sw ra, 132(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x8, 32(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   call getInt
   lw ra, 132(sp)
   mv x8, a0
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x8, 32(sp)
   lw x3, 12(sp)
   lw x4, 16(sp)
   # %var252 = call i32 @getInt()

   sw ra, 132(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x8, 32(sp)
   sw x9, 36(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   call getInt
   lw ra, 132(sp)
   mv x9, a0
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x8, 32(sp)
   lw x9, 36(sp)
   lw x3, 12(sp)
   lw x4, 16(sp)
   # %var253 = load ptr, ptr @g

   la t0, @g
   lw a0, 0(t0)
   # call void @EdgeList..addEdge(ptr %var253, i32 %var250, i32 %var251, i32 %var252)

   sw ra, 132(sp)
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
   mv a3, x9
   mv a2, x8
   mv a0, a0
   mv a1, x4
   call EdgeList..addEdge
   lw ra, 132(sp)
   sw a0, 128(sp)
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
   # br label %for.step.2

   j init_for.step.2

   .section .text
   .globl init_for.step.2
init_for.step.2:
   # %var258 = add i32 %i.3_for.cond.2, 1

   li t1, 1
   add x3, x3, t1
   # br label %for.cond.2

   mv x3, x3
   j init_for.cond.2

   .section .text
   .globl init_for.back.2
init_for.back.2:
   # ret void

   addi sp, sp, 148
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   ret

   .section .text
   .globl Queue_int..size
Queue_int..size:
   addi sp, sp, -144
   sw t0, 132(sp)
   sw t1, 136(sp)
   sw t2, 140(sp)

   .section .text
   .globl Queue_int..size_entry
Queue_int..size_entry:
   # %var59 = getelementptr %class..Queue_int, ptr %_this, i32 0, i32 2

   li t1, 2
   li t2, 4
   mul t1, t1, t2
   add x3, t1, x3
   mv x4, x3
   # %var60 = load i32, ptr %var59

   lw x4, 0(t0)
   # %var62 = getelementptr %class..Queue_int, ptr %_this, i32 0, i32 0

   li t1, 0
   li t2, 4
   mul t1, t1, t2
   add x3, t1, x3
   mv x8, x3
   # %var63 = load ptr, ptr %var62

   lw x8, 0(t0)
   # %var64 = call i32 @array.size(ptr %var63)

   sw ra, 128(sp)
   sw a0, 40(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x8, 32(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   mv a0, x8
   call array.size
   lw ra, 128(sp)
   mv x8, a0
   lw a0, 40(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x8, 32(sp)
   lw x3, 12(sp)
   lw x4, 16(sp)
   # %var65 = add i32 %var60, %var64

   add x4, x4, x8
   # %var67 = getelementptr %class..Queue_int, ptr %_this, i32 0, i32 1

   li t1, 1
   li t2, 4
   mul t1, t1, t2
   add x3, t1, x3
   mv x8, x3
   # %var68 = load i32, ptr %var67

   lw x8, 0(t0)
   # %var69 = sub i32 %var65, %var68

   sub x4, x4, x8
   # %var71 = getelementptr %class..Queue_int, ptr %_this, i32 0, i32 0

   li t1, 0
   li t2, 4
   mul t1, t1, t2
   add x3, t1, x3
   mv x3, x3
   # %var72 = load ptr, ptr %var71

   lw x3, 0(t0)
   # %var73 = call i32 @array.size(ptr %var72)

   sw ra, 128(sp)
   sw a0, 40(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   mv a0, x3
   call array.size
   lw ra, 128(sp)
   mv x3, a0
   lw a0, 40(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x3, 12(sp)
   lw x4, 16(sp)
   # %var74 = srem i32 %var69, %var73

   rem x3, x4, x3
   # ret i32 %var74

   addi sp, sp, 144
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   ret

   .section .text
   .globl main
main:
   addi sp, sp, -168
   sw t0, 156(sp)
   sw t1, 160(sp)
   sw t2, 164(sp)

   .section .text
   .globl main_entry
main_entry:
   # call void @__init()

   sw ra, 152(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   call __init
   lw ra, 152(sp)
   sw a0, 128(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   # call void @init()

   sw ra, 152(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   call init
   lw ra, 152(sp)
   sw a0, 132(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   # br label %for.cond.5

   li x3, 0
   j main_for.cond.5

   .section .text
   .globl main_for.cond.5
main_for.cond.5:
   # %var346 = load i32, ptr @n

   la t0, @n
   lw x4, 0(t0)
   # %var347 = icmp slt i32 %i.5_for.cond.5, %var346

   sub t2, x3, x4
   sltz    x4, t2
   # br i1 %var347, label %for.body.5, label %for.back.5

   bne      x4, x0, .+8
   j main_for.back.5
   j main_for.body.5

   .section .text
   .globl main_for.body.5
main_for.body.5:
   # %var348 = call ptr @spfa(i32 %i.5_for.cond.5)

   sw ra, 152(sp)
   sw a0, 40(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   mv a0, x3
   call spfa
   lw ra, 152(sp)
   mv x4, a0
   lw a0, 40(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x3, 12(sp)
   lw x4, 16(sp)
   # br label %for.cond.6

   li x8, 0
   j main_for.cond.6

   .section .text
   .globl main_for.cond.6
main_for.cond.6:
   # %var352 = load i32, ptr @n

   la t0, @n
   lw x9, 0(t0)
   # %var353 = icmp slt i32 %j.1_for.cond.6, %var352

   sub t2, x8, x9
   sltz    x9, t2
   # br i1 %var353, label %for.body.6, label %for.back.6

   bne      x9, x0, .+8
   j main_for.back.6
   j main_for.body.6

   .section .text
   .globl main_for.body.6
main_for.body.6:
   # %var356 = getelementptr i32, ptr %var348, i32 %j.1_for.cond.6

   li t2, 4
   mul x8, x8, t2
   add x4, x8, x4
   mv x9, x4
   # %var357 = load i32, ptr %var356

   lw x9, 0(t0)
   # %var358 = load i32, ptr @INF

   la t0, @INF
   lw a0, 0(t0)
   # %var359 = icmp eq i32 %var357, %var358

   sub t2, x9, a0
   seqz    x9, t2
   # br i1 %var359, label %if.then.3, label %if.else.3

   bne      x9, x0, .+8
   j main_if.else.3
   j main_if.then.3

   .section .text
   .globl main_if.then.3
main_if.then.3:
   # call void @print(ptr @.str..1)

   sw ra, 152(sp)
   sw a0, 40(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x8, 32(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   la a0, @.str..1
   call print
   lw ra, 152(sp)
   sw a0, 136(sp)
   lw a0, 40(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x8, 32(sp)
   lw x3, 12(sp)
   lw x4, 16(sp)
   # br label %if.back.3

   j main_if.back.3

   .section .text
   .globl main_if.else.3
main_if.else.3:
   # %var365 = getelementptr i32, ptr %var348, i32 %j.1_for.cond.6

   li t2, 4
   mul x8, x8, t2
   add x4, x8, x4
   mv x9, x4
   # %var366 = load i32, ptr %var365

   lw x9, 0(t0)
   # %var362 = call ptr @toString(i32 %var366)

   sw ra, 152(sp)
   sw a0, 40(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x8, 32(sp)
   sw x9, 36(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   mv a0, x9
   call toString
   lw ra, 152(sp)
   mv x9, a0
   lw a0, 40(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x8, 32(sp)
   lw x9, 36(sp)
   lw x3, 12(sp)
   lw x4, 16(sp)
   # call void @print(ptr %var362)

   sw ra, 152(sp)
   sw a0, 40(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x8, 32(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   mv a0, x9
   call print
   lw ra, 152(sp)
   sw a0, 140(sp)
   lw a0, 40(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x8, 32(sp)
   lw x3, 12(sp)
   lw x4, 16(sp)
   # br label %if.back.3

   j main_if.back.3

   .section .text
   .globl main_if.back.3
main_if.back.3:
   # call void @print(ptr @.str..2)

   sw ra, 152(sp)
   sw a0, 40(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x8, 32(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   la a0, @.str..2
   call print
   lw ra, 152(sp)
   sw a0, 144(sp)
   lw a0, 40(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x8, 32(sp)
   lw x3, 12(sp)
   lw x4, 16(sp)
   # br label %for.step.6

   j main_for.step.6

   .section .text
   .globl main_for.step.6
main_for.step.6:
   # %var369 = add i32 %j.1_for.cond.6, 1

   li t1, 1
   add x8, x8, t1
   # br label %for.cond.6

   mv x8, x8
   j main_for.cond.6

   .section .text
   .globl main_for.back.6
main_for.back.6:
   # call void @println(ptr @.str..3)

   sw ra, 152(sp)
   sw a0, 40(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x3, 12(sp)
   la a0, @.str..3
   call println
   lw ra, 152(sp)
   sw a0, 148(sp)
   lw a0, 40(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x3, 12(sp)
   # br label %for.step.5

   j main_for.step.5

   .section .text
   .globl main_for.step.5
main_for.step.5:
   # %var372 = add i32 %i.5_for.cond.5, 1

   li t1, 1
   add x3, x3, t1
   # br label %for.cond.5

   mv x3, x3
   j main_for.cond.5

   .section .text
   .globl main_for.back.5
main_for.back.5:
   # ret i32 0

   li a0, 0
   addi sp, sp, 168
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   ret

   .section .text
   .globl spfa
spfa:
   addi sp, sp, -156
   sw t0, 144(sp)
   sw t1, 148(sp)
   sw t2, 152(sp)

   .section .text
   .globl spfa_entry
spfa_entry:
   # %var260 = load i32, ptr @n

   la t0, @n
   lw x4, 0(t0)
   # %var259 = call ptr @__array.alloca(i32 4, i32 1, i32 1, i32 %var260)

   sw ra, 140(sp)
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
   li a0, 4
   li a2, 1
   li a1, 1
   mv a3, x4
   call __array.alloca
   lw ra, 140(sp)
   mv x4, a0
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
   # br label %for.cond.3

   li x8, 0
   j spfa_for.cond.3

   .section .text
   .globl spfa_for.cond.3
spfa_for.cond.3:
   # %var263 = load i32, ptr @n

   la t0, @n
   lw x9, 0(t0)
   # %var264 = icmp slt i32 %i.4_for.cond.3, %var263

   sub t2, x8, x9
   sltz    x9, t2
   # br i1 %var264, label %for.body.3, label %for.back.3

   bne      x9, x0, .+8
   j spfa_for.back.3
   j spfa_for.body.3

   .section .text
   .globl spfa_for.body.3
spfa_for.body.3:
   # %var267 = getelementptr i32, ptr %var259, i32 %i.4_for.cond.3

   li t2, 4
   mul x8, x8, t2
   add x4, x8, x4
   mv x9, x4
   # %var269 = load i32, ptr @INF

   la t0, @INF
   lw a0, 0(t0)
   # store i32 %var269, ptr %var267

   sw a0, 0(t1)
   # br label %for.step.3

   j spfa_for.step.3

   .section .text
   .globl spfa_for.step.3
spfa_for.step.3:
   # %var271 = add i32 %i.4_for.cond.3, 1

   li t1, 1
   add x8, x8, t1
   # br label %for.cond.3

   mv x8, x8
   j spfa_for.cond.3

   .section .text
   .globl spfa_for.back.3
spfa_for.back.3:
   # %var274 = getelementptr i32, ptr %var259, i32 %s

   li t2, 4
   mul x3, x3, t2
   add x4, x3, x4
   mv x8, x4
   # store i32 0, ptr %var274

   li t0, 0
   sw t0, 0(t1)
   # %var276 = call ptr @_malloc(i32 12)

   sw ra, 140(sp)
   sw a0, 40(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x8, 32(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   li a0, 12
   call _malloc
   lw ra, 140(sp)
   mv x8, a0
   lw a0, 40(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x8, 32(sp)
   lw x3, 12(sp)
   lw x4, 16(sp)
   # call void @Queue_int..Queue_int(ptr %var276)

   sw ra, 140(sp)
   sw a0, 40(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x8, 32(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   mv a0, x8
   call Queue_int..Queue_int
   lw ra, 140(sp)
   sw a0, 128(sp)
   lw a0, 40(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x8, 32(sp)
   lw x3, 12(sp)
   lw x4, 16(sp)
   # call void @Queue_int..push(ptr %var276, i32 %s)

   sw ra, 140(sp)
   sw a0, 40(sp)
   sw a1, 44(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x8, 32(sp)
   sw x4, 16(sp)
   mv a1, x3
   mv a0, x8
   call Queue_int..push
   lw ra, 140(sp)
   sw a0, 132(sp)
   lw a0, 40(sp)
   lw a1, 44(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x8, 32(sp)
   lw x4, 16(sp)
   # call void @Queue_int..size(ptr %var276)

   sw ra, 140(sp)
   sw a0, 40(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x8, 32(sp)
   sw x4, 16(sp)
   mv a0, x8
   call Queue_int..size
   lw ra, 140(sp)
   sw a0, 136(sp)
   lw a0, 40(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x8, 32(sp)
   lw x4, 16(sp)
   # br label %while.cond.1

   li x9, 0
   li x3, 0
   j spfa_while.cond.1

   .section .text
   .globl spfa_while.cond.1
spfa_while.cond.1:
   # %var284 = call i32 @Queue_int..size(ptr %var276)

   sw ra, 140(sp)
   sw a0, 40(sp)
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
   mv a0, x8
   call Queue_int..size
   lw ra, 140(sp)
   mv a0, a0
   lw a0, 40(sp)
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
   # %var285 = icmp ne i32 %var284, 0

   li t1, 0
   sub t2, a0, t1
   snez    a0, t2
   # br i1 %var285, label %while.body.1, label %while.back.1

   bne      a0, x0, .+8
   j spfa_while.back.1
   j spfa_while.body.1

   .section .text
   .globl spfa_while.body.1
spfa_while.body.1:
   # %var287 = call i32 @Queue_int..pop(ptr %var276)

   sw ra, 140(sp)
   sw a0, 40(sp)
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
   mv a0, x8
   call Queue_int..pop
   lw ra, 140(sp)
   mv a0, a0
   lw a0, 40(sp)
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
   # %var289 = load ptr, ptr @g

   la t0, @g
   lw a1, 0(t0)
   # %var290 = getelementptr %class..EdgeList, ptr %var289, i32 0, i32 2

   li t1, 2
   li t2, 4
   mul t1, t1, t2
   add a1, t1, a1
   mv a1, a1
   # %var291 = load ptr, ptr %var290

   lw a1, 0(t0)
   # %var293 = getelementptr i32, ptr %var291, i32 %var287

   li t2, 4
   mul a0, a0, t2
   add a1, a0, a1
   mv a1, a1
   # %var294 = load i32, ptr %var293

   lw a1, 0(t0)
   # br label %for.cond.4

   mv x3, a1
   mv a1, x9
   mv x9, x3
   j spfa_for.cond.4

   .section .text
   .globl spfa_for.cond.4
spfa_for.cond.4:
   # %var296 = sub i32 0, 1

   li t0, 0
   li t1, 1
   sub a2, t0, t1
   # %var297 = icmp ne i32 %k.1_for.cond.4, %var296

   sub t2, x3, a2
   snez    a2, t2
   # br i1 %var297, label %for.body.4, label %for.back.4

   bne      a2, x0, .+8
   j spfa_for.back.4
   j spfa_for.body.4

   .section .text
   .globl spfa_for.body.4
spfa_for.body.4:
   # %var298 = load ptr, ptr @g

   la t0, @g
   lw x9, 0(t0)
   # %var299 = getelementptr %class..EdgeList, ptr %var298, i32 0, i32 0

   li t1, 0
   li t2, 4
   mul t1, t1, t2
   add x9, t1, x9
   mv x9, x9
   # %var300 = load ptr, ptr %var299

   lw x9, 0(t0)
   # %var302 = getelementptr ptr, ptr %var300, i32 %k.1_for.cond.4

   li t2, 4
   mul x3, x3, t2
   add x9, x3, x9
   mv x9, x9
   # %var303 = load ptr, ptr %var302

   lw x9, 0(t0)
   # %var305 = getelementptr %class..Edge, ptr %var303, i32 0, i32 1

   li t1, 1
   li t2, 4
   mul t1, t1, t2
   add x9, t1, x9
   mv a1, x9
   # %var306 = load i32, ptr %var305

   lw a1, 0(t0)
   # %var309 = getelementptr i32, ptr %var259, i32 %var306

   li t2, 4
   mul a1, a1, t2
   add x4, a1, x4
   mv a2, x4
   # %var310 = load i32, ptr %var309

   lw a2, 0(t0)
   # %var313 = getelementptr i32, ptr %var259, i32 %var287

   li t2, 4
   mul a0, a0, t2
   add x4, a0, x4
   mv a3, x4
   # %var314 = load i32, ptr %var313

   lw a3, 0(t0)
   # %var316 = getelementptr %class..Edge, ptr %var303, i32 0, i32 2

   li t1, 2
   li t2, 4
   mul t1, t1, t2
   add x9, t1, x9
   mv a4, x9
   # %var317 = load i32, ptr %var316

   lw a4, 0(t0)
   # %var318 = add i32 %var314, %var317

   add a3, a3, a4
   # %var319 = icmp sgt i32 %var310, %var318

   sub t2, a2, a3
   sgtz    a2, t2
   # br i1 %var319, label %if.then.2, label %if.else.2

   bne      a2, x0, .+8
   j spfa_if.else.2
   j spfa_if.then.2

   .section .text
   .globl spfa_if.then.2
spfa_if.then.2:
   # %var322 = getelementptr i32, ptr %var259, i32 %var306

   li t2, 4
   mul a1, a1, t2
   add x4, a1, x4
   mv a2, x4
   # %var326 = getelementptr i32, ptr %var259, i32 %var287

   li t2, 4
   mul a0, a0, t2
   add x4, a0, x4
   mv a3, x4
   # %var327 = load i32, ptr %var326

   lw a3, 0(t0)
   # %var329 = getelementptr %class..Edge, ptr %var303, i32 0, i32 2

   li t1, 2
   li t2, 4
   mul t1, t1, t2
   add x9, t1, x9
   mv a4, x9
   # %var330 = load i32, ptr %var329

   lw a4, 0(t0)
   # %var331 = add i32 %var327, %var330

   add a3, a3, a4
   # store i32 %var331, ptr %var322

   sw a3, 0(t1)
   # call void @Queue_int..push(ptr %var276, i32 %var306)

   sw ra, 140(sp)
   sw a0, 40(sp)
   sw a1, 44(sp)
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
   mv a0, x8
   mv a1, a1
   call Queue_int..push
   lw ra, 140(sp)
   sw a0, 132(sp)
   lw a0, 40(sp)
   lw a1, 44(sp)
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
   # br label %if.back.2

   j spfa_if.back.2

   .section .text
   .globl spfa_if.else.2
spfa_if.else.2:
   # br label %if.back.2

   j spfa_if.back.2

   .section .text
   .globl spfa_if.back.2
spfa_if.back.2:
   # br label %for.step.4

   j spfa_for.step.4

   .section .text
   .globl spfa_for.step.4
spfa_for.step.4:
   # %var335 = load ptr, ptr @g

   la t0, @g
   lw a2, 0(t0)
   # %var336 = getelementptr %class..EdgeList, ptr %var335, i32 0, i32 1

   li t1, 1
   li t2, 4
   mul t1, t1, t2
   add a2, t1, a2
   mv a2, a2
   # %var337 = load ptr, ptr %var336

   lw a2, 0(t0)
   # %var339 = getelementptr i32, ptr %var337, i32 %k.1_for.cond.4

   li t2, 4
   mul x3, x3, t2
   add a2, x3, a2
   mv x3, a2
   # %var340 = load i32, ptr %var339

   lw x3, 0(t0)
   # br label %for.cond.4

   mv x3, x3
   mv a1, x9
   mv x9, a1
   j spfa_for.cond.4

   .section .text
   .globl spfa_for.back.4
spfa_for.back.4:
   # br label %while.cond.1

   mv x9, a1
   mv x3, x9
   j spfa_while.cond.1

   .section .text
   .globl spfa_while.back.1
spfa_while.back.1:
   # ret ptr %var259

   addi sp, sp, 156
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   ret

   .section .text
   .globl EdgeList..init
EdgeList..init:
   addi sp, sp, -144
   sw t0, 132(sp)
   sw t1, 136(sp)
   sw t2, 140(sp)

   .section .text
   .globl EdgeList..init_entry
EdgeList..init_entry:
   # %var137 = getelementptr %class..EdgeList, ptr %_this, i32 0, i32 0

   li t1, 0
   li t2, 4
   mul t1, t1, t2
   add x3, t1, x3
   mv x9, x3
   # %var139 = call ptr @__array.alloca(i32 4, i32 1, i32 1, i32 %m)

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
   sw x9, 36(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   sw a0, 40(sp)
   li a2, 1
   mv a3, x3
   li a1, 1
   li a0, 4
   call __array.alloca
   lw ra, 128(sp)
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
   lw x9, 36(sp)
   lw x3, 12(sp)
   lw x4, 16(sp)
   lw a0, 40(sp)
   # store ptr %var139, ptr %var137

   sw a0, 0(t1)
   # %var142 = getelementptr %class..EdgeList, ptr %_this, i32 0, i32 1

   li t1, 1
   li t2, 4
   mul t1, t1, t2
   add x3, t1, x3
   mv x9, x3
   # %var144 = call ptr @__array.alloca(i32 4, i32 1, i32 1, i32 %m)

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
   sw x9, 36(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   sw a0, 40(sp)
   li a1, 1
   li a0, 4
   li a2, 1
   mv a3, x3
   call __array.alloca
   lw ra, 128(sp)
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
   lw x9, 36(sp)
   lw x3, 12(sp)
   lw x4, 16(sp)
   lw a0, 40(sp)
   # store ptr %var144, ptr %var142

   sw a0, 0(t1)
   # %var147 = getelementptr %class..EdgeList, ptr %_this, i32 0, i32 2

   li t1, 2
   li t2, 4
   mul t1, t1, t2
   add x3, t1, x3
   mv x9, x3
   # %var149 = call ptr @__array.alloca(i32 4, i32 1, i32 1, i32 %n)

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
   sw x9, 36(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   sw a0, 40(sp)
   li a2, 1
   li a1, 1
   mv a3, x4
   li a0, 4
   call __array.alloca
   lw ra, 128(sp)
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
   lw x9, 36(sp)
   lw x3, 12(sp)
   lw x4, 16(sp)
   lw a0, 40(sp)
   # store ptr %var149, ptr %var147

   sw a0, 0(t1)
   # br label %for.cond.0

   li x9, 0
   j EdgeList..init_for.cond.0

   .section .text
   .globl EdgeList..init_for.cond.0
EdgeList..init_for.cond.0:
   # %var154 = icmp slt i32 %i.2_for.cond.0, %m

   sub t2, x9, x3
   sltz    a0, t2
   # br i1 %var154, label %for.body.0, label %for.back.0

   bne      a0, x0, .+8
   j EdgeList..init_for.back.0
   j EdgeList..init_for.body.0

   .section .text
   .globl EdgeList..init_for.body.0
EdgeList..init_for.body.0:
   # %var156 = getelementptr %class..EdgeList, ptr %_this, i32 0, i32 1

   li t1, 1
   li t2, 4
   mul t1, t1, t2
   add x3, t1, x3
   mv a0, x3
   # %var157 = load ptr, ptr %var156

   lw a0, 0(t0)
   # %var159 = getelementptr i32, ptr %var157, i32 %i.2_for.cond.0

   li t2, 4
   mul x9, x9, t2
   add a0, x9, a0
   mv a0, a0
   # %var161 = sub i32 0, 1

   li t0, 0
   li t1, 1
   sub a1, t0, t1
   # store i32 %var161, ptr %var159

   sw a1, 0(t1)
   # br label %for.step.0

   j EdgeList..init_for.step.0

   .section .text
   .globl EdgeList..init_for.step.0
EdgeList..init_for.step.0:
   # %var163 = add i32 %i.2_for.cond.0, 1

   li t1, 1
   add x9, x9, t1
   # br label %for.cond.0

   mv x9, x9
   j EdgeList..init_for.cond.0

   .section .text
   .globl EdgeList..init_for.back.0
EdgeList..init_for.back.0:
   # br label %for.cond.1

   li x3, 0
   j EdgeList..init_for.cond.1

   .section .text
   .globl EdgeList..init_for.cond.1
EdgeList..init_for.cond.1:
   # %var167 = icmp slt i32 %i.2_for.cond.1, %n

   sub t2, x3, x4
   sltz    x9, t2
   # br i1 %var167, label %for.body.1, label %for.back.1

   bne      x9, x0, .+8
   j EdgeList..init_for.back.1
   j EdgeList..init_for.body.1

   .section .text
   .globl EdgeList..init_for.body.1
EdgeList..init_for.body.1:
   # %var169 = getelementptr %class..EdgeList, ptr %_this, i32 0, i32 2

   li t1, 2
   li t2, 4
   mul t1, t1, t2
   add x3, t1, x3
   mv x9, x3
   # %var170 = load ptr, ptr %var169

   lw x9, 0(t0)
   # %var172 = getelementptr i32, ptr %var170, i32 %i.2_for.cond.1

   li t2, 4
   mul x3, x3, t2
   add x9, x3, x9
   mv x9, x9
   # %var174 = sub i32 0, 1

   li t0, 0
   li t1, 1
   sub a0, t0, t1
   # store i32 %var174, ptr %var172

   sw a0, 0(t1)
   # br label %for.step.1

   j EdgeList..init_for.step.1

   .section .text
   .globl EdgeList..init_for.step.1
EdgeList..init_for.step.1:
   # %var176 = add i32 %i.2_for.cond.1, 1

   li t1, 1
   add x3, x3, t1
   # br label %for.cond.1

   mv x3, x3
   j EdgeList..init_for.cond.1

   .section .text
   .globl EdgeList..init_for.back.1
EdgeList..init_for.back.1:
   # %var178 = getelementptr %class..EdgeList, ptr %_this, i32 0, i32 3

   li t1, 3
   li t2, 4
   mul t1, t1, t2
   add x3, t1, x3
   mv x3, x3
   # store i32 0, ptr %var178

   li t0, 0
   sw t0, 0(t1)
   # ret void

   addi sp, sp, 144
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   ret

   .section .text
   .globl Queue_int..push
Queue_int..push:
   addi sp, sp, -148
   sw t0, 136(sp)
   sw t1, 140(sp)
   sw t2, 144(sp)

   .section .text
   .globl Queue_int..push_entry
Queue_int..push_entry:
   # %var1 = call i32 @Queue_int..size(ptr %_this)

   sw ra, 132(sp)
   sw a0, 40(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x8, 32(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   mv a0, x3
   call Queue_int..size
   lw ra, 132(sp)
   mv x8, a0
   lw a0, 40(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x8, 32(sp)
   lw x3, 12(sp)
   lw x4, 16(sp)
   # %var3 = getelementptr %class..Queue_int, ptr %_this, i32 0, i32 0

   li t1, 0
   li t2, 4
   mul t1, t1, t2
   add x3, t1, x3
   mv x9, x3
   # %var4 = load ptr, ptr %var3

   lw x9, 0(t0)
   # %var5 = call i32 @array.size(ptr %var4)

   sw ra, 132(sp)
   sw a0, 40(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x8, 32(sp)
   sw x9, 36(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   mv a0, x9
   call array.size
   lw ra, 132(sp)
   mv x9, a0
   lw a0, 40(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x8, 32(sp)
   lw x9, 36(sp)
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
   j Queue_int..push_if.then.0

   .section .text
   .globl Queue_int..push_if.then.0
Queue_int..push_if.then.0:
   # call void @Queue_int..doubleStorage(ptr %_this)

   sw ra, 132(sp)
   sw a0, 40(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   mv a0, x3
   call Queue_int..doubleStorage
   lw ra, 132(sp)
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

   j Queue_int..push_if.back.0

   .section .text
   .globl Queue_int..push_if.else.0
Queue_int..push_if.else.0:
   # br label %if.back.0

   j Queue_int..push_if.back.0

   .section .text
   .globl Queue_int..push_if.back.0
Queue_int..push_if.back.0:
   # %var11 = getelementptr %class..Queue_int, ptr %_this, i32 0, i32 0

   li t1, 0
   li t2, 4
   mul t1, t1, t2
   add x3, t1, x3
   mv x8, x3
   # %var12 = load ptr, ptr %var11

   lw x8, 0(t0)
   # %var14 = getelementptr %class..Queue_int, ptr %_this, i32 0, i32 2

   li t1, 2
   li t2, 4
   mul t1, t1, t2
   add x3, t1, x3
   mv x9, x3
   # %var15 = load i32, ptr %var14

   lw x9, 0(t0)
   # %var16 = getelementptr i32, ptr %var12, i32 %var15

   li t2, 4
   mul x9, x9, t2
   add x8, x9, x8
   mv x8, x8
   # store i32 %v, ptr %var16

   mv x4, a1
   sw x4, 0(t1)
   # %var20 = getelementptr %class..Queue_int, ptr %_this, i32 0, i32 2

   li t1, 2
   li t2, 4
   mul t1, t1, t2
   add x3, t1, x3
   mv x3, x3
   # %var23 = getelementptr %class..Queue_int, ptr %_this, i32 0, i32 2

   li t1, 2
   li t2, 4
   mul t1, t1, t2
   add x3, t1, x3
   mv x8, x3
   # %var24 = load i32, ptr %var23

   lw x8, 0(t0)
   # %var25 = add i32 %var24, 1

   li t1, 1
   add x8, x8, t1
   # %var27 = getelementptr %class..Queue_int, ptr %_this, i32 0, i32 0

   li t1, 0
   li t2, 4
   mul t1, t1, t2
   add x3, t1, x3
   mv x4, x3
   # %var28 = load ptr, ptr %var27

   lw x4, 0(t0)
   # %var29 = call i32 @array.size(ptr %var28)

   sw ra, 132(sp)
   sw a0, 40(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x8, 32(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   mv a0, x4
   call array.size
   lw ra, 132(sp)
   mv x4, a0
   lw a0, 40(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x8, 32(sp)
   lw x3, 12(sp)
   lw x4, 16(sp)
   # %var30 = srem i32 %var25, %var29

   rem x4, x8, x4
   # store i32 %var30, ptr %var20

   sw x4, 0(t1)
   # ret void

   addi sp, sp, 148
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   ret

   .section .text
   .globl Queue_int..pop
Queue_int..pop:
   addi sp, sp, -148
   sw t0, 136(sp)
   sw t1, 140(sp)
   sw t2, 144(sp)

   .section .text
   .globl Queue_int..pop_entry
Queue_int..pop_entry:
   # %var40 = call i32 @Queue_int..size(ptr %_this)

   sw ra, 132(sp)
   sw a0, 40(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   mv a0, x3
   call Queue_int..size
   lw ra, 132(sp)
   mv x4, a0
   lw a0, 40(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x3, 12(sp)
   lw x4, 16(sp)
   # %var41 = icmp eq i32 %var40, 0

   li t1, 0
   sub t2, x4, t1
   seqz    x4, t2
   # br i1 %var41, label %if.then.1, label %if.else.1

   bne      x4, x0, .+8
   j Queue_int..pop_if.else.1
   j Queue_int..pop_if.then.1

   .section .text
   .globl Queue_int..pop_if.then.1
Queue_int..pop_if.then.1:
   # call void @println(ptr @.str..0)

   sw ra, 132(sp)
   sw a0, 40(sp)
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
   lw a0, 40(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x3, 12(sp)
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
   # %var44 = call i32 @Queue_int..top(ptr %_this)

   sw ra, 132(sp)
   sw a0, 40(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   mv a0, x3
   call Queue_int..top
   lw ra, 132(sp)
   mv x4, a0
   lw a0, 40(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x3, 12(sp)
   lw x4, 16(sp)
   # %var46 = getelementptr %class..Queue_int, ptr %_this, i32 0, i32 1

   li t1, 1
   li t2, 4
   mul t1, t1, t2
   add x3, t1, x3
   mv x8, x3
   # %var49 = getelementptr %class..Queue_int, ptr %_this, i32 0, i32 1

   li t1, 1
   li t2, 4
   mul t1, t1, t2
   add x3, t1, x3
   mv x9, x3
   # %var50 = load i32, ptr %var49

   lw x9, 0(t0)
   # %var51 = add i32 %var50, 1

   li t1, 1
   add x9, x9, t1
   # %var53 = getelementptr %class..Queue_int, ptr %_this, i32 0, i32 0

   li t1, 0
   li t2, 4
   mul t1, t1, t2
   add x3, t1, x3
   mv x3, x3
   # %var54 = load ptr, ptr %var53

   lw x3, 0(t0)
   # %var55 = call i32 @array.size(ptr %var54)

   sw ra, 132(sp)
   sw a0, 40(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x8, 32(sp)
   sw x9, 36(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   mv a0, x3
   call array.size
   lw ra, 132(sp)
   mv x3, a0
   lw a0, 40(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x8, 32(sp)
   lw x9, 36(sp)
   lw x3, 12(sp)
   lw x4, 16(sp)
   # %var56 = srem i32 %var51, %var55

   rem x3, x9, x3
   # store i32 %var56, ptr %var46

   sw x3, 0(t1)
   # ret i32 %var44

   addi sp, sp, 148
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   ret

   .section .text
   .globl Queue_int..Queue_int
Queue_int..Queue_int:
   addi sp, sp, -144
   sw t0, 132(sp)
   sw t1, 136(sp)
   sw t2, 140(sp)

   .section .text
   .globl Queue_int..Queue_int_entry
Queue_int..Queue_int_entry:
   # %var127 = getelementptr %class..Queue_int, ptr %_this, i32 0, i32 1

   li t1, 1
   li t2, 4
   mul t1, t1, t2
   add x3, t1, x3
   mv x4, x3
   # store i32 0, ptr %var127

   li t0, 0
   sw t0, 0(t1)
   # %var130 = getelementptr %class..Queue_int, ptr %_this, i32 0, i32 2

   li t1, 2
   li t2, 4
   mul t1, t1, t2
   add x3, t1, x3
   mv x4, x3
   # store i32 0, ptr %var130

   li t0, 0
   sw t0, 0(t1)
   # %var133 = getelementptr %class..Queue_int, ptr %_this, i32 0, i32 0

   li t1, 0
   li t2, 4
   mul t1, t1, t2
   add x3, t1, x3
   mv x3, x3
   # %var135 = call ptr @__array.alloca(i32 4, i32 1, i32 1, i32 16)

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
   sw x3, 12(sp)
   sw x4, 16(sp)
   li a0, 4
   li a1, 1
   li a2, 1
   li a3, 16
   call __array.alloca
   lw ra, 128(sp)
   mv x4, a0
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
   # store ptr %var135, ptr %var133

   sw x4, 0(t1)
   # ret void

   addi sp, sp, 144
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   ret

   .section .text
   .globl EdgeList..addEdge
EdgeList..addEdge:
   addi sp, sp, -144
   sw t0, 132(sp)
   sw t1, 136(sp)
   sw t2, 140(sp)

   .section .text
   .globl EdgeList..addEdge_entry
EdgeList..addEdge_entry:
   # %var180 = call ptr @_malloc(i32 12)

   sw ra, 128(sp)
   sw a0, 40(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x8, 32(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   sw a0, 40(sp)
   li a0, 12
   call _malloc
   lw ra, 128(sp)
   mv a0, a0
   lw a0, 40(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x8, 32(sp)
   lw x3, 12(sp)
   lw x4, 16(sp)
   lw a0, 40(sp)
   # %var182 = getelementptr %class..Edge, ptr %var180, i32 0, i32 0

   li t1, 0
   li t2, 4
   mul t1, t1, t2
   add a0, t1, a0
   mv a1, a0
   # store i32 %u, ptr %var182

   mv x3, a1
   sw x3, 0(t1)
   # %var186 = getelementptr %class..Edge, ptr %var180, i32 0, i32 1

   li t1, 1
   li t2, 4
   mul t1, t1, t2
   add a0, t1, a0
   mv a1, a0
   # store i32 %v, ptr %var186

   mv x4, a2
   sw x4, 0(t1)
   # %var190 = getelementptr %class..Edge, ptr %var180, i32 0, i32 2

   li t1, 2
   li t2, 4
   mul t1, t1, t2
   add a0, t1, a0
   mv x4, a0
   # store i32 %w, ptr %var190

   mv x8, a3
   sw x8, 0(t1)
   # %var194 = getelementptr %class..EdgeList, ptr %_this, i32 0, i32 0

   li t1, 0
   li t2, 4
   mul t1, t1, t2
   add x3, t1, x3
   mv x4, x3
   # %var195 = load ptr, ptr %var194

   lw x4, 0(t0)
   # %var197 = getelementptr %class..EdgeList, ptr %_this, i32 0, i32 3

   li t1, 3
   li t2, 4
   mul t1, t1, t2
   add x3, t1, x3
   mv x8, x3
   # %var198 = load i32, ptr %var197

   lw x8, 0(t0)
   # %var199 = getelementptr ptr, ptr %var195, i32 %var198

   li t2, 4
   mul x8, x8, t2
   add x4, x8, x4
   mv x4, x4
   # store ptr %var180, ptr %var199

   sw a0, 0(t1)
   # %var203 = getelementptr %class..EdgeList, ptr %_this, i32 0, i32 1

   li t1, 1
   li t2, 4
   mul t1, t1, t2
   add x3, t1, x3
   mv x4, x3
   # %var204 = load ptr, ptr %var203

   lw x4, 0(t0)
   # %var206 = getelementptr %class..EdgeList, ptr %_this, i32 0, i32 3

   li t1, 3
   li t2, 4
   mul t1, t1, t2
   add x3, t1, x3
   mv x8, x3
   # %var207 = load i32, ptr %var206

   lw x8, 0(t0)
   # %var208 = getelementptr i32, ptr %var204, i32 %var207

   li t2, 4
   mul x8, x8, t2
   add x4, x8, x4
   mv x4, x4
   # %var211 = getelementptr %class..EdgeList, ptr %_this, i32 0, i32 2

   li t1, 2
   li t2, 4
   mul t1, t1, t2
   add x3, t1, x3
   mv x8, x3
   # %var212 = load ptr, ptr %var211

   lw x8, 0(t0)
   # %var214 = getelementptr i32, ptr %var212, i32 %u

   li t2, 4
   mul x3, x3, t2
   add x8, x3, x8
   mv x8, x8
   # %var215 = load i32, ptr %var214

   lw x8, 0(t0)
   # store i32 %var215, ptr %var208

   sw x8, 0(t1)
   # %var217 = getelementptr %class..EdgeList, ptr %_this, i32 0, i32 2

   li t1, 2
   li t2, 4
   mul t1, t1, t2
   add x3, t1, x3
   mv x4, x3
   # %var218 = load ptr, ptr %var217

   lw x4, 0(t0)
   # %var220 = getelementptr i32, ptr %var218, i32 %u

   li t2, 4
   mul x3, x3, t2
   add x4, x3, x4
   mv x3, x4
   # %var223 = getelementptr %class..EdgeList, ptr %_this, i32 0, i32 3

   li t1, 3
   li t2, 4
   mul t1, t1, t2
   add x3, t1, x3
   mv x4, x3
   # %var224 = load i32, ptr %var223

   lw x4, 0(t0)
   # store i32 %var224, ptr %var220

   sw x4, 0(t1)
   # %var226 = getelementptr %class..EdgeList, ptr %_this, i32 0, i32 3

   li t1, 3
   li t2, 4
   mul t1, t1, t2
   add x3, t1, x3
   mv x3, x3
   # %var227 = load i32, ptr %var226

   lw x4, 0(t0)
   # %var228 = add i32 %var227, 1

   li t1, 1
   add x4, x4, t1
   # store i32 %var228, ptr %var226

   sw x4, 0(t1)
   # ret void

   addi sp, sp, 144
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   ret

   .section .text
   .globl Queue_int..top
Queue_int..top:
   addi sp, sp, -144
   sw t0, 132(sp)
   sw t1, 136(sp)
   sw t2, 140(sp)

   .section .text
   .globl Queue_int..top_entry
Queue_int..top_entry:
   # %var32 = getelementptr %class..Queue_int, ptr %_this, i32 0, i32 0

   li t1, 0
   li t2, 4
   mul t1, t1, t2
   add x3, t1, x3
   mv x4, x3
   # %var33 = load ptr, ptr %var32

   lw x4, 0(t0)
   # %var35 = getelementptr %class..Queue_int, ptr %_this, i32 0, i32 1

   li t1, 1
   li t2, 4
   mul t1, t1, t2
   add x3, t1, x3
   mv x3, x3
   # %var36 = load i32, ptr %var35

   lw x3, 0(t0)
   # %var37 = getelementptr i32, ptr %var33, i32 %var36

   li t2, 4
   mul x3, x3, t2
   add x4, x3, x4
   mv x3, x4
   # %var38 = load i32, ptr %var37

   lw x3, 0(t0)
   # ret i32 %var38

   addi sp, sp, 144
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   ret

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
   .globl Queue_int..doubleStorage
Queue_int..doubleStorage:
   addi sp, sp, -144
   sw t0, 132(sp)
   sw t1, 136(sp)
   sw t2, 140(sp)

   .section .text
   .globl Queue_int..doubleStorage_entry
Queue_int..doubleStorage_entry:
   # %var76 = getelementptr %class..Queue_int, ptr %_this, i32 0, i32 0

   li t1, 0
   li t2, 4
   mul t1, t1, t2
   add x3, t1, x3
   mv x4, x3
   # %var77 = load ptr, ptr %var76

   lw x4, 0(t0)
   # %var79 = getelementptr %class..Queue_int, ptr %_this, i32 0, i32 1

   li t1, 1
   li t2, 4
   mul t1, t1, t2
   add x3, t1, x3
   mv x8, x3
   # %var80 = load i32, ptr %var79

   lw x8, 0(t0)
   # %var82 = getelementptr %class..Queue_int, ptr %_this, i32 0, i32 2

   li t1, 2
   li t2, 4
   mul t1, t1, t2
   add x3, t1, x3
   mv x9, x3
   # %var83 = load i32, ptr %var82

   lw x9, 0(t0)
   # %var85 = getelementptr %class..Queue_int, ptr %_this, i32 0, i32 0

   li t1, 0
   li t2, 4
   mul t1, t1, t2
   add x3, t1, x3
   mv a0, x3
   # %var89 = call i32 @array.size(ptr %var77)

   sw ra, 128(sp)
   sw a0, 40(sp)
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
   mv a0, x4
   call array.size
   lw ra, 128(sp)
   mv a1, a0
   lw a0, 40(sp)
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
   # %var90 = mul i32 %var89, 2

   li t1, 2
   mul a1, a1, t1
   # %var87 = call ptr @__array.alloca(i32 4, i32 1, i32 1, i32 %var90)

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
   sw x8, 32(sp)
   sw a1, 44(sp)
   sw x9, 36(sp)
   sw x3, 12(sp)
   sw x4, 16(sp)
   sw a0, 40(sp)
   li a2, 1
   li a0, 4
   li a1, 1
   mv a3, a1
   call __array.alloca
   lw ra, 128(sp)
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
   lw a1, 44(sp)
   lw x9, 36(sp)
   lw x3, 12(sp)
   lw x4, 16(sp)
   lw a0, 40(sp)
   # store ptr %var87, ptr %var85

   sw a1, 0(t1)
   # %var92 = getelementptr %class..Queue_int, ptr %_this, i32 0, i32 1

   li t1, 1
   li t2, 4
   mul t1, t1, t2
   add x3, t1, x3
   mv a0, x3
   # store i32 0, ptr %var92

   li t0, 0
   sw t0, 0(t1)
   # %var95 = getelementptr %class..Queue_int, ptr %_this, i32 0, i32 2

   li t1, 2
   li t2, 4
   mul t1, t1, t2
   add x3, t1, x3
   mv a0, x3
   # store i32 0, ptr %var95

   li t0, 0
   sw t0, 0(t1)
   # br label %while.cond.0

   mv x8, x8
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
   j Queue_int..doubleStorage_while.body.0

   .section .text
   .globl Queue_int..doubleStorage_while.body.0
Queue_int..doubleStorage_while.body.0:
   # %var105 = getelementptr %class..Queue_int, ptr %_this, i32 0, i32 0

   li t1, 0
   li t2, 4
   mul t1, t1, t2
   add x3, t1, x3
   mv a0, x3
   # %var106 = load ptr, ptr %var105

   lw a0, 0(t0)
   # %var108 = getelementptr %class..Queue_int, ptr %_this, i32 0, i32 2

   li t1, 2
   li t2, 4
   mul t1, t1, t2
   add x3, t1, x3
   mv a1, x3
   # %var109 = load i32, ptr %var108

   lw a1, 0(t0)
   # %var110 = getelementptr i32, ptr %var106, i32 %var109

   li t2, 4
   mul a1, a1, t2
   add a0, a1, a0
   mv a0, a0
   # %var114 = getelementptr i32, ptr %var77, i32 %i.1_while.cond.0

   li t2, 4
   mul x8, x8, t2
   add x4, x8, x4
   mv a1, x4
   # %var115 = load i32, ptr %var114

   lw a1, 0(t0)
   # store i32 %var115, ptr %var110

   sw a1, 0(t1)
   # %var117 = getelementptr %class..Queue_int, ptr %_this, i32 0, i32 2

   li t1, 2
   li t2, 4
   mul t1, t1, t2
   add x3, t1, x3
   mv a0, x3
   # %var118 = load i32, ptr %var117

   lw a1, 0(t0)
   # %var119 = add i32 %var118, 1

   li t1, 1
   add a1, a1, t1
   # store i32 %var119, ptr %var117

   sw a1, 0(t1)
   # %var122 = add i32 %i.1_while.cond.0, 1

   li t1, 1
   add x8, x8, t1
   # %var124 = call i32 @array.size(ptr %var77)

   sw ra, 128(sp)
   sw a0, 40(sp)
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
   mv a0, a0
   lw a0, 40(sp)
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
   # %var125 = srem i32 %var122, %var124

   rem x8, x8, a0
   # br label %while.cond.0

   mv x8, x8
   j Queue_int..doubleStorage_while.cond.0

   .section .text
   .globl Queue_int..doubleStorage_while.back.0
Queue_int..doubleStorage_while.back.0:
   # ret void

   addi sp, sp, 144
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   ret

   .section .data
   .globl @INF
@INF:
   .word 10000000

   .section .data
   .globl @g
@g:
   .word 0

   .section .data
   .globl @m
@m:
   .word 0

   .section .data
   .globl @n
@n:
   .word 0

   .section .rodata
@.str..1:
   .asciz "-1"

   .section .rodata
@.str..2:
   .asciz " "

   .section .rodata
@.str..0:
   .asciz "Warning: Queue_int::pop: empty queue"

   .section .rodata
@.str..3:
   .asciz ""

