@p = global i32 0
@.str..1 = private unnamed_addr constant [2 x i8] c"(\00"
@.str..2 = private unnamed_addr constant [3 x i8] c") \00"
@.str..0 = private unnamed_addr constant [4 x i8] c"<< \00"
@i = global i32 0
@k = global i32 0
@n = global i32 0
@.str..3 = private unnamed_addr constant [2 x i8] c" \00"
@.str..4 = private unnamed_addr constant [4 x i8] c">> \00"
define void @__init() {
entry:
ret void

}
define i32 @main() {
entry:
call void @__init()
%var2 = call i32 @getInt()
store i32 %var2, ptr @n
%var4 = call i32 @getInt()
store i32 %var4, ptr @p
%var6 = call i32 @getInt()
store i32 %var6, ptr @k
%var7 = load i32, ptr @p
%var8 = load i32, ptr @k
%var9 = sub i32 %var7, %var8
%var10 = icmp sgt i32 %var9, 1
br i1 %var10, label %if.then.0, label %if.else.0

if.then.0:
call void @print(ptr @.str..0)
br label %if.back.0

if.else.0:
br label %if.back.0

if.back.0:
%var13 = load i32, ptr @p
%var14 = load i32, ptr @k
%var15 = sub i32 %var13, %var14
store i32 %var15, ptr @i
br label %for.cond.0

for.cond.0:
%var16 = load i32, ptr @i
%var17 = load i32, ptr @p
%var18 = load i32, ptr @k
%var19 = add i32 %var17, %var18
%var20 = icmp sle i32 %var16, %var19
br i1 %var20, label %for.body.0, label %for.back.0

for.body.0:
%var22 = icmp sle i32 1, %var21
br i1 %var22, label %land.next..0, label %for.body.0_and_land.end..0

land.next..0:
%var24 = load i32, ptr @i
%var25 = load i32, ptr @n
%var26 = icmp sle i32 %var24, %var25
br label %land.end..0

land.end..0:
%var23_land.end..0 = phi i1 [ %var22, %for.body.0_and_land.end..0 ], [ %var26, %land.next..0 ]
br i1 %var23_land.end..0, label %if.then.1, label %if.else.1

if.then.1:
%var28 = load i32, ptr @i
%var29 = load i32, ptr @p
%var30 = icmp eq i32 %var28, %var29
br i1 %var30, label %if.then.2, label %if.else.2

if.then.2:
call void @print(ptr @.str..1)
%var34 = load i32, ptr @i
%var33 = call ptr @toString(i32 %var34)
call void @print(ptr %var33)
call void @print(ptr @.str..2)
br label %if.back.2

if.else.2:
%var37 = load i32, ptr @i
call void @printInt(i32 %var37)
call void @print(ptr @.str..3)
br label %if.back.2

if.back.2:
br label %if.back.1

if.else.1:
br label %if.back.1

if.back.1:
br label %for.step.0

for.step.0:
%var39 = load i32, ptr @i
%var40 = add i32 %var39, 1
store i32 %var40, ptr @i
br label %for.cond.0

for.back.0:
%var41 = load i32, ptr @p
%var42 = load i32, ptr @k
%var43 = add i32 %var41, %var42
%var44 = load i32, ptr @n
%var45 = icmp slt i32 %var43, %var44
br i1 %var45, label %if.then.3, label %if.else.3

if.then.3:
call void @print(ptr @.str..4)
br label %if.back.3

if.else.3:
br label %if.back.3

if.back.3:
ret i32 0

for.body.0_and_land.end..0:
br label %land.end..0

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

