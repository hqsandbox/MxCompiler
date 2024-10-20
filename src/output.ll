define void @__init() {
entry:
ret void

}
define i32 @main() {
entry:
call void @__init()
br label %for.cond.0

for.cond.0:
%i.1_for.cond.0 = phi i32 [ 1, %entry ], [ %var6, %for.step.0 ]
%f2.1_for.cond.0 = phi i32 [ 0, %entry ], [ 1, %for.step.0 ]
%var3 = icmp slt i32 %i.1_for.cond.0, 2
br i1 %var3, label %for.body.0, label %for.back.0

for.body.0:
br label %for.step.0

for.step.0:
%var6 = add i32 %i.1_for.cond.0, 1
br label %for.cond.0

for.back.0:
ret i32 %f2.1_for.cond.0

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

