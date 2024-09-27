@.str..1 = private unnamed_addr constant [3 x i8] c"NO\00"
@.str..0 = private unnamed_addr constant [4 x i8] c"YES\00"
@n = global i32 0
define void @__init() {
entry:
ret void

}
define i32 @main() {
entry:
call void @__init()
%var1 = load i32, ptr @n
store i32 47, ptr @n
%var2 = load i32, ptr @n
%var3 = srem i32 %var2, 7
%var4 = icmp eq i32 %var3, 0
br i1 %var4, label %land.end..0, label %land.next..0

land.next..0:
%var5_land.next..0 = phi i1 [ %var4, %entry ]
%var6 = load i32, ptr @n
%var7 = srem i32 %var6, 47
%var8 = icmp eq i32 %var7, 0
br label %land.end..0

land.end..0:
br i1 %var4, label %if.then.0, label %if.else.0

if.then.0:
call void @print(ptr @.str..0)
br label %if.back.0

if.else.0:
call void @print(ptr @.str..1)
br label %if.back.0

if.back.0:
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

