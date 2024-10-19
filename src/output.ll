define void @__init() {
entry:
ret void

}
define i32 @gcd(i32 %x, i32 %y) {
entry:
%var2 = srem i32 %x, %y
%var3 = icmp eq i32 %var2, 0
br i1 %var3, label %if.then.0, label %if.else.0

if.then.0:
ret i32 %y

if.else.0:
%var9 = srem i32 %x, %y
%var5 = call i32 @gcd5(i32 %y, i32 %var9)
ret i32 %var5

}
define i32 @gcd1(i32 %x, i32 %y) {
entry:
%var12 = srem i32 %x, %y
%var13 = icmp eq i32 %var12, 0
br i1 %var13, label %if.then.1, label %if.else.1

if.then.1:
ret i32 %y

if.else.1:
%var19 = srem i32 %x, %y
%var15 = call i32 @gcd(i32 %y, i32 %var19)
ret i32 %var15

}
define i32 @gcd2(i32 %x, i32 %y) {
entry:
%var22 = srem i32 %x, %y
%var23 = icmp eq i32 %var22, 0
br i1 %var23, label %if.then.2, label %if.else.2

if.then.2:
ret i32 %y

if.else.2:
%var29 = srem i32 %x, %y
%var25 = call i32 @gcd1(i32 %y, i32 %var29)
ret i32 %var25

}
define i32 @main() {
entry:
call void @__init()
%var63 = call i32 @gcd(i32 10, i32 1)
%var62 = call ptr @toString(i32 %var63)
call void @println(ptr %var62)
%var66 = call i32 @gcd(i32 34986, i32 3087)
%var65 = call ptr @toString(i32 %var66)
call void @println(ptr %var65)
%var69 = call i32 @gcd(i32 2907, i32 1539)
%var68 = call ptr @toString(i32 %var69)
call void @println(ptr %var68)
ret i32 0

}
define i32 @gcd3(i32 %x, i32 %y) {
entry:
%var32 = srem i32 %x, %y
%var33 = icmp eq i32 %var32, 0
br i1 %var33, label %if.then.3, label %if.else.3

if.then.3:
ret i32 %y

if.else.3:
%var39 = srem i32 %x, %y
%var35 = call i32 @gcd2(i32 %y, i32 %var39)
ret i32 %var35

}
define i32 @gcd4(i32 %x, i32 %y) {
entry:
%var42 = srem i32 %x, %y
%var43 = icmp eq i32 %var42, 0
br i1 %var43, label %if.then.4, label %if.else.4

if.then.4:
ret i32 %y

if.else.4:
%var49 = srem i32 %x, %y
%var45 = call i32 @gcd(i32 %y, i32 %var49)
ret i32 %var45

}
define i32 @gcd5(i32 %x, i32 %y) {
entry:
%var52 = srem i32 %x, %y
%var53 = icmp eq i32 %var52, 0
br i1 %var53, label %if.then.5, label %if.else.5

if.then.5:
ret i32 %y

if.else.5:
%var59 = srem i32 %x, %y
%var55 = call i32 @gcd2(i32 %y, i32 %var59)
ret i32 %var55

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

