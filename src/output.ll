@.str..1 = private unnamed_addr constant [3 x i8] c", \00"
@.str..2 = private unnamed_addr constant [3 x i8] c" )\00"
@.str..0 = private unnamed_addr constant [3 x i8] c"( \00"
%class..vector = type { i32 }
define ptr @vector..tostring(ptr %_this) {
entry:
%var34 = call i32 @vector..getDim(ptr %_this)
%var35 = icmp sgt i32 %var34, 0
br i1 %var35, label %if.then.2, label %if.else.2

if.then.2:
%var40 = getelementptr %class..vector, ptr %_this, i32 0, i32 0
%var41 = load ptr, ptr %var40
%var42 = getelementptr i32, ptr %var41, i32 0
%var43 = load i32, ptr %var42
%var38 = call ptr @toString(i32 %var43)
%var44 = call ptr @string.add(ptr @.str..0, ptr %var38)
%var45 = call ptr @string.copy(ptr %var44)
br label %if.back.2

if.else.2:
br label %if.back.2

if.back.2:
%temp.1_if.back.2 = phi ptr [ %var45, %if.then.2 ], [ @.str..0, %if.else.2 ]
br label %for.cond.1

for.cond.1:
%temp.1_for.cond.1 = phi ptr [ %temp.1_if.back.2, %if.back.2 ], [ %var62, %for.step.1 ]
%i.2_for.cond.1 = phi i32 [ 1, %if.back.2 ], [ %var64, %for.step.1 ]
%var49 = call i32 @vector..getDim(ptr %_this)
%var50 = icmp slt i32 %i.2_for.cond.1, %var49
br i1 %var50, label %for.body.1, label %for.back.1

for.body.1:
%var53 = call ptr @string.add(ptr %temp.1_for.cond.1, ptr @.str..1)
%var56 = getelementptr %class..vector, ptr %_this, i32 0, i32 0
%var57 = load ptr, ptr %var56
%var59 = getelementptr i32, ptr %var57, i32 %i.2_for.cond.1
%var60 = load i32, ptr %var59
%var54 = call ptr @toString(i32 %var60)
%var61 = call ptr @string.add(ptr %var53, ptr %var54)
%var62 = call ptr @string.copy(ptr %var61)
br label %for.step.1

for.step.1:
%var64 = add i32 %i.2_for.cond.1, 1
br label %for.cond.1

for.back.1:
%var67 = call ptr @string.add(ptr %temp.1_for.cond.1, ptr @.str..2)
%var68 = call ptr @string.copy(ptr %var67)
ret ptr %var68

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
define i32 @main() {
entry:
call void @__init()
%var104 = call ptr @_malloc(i32 4)
%var105 = call ptr @__array.alloca(i32 4, i32 1, i32 1, i32 10)
br label %for.cond.3

for.cond.3:
%i.4_for.cond.3 = phi i32 [ 0, %entry ], [ %var116, %for.step.3 ]
%var108 = icmp slt i32 %i.4_for.cond.3, 10
br i1 %var108, label %for.body.3, label %for.back.3

for.body.3:
%var111 = getelementptr i32, ptr %var105, i32 %i.4_for.cond.3
%var114 = sub i32 9, %i.4_for.cond.3
store i32 %var114, ptr %var111
br label %for.step.3

for.step.3:
%var116 = add i32 %i.4_for.cond.3, 1
br label %for.cond.3

for.back.3:
call void @vector..init(ptr %var104, ptr %var105)
%var121 = call ptr @vector..tostring(ptr %var104)
call void @println(ptr %var121)
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
%var71 = icmp eq ptr %rhs, null
br i1 %var71, label %if.then.3, label %if.else.3

if.then.3:
ret i1 false

if.else.3:
br label %if.back.3

if.back.3:
%var73 = call i32 @vector..getDim(ptr %rhs)
%var74 = icmp eq i32 %var73, 0
br i1 %var74, label %if.then.4, label %if.else.4

if.then.4:
%var76 = getelementptr %class..vector, ptr %_this, i32 0, i32 0
store ptr null, ptr %var76
br label %if.back.4

if.else.4:
%var79 = getelementptr %class..vector, ptr %_this, i32 0, i32 0
%var83 = call i32 @vector..getDim(ptr %rhs)
%var81 = call ptr @__array.alloca(i32 4, i32 1, i32 1, i32 %var83)
store ptr %var81, ptr %var79
br label %for.cond.2

for.cond.2:
%i.3_for.cond.2 = phi i32 [ 0, %if.else.4 ], [ %var102, %for.step.2 ]
%var87 = call i32 @vector..getDim(ptr %_this)
%var88 = icmp slt i32 %i.3_for.cond.2, %var87
br i1 %var88, label %for.body.2, label %for.back.2

for.body.2:
%var90 = getelementptr %class..vector, ptr %_this, i32 0, i32 0
%var91 = load ptr, ptr %var90
%var93 = getelementptr i32, ptr %var91, i32 %i.3_for.cond.2
%var96 = getelementptr %class..vector, ptr %rhs, i32 0, i32 0
%var97 = load ptr, ptr %var96
%var99 = getelementptr i32, ptr %var97, i32 %i.3_for.cond.2
%var100 = load i32, ptr %var99
store i32 %var100, ptr %var93
br label %for.step.2

for.step.2:
%var102 = add i32 %i.3_for.cond.2, 1
br label %for.cond.2

for.back.2:
br label %if.back.4

if.back.4:
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

