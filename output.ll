@a = global ptr null
@i = global i32 0
@n = global i32 0
define void @__init() {
entry:
%var0 = call ptr @__array.alloca(i32 4, i32 1, i32 1, i32 20)
store ptr %var0, ptr @a
ret void

}
define i32 @jud(i32 %x) {
entry:
br label %for.cond.0

for.cond.0:
%i.1_for.cond.0 = phi i32 [ 0, %entry ], [ %var36, %for.step.0 ]
%var3 = load i32, ptr @n
%var5 = sdiv i32 %var3, %x
%var6 = icmp slt i32 %i.1_for.cond.0, %var5
br i1 %var6, label %for.body.0, label %for.back.0

for.body.0:
br label %for.cond.1

for.cond.1:
%flag.1_for.cond.1 = phi i1 [ false, %for.body.0 ], [ %flag.1_if.back.0, %for.step.1 ]
%j.1_for.cond.1 = phi i32 [ 0, %for.body.0 ], [ %var32, %for.step.1 ]
%var10 = sub i32 %x, 1
%var11 = icmp slt i32 %j.1_for.cond.1, %var10
br i1 %var11, label %for.body.1, label %for.back.1

for.body.1:
%var12 = load ptr, ptr @a
%var15 = mul i32 %i.1_for.cond.0, %x
%var17 = add i32 %var15, %j.1_for.cond.1
%var18 = getelementptr i32, ptr %var12, i32 %var17
%var19 = load i32, ptr %var18
%var20 = load ptr, ptr @a
%var23 = mul i32 %i.1_for.cond.0, %x
%var25 = add i32 %var23, %j.1_for.cond.1
%var26 = add i32 %var25, 1
%var27 = getelementptr i32, ptr %var20, i32 %var26
%var28 = load i32, ptr %var27
%var29 = icmp sgt i32 %var19, %var28
br i1 %var29, label %if.then.0, label %if.else.0

if.then.0:
br label %if.back.0

if.else.0:
br label %if.back.0

if.back.0:
%flag.1_if.back.0 = phi i1 [ %flag.1_for.cond.1, %if.else.0 ], [ true, %if.then.0 ]
br label %for.step.1

for.step.1:
%var32 = add i32 %j.1_for.cond.1, 1
br label %for.cond.1

for.back.1:
%var34 = xor i1 %flag.1_for.cond.1, true
br i1 %var34, label %if.then.1, label %if.else.1

if.then.1:
ret i32 1

if.else.1:
br label %if.back.1

if.back.1:
br label %for.step.0

for.step.0:
%var36 = add i32 %i.1_for.cond.0, 1
br label %for.cond.0

for.back.0:
ret i32 0

}
define i32 @main() {
entry:
call void @__init()
%var39 = call i32 @getInt()
store i32 %var39, ptr @n
store i32 0, ptr @i
br label %for.cond.2

for.cond.2:
%var41 = load i32, ptr @i
%var42 = load i32, ptr @n
%var43 = icmp slt i32 %var41, %var42
br i1 %var43, label %for.body.2, label %for.back.2

for.body.2:
%var44 = load ptr, ptr @a
%var45 = load i32, ptr @i
%var46 = getelementptr i32, ptr %var44, i32 %var45
%var48 = call i32 @getInt()
store i32 %var48, ptr %var46
br label %for.step.2

for.step.2:
%var49 = load i32, ptr @i
%var50 = add i32 %var49, 1
store i32 %var50, ptr @i
br label %for.cond.2

for.back.2:
%var52 = load i32, ptr @n
store i32 %var52, ptr @i
br label %for.cond.3

for.cond.3:
%var53 = load i32, ptr @i
%var54 = icmp sgt i32 %var53, 0
br i1 %var54, label %for.body.3, label %for.back.3

for.body.3:
%var56 = load i32, ptr @i
%var55 = call i32 @jud(i32 %var56)
%var57 = icmp sgt i32 %var55, 0
br i1 %var57, label %if.then.2, label %if.else.2

if.then.2:
%var60 = load i32, ptr @i
%var59 = call ptr @toString(i32 %var60)
call void @print(ptr %var59)
ret i32 0

if.else.2:
br label %if.back.2

if.back.2:
br label %for.step.3

for.step.3:
%var62 = load i32, ptr @i
%var63 = sdiv i32 %var62, 2
store i32 %var63, ptr @i
br label %for.cond.3

for.back.3:
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

