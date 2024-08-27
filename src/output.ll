@.str..1 = private unnamed_addr constant [1 x i8] c"\00"
@.str..0 = private unnamed_addr constant [2 x i8] c" \00"
define void @__init() {
entry:
ret void

}
define i32 @main() {
entry:
call void @__init()
%n.2 = alloca i32
%var48 = call i32 @getInt()
store i32 %var48, ptr %n.2
%a.2 = alloca ptr
%var50 = load i32, ptr %n.2
%var49 = call ptr @__array.alloca(i32 4, i32 1, i32 1, i32 %var50)
store ptr %var49, ptr %a.2
%i.2 = alloca i32
store i32 0, ptr %i.2
%var51 = load i32, ptr %i.2
store i32 0, ptr %i.2
br label %for.cond.2

for.cond.2:
%var52 = load i32, ptr %i.2
%var53 = load i32, ptr %n.2
%var54 = icmp slt i32 %var52, %var53
br i1 %var54, label %for.body.2, label %for.back.2

for.body.2:
%var55 = load ptr, ptr %a.2
%var56 = load i32, ptr %i.2
%var57 = getelementptr i32, ptr %var55, i32 %var56
%var58 = load i32, ptr %var57
%var59 = call i32 @getInt()
store i32 %var59, ptr %var57
br label %for.step.2

for.step.2:
%var60 = load i32, ptr %i.2
%var61 = add i32 %var60, 1
store i32 %var61, ptr %i.2
br label %for.cond.2

for.back.2:
%var63 = load ptr, ptr %a.2
call void @bubble_sort(ptr %var63)
%var64 = load i32, ptr %i.2
store i32 0, ptr %i.2
br label %for.cond.3

for.cond.3:
%var65 = load i32, ptr %i.2
%var66 = load i32, ptr %n.2
%var67 = icmp slt i32 %var65, %var66
br i1 %var67, label %for.body.3, label %for.back.3

for.body.3:
%var70 = load ptr, ptr %a.2
%var71 = load i32, ptr %i.2
%var72 = getelementptr i32, ptr %var70, i32 %var71
%var73 = load i32, ptr %var72
%var69 = call ptr @toString(i32 %var73)
%var74 = call ptr @string.add(ptr %var69, ptr @.str..0)
call void @print(ptr %var74)
br label %for.step.3

for.step.3:
%var75 = load i32, ptr %i.2
%var76 = add i32 %var75, 1
store i32 %var76, ptr %i.2
br label %for.cond.3

for.back.3:
call void @println(ptr @.str..1)
ret i32 0

}
define void @bubble_sort(ptr %a) {
entry:
%a.1 = alloca ptr
store ptr %a, ptr %a.1
%i.1 = alloca i32
store i32 0, ptr %i.1
%j.1 = alloca i32
store i32 0, ptr %j.1
%n.1 = alloca i32
%var0 = load ptr, ptr %a.1
%var1 = call i32 @array.size(ptr %var0)
store i32 %var1, ptr %n.1
%var2 = load i32, ptr %i.1
store i32 0, ptr %i.1
br label %for.cond.0

for.cond.0:
%var3 = load i32, ptr %i.1
%var4 = load i32, ptr %n.1
%var5 = sub i32 %var4, 1
%var6 = icmp slt i32 %var3, %var5
br i1 %var6, label %for.body.0, label %for.back.0

for.body.0:
%var7 = load i32, ptr %j.1
store i32 0, ptr %j.1
br label %for.cond.1

for.cond.1:
%var8 = load i32, ptr %j.1
%var9 = load i32, ptr %n.1
%var10 = load i32, ptr %i.1
%var11 = sub i32 %var9, %var10
%var12 = sub i32 %var11, 1
%var13 = icmp slt i32 %var8, %var12
br i1 %var13, label %for.body.1, label %for.back.1

for.body.1:
%var14 = load ptr, ptr %a.1
%var15 = load i32, ptr %j.1
%var16 = getelementptr i32, ptr %var14, i32 %var15
%var17 = load i32, ptr %var16
%var18 = load ptr, ptr %a.1
%var19 = load i32, ptr %j.1
%var20 = add i32 %var19, 1
%var21 = getelementptr i32, ptr %var18, i32 %var20
%var22 = load i32, ptr %var21
%var23 = icmp slt i32 %var17, %var22
br i1 %var23, label %if.then.0, label %if.else.0

if.then.0:
br label %for.body.1
br label %if.back.0

if.else.0:
br label %if.back.0

if.back.0:
%t.1 = alloca i32
%var24 = load ptr, ptr %a.1
%var25 = load i32, ptr %j.1
%var26 = getelementptr i32, ptr %var24, i32 %var25
%var27 = load i32, ptr %var26
store i32 %var27, ptr %t.1
%var28 = load ptr, ptr %a.1
%var29 = load i32, ptr %j.1
%var30 = getelementptr i32, ptr %var28, i32 %var29
%var31 = load i32, ptr %var30
%var32 = load ptr, ptr %a.1
%var33 = load i32, ptr %j.1
%var34 = add i32 %var33, 1
%var35 = getelementptr i32, ptr %var32, i32 %var34
%var36 = load i32, ptr %var35
store i32 %var36, ptr %var30
%var37 = load ptr, ptr %a.1
%var38 = load i32, ptr %j.1
%var39 = add i32 %var38, 1
%var40 = getelementptr i32, ptr %var37, i32 %var39
%var41 = load i32, ptr %var40
%var42 = load i32, ptr %t.1
store i32 %var42, ptr %var40
br label %for.step.1

for.step.1:
%var43 = load i32, ptr %j.1
%var44 = add i32 %var43, 1
store i32 %var44, ptr %j.1
br label %for.cond.1

for.back.1:
br label %for.step.0

for.step.0:
%var45 = load i32, ptr %i.1
%var46 = add i32 %var45, 1
store i32 %var46, ptr %i.1
br label %for.cond.0

for.back.0:
ret void

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

