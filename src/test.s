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
   .globl main
main:
   addi sp, sp, -152
   sw t0, 140(sp)
   sw t1, 144(sp)
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
   # %var1 = load i32, ptr @C

   la t0, @C
   lw x3, 0(t0)
   # %var2 = shl i32 1, 29

   li t0, 1
   li t1, 29
   sll x4, t0, t1
   # %var3 = icmp slt i32 %var1, %var2

   sub t2, x3, x4
   sltz    x3, t2
   # br i1 %var3, label %land.next..0, label %entry_and_land.end..0

   bne      x3, x0, .+8
   j main_entry_and_land.end..0
   j main_land.next..0

   .section .text
   .globl main_land.next..0
main_land.next..0:
   # br label %land.end..0

   j main_land.end..0

   .section .text
   .globl main_land.end..0
main_land.end..0:
   # br label %while.cond.0

   j main_while.cond.0

   .section .text
   .globl main_while.cond.0
main_while.cond.0:
   # %var10 = load i32, ptr @C

   la t0, @C
   lw x3, 0(t0)
   # %var11 = shl i32 1, 29

   li t0, 1
   li t1, 29
   sll x4, t0, t1
   # %var12 = icmp slt i32 %var10, %var11

   sub t2, x3, x4
   sltz    x3, t2
   # br i1 %var12, label %land.next..1, label %while.cond.0_and_land.end..1

   bne      x3, x0, .+8
   j main_while.cond.0_and_land.end..1
   j main_land.next..1

   .section .text
   .globl main_land.next..1
main_land.next..1:
   # %var14 = load i32, ptr @C

   la t0, @C
   lw x3, 0(t0)
   # %var15 = shl i32 1, 29

   li t0, 1
   li t1, 29
   sll x4, t0, t1
   # %var16 = sub i32 0, %var15

   li t0, 0
   sub x4, t0, x4
   # %var17 = icmp sgt i32 %var14, %var16

   sub t2, x3, x4
   sgtz    x3, t2
   # br label %land.end..1

   mv x3, x3
   j main_land.end..1

   .section .text
   .globl main_land.end..1
main_land.end..1:
   # br i1 %var13_land.end..1, label %while.body.0, label %while.back.0

   bne      x3, x0, .+8
   j main_while.back.0
   j main_while.body.0

   .section .text
   .globl main_while.body.0
