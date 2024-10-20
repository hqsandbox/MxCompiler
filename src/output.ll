%class..C2 = type { i32, i32 }
define void @__init() {
entry:
ret void

}
define i32 @main() {
entry:
call void @__init()
%var1 = call ptr @_malloc(i32 8)
%var3 = getelementptr %class..C2, ptr %var1, i32 0, i32 0
store i32 10, ptr %var3
%var6 = getelementptr %class..C2, ptr %var1, i32 0, i32 1
store i32 20, ptr %var6
%var9 = getelementptr %class..C2, ptr %var1, i32 0, i32 0
%var10 = load i32, ptr %var9
%var12 = getelementptr %class..C2, ptr %var1, i32 0, i32 1
%var13 = load i32, ptr %var12
%var14 = add i32 %var10, %var13
ret i32 %var14

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

