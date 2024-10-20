@r = global i32 0
@c = global i32 0
@i = global i32 0
@j = global i32 0
@n = global i32 0
define i32 @abs(i32 %c) {
entry:
%var1 = icmp sgt i32 %c, 0
br i1 %var1, label %if.then.0, label %if.else.0

if.then.0:
ret i32 %c

if.else.0:
br label %if.back.0

if.back.0:
%var4 = sub i32 0, %c
ret i32 %var4

}
define void @__init() {
entry:
ret void

}
define i32 @main() {
entry:
call void @__init()
store i32 0, ptr @i
br label %for.cond.0

for.cond.0:
%var7 = load i32, ptr @i
%var8 = icmp slt i32 %var7, 5
br i1 %var8, label %for.body.0, label %for.back.0

for.body.0:
store i32 0, ptr @j
br label %for.cond.1

for.cond.1:
%var10 = load i32, ptr @j
%var11 = icmp slt i32 %var10, 5
br i1 %var11, label %for.body.1, label %for.back.1

for.body.1:
%var13 = call i32 @getInt()
store i32 %var13, ptr @n
%var14 = load i32, ptr @n
%var15 = icmp eq i32 %var14, 1
br i1 %var15, label %if.then.1, label %if.else.1

if.then.1:
%var17 = load i32, ptr @i
store i32 %var17, ptr @r
%var19 = load i32, ptr @j
store i32 %var19, ptr @c
br label %if.back.1

if.else.1:
br label %if.back.1

if.back.1:
br label %for.step.1

for.step.1:
%var20 = load i32, ptr @j
%var21 = add i32 %var20, 1
store i32 %var21, ptr @j
br label %for.cond.1

for.back.1:
br label %for.step.0

for.step.0:
%var22 = load i32, ptr @i
%var23 = add i32 %var22, 1
store i32 %var23, ptr @i
br label %for.cond.0

for.back.0:
%var26 = load i32, ptr @r
%var27 = sub i32 2, %var26
%var25 = call i32 @abs(i32 %var27)
%var29 = load i32, ptr @c
%var30 = sub i32 2, %var29
%var28 = call i32 @abs(i32 %var30)
%var31 = add i32 %var25, %var28
call void @printInt(i32 %var31)
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

