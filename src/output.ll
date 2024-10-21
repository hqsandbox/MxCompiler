@.str..1 = private unnamed_addr constant [3 x i8] c", \00"
@.str..2 = private unnamed_addr constant [3 x i8] c" )\00"
@.str..0 = private unnamed_addr constant [3 x i8] c"( \00"
@.str..7 = private unnamed_addr constant [8 x i8] c"x * y: \00"
@.str..8 = private unnamed_addr constant [15 x i8] c"(1 << 3) * y: \00"
@.str..5 = private unnamed_addr constant [11 x i8] c"vector y: \00"
@.str..6 = private unnamed_addr constant [8 x i8] c"x + y: \00"
@.str..3 = private unnamed_addr constant [11 x i8] c"vector x: \00"
@.str..4 = private unnamed_addr constant [9 x i8] c"excited!\00"
%class..vector = type { i32 }
define ptr @vector..add(ptr %_this, ptr %rhs) {
entry:
%var85 = call i32 @vector..getDim(ptr %_this)
%var87 = call i32 @vector..getDim(ptr %rhs)
%var88 = icmp ne i32 %var85, %var87
br i1 %var88, label %entry_and_land.end..0, label %land.next..0

land.next..0:
%var91 = call i32 @vector..getDim(ptr %_this)
%var92 = icmp eq i32 %var91, 0
br label %land.end..0

land.end..0:
%var89_land.end..0 = phi i1 [ %var88, %entry_and_land.end..0 ], [ %var92, %land.next..0 ]
br i1 %var89_land.end..0, label %if.then.3, label %if.else.3

if.then.3:
ret ptr null

if.else.3:
br label %if.back.3

if.back.3:
%var94 = call ptr @_malloc(i32 4)
%var96 = getelementptr %class..vector, ptr %var94, i32 0, i32 0
%var100 = call i32 @vector..getDim(ptr %_this)
%var98 = call ptr @__array.alloca(i32 4, i32 1, i32 1, i32 %var100)
store ptr %var98, ptr %var96
br label %for.cond.2

for.cond.2:
%i.4_for.cond.2 = phi i32 [ 0, %if.back.3 ], [ %var126, %for.step.2 ]
%var104 = call i32 @vector..getDim(ptr %_this)
%var105 = icmp slt i32 %i.4_for.cond.2, %var104
br i1 %var105, label %for.body.2, label %for.back.2

for.body.2:
%var107 = getelementptr %class..vector, ptr %var94, i32 0, i32 0
%var108 = load ptr, ptr %var107
%var110 = getelementptr i32, ptr %var108, i32 %i.4_for.cond.2
%var113 = getelementptr %class..vector, ptr %_this, i32 0, i32 0
%var114 = load ptr, ptr %var113
%var116 = getelementptr i32, ptr %var114, i32 %i.4_for.cond.2
%var117 = load i32, ptr %var116
%var119 = getelementptr %class..vector, ptr %rhs, i32 0, i32 0
%var120 = load ptr, ptr %var119
%var122 = getelementptr i32, ptr %var120, i32 %i.4_for.cond.2
%var123 = load i32, ptr %var122
%var124 = add i32 %var117, %var123
store i32 %var124, ptr %var110
br label %for.step.2

for.step.2:
%var126 = add i32 %i.4_for.cond.2, 1
br label %for.cond.2

for.back.2:
ret ptr %var94

entry_and_land.end..0:
br label %land.end..0

}
define ptr @vector..tostring(ptr %_this) {
entry:
%var140 = call i32 @vector..getDim(ptr %_this)
%var141 = icmp sgt i32 %var140, 0
br i1 %var141, label %if.then.5, label %if.else.5

if.then.5:
%var146 = getelementptr %class..vector, ptr %_this, i32 0, i32 0
%var147 = load ptr, ptr %var146
%var148 = getelementptr i32, ptr %var147, i32 0
%var149 = load i32, ptr %var148
%var144 = call ptr @toString(i32 %var149)
%var150 = call ptr @string.add(ptr @.str..0, ptr %var144)
%var151 = call ptr @string.copy(ptr %var150)
br label %if.back.5

if.else.5:
br label %if.back.5

if.back.5:
%temp.2_if.back.5 = phi ptr [ %var151, %if.then.5 ], [ @.str..0, %if.else.5 ]
br label %for.cond.3

for.cond.3:
%temp.2_for.cond.3 = phi ptr [ %temp.2_if.back.5, %if.back.5 ], [ %var168, %for.step.3 ]
%i.5_for.cond.3 = phi i32 [ 1, %if.back.5 ], [ %var170, %for.step.3 ]
%var155 = call i32 @vector..getDim(ptr %_this)
%var156 = icmp slt i32 %i.5_for.cond.3, %var155
br i1 %var156, label %for.body.3, label %for.back.3

for.body.3:
%var159 = call ptr @string.add(ptr %temp.2_for.cond.3, ptr @.str..1)
%var162 = getelementptr %class..vector, ptr %_this, i32 0, i32 0
%var163 = load ptr, ptr %var162
%var165 = getelementptr i32, ptr %var163, i32 %i.5_for.cond.3
%var166 = load i32, ptr %var165
%var160 = call ptr @toString(i32 %var166)
%var167 = call ptr @string.add(ptr %var159, ptr %var160)
%var168 = call ptr @string.copy(ptr %var167)
br label %for.step.3

for.step.3:
%var170 = add i32 %i.5_for.cond.3, 1
br label %for.cond.3

for.back.3:
%var173 = call ptr @string.add(ptr %temp.2_for.cond.3, ptr @.str..2)
%var174 = call ptr @string.copy(ptr %var173)
ret ptr %var174

}
define i1 @vector..set(ptr %_this, i32 %idx, i32 %value) {
entry:
%var129 = call i32 @vector..getDim(ptr %_this)
%var131 = icmp slt i32 %var129, %idx
br i1 %var131, label %if.then.4, label %if.else.4

if.then.4:
ret i1 false

if.else.4:
br label %if.back.4

if.back.4:
%var133 = getelementptr %class..vector, ptr %_this, i32 0, i32 0
%var134 = load ptr, ptr %var133
%var136 = getelementptr i32, ptr %var134, i32 %idx
store i32 %value, ptr %var136
ret i1 true

}
define void @vector..init(ptr %_this, ptr %vec) {
entry:
%var1 = icmp eq ptr %vec, null
br i1 %var1, label %if.then.0, label %if.else.0

if.then.0:
ret void

if.else.0:
br label %if.back.0

if.back.0:
%var3 = getelementptr %class..vector, ptr %_this, i32 0, i32 0
%var7 = call i32 @array.size(ptr %vec)
%var5 = call ptr @__array.alloca(i32 4, i32 1, i32 1, i32 %var7)
store ptr %var5, ptr %var3
br label %for.cond.0

for.cond.0:
%i.1_for.cond.0 = phi i32 [ 0, %if.back.0 ], [ %var24, %for.step.0 ]
%var11 = call i32 @array.size(ptr %vec)
%var12 = icmp slt i32 %i.1_for.cond.0, %var11
br i1 %var12, label %for.body.0, label %for.back.0

for.body.0:
%var14 = getelementptr %class..vector, ptr %_this, i32 0, i32 0
%var15 = load ptr, ptr %var14
%var17 = getelementptr i32, ptr %var15, i32 %i.1_for.cond.0
%var21 = getelementptr i32, ptr %vec, i32 %i.1_for.cond.0
%var22 = load i32, ptr %var21
store i32 %var22, ptr %var17
br label %for.step.0

for.step.0:
%var24 = add i32 %i.1_for.cond.0, 1
br label %for.cond.0

for.back.0:
ret void

}
define void @__init() {
entry:
ret void

}
define i32 @vector..dot(ptr %_this, ptr %rhs) {
entry:
call void @vector..getDim(ptr %_this)
br label %while.cond.0

while.cond.0:
%result.1_while.cond.0 = phi i32 [ 0, %entry ], [ %var54, %while.body.0 ]
%i.2_while.cond.0 = phi i32 [ 0, %entry ], [ %var56, %while.body.0 ]
%var39 = call i32 @vector..getDim(ptr %_this)
%var40 = icmp slt i32 %i.2_while.cond.0, %var39
br i1 %var40, label %while.body.0, label %while.back.0

while.body.0:
%var43 = getelementptr %class..vector, ptr %_this, i32 0, i32 0
%var44 = load ptr, ptr %var43
%var46 = getelementptr i32, ptr %var44, i32 %i.2_while.cond.0
%var47 = load i32, ptr %var46
%var49 = getelementptr %class..vector, ptr %rhs, i32 0, i32 0
%var50 = load ptr, ptr %var49
%var52 = getelementptr i32, ptr %var50, i32 %i.2_while.cond.0
%var53 = load i32, ptr %var52
%var54 = mul i32 %var47, %var53
%var56 = add i32 %i.2_while.cond.0, 1
br label %while.cond.0

while.back.0:
ret i32 %result.1_while.cond.0

}
define ptr @vector..scalarInPlaceMultiply(ptr %_this, i32 %c) {
entry:
%var59 = getelementptr %class..vector, ptr %_this, i32 0, i32 0
%var60 = load ptr, ptr %var59
%var61 = icmp eq ptr %var60, null
br i1 %var61, label %if.then.2, label %if.else.2

if.then.2:
ret ptr null

if.else.2:
br label %if.back.2

if.back.2:
br label %for.cond.1

for.cond.1:
%i.3_for.cond.1 = phi i32 [ 0, %if.back.2 ], [ %var82, %for.step.1 ]
%var65 = call i32 @vector..getDim(ptr %_this)
%var66 = icmp slt i32 %i.3_for.cond.1, %var65
br i1 %var66, label %for.body.1, label %for.back.1

for.body.1:
%var68 = getelementptr %class..vector, ptr %_this, i32 0, i32 0
%var69 = load ptr, ptr %var68
%var71 = getelementptr i32, ptr %var69, i32 %i.3_for.cond.1
%var75 = getelementptr %class..vector, ptr %_this, i32 0, i32 0
%var76 = load ptr, ptr %var75
%var78 = getelementptr i32, ptr %var76, i32 %i.3_for.cond.1
%var79 = load i32, ptr %var78
%var80 = mul i32 %c, %var79
store i32 %var80, ptr %var71
br label %for.step.1

for.step.1:
%var82 = add i32 %i.3_for.cond.1, 1
br label %for.cond.1

for.back.1:
ret ptr %_this

}
define i32 @main() {
entry:
call void @__init()
%var210 = call ptr @_malloc(i32 4)
%var211 = call ptr @__array.alloca(i32 4, i32 1, i32 1, i32 10)
br label %for.cond.5

for.cond.5:
%i.7_for.cond.5 = phi i32 [ 0, %entry ], [ %var222, %for.step.5 ]
%var214 = icmp slt i32 %i.7_for.cond.5, 10
br i1 %var214, label %for.body.5, label %for.back.5

for.body.5:
%var217 = getelementptr i32, ptr %var211, i32 %i.7_for.cond.5
%var220 = sub i32 9, %i.7_for.cond.5
store i32 %var220, ptr %var217
br label %for.step.5

for.step.5:
%var222 = add i32 %i.7_for.cond.5, 1
br label %for.cond.5

for.back.5:
call void @vector..init(ptr %var210, ptr %var211)
call void @print(ptr @.str..3)
%var228 = call ptr @vector..tostring(ptr %var210)
call void @println(ptr %var228)
%var229 = call ptr @_malloc(i32 4)
call void @vector..copy(ptr %var229, ptr %var210)
%var234 = call i1 @vector..set(ptr %var229, i32 3, i32 817)
br i1 %var234, label %if.then.8, label %if.else.8

if.then.8:
call void @println(ptr @.str..4)
br label %if.back.8

if.else.8:
br label %if.back.8

if.back.8:
call void @print(ptr @.str..5)
%var239 = call ptr @vector..tostring(ptr %var229)
call void @println(ptr %var239)
call void @print(ptr @.str..6)
%var244 = call ptr @vector..add(ptr %var210, ptr %var229)
%var245 = call ptr @vector..tostring(ptr %var244)
call void @println(ptr %var245)
call void @print(ptr @.str..7)
%var251 = call i32 @vector..dot(ptr %var210, ptr %var229)
%var248 = call ptr @toString(i32 %var251)
call void @println(ptr %var248)
call void @print(ptr @.str..8)
%var255 = shl i32 1, 3
%var256 = call ptr @vector..scalarInPlaceMultiply(ptr %var229, i32 %var255)
%var257 = call ptr @vector..tostring(ptr %var256)
call void @println(ptr %var257)
ret i32 0

}
define i32 @vector..getDim(ptr %_this) {
entry:
%var26 = getelementptr %class..vector, ptr %_this, i32 0, i32 0
%var27 = load ptr, ptr %var26
%var28 = icmp eq ptr %var27, null
br i1 %var28, label %if.then.1, label %if.else.1

if.then.1:
ret i32 0

if.else.1:
br label %if.back.1

if.back.1:
%var30 = getelementptr %class..vector, ptr %_this, i32 0, i32 0
%var31 = load ptr, ptr %var30
%var32 = call i32 @array.size(ptr %var31)
ret i32 %var32

}
define i1 @vector..copy(ptr %_this, ptr %rhs) {
entry:
%var177 = icmp eq ptr %rhs, null
br i1 %var177, label %if.then.6, label %if.else.6

if.then.6:
ret i1 false

if.else.6:
br label %if.back.6

if.back.6:
%var179 = call i32 @vector..getDim(ptr %rhs)
%var180 = icmp eq i32 %var179, 0
br i1 %var180, label %if.then.7, label %if.else.7

if.then.7:
%var182 = getelementptr %class..vector, ptr %_this, i32 0, i32 0
store ptr null, ptr %var182
br label %if.back.7

if.else.7:
%var185 = getelementptr %class..vector, ptr %_this, i32 0, i32 0
%var189 = call i32 @vector..getDim(ptr %rhs)
%var187 = call ptr @__array.alloca(i32 4, i32 1, i32 1, i32 %var189)
store ptr %var187, ptr %var185
br label %for.cond.4

for.cond.4:
%i.6_for.cond.4 = phi i32 [ 0, %if.else.7 ], [ %var208, %for.step.4 ]
%var193 = call i32 @vector..getDim(ptr %_this)
%var194 = icmp slt i32 %i.6_for.cond.4, %var193
br i1 %var194, label %for.body.4, label %for.back.4

for.body.4:
%var196 = getelementptr %class..vector, ptr %_this, i32 0, i32 0
%var197 = load ptr, ptr %var196
%var199 = getelementptr i32, ptr %var197, i32 %i.6_for.cond.4
%var202 = getelementptr %class..vector, ptr %rhs, i32 0, i32 0
%var203 = load ptr, ptr %var202
%var205 = getelementptr i32, ptr %var203, i32 %i.6_for.cond.4
%var206 = load i32, ptr %var205
store i32 %var206, ptr %var199
br label %for.step.4

for.step.4:
%var208 = add i32 %i.6_for.cond.4, 1
br label %for.cond.4

for.back.4:
br label %if.back.7

if.back.7:
ret i1 true

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