main_while.body.0:
   # %var20 = load i32, ptr @C

   la t0, @C
   lw x3, 0(t0)
   # %var21 = load i32, ptr @A

   la t0, @A
   lw x4, 0(t0)
   # %var22 = sub i32 %var20, %var21

   sub x3, x3, x4
   # %var23 = load i32, ptr @B

   la t0, @B
   lw x4, 0(t0)
   # %var24 = add i32 %var22, %var23

   add x3, x3, x4
   # %var25 = load i32, ptr @A

   la t0, @A
   lw x4, 0(t0)
   # %var26 = load i32, ptr @B

   la t0, @B
   lw x8, 0(t0)
   # %var27 = add i32 %var25, %var26

   add x4, x4, x8
   # %var28 = sub i32 %var24, %var27

   sub x3, x3, x4
   # %var29 = load i32, ptr @C

   la t0, @C
   lw x4, 0(t0)
   # %var30 = load i32, ptr @A

   la t0, @A
   lw x8, 0(t0)
   # %var31 = sub i32 %var29, %var30

   sub x4, x4, x8
   # %var32 = load i32, ptr @B

   la t0, @B
   lw x8, 0(t0)
   # %var33 = add i32 %var31, %var32

   add x4, x4, x8
   # %var34 = load i32, ptr @A

   la t0, @A
   lw x8, 0(t0)
   # %var35 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var36 = add i32 %var34, %var35

   add x8, x8, x9
   # %var37 = sub i32 %var33, %var36

   sub x4, x4, x8
   # %var38 = add i32 %var28, %var37

   add x3, x3, x4
   # %var39 = load i32, ptr @C

   la t0, @C
   lw x4, 0(t0)
   # %var40 = load i32, ptr @A

   la t0, @A
   lw x8, 0(t0)
   # %var41 = sub i32 %var39, %var40

   sub x4, x4, x8
   # %var42 = load i32, ptr @B

   la t0, @B
   lw x8, 0(t0)
   # %var43 = add i32 %var41, %var42

   add x4, x4, x8
   # %var44 = load i32, ptr @A

   la t0, @A
   lw x8, 0(t0)
   # %var45 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var46 = add i32 %var44, %var45

   add x8, x8, x9
   # %var47 = sub i32 %var43, %var46

   sub x4, x4, x8
   # %var48 = load i32, ptr @C

   la t0, @C
   lw x8, 0(t0)
   # %var49 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var50 = sub i32 %var48, %var49

   sub x8, x8, x9
   # %var51 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var52 = add i32 %var50, %var51

   add x8, x8, x9
   # %var53 = add i32 %var47, %var52

   add x4, x4, x8
   # %var54 = add i32 %var38, %var53

   add x3, x3, x4
   # %var55 = load i32, ptr @A

   la t0, @A
   lw x4, 0(t0)
   # %var56 = load i32, ptr @B

   la t0, @B
   lw x8, 0(t0)
   # %var57 = add i32 %var55, %var56

   add x4, x4, x8
   # %var58 = load i32, ptr @C

   la t0, @C
   lw x8, 0(t0)
   # %var59 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var60 = sub i32 %var58, %var59

   sub x8, x8, x9
   # %var61 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var62 = add i32 %var60, %var61

   add x8, x8, x9
   # %var63 = add i32 %var57, %var62

   add x4, x4, x8
   # %var64 = load i32, ptr @A

   la t0, @A
   lw x8, 0(t0)
   # %var65 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var66 = add i32 %var64, %var65

   add x8, x8, x9
   # %var67 = sub i32 %var63, %var66

   sub x4, x4, x8
   # %var68 = load i32, ptr @C

   la t0, @C
   lw x8, 0(t0)
   # %var69 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var70 = sub i32 %var68, %var69

   sub x8, x8, x9
   # %var71 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var72 = add i32 %var70, %var71

   add x8, x8, x9
   # %var73 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var74 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var75 = add i32 %var73, %var74

   add x9, x9, a0
   # %var76 = sub i32 %var72, %var75

   sub x8, x8, x9
   # %var77 = load i32, ptr @C

   la t0, @C
   lw x9, 0(t0)
   # %var78 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var79 = sub i32 %var77, %var78

   sub x9, x9, a0
   # %var80 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var81 = add i32 %var79, %var80

   add x9, x9, a0
   # %var82 = add i32 %var76, %var81

   add x8, x8, x9
   # %var83 = add i32 %var67, %var82

   add x4, x4, x8
   # %var84 = sub i32 %var54, %var83

   sub x3, x3, x4
   # %var85 = load i32, ptr @A

   la t0, @A
   lw x4, 0(t0)
   # %var86 = load i32, ptr @B

   la t0, @B
   lw x8, 0(t0)
   # %var87 = add i32 %var85, %var86

   add x4, x4, x8
   # %var88 = load i32, ptr @C

   la t0, @C
   lw x8, 0(t0)
   # %var89 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var90 = sub i32 %var88, %var89

   sub x8, x8, x9
   # %var91 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var92 = add i32 %var90, %var91

   add x8, x8, x9
   # %var93 = add i32 %var87, %var92

   add x4, x4, x8
   # %var94 = load i32, ptr @A

   la t0, @A
   lw x8, 0(t0)
   # %var95 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var96 = add i32 %var94, %var95

   add x8, x8, x9
   # %var97 = load i32, ptr @C

   la t0, @C
   lw x9, 0(t0)
   # %var98 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var99 = sub i32 %var97, %var98

   sub x9, x9, a0
   # %var100 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var101 = add i32 %var99, %var100

   add x9, x9, a0
   # %var102 = add i32 %var96, %var101

   add x8, x8, x9
   # %var103 = sub i32 %var93, %var102

   sub x4, x4, x8
   # %var104 = load i32, ptr @A

   la t0, @A
   lw x8, 0(t0)
   # %var105 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var106 = add i32 %var104, %var105

   add x8, x8, x9
   # %var107 = load i32, ptr @C

   la t0, @C
   lw x9, 0(t0)
   # %var108 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var109 = sub i32 %var107, %var108

   sub x9, x9, a0
   # %var110 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var111 = add i32 %var109, %var110

   add x9, x9, a0
   # %var112 = add i32 %var106, %var111

   add x8, x8, x9
   # %var113 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var114 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var115 = add i32 %var113, %var114

   add x9, x9, a0
   # %var116 = sub i32 %var112, %var115

   sub x8, x8, x9
   # %var117 = sub i32 %var103, %var116

   sub x4, x4, x8
   # %var118 = load i32, ptr @C

   la t0, @C
   lw x8, 0(t0)
   # %var119 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var120 = sub i32 %var118, %var119

   sub x8, x8, x9
   # %var121 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var122 = add i32 %var120, %var121

   add x8, x8, x9
   # %var123 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var124 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var125 = add i32 %var123, %var124

   add x9, x9, a0
   # %var126 = sub i32 %var122, %var125

   sub x8, x8, x9
   # %var127 = load i32, ptr @C

   la t0, @C
   lw x9, 0(t0)
   # %var128 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var129 = sub i32 %var127, %var128

   sub x9, x9, a0
   # %var130 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var131 = add i32 %var129, %var130

   add x9, x9, a0
   # %var132 = add i32 %var126, %var131

   add x8, x8, x9
   # %var133 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var134 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var135 = add i32 %var133, %var134

   add x9, x9, a0
   # %var136 = load i32, ptr @C

   la t0, @C
   lw a0, 0(t0)
   # %var137 = load i32, ptr @A

   la t0, @A
   lw a1, 0(t0)
   # %var138 = sub i32 %var136, %var137

   sub a0, a0, a1
   # %var139 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var140 = add i32 %var138, %var139

   add a0, a0, a1
   # %var141 = add i32 %var135, %var140

   add x9, x9, a0
   # %var142 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var143 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var144 = add i32 %var142, %var143

   add a0, a0, a1
   # %var145 = sub i32 %var141, %var144

   sub x9, x9, a0
   # %var146 = sub i32 %var132, %var145

   sub x8, x8, x9
   # %var147 = add i32 %var117, %var146

   add x4, x4, x8
   # %var148 = sub i32 %var84, %var147

   sub x3, x3, x4
   # %var149 = load i32, ptr @C

   la t0, @C
   lw x4, 0(t0)
   # %var150 = load i32, ptr @A

   la t0, @A
   lw x8, 0(t0)
   # %var151 = sub i32 %var149, %var150

   sub x4, x4, x8
   # %var152 = load i32, ptr @B

   la t0, @B
   lw x8, 0(t0)
   # %var153 = add i32 %var151, %var152

   add x4, x4, x8
   # %var154 = load i32, ptr @A

   la t0, @A
   lw x8, 0(t0)
   # %var155 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var156 = add i32 %var154, %var155

   add x8, x8, x9
   # %var157 = sub i32 %var153, %var156

   sub x4, x4, x8
   # %var158 = load i32, ptr @C

   la t0, @C
   lw x8, 0(t0)
   # %var159 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var160 = sub i32 %var158, %var159

   sub x8, x8, x9
   # %var161 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var162 = add i32 %var160, %var161

   add x8, x8, x9
   # %var163 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var164 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var165 = add i32 %var163, %var164

   add x9, x9, a0
   # %var166 = sub i32 %var162, %var165

   sub x8, x8, x9
   # %var167 = add i32 %var157, %var166

   add x4, x4, x8
   # %var168 = load i32, ptr @C

   la t0, @C
   lw x8, 0(t0)
   # %var169 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var170 = sub i32 %var168, %var169

   sub x8, x8, x9
   # %var171 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var172 = add i32 %var170, %var171

   add x8, x8, x9
   # %var173 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var174 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var175 = add i32 %var173, %var174

   add x9, x9, a0
   # %var176 = sub i32 %var172, %var175

   sub x8, x8, x9
   # %var177 = load i32, ptr @C

   la t0, @C
   lw x9, 0(t0)
   # %var178 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var179 = sub i32 %var177, %var178

   sub x9, x9, a0
   # %var180 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var181 = add i32 %var179, %var180

   add x9, x9, a0
   # %var182 = add i32 %var176, %var181

   add x8, x8, x9
   # %var183 = add i32 %var167, %var182

   add x4, x4, x8
   # %var184 = load i32, ptr @A

   la t0, @A
   lw x8, 0(t0)
   # %var185 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var186 = add i32 %var184, %var185

   add x8, x8, x9
   # %var187 = load i32, ptr @C

   la t0, @C
   lw x9, 0(t0)
   # %var188 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var189 = sub i32 %var187, %var188

   sub x9, x9, a0
   # %var190 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var191 = add i32 %var189, %var190

   add x9, x9, a0
   # %var192 = add i32 %var186, %var191

   add x8, x8, x9
   # %var193 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var194 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var195 = add i32 %var193, %var194

   add x9, x9, a0
   # %var196 = sub i32 %var192, %var195

   sub x8, x8, x9
   # %var197 = load i32, ptr @C

   la t0, @C
   lw x9, 0(t0)
   # %var198 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var199 = sub i32 %var197, %var198

   sub x9, x9, a0
   # %var200 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var201 = add i32 %var199, %var200

   add x9, x9, a0
   # %var202 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var203 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var204 = add i32 %var202, %var203

   add a0, a0, a1
   # %var205 = sub i32 %var201, %var204

   sub x9, x9, a0
   # %var206 = load i32, ptr @C

   la t0, @C
   lw a0, 0(t0)
   # %var207 = load i32, ptr @A

   la t0, @A
   lw a1, 0(t0)
   # %var208 = sub i32 %var206, %var207

   sub a0, a0, a1
   # %var209 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var210 = add i32 %var208, %var209

   add a0, a0, a1
   # %var211 = add i32 %var205, %var210

   add x9, x9, a0
   # %var212 = add i32 %var196, %var211

   add x8, x8, x9
   # %var213 = sub i32 %var183, %var212

   sub x4, x4, x8
   # %var214 = load i32, ptr @A

   la t0, @A
   lw x8, 0(t0)
   # %var215 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var216 = add i32 %var214, %var215

   add x8, x8, x9
   # %var217 = load i32, ptr @C

   la t0, @C
   lw x9, 0(t0)
   # %var218 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var219 = sub i32 %var217, %var218

   sub x9, x9, a0
   # %var220 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var221 = add i32 %var219, %var220

   add x9, x9, a0
   # %var222 = add i32 %var216, %var221

   add x8, x8, x9
   # %var223 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var224 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var225 = add i32 %var223, %var224

   add x9, x9, a0
   # %var226 = sub i32 %var222, %var225

   sub x8, x8, x9
   # %var227 = load i32, ptr @C

   la t0, @C
   lw x9, 0(t0)
   # %var228 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var229 = sub i32 %var227, %var228

   sub x9, x9, a0
   # %var230 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var231 = add i32 %var229, %var230

   add x9, x9, a0
   # %var232 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var233 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var234 = add i32 %var232, %var233

   add a0, a0, a1
   # %var235 = sub i32 %var231, %var234

   sub x9, x9, a0
   # %var236 = load i32, ptr @C

   la t0, @C
   lw a0, 0(t0)
   # %var237 = load i32, ptr @A

   la t0, @A
   lw a1, 0(t0)
   # %var238 = sub i32 %var236, %var237

   sub a0, a0, a1
   # %var239 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var240 = add i32 %var238, %var239

   add a0, a0, a1
   # %var241 = add i32 %var235, %var240

   add x9, x9, a0
   # %var242 = add i32 %var226, %var241

   add x8, x8, x9
   # %var243 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var244 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var245 = add i32 %var243, %var244

   add x9, x9, a0
   # %var246 = load i32, ptr @C

   la t0, @C
   lw a0, 0(t0)
   # %var247 = load i32, ptr @A

   la t0, @A
   lw a1, 0(t0)
   # %var248 = sub i32 %var246, %var247

   sub a0, a0, a1
   # %var249 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var250 = add i32 %var248, %var249

   add a0, a0, a1
   # %var251 = add i32 %var245, %var250

   add x9, x9, a0
   # %var252 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var253 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var254 = add i32 %var252, %var253

   add a0, a0, a1
   # %var255 = sub i32 %var251, %var254

   sub x9, x9, a0
   # %var256 = load i32, ptr @C

   la t0, @C
   lw a0, 0(t0)
   # %var257 = load i32, ptr @A

   la t0, @A
   lw a1, 0(t0)
   # %var258 = sub i32 %var256, %var257

   sub a0, a0, a1
   # %var259 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var260 = add i32 %var258, %var259

   add a0, a0, a1
   # %var261 = load i32, ptr @A

   la t0, @A
   lw a1, 0(t0)
   # %var262 = load i32, ptr @B

   la t0, @B
   lw a2, 0(t0)
   # %var263 = add i32 %var261, %var262

   add a1, a1, a2
   # %var264 = sub i32 %var260, %var263

   sub a0, a0, a1
   # %var265 = load i32, ptr @C

   la t0, @C
   lw a1, 0(t0)
   # %var266 = load i32, ptr @A

   la t0, @A
   lw a2, 0(t0)
   # %var267 = sub i32 %var265, %var266

   sub a1, a1, a2
   # %var268 = load i32, ptr @B

   la t0, @B
   lw a2, 0(t0)
   # %var269 = add i32 %var267, %var268

   add a1, a1, a2
   # %var270 = add i32 %var264, %var269

   add a0, a0, a1
   # %var271 = add i32 %var255, %var270

   add x9, x9, a0
   # %var272 = sub i32 %var242, %var271

   sub x8, x8, x9
   # %var273 = sub i32 %var213, %var272

   sub x4, x4, x8
   # %var274 = add i32 %var148, %var273

   add x3, x3, x4
   # %var275 = load i32, ptr @A

   la t0, @A
   lw x4, 0(t0)
   # %var276 = load i32, ptr @B

   la t0, @B
   lw x8, 0(t0)
   # %var277 = add i32 %var275, %var276

   add x4, x4, x8
   # %var278 = load i32, ptr @C

   la t0, @C
   lw x8, 0(t0)
   # %var279 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var280 = sub i32 %var278, %var279

   sub x8, x8, x9
   # %var281 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var282 = add i32 %var280, %var281

   add x8, x8, x9
   # %var283 = add i32 %var277, %var282

   add x4, x4, x8
   # %var284 = load i32, ptr @A

   la t0, @A
   lw x8, 0(t0)
   # %var285 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var286 = add i32 %var284, %var285

   add x8, x8, x9
   # %var287 = load i32, ptr @C

   la t0, @C
   lw x9, 0(t0)
   # %var288 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var289 = sub i32 %var287, %var288

   sub x9, x9, a0
   # %var290 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var291 = add i32 %var289, %var290

   add x9, x9, a0
   # %var292 = add i32 %var286, %var291

   add x8, x8, x9
   # %var293 = sub i32 %var283, %var292

   sub x4, x4, x8
   # %var294 = load i32, ptr @A

   la t0, @A
   lw x8, 0(t0)
   # %var295 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var296 = add i32 %var294, %var295

   add x8, x8, x9
   # %var297 = load i32, ptr @C

   la t0, @C
   lw x9, 0(t0)
   # %var298 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var299 = sub i32 %var297, %var298

   sub x9, x9, a0
   # %var300 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var301 = add i32 %var299, %var300

   add x9, x9, a0
   # %var302 = add i32 %var296, %var301

   add x8, x8, x9
   # %var303 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var304 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var305 = add i32 %var303, %var304

   add x9, x9, a0
   # %var306 = sub i32 %var302, %var305

   sub x8, x8, x9
   # %var307 = sub i32 %var293, %var306

   sub x4, x4, x8
   # %var308 = load i32, ptr @C

   la t0, @C
   lw x8, 0(t0)
   # %var309 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var310 = sub i32 %var308, %var309

   sub x8, x8, x9
   # %var311 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var312 = add i32 %var310, %var311

   add x8, x8, x9
   # %var313 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var314 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var315 = add i32 %var313, %var314

   add x9, x9, a0
   # %var316 = sub i32 %var312, %var315

   sub x8, x8, x9
   # %var317 = load i32, ptr @C

   la t0, @C
   lw x9, 0(t0)
   # %var318 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var319 = sub i32 %var317, %var318

   sub x9, x9, a0
   # %var320 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var321 = add i32 %var319, %var320

   add x9, x9, a0
   # %var322 = add i32 %var316, %var321

   add x8, x8, x9
   # %var323 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var324 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var325 = add i32 %var323, %var324

   add x9, x9, a0
   # %var326 = load i32, ptr @C

   la t0, @C
   lw a0, 0(t0)
   # %var327 = load i32, ptr @A

   la t0, @A
   lw a1, 0(t0)
   # %var328 = sub i32 %var326, %var327

   sub a0, a0, a1
   # %var329 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var330 = add i32 %var328, %var329

   add a0, a0, a1
   # %var331 = add i32 %var325, %var330

   add x9, x9, a0
   # %var332 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var333 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var334 = add i32 %var332, %var333

   add a0, a0, a1
   # %var335 = sub i32 %var331, %var334

   sub x9, x9, a0
   # %var336 = sub i32 %var322, %var335

   sub x8, x8, x9
   # %var337 = add i32 %var307, %var336

   add x4, x4, x8
   # %var338 = load i32, ptr @C

   la t0, @C
   lw x8, 0(t0)
   # %var339 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var340 = sub i32 %var338, %var339

   sub x8, x8, x9
   # %var341 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var342 = add i32 %var340, %var341

   add x8, x8, x9
   # %var343 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var344 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var345 = add i32 %var343, %var344

   add x9, x9, a0
   # %var346 = sub i32 %var342, %var345

   sub x8, x8, x9
   # %var347 = load i32, ptr @C

   la t0, @C
   lw x9, 0(t0)
   # %var348 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var349 = sub i32 %var347, %var348

   sub x9, x9, a0
   # %var350 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var351 = add i32 %var349, %var350

   add x9, x9, a0
   # %var352 = add i32 %var346, %var351

   add x8, x8, x9
   # %var353 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var354 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var355 = add i32 %var353, %var354

   add x9, x9, a0
   # %var356 = load i32, ptr @C

   la t0, @C
   lw a0, 0(t0)
   # %var357 = load i32, ptr @A

   la t0, @A
   lw a1, 0(t0)
   # %var358 = sub i32 %var356, %var357

   sub a0, a0, a1
   # %var359 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var360 = add i32 %var358, %var359

   add a0, a0, a1
   # %var361 = add i32 %var355, %var360

   add x9, x9, a0
   # %var362 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var363 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var364 = add i32 %var362, %var363

   add a0, a0, a1
   # %var365 = sub i32 %var361, %var364

   sub x9, x9, a0
   # %var366 = sub i32 %var352, %var365

   sub x8, x8, x9
   # %var367 = load i32, ptr @C

   la t0, @C
   lw x9, 0(t0)
   # %var368 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var369 = sub i32 %var367, %var368

   sub x9, x9, a0
   # %var370 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var371 = add i32 %var369, %var370

   add x9, x9, a0
   # %var372 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var373 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var374 = add i32 %var372, %var373

   add a0, a0, a1
   # %var375 = sub i32 %var371, %var374

   sub x9, x9, a0
   # %var376 = load i32, ptr @C

   la t0, @C
   lw a0, 0(t0)
   # %var377 = load i32, ptr @A

   la t0, @A
   lw a1, 0(t0)
   # %var378 = sub i32 %var376, %var377

   sub a0, a0, a1
   # %var379 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var380 = add i32 %var378, %var379

   add a0, a0, a1
   # %var381 = add i32 %var375, %var380

   add x9, x9, a0
   # %var382 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var383 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var384 = add i32 %var382, %var383

   add a0, a0, a1
   # %var385 = load i32, ptr @C

   la t0, @C
   lw a1, 0(t0)
   # %var386 = load i32, ptr @A

   la t0, @A
   lw a2, 0(t0)
   # %var387 = sub i32 %var385, %var386

   sub a1, a1, a2
   # %var388 = load i32, ptr @B

   la t0, @B
   lw a2, 0(t0)
   # %var389 = add i32 %var387, %var388

   add a1, a1, a2
   # %var390 = add i32 %var384, %var389

   add a0, a0, a1
   # %var391 = load i32, ptr @A

   la t0, @A
   lw a1, 0(t0)
   # %var392 = load i32, ptr @B

   la t0, @B
   lw a2, 0(t0)
   # %var393 = add i32 %var391, %var392

   add a1, a1, a2
   # %var394 = sub i32 %var390, %var393

   sub a0, a0, a1
   # %var395 = sub i32 %var381, %var394

   sub x9, x9, a0
   # %var396 = add i32 %var366, %var395

   add x8, x8, x9
   # %var397 = add i32 %var337, %var396

   add x4, x4, x8
   # %var398 = load i32, ptr @C

   la t0, @C
   lw x8, 0(t0)
   # %var399 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var400 = sub i32 %var398, %var399

   sub x8, x8, x9
   # %var401 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var402 = add i32 %var400, %var401

   add x8, x8, x9
   # %var403 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var404 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var405 = add i32 %var403, %var404

   add x9, x9, a0
   # %var406 = sub i32 %var402, %var405

   sub x8, x8, x9
   # %var407 = load i32, ptr @C

   la t0, @C
   lw x9, 0(t0)
   # %var408 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var409 = sub i32 %var407, %var408

   sub x9, x9, a0
   # %var410 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var411 = add i32 %var409, %var410

   add x9, x9, a0
   # %var412 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var413 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var414 = add i32 %var412, %var413

   add a0, a0, a1
   # %var415 = sub i32 %var411, %var414

   sub x9, x9, a0
   # %var416 = add i32 %var406, %var415

   add x8, x8, x9
   # %var417 = load i32, ptr @C

   la t0, @C
   lw x9, 0(t0)
   # %var418 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var419 = sub i32 %var417, %var418

   sub x9, x9, a0
   # %var420 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var421 = add i32 %var419, %var420

   add x9, x9, a0
   # %var422 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var423 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var424 = add i32 %var422, %var423

   add a0, a0, a1
   # %var425 = sub i32 %var421, %var424

   sub x9, x9, a0
   # %var426 = load i32, ptr @C

   la t0, @C
   lw a0, 0(t0)
   # %var427 = load i32, ptr @A

   la t0, @A
   lw a1, 0(t0)
   # %var428 = sub i32 %var426, %var427

   sub a0, a0, a1
   # %var429 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var430 = add i32 %var428, %var429

   add a0, a0, a1
   # %var431 = add i32 %var425, %var430

   add x9, x9, a0
   # %var432 = add i32 %var416, %var431

   add x8, x8, x9
   # %var433 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var434 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var435 = add i32 %var433, %var434

   add x9, x9, a0
   # %var436 = load i32, ptr @C

   la t0, @C
   lw a0, 0(t0)
   # %var437 = load i32, ptr @A

   la t0, @A
   lw a1, 0(t0)
   # %var438 = sub i32 %var436, %var437

   sub a0, a0, a1
   # %var439 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var440 = add i32 %var438, %var439

   add a0, a0, a1
   # %var441 = add i32 %var435, %var440

   add x9, x9, a0
   # %var442 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var443 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var444 = add i32 %var442, %var443

   add a0, a0, a1
   # %var445 = sub i32 %var441, %var444

   sub x9, x9, a0
   # %var446 = load i32, ptr @C

   la t0, @C
   lw a0, 0(t0)
   # %var447 = load i32, ptr @A

   la t0, @A
   lw a1, 0(t0)
   # %var448 = sub i32 %var446, %var447

   sub a0, a0, a1
   # %var449 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var450 = add i32 %var448, %var449

   add a0, a0, a1
   # %var451 = load i32, ptr @A

   la t0, @A
   lw a1, 0(t0)
   # %var452 = load i32, ptr @B

   la t0, @B
   lw a2, 0(t0)
   # %var453 = add i32 %var451, %var452

   add a1, a1, a2
   # %var454 = sub i32 %var450, %var453

   sub a0, a0, a1
   # %var455 = load i32, ptr @C

   la t0, @C
   lw a1, 0(t0)
   # %var456 = load i32, ptr @A

   la t0, @A
   lw a2, 0(t0)
   # %var457 = sub i32 %var455, %var456

   sub a1, a1, a2
   # %var458 = load i32, ptr @B

   la t0, @B
   lw a2, 0(t0)
   # %var459 = add i32 %var457, %var458

   add a1, a1, a2
   # %var460 = add i32 %var454, %var459

   add a0, a0, a1
   # %var461 = add i32 %var445, %var460

   add x9, x9, a0
   # %var462 = sub i32 %var432, %var461

   sub x8, x8, x9
   # %var463 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var464 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var465 = add i32 %var463, %var464

   add x9, x9, a0
   # %var466 = load i32, ptr @C

   la t0, @C
   lw a0, 0(t0)
   # %var467 = load i32, ptr @A

   la t0, @A
   lw a1, 0(t0)
   # %var468 = sub i32 %var466, %var467

   sub a0, a0, a1
   # %var469 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var470 = add i32 %var468, %var469

   add a0, a0, a1
   # %var471 = add i32 %var465, %var470

   add x9, x9, a0
   # %var472 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var473 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var474 = add i32 %var472, %var473

   add a0, a0, a1
   # %var475 = sub i32 %var471, %var474

   sub x9, x9, a0
   # %var476 = load i32, ptr @C

   la t0, @C
   lw a0, 0(t0)
   # %var477 = load i32, ptr @A

   la t0, @A
   lw a1, 0(t0)
   # %var478 = sub i32 %var476, %var477

   sub a0, a0, a1
   # %var479 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var480 = add i32 %var478, %var479

   add a0, a0, a1
   # %var481 = load i32, ptr @A

   la t0, @A
   lw a1, 0(t0)
   # %var482 = load i32, ptr @B

   la t0, @B
   lw a2, 0(t0)
   # %var483 = add i32 %var481, %var482

   add a1, a1, a2
   # %var484 = sub i32 %var480, %var483

   sub a0, a0, a1
   # %var485 = load i32, ptr @C

   la t0, @C
   lw a1, 0(t0)
   # %var486 = load i32, ptr @A

   la t0, @A
   lw a2, 0(t0)
   # %var487 = sub i32 %var485, %var486

   sub a1, a1, a2
   # %var488 = load i32, ptr @B

   la t0, @B
   lw a2, 0(t0)
   # %var489 = add i32 %var487, %var488

   add a1, a1, a2
   # %var490 = add i32 %var484, %var489

   add a0, a0, a1
   # %var491 = add i32 %var475, %var490

   add x9, x9, a0
   # %var492 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var493 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var494 = add i32 %var492, %var493

   add a0, a0, a1
   # %var495 = load i32, ptr @C

   la t0, @C
   lw a1, 0(t0)
   # %var496 = load i32, ptr @A

   la t0, @A
   lw a2, 0(t0)
   # %var497 = sub i32 %var495, %var496

   sub a1, a1, a2
   # %var498 = load i32, ptr @B

   la t0, @B
   lw a2, 0(t0)
   # %var499 = add i32 %var497, %var498

   add a1, a1, a2
   # %var500 = add i32 %var494, %var499

   add a0, a0, a1
   # %var501 = load i32, ptr @A

   la t0, @A
   lw a1, 0(t0)
   # %var502 = load i32, ptr @B

   la t0, @B
   lw a2, 0(t0)
   # %var503 = add i32 %var501, %var502

   add a1, a1, a2
   # %var504 = sub i32 %var500, %var503

   sub a0, a0, a1
   # %var505 = load i32, ptr @C

   la t0, @C
   lw a1, 0(t0)
   # %var506 = load i32, ptr @A

   la t0, @A
   lw a2, 0(t0)
   # %var507 = sub i32 %var505, %var506

   sub a1, a1, a2
   # %var508 = load i32, ptr @B

   la t0, @B
   lw a2, 0(t0)
   # %var509 = add i32 %var507, %var508

   add a1, a1, a2
   # %var510 = load i32, ptr @A

   la t0, @A
   lw a2, 0(t0)
   # %var511 = load i32, ptr @B

   la t0, @B
   lw a3, 0(t0)
   # %var512 = add i32 %var510, %var511

   add a2, a2, a3
   # %var513 = sub i32 %var509, %var512

   sub a1, a1, a2
   # %var514 = load i32, ptr @C

   la t0, @C
   lw a2, 0(t0)
   # %var515 = load i32, ptr @A

   la t0, @A
   lw a3, 0(t0)
   # %var516 = sub i32 %var514, %var515

   sub a2, a2, a3
   # %var517 = load i32, ptr @B

   la t0, @B
   lw a3, 0(t0)
   # %var518 = add i32 %var516, %var517

   add a2, a2, a3
   # %var519 = add i32 %var513, %var518

   add a1, a1, a2
   # %var520 = add i32 %var504, %var519

   add a0, a0, a1
   # %var521 = sub i32 %var491, %var520

   sub x9, x9, a0
   # %var522 = sub i32 %var462, %var521

   sub x8, x8, x9
   # %var523 = add i32 %var397, %var522

   add x4, x4, x8
   # %var524 = sub i32 %var274, %var523

   sub x3, x3, x4
   # store i32 %var524, ptr @A

   la t1, @A
   sw x3, 0(t1)
   # %var526 = load i32, ptr @C

   la t0, @C
   lw x3, 0(t0)
   # %var527 = load i32, ptr @A

   la t0, @A
   lw x4, 0(t0)
   # %var528 = sub i32 %var526, %var527

   sub x3, x3, x4
   # %var529 = load i32, ptr @B

   la t0, @B
   lw x4, 0(t0)
   # %var530 = add i32 %var528, %var529

   add x3, x3, x4
   # %var531 = load i32, ptr @A

   la t0, @A
   lw x4, 0(t0)
   # %var532 = load i32, ptr @B

   la t0, @B
   lw x8, 0(t0)
   # %var533 = add i32 %var531, %var532

   add x4, x4, x8
   # %var534 = sub i32 %var530, %var533

   sub x3, x3, x4
   # %var535 = load i32, ptr @C

   la t0, @C
   lw x4, 0(t0)
   # %var536 = load i32, ptr @A

   la t0, @A
   lw x8, 0(t0)
   # %var537 = sub i32 %var535, %var536

   sub x4, x4, x8
   # %var538 = load i32, ptr @B

   la t0, @B
   lw x8, 0(t0)
   # %var539 = add i32 %var537, %var538

   add x4, x4, x8
   # %var540 = load i32, ptr @A

   la t0, @A
   lw x8, 0(t0)
   # %var541 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var542 = add i32 %var540, %var541

   add x8, x8, x9
   # %var543 = sub i32 %var539, %var542

   sub x4, x4, x8
   # %var544 = add i32 %var534, %var543

   add x3, x3, x4
   # %var545 = load i32, ptr @C

   la t0, @C
   lw x4, 0(t0)
   # %var546 = load i32, ptr @A

   la t0, @A
   lw x8, 0(t0)
   # %var547 = sub i32 %var545, %var546

   sub x4, x4, x8
   # %var548 = load i32, ptr @B

   la t0, @B
   lw x8, 0(t0)
   # %var549 = add i32 %var547, %var548

   add x4, x4, x8
   # %var550 = load i32, ptr @A

   la t0, @A
   lw x8, 0(t0)
   # %var551 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var552 = add i32 %var550, %var551

   add x8, x8, x9
   # %var553 = sub i32 %var549, %var552

   sub x4, x4, x8
   # %var554 = load i32, ptr @C

   la t0, @C
   lw x8, 0(t0)
   # %var555 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var556 = sub i32 %var554, %var555

   sub x8, x8, x9
   # %var557 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var558 = add i32 %var556, %var557

   add x8, x8, x9
   # %var559 = add i32 %var553, %var558

   add x4, x4, x8
   # %var560 = add i32 %var544, %var559

   add x3, x3, x4
   # %var561 = load i32, ptr @A

   la t0, @A
   lw x4, 0(t0)
   # %var562 = load i32, ptr @B

   la t0, @B
   lw x8, 0(t0)
   # %var563 = add i32 %var561, %var562

   add x4, x4, x8
   # %var564 = load i32, ptr @C

   la t0, @C
   lw x8, 0(t0)
   # %var565 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var566 = sub i32 %var564, %var565

   sub x8, x8, x9
   # %var567 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var568 = add i32 %var566, %var567

   add x8, x8, x9
   # %var569 = add i32 %var563, %var568

   add x4, x4, x8
   # %var570 = load i32, ptr @A

   la t0, @A
   lw x8, 0(t0)
   # %var571 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var572 = add i32 %var570, %var571

   add x8, x8, x9
   # %var573 = sub i32 %var569, %var572

   sub x4, x4, x8
   # %var574 = load i32, ptr @C

   la t0, @C
   lw x8, 0(t0)
   # %var575 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var576 = sub i32 %var574, %var575

   sub x8, x8, x9
   # %var577 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var578 = add i32 %var576, %var577

   add x8, x8, x9
   # %var579 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var580 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var581 = add i32 %var579, %var580

   add x9, x9, a0
   # %var582 = sub i32 %var578, %var581

   sub x8, x8, x9
   # %var583 = load i32, ptr @C

   la t0, @C
   lw x9, 0(t0)
   # %var584 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var585 = sub i32 %var583, %var584

   sub x9, x9, a0
   # %var586 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var587 = add i32 %var585, %var586

   add x9, x9, a0
   # %var588 = add i32 %var582, %var587

   add x8, x8, x9
   # %var589 = add i32 %var573, %var588

   add x4, x4, x8
   # %var590 = sub i32 %var560, %var589

   sub x3, x3, x4
   # %var591 = load i32, ptr @A

   la t0, @A
   lw x4, 0(t0)
   # %var592 = load i32, ptr @B

   la t0, @B
   lw x8, 0(t0)
   # %var593 = add i32 %var591, %var592

   add x4, x4, x8
   # %var594 = load i32, ptr @C

   la t0, @C
   lw x8, 0(t0)
   # %var595 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var596 = sub i32 %var594, %var595

   sub x8, x8, x9
   # %var597 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var598 = add i32 %var596, %var597

   add x8, x8, x9
   # %var599 = add i32 %var593, %var598

   add x4, x4, x8
   # %var600 = load i32, ptr @A

   la t0, @A
   lw x8, 0(t0)
   # %var601 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var602 = add i32 %var600, %var601

   add x8, x8, x9
   # %var603 = load i32, ptr @C

   la t0, @C
   lw x9, 0(t0)
   # %var604 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var605 = sub i32 %var603, %var604

   sub x9, x9, a0
   # %var606 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var607 = add i32 %var605, %var606

   add x9, x9, a0
   # %var608 = add i32 %var602, %var607

   add x8, x8, x9
   # %var609 = sub i32 %var599, %var608

   sub x4, x4, x8
   # %var610 = load i32, ptr @A

   la t0, @A
   lw x8, 0(t0)
   # %var611 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var612 = add i32 %var610, %var611

   add x8, x8, x9
   # %var613 = load i32, ptr @C

   la t0, @C
   lw x9, 0(t0)
   # %var614 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var615 = sub i32 %var613, %var614

   sub x9, x9, a0
   # %var616 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var617 = add i32 %var615, %var616

   add x9, x9, a0
   # %var618 = add i32 %var612, %var617

   add x8, x8, x9
   # %var619 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var620 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var621 = add i32 %var619, %var620

   add x9, x9, a0
   # %var622 = sub i32 %var618, %var621

   sub x8, x8, x9
   # %var623 = sub i32 %var609, %var622

   sub x4, x4, x8
   # %var624 = load i32, ptr @C

   la t0, @C
   lw x8, 0(t0)
   # %var625 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var626 = sub i32 %var624, %var625

   sub x8, x8, x9
   # %var627 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var628 = add i32 %var626, %var627

   add x8, x8, x9
   # %var629 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var630 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var631 = add i32 %var629, %var630

   add x9, x9, a0
   # %var632 = sub i32 %var628, %var631

   sub x8, x8, x9
   # %var633 = load i32, ptr @C

   la t0, @C
   lw x9, 0(t0)
   # %var634 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var635 = sub i32 %var633, %var634

   sub x9, x9, a0
   # %var636 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var637 = add i32 %var635, %var636

   add x9, x9, a0
   # %var638 = add i32 %var632, %var637

   add x8, x8, x9
   # %var639 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var640 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var641 = add i32 %var639, %var640

   add x9, x9, a0
   # %var642 = load i32, ptr @C

   la t0, @C
   lw a0, 0(t0)
   # %var643 = load i32, ptr @A

   la t0, @A
   lw a1, 0(t0)
   # %var644 = sub i32 %var642, %var643

   sub a0, a0, a1
   # %var645 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var646 = add i32 %var644, %var645

   add a0, a0, a1
   # %var647 = add i32 %var641, %var646

   add x9, x9, a0
   # %var648 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var649 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var650 = add i32 %var648, %var649

   add a0, a0, a1
   # %var651 = sub i32 %var647, %var650

   sub x9, x9, a0
   # %var652 = sub i32 %var638, %var651

   sub x8, x8, x9
   # %var653 = add i32 %var623, %var652

   add x4, x4, x8
   # %var654 = sub i32 %var590, %var653

   sub x3, x3, x4
   # %var655 = load i32, ptr @C

   la t0, @C
   lw x4, 0(t0)
   # %var656 = load i32, ptr @A

   la t0, @A
   lw x8, 0(t0)
   # %var657 = sub i32 %var655, %var656

   sub x4, x4, x8
   # %var658 = load i32, ptr @B

   la t0, @B
   lw x8, 0(t0)
   # %var659 = add i32 %var657, %var658

   add x4, x4, x8
   # %var660 = load i32, ptr @A

   la t0, @A
   lw x8, 0(t0)
   # %var661 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var662 = add i32 %var660, %var661

   add x8, x8, x9
   # %var663 = sub i32 %var659, %var662

   sub x4, x4, x8
   # %var664 = load i32, ptr @C

   la t0, @C
   lw x8, 0(t0)
   # %var665 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var666 = sub i32 %var664, %var665

   sub x8, x8, x9
   # %var667 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var668 = add i32 %var666, %var667

   add x8, x8, x9
   # %var669 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var670 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var671 = add i32 %var669, %var670

   add x9, x9, a0
   # %var672 = sub i32 %var668, %var671

   sub x8, x8, x9
   # %var673 = add i32 %var663, %var672

   add x4, x4, x8
   # %var674 = load i32, ptr @C

   la t0, @C
   lw x8, 0(t0)
   # %var675 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var676 = sub i32 %var674, %var675

   sub x8, x8, x9
   # %var677 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var678 = add i32 %var676, %var677

   add x8, x8, x9
   # %var679 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var680 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var681 = add i32 %var679, %var680

   add x9, x9, a0
   # %var682 = sub i32 %var678, %var681

   sub x8, x8, x9
   # %var683 = load i32, ptr @C

   la t0, @C
   lw x9, 0(t0)
   # %var684 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var685 = sub i32 %var683, %var684

   sub x9, x9, a0
   # %var686 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var687 = add i32 %var685, %var686

   add x9, x9, a0
   # %var688 = add i32 %var682, %var687

   add x8, x8, x9
   # %var689 = add i32 %var673, %var688

   add x4, x4, x8
   # %var690 = load i32, ptr @A

   la t0, @A
   lw x8, 0(t0)
   # %var691 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var692 = add i32 %var690, %var691

   add x8, x8, x9
   # %var693 = load i32, ptr @C

   la t0, @C
   lw x9, 0(t0)
   # %var694 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var695 = sub i32 %var693, %var694

   sub x9, x9, a0
   # %var696 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var697 = add i32 %var695, %var696

   add x9, x9, a0
   # %var698 = add i32 %var692, %var697

   add x8, x8, x9
   # %var699 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var700 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var701 = add i32 %var699, %var700

   add x9, x9, a0
   # %var702 = sub i32 %var698, %var701

   sub x8, x8, x9
   # %var703 = load i32, ptr @C

   la t0, @C
   lw x9, 0(t0)
   # %var704 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var705 = sub i32 %var703, %var704

   sub x9, x9, a0
   # %var706 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var707 = add i32 %var705, %var706

   add x9, x9, a0
   # %var708 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var709 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var710 = add i32 %var708, %var709

   add a0, a0, a1
   # %var711 = sub i32 %var707, %var710

   sub x9, x9, a0
   # %var712 = load i32, ptr @C

   la t0, @C
   lw a0, 0(t0)
   # %var713 = load i32, ptr @A

   la t0, @A
   lw a1, 0(t0)
   # %var714 = sub i32 %var712, %var713

   sub a0, a0, a1
   # %var715 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var716 = add i32 %var714, %var715

   add a0, a0, a1
   # %var717 = add i32 %var711, %var716

   add x9, x9, a0
   # %var718 = add i32 %var702, %var717

   add x8, x8, x9
   # %var719 = sub i32 %var689, %var718

   sub x4, x4, x8
   # %var720 = load i32, ptr @A

   la t0, @A
   lw x8, 0(t0)
   # %var721 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var722 = add i32 %var720, %var721

   add x8, x8, x9
   # %var723 = load i32, ptr @C

   la t0, @C
   lw x9, 0(t0)
   # %var724 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var725 = sub i32 %var723, %var724

   sub x9, x9, a0
   # %var726 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var727 = add i32 %var725, %var726

   add x9, x9, a0
   # %var728 = add i32 %var722, %var727

   add x8, x8, x9
   # %var729 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var730 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var731 = add i32 %var729, %var730

   add x9, x9, a0
   # %var732 = sub i32 %var728, %var731

   sub x8, x8, x9
   # %var733 = load i32, ptr @C

   la t0, @C
   lw x9, 0(t0)
   # %var734 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var735 = sub i32 %var733, %var734

   sub x9, x9, a0
   # %var736 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var737 = add i32 %var735, %var736

   add x9, x9, a0
   # %var738 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var739 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var740 = add i32 %var738, %var739

   add a0, a0, a1
   # %var741 = sub i32 %var737, %var740

   sub x9, x9, a0
   # %var742 = load i32, ptr @C

   la t0, @C
   lw a0, 0(t0)
   # %var743 = load i32, ptr @A

   la t0, @A
   lw a1, 0(t0)
   # %var744 = sub i32 %var742, %var743

   sub a0, a0, a1
   # %var745 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var746 = add i32 %var744, %var745

   add a0, a0, a1
   # %var747 = add i32 %var741, %var746

   add x9, x9, a0
   # %var748 = add i32 %var732, %var747

   add x8, x8, x9
   # %var749 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var750 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var751 = add i32 %var749, %var750

   add x9, x9, a0
   # %var752 = load i32, ptr @C

   la t0, @C
   lw a0, 0(t0)
   # %var753 = load i32, ptr @A

   la t0, @A
   lw a1, 0(t0)
   # %var754 = sub i32 %var752, %var753

   sub a0, a0, a1
   # %var755 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var756 = add i32 %var754, %var755

   add a0, a0, a1
   # %var757 = add i32 %var751, %var756

   add x9, x9, a0
   # %var758 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var759 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var760 = add i32 %var758, %var759

   add a0, a0, a1
   # %var761 = sub i32 %var757, %var760

   sub x9, x9, a0
   # %var762 = load i32, ptr @C

   la t0, @C
   lw a0, 0(t0)
   # %var763 = load i32, ptr @A

   la t0, @A
   lw a1, 0(t0)
   # %var764 = sub i32 %var762, %var763

   sub a0, a0, a1
   # %var765 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var766 = add i32 %var764, %var765

   add a0, a0, a1
   # %var767 = load i32, ptr @A

   la t0, @A
   lw a1, 0(t0)
   # %var768 = load i32, ptr @B

   la t0, @B
   lw a2, 0(t0)
   # %var769 = add i32 %var767, %var768

   add a1, a1, a2
   # %var770 = sub i32 %var766, %var769

   sub a0, a0, a1
   # %var771 = load i32, ptr @C

   la t0, @C
   lw a1, 0(t0)
   # %var772 = load i32, ptr @A

   la t0, @A
   lw a2, 0(t0)
   # %var773 = sub i32 %var771, %var772

   sub a1, a1, a2
   # %var774 = load i32, ptr @B

   la t0, @B
   lw a2, 0(t0)
   # %var775 = add i32 %var773, %var774

   add a1, a1, a2
   # %var776 = add i32 %var770, %var775

   add a0, a0, a1
   # %var777 = add i32 %var761, %var776

   add x9, x9, a0
   # %var778 = sub i32 %var748, %var777

   sub x8, x8, x9
   # %var779 = sub i32 %var719, %var778

   sub x4, x4, x8
   # %var780 = add i32 %var654, %var779

   add x3, x3, x4
   # %var781 = load i32, ptr @A

   la t0, @A
   lw x4, 0(t0)
   # %var782 = load i32, ptr @B

   la t0, @B
   lw x8, 0(t0)
   # %var783 = add i32 %var781, %var782

   add x4, x4, x8
   # %var784 = load i32, ptr @C

   la t0, @C
   lw x8, 0(t0)
   # %var785 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var786 = sub i32 %var784, %var785

   sub x8, x8, x9
   # %var787 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var788 = add i32 %var786, %var787

   add x8, x8, x9
   # %var789 = add i32 %var783, %var788

   add x4, x4, x8
   # %var790 = load i32, ptr @A

   la t0, @A
   lw x8, 0(t0)
   # %var791 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var792 = add i32 %var790, %var791

   add x8, x8, x9
   # %var793 = load i32, ptr @C

   la t0, @C
   lw x9, 0(t0)
   # %var794 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var795 = sub i32 %var793, %var794

   sub x9, x9, a0
   # %var796 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var797 = add i32 %var795, %var796

   add x9, x9, a0
   # %var798 = add i32 %var792, %var797

   add x8, x8, x9
   # %var799 = sub i32 %var789, %var798

   sub x4, x4, x8
   # %var800 = load i32, ptr @A

   la t0, @A
   lw x8, 0(t0)
   # %var801 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var802 = add i32 %var800, %var801

   add x8, x8, x9
   # %var803 = load i32, ptr @C

   la t0, @C
   lw x9, 0(t0)
   # %var804 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var805 = sub i32 %var803, %var804

   sub x9, x9, a0
   # %var806 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var807 = add i32 %var805, %var806

   add x9, x9, a0
   # %var808 = add i32 %var802, %var807

   add x8, x8, x9
   # %var809 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var810 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var811 = add i32 %var809, %var810

   add x9, x9, a0
   # %var812 = sub i32 %var808, %var811

   sub x8, x8, x9
   # %var813 = sub i32 %var799, %var812

   sub x4, x4, x8
   # %var814 = load i32, ptr @C

   la t0, @C
   lw x8, 0(t0)
   # %var815 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var816 = sub i32 %var814, %var815

   sub x8, x8, x9
   # %var817 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var818 = add i32 %var816, %var817

   add x8, x8, x9
   # %var819 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var820 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var821 = add i32 %var819, %var820

   add x9, x9, a0
   # %var822 = sub i32 %var818, %var821

   sub x8, x8, x9
   # %var823 = load i32, ptr @C

   la t0, @C
   lw x9, 0(t0)
   # %var824 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var825 = sub i32 %var823, %var824

   sub x9, x9, a0
   # %var826 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var827 = add i32 %var825, %var826

   add x9, x9, a0
   # %var828 = add i32 %var822, %var827

   add x8, x8, x9
   # %var829 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var830 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var831 = add i32 %var829, %var830

   add x9, x9, a0
   # %var832 = load i32, ptr @C

   la t0, @C
   lw a0, 0(t0)
   # %var833 = load i32, ptr @A

   la t0, @A
   lw a1, 0(t0)
   # %var834 = sub i32 %var832, %var833

   sub a0, a0, a1
   # %var835 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var836 = add i32 %var834, %var835

   add a0, a0, a1
   # %var837 = add i32 %var831, %var836

   add x9, x9, a0
   # %var838 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var839 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var840 = add i32 %var838, %var839

   add a0, a0, a1
   # %var841 = sub i32 %var837, %var840

   sub x9, x9, a0
   # %var842 = sub i32 %var828, %var841

   sub x8, x8, x9
   # %var843 = add i32 %var813, %var842

   add x4, x4, x8
   # %var844 = load i32, ptr @C

   la t0, @C
   lw x8, 0(t0)
   # %var845 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var846 = sub i32 %var844, %var845

   sub x8, x8, x9
   # %var847 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var848 = add i32 %var846, %var847

   add x8, x8, x9
   # %var849 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var850 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var851 = add i32 %var849, %var850

   add x9, x9, a0
   # %var852 = sub i32 %var848, %var851

   sub x8, x8, x9
   # %var853 = load i32, ptr @C

   la t0, @C
   lw x9, 0(t0)
   # %var854 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var855 = sub i32 %var853, %var854

   sub x9, x9, a0
   # %var856 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var857 = add i32 %var855, %var856

   add x9, x9, a0
   # %var858 = add i32 %var852, %var857

   add x8, x8, x9
   # %var859 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var860 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var861 = add i32 %var859, %var860

   add x9, x9, a0
   # %var862 = load i32, ptr @C

   la t0, @C
   lw a0, 0(t0)
   # %var863 = load i32, ptr @A

   la t0, @A
   lw a1, 0(t0)
   # %var864 = sub i32 %var862, %var863

   sub a0, a0, a1
   # %var865 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var866 = add i32 %var864, %var865

   add a0, a0, a1
   # %var867 = add i32 %var861, %var866

   add x9, x9, a0
   # %var868 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var869 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var870 = add i32 %var868, %var869

   add a0, a0, a1
   # %var871 = sub i32 %var867, %var870

   sub x9, x9, a0
   # %var872 = sub i32 %var858, %var871

   sub x8, x8, x9
   # %var873 = load i32, ptr @C

   la t0, @C
   lw x9, 0(t0)
   # %var874 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var875 = sub i32 %var873, %var874

   sub x9, x9, a0
   # %var876 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var877 = add i32 %var875, %var876

   add x9, x9, a0
   # %var878 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var879 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var880 = add i32 %var878, %var879

   add a0, a0, a1
   # %var881 = sub i32 %var877, %var880

   sub x9, x9, a0
   # %var882 = load i32, ptr @C

   la t0, @C
   lw a0, 0(t0)
   # %var883 = load i32, ptr @A

   la t0, @A
   lw a1, 0(t0)
   # %var884 = sub i32 %var882, %var883

   sub a0, a0, a1
   # %var885 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var886 = add i32 %var884, %var885

   add a0, a0, a1
   # %var887 = add i32 %var881, %var886

   add x9, x9, a0
   # %var888 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var889 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var890 = add i32 %var888, %var889

   add a0, a0, a1
   # %var891 = load i32, ptr @C

   la t0, @C
   lw a1, 0(t0)
   # %var892 = load i32, ptr @A

   la t0, @A
   lw a2, 0(t0)
   # %var893 = sub i32 %var891, %var892

   sub a1, a1, a2
   # %var894 = load i32, ptr @B

   la t0, @B
   lw a2, 0(t0)
   # %var895 = add i32 %var893, %var894

   add a1, a1, a2
   # %var896 = add i32 %var890, %var895

   add a0, a0, a1
   # %var897 = load i32, ptr @A

   la t0, @A
   lw a1, 0(t0)
   # %var898 = load i32, ptr @B

   la t0, @B
   lw a2, 0(t0)
   # %var899 = add i32 %var897, %var898

   add a1, a1, a2
   # %var900 = sub i32 %var896, %var899

   sub a0, a0, a1
   # %var901 = sub i32 %var887, %var900

   sub x9, x9, a0
   # %var902 = add i32 %var872, %var901

   add x8, x8, x9
   # %var903 = add i32 %var843, %var902

   add x4, x4, x8
   # %var904 = load i32, ptr @C

   la t0, @C
   lw x8, 0(t0)
   # %var905 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var906 = sub i32 %var904, %var905

   sub x8, x8, x9
   # %var907 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var908 = add i32 %var906, %var907

   add x8, x8, x9
   # %var909 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var910 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var911 = add i32 %var909, %var910

   add x9, x9, a0
   # %var912 = sub i32 %var908, %var911

   sub x8, x8, x9
   # %var913 = load i32, ptr @C

   la t0, @C
   lw x9, 0(t0)
   # %var914 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var915 = sub i32 %var913, %var914

   sub x9, x9, a0
   # %var916 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var917 = add i32 %var915, %var916

   add x9, x9, a0
   # %var918 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var919 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var920 = add i32 %var918, %var919

   add a0, a0, a1
   # %var921 = sub i32 %var917, %var920

   sub x9, x9, a0
   # %var922 = add i32 %var912, %var921

   add x8, x8, x9
   # %var923 = load i32, ptr @C

   la t0, @C
   lw x9, 0(t0)
   # %var924 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var925 = sub i32 %var923, %var924

   sub x9, x9, a0
   # %var926 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var927 = add i32 %var925, %var926

   add x9, x9, a0
   # %var928 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var929 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var930 = add i32 %var928, %var929

   add a0, a0, a1
   # %var931 = sub i32 %var927, %var930

   sub x9, x9, a0
   # %var932 = load i32, ptr @C

   la t0, @C
   lw a0, 0(t0)
   # %var933 = load i32, ptr @A

   la t0, @A
   lw a1, 0(t0)
   # %var934 = sub i32 %var932, %var933

   sub a0, a0, a1
   # %var935 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var936 = add i32 %var934, %var935

   add a0, a0, a1
   # %var937 = add i32 %var931, %var936

   add x9, x9, a0
   # %var938 = add i32 %var922, %var937

   add x8, x8, x9
   # %var939 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var940 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var941 = add i32 %var939, %var940

   add x9, x9, a0
   # %var942 = load i32, ptr @C

   la t0, @C
   lw a0, 0(t0)
   # %var943 = load i32, ptr @A

   la t0, @A
   lw a1, 0(t0)
   # %var944 = sub i32 %var942, %var943

   sub a0, a0, a1
   # %var945 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var946 = add i32 %var944, %var945

   add a0, a0, a1
   # %var947 = add i32 %var941, %var946

   add x9, x9, a0
   # %var948 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var949 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var950 = add i32 %var948, %var949

   add a0, a0, a1
   # %var951 = sub i32 %var947, %var950

   sub x9, x9, a0
   # %var952 = load i32, ptr @C

   la t0, @C
   lw a0, 0(t0)
   # %var953 = load i32, ptr @A

   la t0, @A
   lw a1, 0(t0)
   # %var954 = sub i32 %var952, %var953

   sub a0, a0, a1
   # %var955 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var956 = add i32 %var954, %var955

   add a0, a0, a1
   # %var957 = load i32, ptr @A

   la t0, @A
   lw a1, 0(t0)
   # %var958 = load i32, ptr @B

   la t0, @B
   lw a2, 0(t0)
   # %var959 = add i32 %var957, %var958

   add a1, a1, a2
   # %var960 = sub i32 %var956, %var959

   sub a0, a0, a1
   # %var961 = load i32, ptr @C

   la t0, @C
   lw a1, 0(t0)
   # %var962 = load i32, ptr @A

   la t0, @A
   lw a2, 0(t0)
   # %var963 = sub i32 %var961, %var962

   sub a1, a1, a2
   # %var964 = load i32, ptr @B

   la t0, @B
   lw a2, 0(t0)
   # %var965 = add i32 %var963, %var964

   add a1, a1, a2
   # %var966 = add i32 %var960, %var965

   add a0, a0, a1
   # %var967 = add i32 %var951, %var966

   add x9, x9, a0
   # %var968 = sub i32 %var938, %var967

   sub x8, x8, x9
   # %var969 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var970 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var971 = add i32 %var969, %var970

   add x9, x9, a0
   # %var972 = load i32, ptr @C

   la t0, @C
   lw a0, 0(t0)
   # %var973 = load i32, ptr @A

   la t0, @A
   lw a1, 0(t0)
   # %var974 = sub i32 %var972, %var973

   sub a0, a0, a1
   # %var975 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var976 = add i32 %var974, %var975

   add a0, a0, a1
   # %var977 = add i32 %var971, %var976

   add x9, x9, a0
   # %var978 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var979 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var980 = add i32 %var978, %var979

   add a0, a0, a1
   # %var981 = sub i32 %var977, %var980

   sub x9, x9, a0
   # %var982 = load i32, ptr @C

   la t0, @C
   lw a0, 0(t0)
   # %var983 = load i32, ptr @A

   la t0, @A
   lw a1, 0(t0)
   # %var984 = sub i32 %var982, %var983

   sub a0, a0, a1
   # %var985 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var986 = add i32 %var984, %var985

   add a0, a0, a1
   # %var987 = load i32, ptr @A

   la t0, @A
   lw a1, 0(t0)
   # %var988 = load i32, ptr @B

   la t0, @B
   lw a2, 0(t0)
   # %var989 = add i32 %var987, %var988

   add a1, a1, a2
   # %var990 = sub i32 %var986, %var989

   sub a0, a0, a1
   # %var991 = load i32, ptr @C

   la t0, @C
   lw a1, 0(t0)
   # %var992 = load i32, ptr @A

   la t0, @A
   lw a2, 0(t0)
   # %var993 = sub i32 %var991, %var992

   sub a1, a1, a2
   # %var994 = load i32, ptr @B

   la t0, @B
   lw a2, 0(t0)
   # %var995 = add i32 %var993, %var994

   add a1, a1, a2
   # %var996 = add i32 %var990, %var995

   add a0, a0, a1
   # %var997 = add i32 %var981, %var996

   add x9, x9, a0
   # %var998 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var999 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var1000 = add i32 %var998, %var999

   add a0, a0, a1
   # %var1001 = load i32, ptr @C

   la t0, @C
   lw a1, 0(t0)
   # %var1002 = load i32, ptr @A

   la t0, @A
   lw a2, 0(t0)
   # %var1003 = sub i32 %var1001, %var1002

   sub a1, a1, a2
   # %var1004 = load i32, ptr @B

   la t0, @B
   lw a2, 0(t0)
   # %var1005 = add i32 %var1003, %var1004

   add a1, a1, a2
   # %var1006 = add i32 %var1000, %var1005

   add a0, a0, a1
   # %var1007 = load i32, ptr @A

   la t0, @A
   lw a1, 0(t0)
   # %var1008 = load i32, ptr @B

   la t0, @B
   lw a2, 0(t0)
   # %var1009 = add i32 %var1007, %var1008

   add a1, a1, a2
   # %var1010 = sub i32 %var1006, %var1009

   sub a0, a0, a1
   # %var1011 = load i32, ptr @C

   la t0, @C
   lw a1, 0(t0)
   # %var1012 = load i32, ptr @A

   la t0, @A
   lw a2, 0(t0)
   # %var1013 = sub i32 %var1011, %var1012

   sub a1, a1, a2
   # %var1014 = load i32, ptr @B

   la t0, @B
   lw a2, 0(t0)
   # %var1015 = add i32 %var1013, %var1014

   add a1, a1, a2
   # %var1016 = load i32, ptr @A

   la t0, @A
   lw a2, 0(t0)
   # %var1017 = load i32, ptr @B

   la t0, @B
   lw a3, 0(t0)
   # %var1018 = add i32 %var1016, %var1017

   add a2, a2, a3
   # %var1019 = sub i32 %var1015, %var1018

   sub a1, a1, a2
   # %var1020 = load i32, ptr @C

   la t0, @C
   lw a2, 0(t0)
   # %var1021 = load i32, ptr @A

   la t0, @A
   lw a3, 0(t0)
   # %var1022 = sub i32 %var1020, %var1021

   sub a2, a2, a3
   # %var1023 = load i32, ptr @B

   la t0, @B
   lw a3, 0(t0)
   # %var1024 = add i32 %var1022, %var1023

   add a2, a2, a3
   # %var1025 = add i32 %var1019, %var1024

   add a1, a1, a2
   # %var1026 = add i32 %var1010, %var1025

   add a0, a0, a1
   # %var1027 = sub i32 %var997, %var1026

   sub x9, x9, a0
   # %var1028 = sub i32 %var968, %var1027

   sub x8, x8, x9
   # %var1029 = add i32 %var903, %var1028

   add x4, x4, x8
   # %var1030 = sub i32 %var780, %var1029

   sub x3, x3, x4
   # store i32 %var1030, ptr @B

   la t1, @B
   sw x3, 0(t1)
   # %var1032 = load i32, ptr @C

   la t0, @C
   lw x3, 0(t0)
   # %var1033 = load i32, ptr @A

   la t0, @A
   lw x4, 0(t0)
   # %var1034 = sub i32 %var1032, %var1033

   sub x3, x3, x4
   # %var1035 = load i32, ptr @B

   la t0, @B
   lw x4, 0(t0)
   # %var1036 = add i32 %var1034, %var1035

   add x3, x3, x4
   # %var1037 = load i32, ptr @A

   la t0, @A
   lw x4, 0(t0)
   # %var1038 = load i32, ptr @B

   la t0, @B
   lw x8, 0(t0)
   # %var1039 = add i32 %var1037, %var1038

   add x4, x4, x8
   # %var1040 = sub i32 %var1036, %var1039

   sub x3, x3, x4
   # %var1041 = load i32, ptr @C

   la t0, @C
   lw x4, 0(t0)
   # %var1042 = load i32, ptr @A

   la t0, @A
   lw x8, 0(t0)
   # %var1043 = sub i32 %var1041, %var1042

   sub x4, x4, x8
   # %var1044 = load i32, ptr @B

   la t0, @B
   lw x8, 0(t0)
   # %var1045 = add i32 %var1043, %var1044

   add x4, x4, x8
   # %var1046 = load i32, ptr @A

   la t0, @A
   lw x8, 0(t0)
   # %var1047 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var1048 = add i32 %var1046, %var1047

   add x8, x8, x9
   # %var1049 = sub i32 %var1045, %var1048

   sub x4, x4, x8
   # %var1050 = add i32 %var1040, %var1049

   add x3, x3, x4
   # %var1051 = load i32, ptr @C

   la t0, @C
   lw x4, 0(t0)
   # %var1052 = load i32, ptr @A

   la t0, @A
   lw x8, 0(t0)
   # %var1053 = sub i32 %var1051, %var1052

   sub x4, x4, x8
   # %var1054 = load i32, ptr @B

   la t0, @B
   lw x8, 0(t0)
   # %var1055 = add i32 %var1053, %var1054

   add x4, x4, x8
   # %var1056 = load i32, ptr @A

   la t0, @A
   lw x8, 0(t0)
   # %var1057 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var1058 = add i32 %var1056, %var1057

   add x8, x8, x9
   # %var1059 = sub i32 %var1055, %var1058

   sub x4, x4, x8
   # %var1060 = load i32, ptr @C

   la t0, @C
   lw x8, 0(t0)
   # %var1061 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var1062 = sub i32 %var1060, %var1061

   sub x8, x8, x9
   # %var1063 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var1064 = add i32 %var1062, %var1063

   add x8, x8, x9
   # %var1065 = add i32 %var1059, %var1064

   add x4, x4, x8
   # %var1066 = add i32 %var1050, %var1065

   add x3, x3, x4
   # %var1067 = load i32, ptr @A

   la t0, @A
   lw x4, 0(t0)
   # %var1068 = load i32, ptr @B

   la t0, @B
   lw x8, 0(t0)
   # %var1069 = add i32 %var1067, %var1068

   add x4, x4, x8
   # %var1070 = load i32, ptr @C

   la t0, @C
   lw x8, 0(t0)
   # %var1071 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var1072 = sub i32 %var1070, %var1071

   sub x8, x8, x9
   # %var1073 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var1074 = add i32 %var1072, %var1073

   add x8, x8, x9
   # %var1075 = add i32 %var1069, %var1074

   add x4, x4, x8
   # %var1076 = load i32, ptr @A

   la t0, @A
   lw x8, 0(t0)
   # %var1077 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var1078 = add i32 %var1076, %var1077

   add x8, x8, x9
   # %var1079 = sub i32 %var1075, %var1078

   sub x4, x4, x8
   # %var1080 = load i32, ptr @C

   la t0, @C
   lw x8, 0(t0)
   # %var1081 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var1082 = sub i32 %var1080, %var1081

   sub x8, x8, x9
   # %var1083 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var1084 = add i32 %var1082, %var1083

   add x8, x8, x9
   # %var1085 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var1086 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var1087 = add i32 %var1085, %var1086

   add x9, x9, a0
   # %var1088 = sub i32 %var1084, %var1087

   sub x8, x8, x9
   # %var1089 = load i32, ptr @C

   la t0, @C
   lw x9, 0(t0)
   # %var1090 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var1091 = sub i32 %var1089, %var1090

   sub x9, x9, a0
   # %var1092 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var1093 = add i32 %var1091, %var1092

   add x9, x9, a0
   # %var1094 = add i32 %var1088, %var1093

   add x8, x8, x9
   # %var1095 = add i32 %var1079, %var1094

   add x4, x4, x8
   # %var1096 = sub i32 %var1066, %var1095

   sub x3, x3, x4
   # %var1097 = load i32, ptr @A

   la t0, @A
   lw x4, 0(t0)
   # %var1098 = load i32, ptr @B

   la t0, @B
   lw x8, 0(t0)
   # %var1099 = add i32 %var1097, %var1098

   add x4, x4, x8
   # %var1100 = load i32, ptr @C

   la t0, @C
   lw x8, 0(t0)
   # %var1101 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var1102 = sub i32 %var1100, %var1101

   sub x8, x8, x9
   # %var1103 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var1104 = add i32 %var1102, %var1103

   add x8, x8, x9
   # %var1105 = add i32 %var1099, %var1104

   add x4, x4, x8
   # %var1106 = load i32, ptr @A

   la t0, @A
   lw x8, 0(t0)
   # %var1107 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var1108 = add i32 %var1106, %var1107

   add x8, x8, x9
   # %var1109 = load i32, ptr @C

   la t0, @C
   lw x9, 0(t0)
   # %var1110 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var1111 = sub i32 %var1109, %var1110

   sub x9, x9, a0
   # %var1112 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var1113 = add i32 %var1111, %var1112

   add x9, x9, a0
   # %var1114 = add i32 %var1108, %var1113

   add x8, x8, x9
   # %var1115 = sub i32 %var1105, %var1114

   sub x4, x4, x8
   # %var1116 = load i32, ptr @A

   la t0, @A
   lw x8, 0(t0)
   # %var1117 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var1118 = add i32 %var1116, %var1117

   add x8, x8, x9
   # %var1119 = load i32, ptr @C

   la t0, @C
   lw x9, 0(t0)
   # %var1120 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var1121 = sub i32 %var1119, %var1120

   sub x9, x9, a0
   # %var1122 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var1123 = add i32 %var1121, %var1122

   add x9, x9, a0
   # %var1124 = add i32 %var1118, %var1123

   add x8, x8, x9
   # %var1125 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var1126 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var1127 = add i32 %var1125, %var1126

   add x9, x9, a0
   # %var1128 = sub i32 %var1124, %var1127

   sub x8, x8, x9
   # %var1129 = sub i32 %var1115, %var1128

   sub x4, x4, x8
   # %var1130 = load i32, ptr @C

   la t0, @C
   lw x8, 0(t0)
   # %var1131 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var1132 = sub i32 %var1130, %var1131

   sub x8, x8, x9
   # %var1133 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var1134 = add i32 %var1132, %var1133

   add x8, x8, x9
   # %var1135 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var1136 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var1137 = add i32 %var1135, %var1136

   add x9, x9, a0
   # %var1138 = sub i32 %var1134, %var1137

   sub x8, x8, x9
   # %var1139 = load i32, ptr @C

   la t0, @C
   lw x9, 0(t0)
   # %var1140 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var1141 = sub i32 %var1139, %var1140

   sub x9, x9, a0
   # %var1142 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var1143 = add i32 %var1141, %var1142

   add x9, x9, a0
   # %var1144 = add i32 %var1138, %var1143

   add x8, x8, x9
   # %var1145 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var1146 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var1147 = add i32 %var1145, %var1146

   add x9, x9, a0
   # %var1148 = load i32, ptr @C

   la t0, @C
   lw a0, 0(t0)
   # %var1149 = load i32, ptr @A

   la t0, @A
   lw a1, 0(t0)
   # %var1150 = sub i32 %var1148, %var1149

   sub a0, a0, a1
   # %var1151 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var1152 = add i32 %var1150, %var1151

   add a0, a0, a1
   # %var1153 = add i32 %var1147, %var1152

   add x9, x9, a0
   # %var1154 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var1155 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var1156 = add i32 %var1154, %var1155

   add a0, a0, a1
   # %var1157 = sub i32 %var1153, %var1156

   sub x9, x9, a0
   # %var1158 = sub i32 %var1144, %var1157

   sub x8, x8, x9
   # %var1159 = add i32 %var1129, %var1158

   add x4, x4, x8
   # %var1160 = sub i32 %var1096, %var1159

   sub x3, x3, x4
   # %var1161 = load i32, ptr @C

   la t0, @C
   lw x4, 0(t0)
   # %var1162 = load i32, ptr @A

   la t0, @A
   lw x8, 0(t0)
   # %var1163 = sub i32 %var1161, %var1162

   sub x4, x4, x8
   # %var1164 = load i32, ptr @B

   la t0, @B
   lw x8, 0(t0)
   # %var1165 = add i32 %var1163, %var1164

   add x4, x4, x8
   # %var1166 = load i32, ptr @A

   la t0, @A
   lw x8, 0(t0)
   # %var1167 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var1168 = add i32 %var1166, %var1167

   add x8, x8, x9
   # %var1169 = sub i32 %var1165, %var1168

   sub x4, x4, x8
   # %var1170 = load i32, ptr @C

   la t0, @C
   lw x8, 0(t0)
   # %var1171 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var1172 = sub i32 %var1170, %var1171

   sub x8, x8, x9
   # %var1173 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var1174 = add i32 %var1172, %var1173

   add x8, x8, x9
   # %var1175 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var1176 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var1177 = add i32 %var1175, %var1176

   add x9, x9, a0
   # %var1178 = sub i32 %var1174, %var1177

   sub x8, x8, x9
   # %var1179 = add i32 %var1169, %var1178

   add x4, x4, x8
   # %var1180 = load i32, ptr @C

   la t0, @C
   lw x8, 0(t0)
   # %var1181 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var1182 = sub i32 %var1180, %var1181

   sub x8, x8, x9
   # %var1183 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var1184 = add i32 %var1182, %var1183

   add x8, x8, x9
   # %var1185 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var1186 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var1187 = add i32 %var1185, %var1186

   add x9, x9, a0
   # %var1188 = sub i32 %var1184, %var1187

   sub x8, x8, x9
   # %var1189 = load i32, ptr @C

   la t0, @C
   lw x9, 0(t0)
   # %var1190 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var1191 = sub i32 %var1189, %var1190

   sub x9, x9, a0
   # %var1192 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var1193 = add i32 %var1191, %var1192

   add x9, x9, a0
   # %var1194 = add i32 %var1188, %var1193

   add x8, x8, x9
   # %var1195 = add i32 %var1179, %var1194

   add x4, x4, x8
   # %var1196 = load i32, ptr @A

   la t0, @A
   lw x8, 0(t0)
   # %var1197 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var1198 = add i32 %var1196, %var1197

   add x8, x8, x9
   # %var1199 = load i32, ptr @C

   la t0, @C
   lw x9, 0(t0)
   # %var1200 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var1201 = sub i32 %var1199, %var1200

   sub x9, x9, a0
   # %var1202 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var1203 = add i32 %var1201, %var1202

   add x9, x9, a0
   # %var1204 = add i32 %var1198, %var1203

   add x8, x8, x9
   # %var1205 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var1206 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var1207 = add i32 %var1205, %var1206

   add x9, x9, a0
   # %var1208 = sub i32 %var1204, %var1207

   sub x8, x8, x9
   # %var1209 = load i32, ptr @C

   la t0, @C
   lw x9, 0(t0)
   # %var1210 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var1211 = sub i32 %var1209, %var1210

   sub x9, x9, a0
   # %var1212 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var1213 = add i32 %var1211, %var1212

   add x9, x9, a0
   # %var1214 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var1215 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var1216 = add i32 %var1214, %var1215

   add a0, a0, a1
   # %var1217 = sub i32 %var1213, %var1216

   sub x9, x9, a0
   # %var1218 = load i32, ptr @C

   la t0, @C
   lw a0, 0(t0)
   # %var1219 = load i32, ptr @A

   la t0, @A
   lw a1, 0(t0)
   # %var1220 = sub i32 %var1218, %var1219

   sub a0, a0, a1
   # %var1221 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var1222 = add i32 %var1220, %var1221

   add a0, a0, a1
   # %var1223 = add i32 %var1217, %var1222

   add x9, x9, a0
   # %var1224 = add i32 %var1208, %var1223

   add x8, x8, x9
   # %var1225 = sub i32 %var1195, %var1224

   sub x4, x4, x8
   # %var1226 = load i32, ptr @A

   la t0, @A
   lw x8, 0(t0)
   # %var1227 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var1228 = add i32 %var1226, %var1227

   add x8, x8, x9
   # %var1229 = load i32, ptr @C

   la t0, @C
   lw x9, 0(t0)
   # %var1230 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var1231 = sub i32 %var1229, %var1230

   sub x9, x9, a0
   # %var1232 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var1233 = add i32 %var1231, %var1232

   add x9, x9, a0
   # %var1234 = add i32 %var1228, %var1233

   add x8, x8, x9
   # %var1235 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var1236 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var1237 = add i32 %var1235, %var1236

   add x9, x9, a0
   # %var1238 = sub i32 %var1234, %var1237

   sub x8, x8, x9
   # %var1239 = load i32, ptr @C

   la t0, @C
   lw x9, 0(t0)
   # %var1240 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var1241 = sub i32 %var1239, %var1240

   sub x9, x9, a0
   # %var1242 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var1243 = add i32 %var1241, %var1242

   add x9, x9, a0
   # %var1244 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var1245 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var1246 = add i32 %var1244, %var1245

   add a0, a0, a1
   # %var1247 = sub i32 %var1243, %var1246

   sub x9, x9, a0
   # %var1248 = load i32, ptr @C

   la t0, @C
   lw a0, 0(t0)
   # %var1249 = load i32, ptr @A

   la t0, @A
   lw a1, 0(t0)
   # %var1250 = sub i32 %var1248, %var1249

   sub a0, a0, a1
   # %var1251 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var1252 = add i32 %var1250, %var1251

   add a0, a0, a1
   # %var1253 = add i32 %var1247, %var1252

   add x9, x9, a0
   # %var1254 = add i32 %var1238, %var1253

   add x8, x8, x9
   # %var1255 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var1256 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var1257 = add i32 %var1255, %var1256

   add x9, x9, a0
   # %var1258 = load i32, ptr @C

   la t0, @C
   lw a0, 0(t0)
   # %var1259 = load i32, ptr @A

   la t0, @A
   lw a1, 0(t0)
   # %var1260 = sub i32 %var1258, %var1259

   sub a0, a0, a1
   # %var1261 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var1262 = add i32 %var1260, %var1261

   add a0, a0, a1
   # %var1263 = add i32 %var1257, %var1262

   add x9, x9, a0
   # %var1264 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var1265 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var1266 = add i32 %var1264, %var1265

   add a0, a0, a1
   # %var1267 = sub i32 %var1263, %var1266

   sub x9, x9, a0
   # %var1268 = load i32, ptr @C

   la t0, @C
   lw a0, 0(t0)
   # %var1269 = load i32, ptr @A

   la t0, @A
   lw a1, 0(t0)
   # %var1270 = sub i32 %var1268, %var1269

   sub a0, a0, a1
   # %var1271 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var1272 = add i32 %var1270, %var1271

   add a0, a0, a1
   # %var1273 = load i32, ptr @A

   la t0, @A
   lw a1, 0(t0)
   # %var1274 = load i32, ptr @B

   la t0, @B
   lw a2, 0(t0)
   # %var1275 = add i32 %var1273, %var1274

   add a1, a1, a2
   # %var1276 = sub i32 %var1272, %var1275

   sub a0, a0, a1
   # %var1277 = load i32, ptr @C

   la t0, @C
   lw a1, 0(t0)
   # %var1278 = load i32, ptr @A

   la t0, @A
   lw a2, 0(t0)
   # %var1279 = sub i32 %var1277, %var1278

   sub a1, a1, a2
   # %var1280 = load i32, ptr @B

   la t0, @B
   lw a2, 0(t0)
   # %var1281 = add i32 %var1279, %var1280

   add a1, a1, a2
   # %var1282 = add i32 %var1276, %var1281

   add a0, a0, a1
   # %var1283 = add i32 %var1267, %var1282

   add x9, x9, a0
   # %var1284 = sub i32 %var1254, %var1283

   sub x8, x8, x9
   # %var1285 = sub i32 %var1225, %var1284

   sub x4, x4, x8
   # %var1286 = add i32 %var1160, %var1285

   add x3, x3, x4
   # %var1287 = load i32, ptr @A

   la t0, @A
   lw x4, 0(t0)
   # %var1288 = load i32, ptr @B

   la t0, @B
   lw x8, 0(t0)
   # %var1289 = add i32 %var1287, %var1288

   add x4, x4, x8
   # %var1290 = load i32, ptr @C

   la t0, @C
   lw x8, 0(t0)
   # %var1291 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var1292 = sub i32 %var1290, %var1291

   sub x8, x8, x9
   # %var1293 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var1294 = add i32 %var1292, %var1293

   add x8, x8, x9
   # %var1295 = add i32 %var1289, %var1294

   add x4, x4, x8
   # %var1296 = load i32, ptr @A

   la t0, @A
   lw x8, 0(t0)
   # %var1297 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var1298 = add i32 %var1296, %var1297

   add x8, x8, x9
   # %var1299 = load i32, ptr @C

   la t0, @C
   lw x9, 0(t0)
   # %var1300 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var1301 = sub i32 %var1299, %var1300

   sub x9, x9, a0
   # %var1302 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var1303 = add i32 %var1301, %var1302

   add x9, x9, a0
   # %var1304 = add i32 %var1298, %var1303

   add x8, x8, x9
   # %var1305 = sub i32 %var1295, %var1304

   sub x4, x4, x8
   # %var1306 = load i32, ptr @A

   la t0, @A
   lw x8, 0(t0)
   # %var1307 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var1308 = add i32 %var1306, %var1307

   add x8, x8, x9
   # %var1309 = load i32, ptr @C

   la t0, @C
   lw x9, 0(t0)
   # %var1310 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var1311 = sub i32 %var1309, %var1310

   sub x9, x9, a0
   # %var1312 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var1313 = add i32 %var1311, %var1312

   add x9, x9, a0
   # %var1314 = add i32 %var1308, %var1313

   add x8, x8, x9
   # %var1315 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var1316 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var1317 = add i32 %var1315, %var1316

   add x9, x9, a0
   # %var1318 = sub i32 %var1314, %var1317

   sub x8, x8, x9
   # %var1319 = sub i32 %var1305, %var1318

   sub x4, x4, x8
   # %var1320 = load i32, ptr @C

   la t0, @C
   lw x8, 0(t0)
   # %var1321 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var1322 = sub i32 %var1320, %var1321

   sub x8, x8, x9
   # %var1323 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var1324 = add i32 %var1322, %var1323

   add x8, x8, x9
   # %var1325 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var1326 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var1327 = add i32 %var1325, %var1326

   add x9, x9, a0
   # %var1328 = sub i32 %var1324, %var1327

   sub x8, x8, x9
   # %var1329 = load i32, ptr @C

   la t0, @C
   lw x9, 0(t0)
   # %var1330 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var1331 = sub i32 %var1329, %var1330

   sub x9, x9, a0
   # %var1332 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var1333 = add i32 %var1331, %var1332

   add x9, x9, a0
   # %var1334 = add i32 %var1328, %var1333

   add x8, x8, x9
   # %var1335 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var1336 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var1337 = add i32 %var1335, %var1336

   add x9, x9, a0
   # %var1338 = load i32, ptr @C

   la t0, @C
   lw a0, 0(t0)
   # %var1339 = load i32, ptr @A

   la t0, @A
   lw a1, 0(t0)
   # %var1340 = sub i32 %var1338, %var1339

   sub a0, a0, a1
   # %var1341 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var1342 = add i32 %var1340, %var1341

   add a0, a0, a1
   # %var1343 = add i32 %var1337, %var1342

   add x9, x9, a0
   # %var1344 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var1345 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var1346 = add i32 %var1344, %var1345

   add a0, a0, a1
   # %var1347 = sub i32 %var1343, %var1346

   sub x9, x9, a0
   # %var1348 = sub i32 %var1334, %var1347

   sub x8, x8, x9
   # %var1349 = add i32 %var1319, %var1348

   add x4, x4, x8
   # %var1350 = load i32, ptr @C

   la t0, @C
   lw x8, 0(t0)
   # %var1351 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var1352 = sub i32 %var1350, %var1351

   sub x8, x8, x9
   # %var1353 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var1354 = add i32 %var1352, %var1353

   add x8, x8, x9
   # %var1355 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var1356 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var1357 = add i32 %var1355, %var1356

   add x9, x9, a0
   # %var1358 = sub i32 %var1354, %var1357

   sub x8, x8, x9
   # %var1359 = load i32, ptr @C

   la t0, @C
   lw x9, 0(t0)
   # %var1360 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var1361 = sub i32 %var1359, %var1360

   sub x9, x9, a0
   # %var1362 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var1363 = add i32 %var1361, %var1362

   add x9, x9, a0
   # %var1364 = add i32 %var1358, %var1363

   add x8, x8, x9
   # %var1365 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var1366 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var1367 = add i32 %var1365, %var1366

   add x9, x9, a0
   # %var1368 = load i32, ptr @C

   la t0, @C
   lw a0, 0(t0)
   # %var1369 = load i32, ptr @A

   la t0, @A
   lw a1, 0(t0)
   # %var1370 = sub i32 %var1368, %var1369

   sub a0, a0, a1
   # %var1371 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var1372 = add i32 %var1370, %var1371

   add a0, a0, a1
   # %var1373 = add i32 %var1367, %var1372

   add x9, x9, a0
   # %var1374 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var1375 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var1376 = add i32 %var1374, %var1375

   add a0, a0, a1
   # %var1377 = sub i32 %var1373, %var1376

   sub x9, x9, a0
   # %var1378 = sub i32 %var1364, %var1377

   sub x8, x8, x9
   # %var1379 = load i32, ptr @C

   la t0, @C
   lw x9, 0(t0)
   # %var1380 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var1381 = sub i32 %var1379, %var1380

   sub x9, x9, a0
   # %var1382 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var1383 = add i32 %var1381, %var1382

   add x9, x9, a0
   # %var1384 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var1385 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var1386 = add i32 %var1384, %var1385

   add a0, a0, a1
   # %var1387 = sub i32 %var1383, %var1386

   sub x9, x9, a0
   # %var1388 = load i32, ptr @C

   la t0, @C
   lw a0, 0(t0)
   # %var1389 = load i32, ptr @A

   la t0, @A
   lw a1, 0(t0)
   # %var1390 = sub i32 %var1388, %var1389

   sub a0, a0, a1
   # %var1391 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var1392 = add i32 %var1390, %var1391

   add a0, a0, a1
   # %var1393 = add i32 %var1387, %var1392

   add x9, x9, a0
   # %var1394 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var1395 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var1396 = add i32 %var1394, %var1395

   add a0, a0, a1
   # %var1397 = load i32, ptr @C

   la t0, @C
   lw a1, 0(t0)
   # %var1398 = load i32, ptr @A

   la t0, @A
   lw a2, 0(t0)
   # %var1399 = sub i32 %var1397, %var1398

   sub a1, a1, a2
   # %var1400 = load i32, ptr @B

   la t0, @B
   lw a2, 0(t0)
   # %var1401 = add i32 %var1399, %var1400

   add a1, a1, a2
   # %var1402 = add i32 %var1396, %var1401

   add a0, a0, a1
   # %var1403 = load i32, ptr @A

   la t0, @A
   lw a1, 0(t0)
   # %var1404 = load i32, ptr @B

   la t0, @B
   lw a2, 0(t0)
   # %var1405 = add i32 %var1403, %var1404

   add a1, a1, a2
   # %var1406 = sub i32 %var1402, %var1405

   sub a0, a0, a1
   # %var1407 = sub i32 %var1393, %var1406

   sub x9, x9, a0
   # %var1408 = add i32 %var1378, %var1407

   add x8, x8, x9
   # %var1409 = add i32 %var1349, %var1408

   add x4, x4, x8
   # %var1410 = load i32, ptr @C

   la t0, @C
   lw x8, 0(t0)
   # %var1411 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var1412 = sub i32 %var1410, %var1411

   sub x8, x8, x9
   # %var1413 = load i32, ptr @B

   la t0, @B
   lw x9, 0(t0)
   # %var1414 = add i32 %var1412, %var1413

   add x8, x8, x9
   # %var1415 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var1416 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var1417 = add i32 %var1415, %var1416

   add x9, x9, a0
   # %var1418 = sub i32 %var1414, %var1417

   sub x8, x8, x9
   # %var1419 = load i32, ptr @C

   la t0, @C
   lw x9, 0(t0)
   # %var1420 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var1421 = sub i32 %var1419, %var1420

   sub x9, x9, a0
   # %var1422 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var1423 = add i32 %var1421, %var1422

   add x9, x9, a0
   # %var1424 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var1425 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var1426 = add i32 %var1424, %var1425

   add a0, a0, a1
   # %var1427 = sub i32 %var1423, %var1426

   sub x9, x9, a0
   # %var1428 = add i32 %var1418, %var1427

   add x8, x8, x9
   # %var1429 = load i32, ptr @C

   la t0, @C
   lw x9, 0(t0)
   # %var1430 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var1431 = sub i32 %var1429, %var1430

   sub x9, x9, a0
   # %var1432 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var1433 = add i32 %var1431, %var1432

   add x9, x9, a0
   # %var1434 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var1435 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var1436 = add i32 %var1434, %var1435

   add a0, a0, a1
   # %var1437 = sub i32 %var1433, %var1436

   sub x9, x9, a0
   # %var1438 = load i32, ptr @C

   la t0, @C
   lw a0, 0(t0)
   # %var1439 = load i32, ptr @A

   la t0, @A
   lw a1, 0(t0)
   # %var1440 = sub i32 %var1438, %var1439

   sub a0, a0, a1
   # %var1441 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var1442 = add i32 %var1440, %var1441

   add a0, a0, a1
   # %var1443 = add i32 %var1437, %var1442

   add x9, x9, a0
   # %var1444 = add i32 %var1428, %var1443

   add x8, x8, x9
   # %var1445 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var1446 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var1447 = add i32 %var1445, %var1446

   add x9, x9, a0
   # %var1448 = load i32, ptr @C

   la t0, @C
   lw a0, 0(t0)
   # %var1449 = load i32, ptr @A

   la t0, @A
   lw a1, 0(t0)
   # %var1450 = sub i32 %var1448, %var1449

   sub a0, a0, a1
   # %var1451 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var1452 = add i32 %var1450, %var1451

   add a0, a0, a1
   # %var1453 = add i32 %var1447, %var1452

   add x9, x9, a0
   # %var1454 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var1455 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var1456 = add i32 %var1454, %var1455

   add a0, a0, a1
   # %var1457 = sub i32 %var1453, %var1456

   sub x9, x9, a0
   # %var1458 = load i32, ptr @C

   la t0, @C
   lw a0, 0(t0)
   # %var1459 = load i32, ptr @A

   la t0, @A
   lw a1, 0(t0)
   # %var1460 = sub i32 %var1458, %var1459

   sub a0, a0, a1
   # %var1461 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var1462 = add i32 %var1460, %var1461

   add a0, a0, a1
   # %var1463 = load i32, ptr @A

   la t0, @A
   lw a1, 0(t0)
   # %var1464 = load i32, ptr @B

   la t0, @B
   lw a2, 0(t0)
   # %var1465 = add i32 %var1463, %var1464

   add a1, a1, a2
   # %var1466 = sub i32 %var1462, %var1465

   sub a0, a0, a1
   # %var1467 = load i32, ptr @C

   la t0, @C
   lw a1, 0(t0)
   # %var1468 = load i32, ptr @A

   la t0, @A
   lw a2, 0(t0)
   # %var1469 = sub i32 %var1467, %var1468

   sub a1, a1, a2
   # %var1470 = load i32, ptr @B

   la t0, @B
   lw a2, 0(t0)
   # %var1471 = add i32 %var1469, %var1470

   add a1, a1, a2
   # %var1472 = add i32 %var1466, %var1471

   add a0, a0, a1
   # %var1473 = add i32 %var1457, %var1472

   add x9, x9, a0
   # %var1474 = sub i32 %var1444, %var1473

   sub x8, x8, x9
   # %var1475 = load i32, ptr @A

   la t0, @A
   lw x9, 0(t0)
   # %var1476 = load i32, ptr @B

   la t0, @B
   lw a0, 0(t0)
   # %var1477 = add i32 %var1475, %var1476

   add x9, x9, a0
   # %var1478 = load i32, ptr @C

   la t0, @C
   lw a0, 0(t0)
   # %var1479 = load i32, ptr @A

   la t0, @A
   lw a1, 0(t0)
   # %var1480 = sub i32 %var1478, %var1479

   sub a0, a0, a1
   # %var1481 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var1482 = add i32 %var1480, %var1481

   add a0, a0, a1
   # %var1483 = add i32 %var1477, %var1482

   add x9, x9, a0
   # %var1484 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var1485 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var1486 = add i32 %var1484, %var1485

   add a0, a0, a1
   # %var1487 = sub i32 %var1483, %var1486

   sub x9, x9, a0
   # %var1488 = load i32, ptr @C

   la t0, @C
   lw a0, 0(t0)
   # %var1489 = load i32, ptr @A

   la t0, @A
   lw a1, 0(t0)
   # %var1490 = sub i32 %var1488, %var1489

   sub a0, a0, a1
   # %var1491 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var1492 = add i32 %var1490, %var1491

   add a0, a0, a1
   # %var1493 = load i32, ptr @A

   la t0, @A
   lw a1, 0(t0)
   # %var1494 = load i32, ptr @B

   la t0, @B
   lw a2, 0(t0)
   # %var1495 = add i32 %var1493, %var1494

   add a1, a1, a2
   # %var1496 = sub i32 %var1492, %var1495

   sub a0, a0, a1
   # %var1497 = load i32, ptr @C

   la t0, @C
   lw a1, 0(t0)
   # %var1498 = load i32, ptr @A

   la t0, @A
   lw a2, 0(t0)
   # %var1499 = sub i32 %var1497, %var1498

   sub a1, a1, a2
   # %var1500 = load i32, ptr @B

   la t0, @B
   lw a2, 0(t0)
   # %var1501 = add i32 %var1499, %var1500

   add a1, a1, a2
   # %var1502 = add i32 %var1496, %var1501

   add a0, a0, a1
   # %var1503 = add i32 %var1487, %var1502

   add x9, x9, a0
   # %var1504 = load i32, ptr @A

   la t0, @A
   lw a0, 0(t0)
   # %var1505 = load i32, ptr @B

   la t0, @B
   lw a1, 0(t0)
   # %var1506 = add i32 %var1504, %var1505

   add a0, a0, a1
   # %var1507 = load i32, ptr @C

   la t0, @C
   lw a1, 0(t0)
   # %var1508 = load i32, ptr @A

   la t0, @A
   lw a2, 0(t0)
   # %var1509 = sub i32 %var1507, %var1508

   sub a1, a1, a2
   # %var1510 = load i32, ptr @B

   la t0, @B
   lw a2, 0(t0)
   # %var1511 = add i32 %var1509, %var1510

   add a1, a1, a2
   # %var1512 = add i32 %var1506, %var1511

   add a0, a0, a1
   # %var1513 = load i32, ptr @A

   la t0, @A
   lw a1, 0(t0)
   # %var1514 = load i32, ptr @B

   la t0, @B
   lw a2, 0(t0)
   # %var1515 = add i32 %var1513, %var1514

   add a1, a1, a2
   # %var1516 = sub i32 %var1512, %var1515

   sub a0, a0, a1
   # %var1517 = load i32, ptr @C

   la t0, @C
   lw a1, 0(t0)
   # %var1518 = load i32, ptr @A

   la t0, @A
   lw a2, 0(t0)
   # %var1519 = sub i32 %var1517, %var1518

   sub a1, a1, a2
   # %var1520 = load i32, ptr @B

   la t0, @B
   lw a2, 0(t0)
   # %var1521 = add i32 %var1519, %var1520

   add a1, a1, a2
   # %var1522 = load i32, ptr @A

   la t0, @A
   lw a2, 0(t0)
   # %var1523 = load i32, ptr @B

   la t0, @B
   lw a3, 0(t0)
   # %var1524 = add i32 %var1522, %var1523

   add a2, a2, a3
   # %var1525 = sub i32 %var1521, %var1524

   sub a1, a1, a2
   # %var1526 = load i32, ptr @C

   la t0, @C
   lw a2, 0(t0)
   # %var1527 = load i32, ptr @A

   la t0, @A
   lw a3, 0(t0)
   # %var1528 = sub i32 %var1526, %var1527

   sub a2, a2, a3
   # %var1529 = load i32, ptr @B

   la t0, @B
   lw a3, 0(t0)
   # %var1530 = add i32 %var1528, %var1529

   add a2, a2, a3
   # %var1531 = add i32 %var1525, %var1530

   add a1, a1, a2
   # %var1532 = add i32 %var1516, %var1531

   add a0, a0, a1
   # %var1533 = sub i32 %var1503, %var1532

   sub x9, x9, a0
   # %var1534 = sub i32 %var1474, %var1533

   sub x8, x8, x9
   # %var1535 = add i32 %var1409, %var1534

   add x4, x4, x8
   # %var1536 = sub i32 %var1286, %var1535

   sub x3, x3, x4
   # store i32 %var1536, ptr @C

   la t1, @C
   sw x3, 0(t1)
   # br label %while.cond.0

   j main_while.cond.0

   .section .text
   .globl main_while.back.0
