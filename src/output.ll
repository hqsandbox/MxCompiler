@p = global i32 0
@.str..3 = private unnamed_addr constant [2 x i8] c" \00"
@.str..4 = private unnamed_addr constant [4 x i8] c">> \00"
@i = global i32 0
@.str..2 = private unnamed_addr constant [3 x i8] c") \00"
@k = global i32 0
@.str..1 = private unnamed_addr constant [2 x i8] c"(\00"
@n = global i32 0
@.str..0 = private unnamed_addr constant [4 x i8] c"<< \00"
define i32 @main() {
entry:
%var0 = load i32, ptr @n
%var1 = call i32 @getInt()
store i32 %var1, ptr @n
%var2 = load i32, ptr @p
%var3 = call i32 @getInt()
store i32 %var3, ptr @p
%var4 = load i32, ptr @k
%var5 = call i32 @getInt()
store i32 %var5, ptr @k
%var6 = load i32, ptr @p
%var7 = load i32, ptr @k
%var8 = sub i32 %var6, %var7
%var9 = icmp sgt i32 %var8, 1
br i1 %var9, label %if.then.0, label %if.else.0

if.then.0:
call void @print(ptr @.str..0)
br label %if.back.0

if.else.0:
br label %if.back.0

if.back.0:
%var11 = load i32, ptr @i
%var12 = load i32, ptr @p
%var13 = load i32, ptr @k
%var14 = sub i32 %var12, %var13
store i32 %var14, ptr @i
br label %for.cond.0

for.cond.0:
%var15 = load i32, ptr @i
%var16 = load i32, ptr @p
%var17 = load i32, ptr @k
%var18 = add i32 %var16, %var17
%var19 = icmp sle i32 %var15, %var18
br i1 %var19, label %for.body.0, label %for.back.0

for.body.0:
%var20 = load i32, ptr @i
%var21 = icmp sle i32 1, %var20
br i1 %var21, label %land.then..0, label %land.else..0

land.then..0:
%var22 = load i32, ptr @i
%var23 = load i32, ptr @n
%var24 = icmp sle i32 %var22, %var23
br label %land.end..0

land.else..0:
br label %land.end..0

land.end..0:
%var25 = phi i1 [ %var24, %land.then..0 ], [ %var21, %land.else..0 ]
br i1 %var25, label %if.then.1, label %if.else.1

if.then.1:
%var26 = load i32, ptr @i
%var27 = load i32, ptr @p
%var28 = icmp eq i32 %var26, %var27
br i1 %var28, label %if.then.2, label %if.else.2

if.then.2:
call void @print(ptr @.str..1)
%var32 = load i32, ptr @i
%var31 = call ptr @toString(i32 %var32)
call void @print(ptr %var31)
call void @print(ptr @.str..2)
br label %if.back.2

if.else.2:
%var35 = load i32, ptr @i
call void @printInt(i32 %var35)
call void @print(ptr @.str..3)
br label %if.back.2

if.back.2:
br label %if.back.1

if.else.1:
br label %if.back.1

if.back.1:
br label %for.step.0

for.step.0:
%var37 = load i32, ptr @i
%var38 = add i32 %var37, 1
store i32 %var38, ptr @i
br label %for.cond.0

for.back.0:
%var39 = load i32, ptr @p
%var40 = load i32, ptr @k
%var41 = add i32 %var39, %var40
%var42 = load i32, ptr @n
%var43 = icmp slt i32 %var41, %var42
br i1 %var43, label %if.then.3, label %if.else.3

if.then.3:
call void @print(ptr @.str..4)
br label %if.back.3

if.else.3:
br label %if.back.3

if.back.3:
ret i32 0

}
declare void @print(ptr)
declare void @println(ptr)
declare void @printInt(i32)
declare void @printlnInt(i32)
declare ptr @getString()
declare i32 @getInt()
declare ptr @toString(i32)

