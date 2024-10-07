@a = global ptr null
@n = global i32 0
define void @__init() {
entry:
%var0 = call ptr @__array.alloca(i32 4, i32 1, i32 1, i32 20)
store ptr %var0, ptr @a
ret void

}
define i32 @jud(i32 %x) {
entry:
store i32 %x, ptr %x.1
store i32 0, ptr %i.1
store i32 0, ptr %j.1
%var1 = load i32, ptr %i.1
store i32 0, ptr %i.1
br label %for.cond.0

for.cond.0:
%var2 = load i32, ptr %i.1
%var3 = load i32, ptr @n
%var4 = load i32, ptr %x.1
%var5 = sdiv i32 %var3, %var4
%var6 = icmp slt i32 %var2, %var5
br i1 %var6, label %for.body.0, label %for.back.0

for.body.0:
br label %for.step.0

for.step.0:
%var7 = load i32, ptr %i.1
%var8 = add i32 %var7, 1
store i32 %var8, ptr %i.1
br label %for.cond.0

for.back.0:
ret i32 0

}
define i32 @main() {
entry:
call void @__init()
%var10 = call i32 @jud(i32 1)
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