main_while.back.0:
   # %var1539 = load i32, ptr @A

   la t0, @A
   lw x3, 0(t0)
   # %var1538 = call ptr @toString(i32 %var1539)

   sw ra, 136(sp)
   sw a0, 40(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   mv a0, x3
   call toString
   lw ra, 136(sp)
   mv x3, a0
   lw a0, 40(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   # %var1540 = call ptr @string.add(ptr %var1538, ptr @.str..0)

   sw ra, 136(sp)
   sw a0, 40(sp)
   sw a1, 44(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   mv a0, x3
   la a1, @.str..0
   call string.add
   lw ra, 136(sp)
   mv x3, a0
   lw a0, 40(sp)
   lw a1, 44(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   # %var1542 = load i32, ptr @B

   la t0, @B
   lw x4, 0(t0)
   # %var1541 = call ptr @toString(i32 %var1542)

   sw ra, 136(sp)
   sw a0, 40(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x3, 12(sp)
   mv a0, x4
   call toString
   lw ra, 136(sp)
   mv x4, a0
   lw a0, 40(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x3, 12(sp)
   # %var1543 = call ptr @string.add(ptr %var1540, ptr %var1541)

   sw ra, 136(sp)
   sw a0, 40(sp)
   sw a1, 44(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   mv a0, x3
   mv a1, x4
   call string.add
   lw ra, 136(sp)
   mv x3, a0
   lw a0, 40(sp)
   lw a1, 44(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   # %var1544 = call ptr @string.add(ptr %var1543, ptr @.str..1)

   sw ra, 136(sp)
   sw a0, 40(sp)
   sw a1, 44(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   la a1, @.str..1
   mv a0, x3
   call string.add
   lw ra, 136(sp)
   mv x3, a0
   lw a0, 40(sp)
   lw a1, 44(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   # %var1546 = load i32, ptr @C

   la t0, @C
   lw x4, 0(t0)
   # %var1545 = call ptr @toString(i32 %var1546)

   sw ra, 136(sp)
   sw a0, 40(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   sw x3, 12(sp)
   mv a0, x4
   call toString
   lw ra, 136(sp)
   mv x4, a0
   lw a0, 40(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   lw x3, 12(sp)
   # %var1547 = call ptr @string.add(ptr %var1544, ptr %var1545)

   sw ra, 136(sp)
   sw a0, 40(sp)
   sw a1, 44(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   mv a1, x4
   mv a0, x3
   call string.add
   lw ra, 136(sp)
   mv x3, a0
   lw a0, 40(sp)
   lw a1, 44(sp)
   lw t0, 20(sp)
   lw t1, 24(sp)
   lw t2, 28(sp)
   lw t3, 112(sp)
   lw t6, 124(sp)
   # call void @println(ptr %var1547)

   sw ra, 136(sp)
   sw a0, 40(sp)
   sw t0, 20(sp)
   sw t1, 24(sp)
   sw t2, 28(sp)
   sw t3, 112(sp)
   sw t6, 124(sp)
   mv a0, x3
   call println
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
   ret

   .section .text
   .globl main_entry_and_land.end..0
main_entry_and_land.end..0:
   # br label %land.end..0

   j main_land.end..0

   .section .text
   .globl main_while.cond.0_and_land.end..1
main_while.cond.0_and_land.end..1:
   # br label %land.end..1

   mv x3, x3
   j main_land.end..1

   .section .data
   .globl @A
@A:
   .word 1

   .section .data
   .globl @B
@B:
   .word 1

   .section .data
   .globl @C
@C:
   .word 1

   .section .rodata
@.str..1:
   .asciz " "

   .section .rodata
@.str..0:
   .asciz " "

