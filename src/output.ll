@.str..0 = private unnamed_addr constant [2 x i8] c"\0A\00"
define void @__init() {
entry:
ret void

}
define i32 @main() {
entry:
call void @__init()
%var1 = call ptr @__array.alloca(i32 4, i32 1, i32 1, i32 2801)
br label %for.cond.0

for.cond.0:
%b.1_for.cond.0 = phi i32 [ 0, %entry ], [ %var13, %for.step.0 ]
%var4 = sub i32 %b.1_for.cond.0, 2800
%var5 = icmp ne i32 %var4, 0
br i1 %var5, label %for.body.0, label %for.back.0

for.body.0:
%var8 = getelementptr i32, ptr %var1, i32 %b.1_for.cond.0
%var11 = sdiv i32 10000, 5
store i32 %var11, ptr %var8
br label %for.step.0

for.step.0:
%var13 = add i32 %b.1_for.cond.0, 1
br label %for.cond.0

for.back.0:
br label %for.cond.1

for.cond.1:
%e.1_for.cond.1 = phi i32 [ 0, %for.back.0 ], [ %var65, %for.step.1 ]
%c.1_for.cond.1 = phi i32 [ 2800, %for.back.0 ], [ %var54, %for.step.1 ]
br label %for.body.1

for.body.1:
%var17 = mul i32 %c.1_for.cond.1, 2
%var19 = icmp eq i32 %var17, 0
br i1 %var19, label %if.then.0, label %if.else.0

if.then.0:
br label %for.back.1

if.else.0:
br label %if.back.0

if.back.0:
br label %for.cond.2

for.cond.2:
%d.1_for.cond.2 = phi i32 [ 0, %if.back.0 ], [ %var51, %for.step.2 ]
%b.1_for.cond.2 = phi i32 [ %c.1_for.cond.1, %if.back.0 ], [ %var46, %for.step.2 ]
%g.1_for.cond.2 = phi i32 [ %var17, %if.back.0 ], [ %var44, %for.step.2 ]
br label %for.body.2

for.body.2:
%var26 = getelementptr i32, ptr %var1, i32 %b.1_for.cond.2
%var27 = load i32, ptr %var26
%var29 = mul i32 %var27, 10000
%var30 = add i32 %d.1_for.cond.2, %var29
%var33 = getelementptr i32, ptr %var1, i32 %b.1_for.cond.2
%var37 = sub i32 %g.1_for.cond.2, 1
%var38 = srem i32 %var30, %var37
store i32 %var38, ptr %var33
%var42 = sdiv i32 %var30, %var37
%var44 = sub i32 %var37, 1
%var46 = sub i32 %b.1_for.cond.2, 1
%var47 = icmp eq i32 %var46, 0
br i1 %var47, label %if.then.1, label %if.else.1

if.then.1:
br label %for.back.2

if.else.1:
br label %if.back.1

if.back.1:
br label %for.step.2

for.step.2:
%var51 = mul i32 %var42, %var46
br label %for.cond.2

for.back.2:
%var54 = sub i32 %c.1_for.cond.1, 14
%var60 = sdiv i32 %var42, 10000
%var61 = add i32 %e.1_for.cond.1, %var60
%var56 = call ptr @toString(i32 %var61)
call void @print(ptr %var56)
br label %for.step.1

for.step.1:
%var65 = srem i32 %var42, 10000
br label %for.cond.1

for.back.1:
call void @print(ptr @.str..0)
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

