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
   addi sp, sp, -148
   sw t0, 136(sp)
   sw t1, 140(sp)
   # phi start 
   # phi end 
   sw t2, 144(sp)

   .section .text
   .globl main_entry
main_entry:
   # call void @__init()

   sw ra, 132(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   call __init
   lw ra, 132(sp)
   sw a0, 128(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   # br label %for.cond.0

   # phi start 
   li x3, 0
   li x4, 1
   # phi end 
   j main_for.cond.0

   .section .text
   .globl main_for.cond.0
main_for.cond.0:
   # %var3 = icmp slt i32 %i.1_for.cond.0, 2

   li t1, 2
   sub t2, x4, t1
   sltz    x8, t2
   # br i1 %var3, label %for.body.0, label %for.back.0

   bne      x8, x0, .+8
   j main_for.back.0
   # phi start 
   # phi end 
   j main_for.body.0

   .section .text
   .globl main_for.body.0
main_for.body.0:
   # br label %for.step.0

   # phi start 
   # phi end 
   j main_for.step.0

   .section .text
   .globl main_for.step.0
main_for.step.0:
   # %var6 = add i32 %i.1_for.cond.0, 1

   li t1, 1
   add x3, x4, t1
   # br label %for.cond.0

   # phi start 
   li x3, 1
   mv x4, x3
   # phi end 
   j main_for.cond.0

   .section .text
   .globl main_for.back.0
main_for.back.0:
   # ret i32 %f2.1_for.cond.0

   mv a0, x3
   addi sp, sp, 148
   lw t0, -12(sp)
   lw t1, -8(sp)
   lw t2, -4(sp)
   # phi start 
   # phi end 
   ret

