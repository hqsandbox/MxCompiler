@.str..1 = private unnamed_addr constant [2 x i8] c"\0A\00"
@r = global ptr null
@.str..0 = private unnamed_addr constant [2 x i8] c" \00"
@ch = global ptr null
@w = global ptr null
@l = global ptr null
@M = global i32 0
@N = global i32 0
define i32 @merge(i32 %x, i32 %y) {
entry:
%x.1 = alloca i32
store i32 %x, ptr %x.1
%y.1 = alloca i32
store i32 %y, ptr %y.1
%var0 = load i32, ptr %x.1
%var1 = icmp eq i32 0, %var0
br i1 %var1, label %if.then.0, label %if.else.0

if.then.0:
%var2 = load i32, ptr %y.1
ret i32 %var2
br label %if.back.0

if.else.0:
br label %if.back.0

if.back.0:
%var3 = load i32, ptr %y.1
%var4 = icmp eq i32 0, %var3
br i1 %var4, label %if.then.1, label %if.else.1

if.then.1:
%var5 = load i32, ptr %x.1
ret i32 %var5
br label %if.back.1

if.else.1:
br label %if.back.1

if.back.1:
%var6 = load ptr, ptr @w
%var7 = load i32, ptr %x.1
%var8 = getelementptr i32, ptr %var6, i32 %var7
%var9 = load i32, ptr %var8
%var10 = load ptr, ptr @w
%var11 = load i32, ptr %y.1
%var12 = getelementptr i32, ptr %var10, i32 %var11
%var13 = load i32, ptr %var12
%var14 = icmp slt i32 %var9, %var13
br i1 %var14, label %if.then.2, label %if.else.2

if.then.2:
%e.1 = alloca i32
%var15 = load i32, ptr %x.1
store i32 %var15, ptr %e.1
%var16 = load i32, ptr %x.1
%var17 = load i32, ptr %y.1
store i32 %var17, ptr %x.1
%var18 = load i32, ptr %y.1
%var19 = load i32, ptr %e.1
store i32 %var19, ptr %y.1
br label %if.back.2

if.else.2:
br label %if.back.2

if.back.2:
%var20 = load ptr, ptr @r
%var21 = load i32, ptr %x.1
%var22 = getelementptr i32, ptr %var20, i32 %var21
%var23 = load i32, ptr %var22
%var25 = load ptr, ptr @r
%var26 = load i32, ptr %x.1
%var27 = getelementptr i32, ptr %var25, i32 %var26
%var28 = load i32, ptr %var27
%var29 = load i32, ptr %y.1
%var24 = call i32 @merge(i32 %var28, i32 %var29)
store i32 %var24, ptr %var22
%e.2 = alloca i32
%var30 = load ptr, ptr @l
%var31 = load i32, ptr %x.1
%var32 = getelementptr i32, ptr %var30, i32 %var31
%var33 = load i32, ptr %var32
store i32 %var33, ptr %e.2
%var34 = load ptr, ptr @l
%var35 = load i32, ptr %x.1
%var36 = getelementptr i32, ptr %var34, i32 %var35
%var37 = load i32, ptr %var36
%var38 = load ptr, ptr @r
%var39 = load i32, ptr %x.1
%var40 = getelementptr i32, ptr %var38, i32 %var39
%var41 = load i32, ptr %var40
store i32 %var41, ptr %var36
%var42 = load ptr, ptr @r
%var43 = load i32, ptr %x.1
%var44 = getelementptr i32, ptr %var42, i32 %var43
%var45 = load i32, ptr %var44
%var46 = load i32, ptr %e.2
store i32 %var46, ptr %var44
%var47 = load i32, ptr %x.1
ret i32 %var47

}
define void @__init() {
entry:
ret void

}
define i32 @main() {
entry:
call void @__init()
%var49 = load i32, ptr @N
%var50 = call i32 @getInt()
store i32 %var50, ptr @N
%var51 = load i32, ptr @M
%var52 = call i32 @getInt()
store i32 %var52, ptr @M
%var53 = load ptr, ptr @ch
%var54 = call ptr @getString()
%var55 = call ptr @string.copy(ptr %var54)
store ptr %var55, ptr @ch
%var56 = load ptr, ptr @l
%var58 = load i32, ptr @N
%var59 = load i32, ptr @M
%var60 = add i32 %var58, %var59
%var61 = add i32 %var60, 5
%var57 = call ptr @__array.alloca(i32 4, i32 1, i32 1, i32 %var61)
store ptr %var57, ptr @l
%var62 = load ptr, ptr @r
%var64 = load i32, ptr @N
%var65 = load i32, ptr @M
%var66 = add i32 %var64, %var65
%var67 = add i32 %var66, 5
%var63 = call ptr @__array.alloca(i32 4, i32 1, i32 1, i32 %var67)
store ptr %var63, ptr @r
%var68 = load ptr, ptr @w
%var70 = load i32, ptr @N
%var71 = load i32, ptr @M
%var72 = add i32 %var70, %var71
%var73 = add i32 %var72, 5
%var69 = call ptr @__array.alloca(i32 4, i32 1, i32 1, i32 %var73)
store ptr %var69, ptr @w
%i.1 = alloca i32
store i32 0, ptr %i.1
%var74 = load i32, ptr %i.1
store i32 1, ptr %i.1
br label %for.cond.0

for.cond.0:
%var75 = load i32, ptr %i.1
%var76 = load i32, ptr @N
%var77 = icmp sle i32 %var75, %var76
br i1 %var77, label %for.body.0, label %for.back.0

for.body.0:
%var78 = load ptr, ptr @w
%var79 = load i32, ptr %i.1
%var80 = getelementptr i32, ptr %var78, i32 %var79
%var81 = load i32, ptr %var80
%var82 = call i32 @getInt()
store i32 %var82, ptr %var80
%var83 = load ptr, ptr @l
%var84 = load i32, ptr %i.1
%var85 = getelementptr i32, ptr %var83, i32 %var84
%var86 = load i32, ptr %var85
store i32 0, ptr %var85
%var87 = load ptr, ptr @r
%var88 = load i32, ptr %i.1
%var89 = getelementptr i32, ptr %var87, i32 %var88
%var90 = load i32, ptr %var89
store i32 0, ptr %var89
br label %for.step.0

for.step.0:
%var91 = load i32, ptr %i.1
%var92 = add i32 %var91, 1
store i32 %var92, ptr %i.1
br label %for.cond.0

for.back.0:
%var93 = load i32, ptr %i.1
store i32 1, ptr %i.1
br label %for.cond.1

for.cond.1:
%var94 = load i32, ptr %i.1
%var95 = load i32, ptr @M
%var96 = icmp sle i32 %var94, %var95
br i1 %var96, label %for.body.1, label %for.back.1

for.body.1:
%var97 = load ptr, ptr @w
%var98 = load i32, ptr %i.1
%var99 = load i32, ptr @N
%var100 = add i32 %var98, %var99
%var101 = getelementptr i32, ptr %var97, i32 %var100
%var102 = load i32, ptr %var101
%var103 = load ptr, ptr @ch
%var104 = load i32, ptr %i.1
%var105 = sub i32 %var104, 1
%var106 = call i32 @string.ord(ptr %var103, i32 %var105)
store i32 %var106, ptr %var101
%var107 = load ptr, ptr @l
%var108 = load i32, ptr %i.1
%var109 = load i32, ptr @N
%var110 = add i32 %var108, %var109
%var111 = getelementptr i32, ptr %var107, i32 %var110
%var112 = load i32, ptr %var111
store i32 0, ptr %var111
%var113 = load ptr, ptr @r
%var114 = load i32, ptr %i.1
%var115 = load i32, ptr @N
%var116 = add i32 %var114, %var115
%var117 = getelementptr i32, ptr %var113, i32 %var116
%var118 = load i32, ptr %var117
store i32 0, ptr %var117
br label %for.step.1

for.step.1:
%var119 = load i32, ptr %i.1
%var120 = add i32 %var119, 1
store i32 %var120, ptr %i.1
br label %for.cond.1

for.back.1:
%rt0.1 = alloca i32
store i32 1, ptr %rt0.1
%rt1.1 = alloca i32
%var121 = load i32, ptr @N
%var122 = add i32 %var121, 1
store i32 %var122, ptr %rt1.1
%var123 = load i32, ptr %i.1
store i32 2, ptr %i.1
br label %for.cond.2

for.cond.2:
%var124 = load i32, ptr %i.1
%var125 = load i32, ptr @N
%var126 = icmp sle i32 %var124, %var125
br i1 %var126, label %for.body.2, label %for.back.2

for.body.2:
%var127 = load i32, ptr %rt0.1
%var129 = load i32, ptr %rt0.1
%var130 = load i32, ptr %i.1
%var128 = call i32 @merge(i32 %var129, i32 %var130)
store i32 %var128, ptr %rt0.1
br label %for.step.2

for.step.2:
%var131 = load i32, ptr %i.1
%var132 = add i32 %var131, 1
store i32 %var132, ptr %i.1
br label %for.cond.2

for.back.2:
%var133 = load i32, ptr %i.1
%var134 = load i32, ptr @N
%var135 = add i32 %var134, 2
store i32 %var135, ptr %i.1
br label %for.cond.3

for.cond.3:
%var136 = load i32, ptr %i.1
%var137 = load i32, ptr @N
%var138 = load i32, ptr @M
%var139 = add i32 %var137, %var138
%var140 = icmp sle i32 %var136, %var139
br i1 %var140, label %for.body.3, label %for.back.3

for.body.3:
%var141 = load i32, ptr %rt1.1
%var143 = load i32, ptr %rt1.1
%var144 = load i32, ptr %i.1
%var142 = call i32 @merge(i32 %var143, i32 %var144)
store i32 %var142, ptr %rt1.1
br label %for.step.3

for.step.3:
%var145 = load i32, ptr %i.1
%var146 = add i32 %var145, 1
store i32 %var146, ptr %i.1
br label %for.cond.3

for.back.3:
%var149 = load ptr, ptr @w
%var150 = load i32, ptr %rt0.1
%var151 = getelementptr i32, ptr %var149, i32 %var150
%var152 = load i32, ptr %var151
%var148 = call ptr @toString(i32 %var152)
call void @print(ptr %var148)
call void @print(ptr @.str..0)
%var155 = load ptr, ptr @ch
%var156 = load i32, ptr %rt1.1
%var157 = load i32, ptr @N
%var158 = sub i32 %var156, %var157
%var159 = sub i32 %var158, 1
%var160 = load i32, ptr %rt1.1
%var161 = load i32, ptr @N
%var162 = sub i32 %var160, %var161
%var163 = call ptr @string.substring(ptr %var155, i32 %var159, i32 %var162)
call void @print(ptr %var163)
call void @print(ptr @.str..1)
%var168 = load i32, ptr %rt0.1
%var169 = load i32, ptr %rt1.1
%var167 = call i32 @merge(i32 %var168, i32 %var169)
%var166 = call ptr @toString(i32 %var167)
call void @println(ptr %var166)
ret i32 0

}
declare void @print(ptr)
declare void @println(ptr)
declare void @printInt(i32)
declare void @printlnInt(i32)
declare ptr @getString()
declare i32 @getInt()
declare ptr @toString(i32)
declare ptr @string.copy(ptr)
declare i32 @string.length(ptr)
declare ptr @string.substring(ptr, i32, i32)
declare i32 @string.parseInt(ptr)
declare i32 @string.ord(ptr, i32)
declare ptr @string.add(ptr, ptr)
declare i1 @string.equal(ptr, ptr)
declare i1 @string.notEqual(ptr, ptr)
declare i1 @string.less(ptr, ptr)
declare i1 @string.lessOrEqual(ptr, ptr)
declare i1 @string.greater(ptr, ptr)
declare i1 @string.greaterOrEqual(ptr, ptr)
declare i32 @array.size(ptr)
declare ptr @_malloc(i32)
declare ptr @__alloca_helper(i32, i32)
declare ptr @__array.alloca_inside(i32, i32, ptr, i32)
declare ptr @__array.alloca(i32, i32, i32, ...)
declare ptr @Int_toString(i32)
declare ptr @Bool_toString(i1)

