@.str..1 = private unnamed_addr constant [3 x i8] c"12\00"
@.str..2 = private unnamed_addr constant [3 x i8] c"89\00"
@.str..0 = private unnamed_addr constant [3 x i8] c"15\00"
@s = global ptr null
@.str..3 = private unnamed_addr constant [3 x i8] c"13\00"
@.str..4 = private unnamed_addr constant [3 x i8] c"14\00"
define void @f() {
entry:
%s.1 = alloca ptr
%var0 = load ptr, ptr %s.1
%var1 = call ptr @string.copy(ptr @.str..0)
store ptr %var1, ptr %s.1
ret void

}
define void @__init() {
entry:
store ptr @.str..1, ptr @s
ret void

}
define i32 @main() {
entry:
call void @__init()
%var3 = load ptr, ptr @s
%var4 = call ptr @string.copy(ptr @.str..2)
store ptr %var4, ptr @s
%s.1 = alloca ptr
store ptr @.str..3, ptr %s.1
call void @print(ptr @.str..4)
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

