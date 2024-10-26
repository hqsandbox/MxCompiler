define void @__init() {
entry:
ret void

}
define i32 @main() {
entry:
call void @__init()
%var2 = icmp ne i32 0, 0
br i1 %var2, label %land.next..0, label %entry_and_land.end..0

land.next..0:
%var6 = sdiv i32 5, 0
%var7 = icmp ne i32 %var6, 1
br label %land.end..0

land.end..0:
%var3_land.end..0 = phi i1 [ %var2, %entry_and_land.end..0 ], [ %var7, %land.next..0 ]
br i1 %var3_land.end..0, label %if.then.0, label %if.else.0

if.then.0:
br label %if.back.0

if.else.0:
br label %if.back.0

if.back.0:
%c.1_if.back.0 = phi i32 [ 10, %if.then.0 ], [ 20, %if.else.0 ]
%var12 = icmp eq i32 %c.1_if.back.0, 10
br i1 %var12, label %land.next..1, label %if.back.0_and_land.end..1

land.next..1:
%var16 = sdiv i32 5, 0
%var17 = icmp eq i32 %var16, 0
br label %land.end..1

land.end..1:
%var13_land.end..1 = phi i1 [ %var17, %land.next..1 ], [ %var12, %if.back.0_and_land.end..1 ]
br i1 %var13_land.end..1, label %land.next..2, label %land.end..1_and_land.end..2

land.next..2:
%var21 = icmp eq i32 5, 5
br label %land.end..2

land.end..2:
%var19_land.end..2 = phi i1 [ %var13_land.end..1, %land.end..1_and_land.end..2 ], [ %var21, %land.next..2 ]
%var23 = xor i1 %var19_land.end..2, true
br i1 %var23, label %if.then.1, label %if.else.1

if.then.1:
br label %if.back.1

if.else.1:
br label %if.back.1

if.back.1:
%c.1_if.back.1 = phi i32 [ 30, %if.then.1 ], [ %c.1_if.back.0, %if.else.1 ]
ret i32 %c.1_if.back.1

entry_and_land.end..0:
br label %land.end..0

if.back.0_and_land.end..1:
br label %land.end..1

land.end..1_and_land.end..2:
br label %land.end..2

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

