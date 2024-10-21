@.str..0 = private unnamed_addr constant [13 x i8] c"789dcbadcba\0A\00"
@x = global i32 1
%class..C = type {  }
define i1 @b(i1 %x) {
entry:
ret i1 %x

}
define void @__init() {
entry:
ret void

}
define void @C..x(ptr %_this) {
entry:
ret void

}
define i32 @main() {
entry:
call void @__init()
call void @C..x(ptr fuck)
call void @b(i1 true)
%var8 = call i32 @string.parseInt(ptr @.str..0)
ret i32 %var8

}
define void @C..C(ptr %_this) {
entry:
call void @C..x(ptr %_this)
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

