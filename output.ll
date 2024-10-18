define void @__init() {
entry:
ret void

}
define i32 @gcd(i32 %x, i32 %y, i32 %j0, i32 %j1, i32 %j2, i32 %j3, i32 %j4, i32 %j5, i32 %j6, i32 %j7, i32 %j8, i32 %j9, i32 %j10, i32 %j11, i32 %j12, i32 %j13, i32 %j14, i32 %j15, i32 %j16, i32 %j17, i32 %j18, i32 %j19, i32 %j20, i32 %j21, i32 %j22, i32 %j23, i32 %j24, i32 %j25, i32 %j26, i32 %j27, i32 %j28, i32 %j29) {
entry:
br label %for.cond.0

for.cond.0:
%i.1_for.cond.0 = phi i32 [ 0, %entry ], [ %var65, %for.step.0 ]
%j.1_for.cond.0 = phi i32 [ 0, %entry ], [ %var63, %for.step.0 ]
%var2 = icmp sle i32 %i.1_for.cond.0, 10
br i1 %var2, label %for.body.0, label %for.back.0

for.body.0:
%var6 = add i32 %j0, %j1
%var8 = add i32 %var6, %j2
%var10 = add i32 %var8, %j3
%var12 = add i32 %var10, %j4
%var14 = add i32 %var12, %j5
%var16 = add i32 %var14, %j6
%var18 = add i32 %var16, %j7
%var20 = add i32 %var18, %j8
%var22 = add i32 %var20, %j9
%var24 = add i32 %var22, %j10
%var26 = add i32 %var24, %j11
%var28 = add i32 %var26, %j12
%var30 = add i32 %var28, %j13
%var32 = add i32 %var30, %j14
%var34 = add i32 %var32, %j15
%var36 = add i32 %var34, %j16
%var38 = add i32 %var36, %j17
%var40 = add i32 %var38, %j18
%var42 = add i32 %var40, %j19
%var44 = add i32 %var42, %j20
%var46 = add i32 %var44, %j21
%var48 = add i32 %var46, %j22
%var50 = add i32 %var48, %j23
%var52 = add i32 %var50, %j24
%var54 = add i32 %var52, %j25
%var56 = add i32 %var54, %j26
%var58 = add i32 %var56, %j27
%var60 = add i32 %var58, %j28
%var62 = add i32 %var60, %j29
%var63 = srem i32 %var62, 100
br label %for.step.0

for.step.0:
%var65 = add i32 %i.1_for.cond.0, 1
br label %for.cond.0

for.back.0:
%var68 = srem i32 %x, %y
%var69 = icmp eq i32 %var68, 0
br i1 %var69, label %if.then.0, label %if.else.0

if.then.0:
ret i32 %y

if.else.0:
%var75 = srem i32 %x, %y
%var77 = call i32 @gcd(i32 10, i32 68, i32 0, i32 2, i32 4, i32 6, i32 8, i32 10, i32 12, i32 14, i32 16, i32 18, i32 20, i32 22, i32 24, i32 26, i32 28, i32 30, i32 32, i32 34, i32 36, i32 38, i32 40, i32 42, i32 44, i32 46, i32 48, i32 50, i32 52, i32 54, i32 56, i32 58)
%var71 = call i32 @gcd1(i32 %y, i32 %var75, i32 %j.1_for.cond.0, i32 %var77, i32 %j2, i32 %j3, i32 %j4, i32 %j5, i32 %j6, i32 %j7, i32 %j8, i32 %j9, i32 %j10, i32 %j11, i32 %j12, i32 %j13, i32 %j14, i32 %j15, i32 %j16, i32 %j17, i32 %j18, i32 %j19, i32 %j20, i32 %j21, i32 %j22, i32 %j23, i32 %j24, i32 %j25, i32 %j26, i32 %j27, i32 %j28, i32 %j29)
ret i32 %var71

}
define i32 @gcd1(i32 %x, i32 %y, i32 %j0, i32 %j1, i32 %j2, i32 %j3, i32 %j4, i32 %j5, i32 %j6, i32 %j7, i32 %j8, i32 %j9, i32 %j10, i32 %j11, i32 %j12, i32 %j13, i32 %j14, i32 %j15, i32 %j16, i32 %j17, i32 %j18, i32 %j19, i32 %j20, i32 %j21, i32 %j22, i32 %j23, i32 %j24, i32 %j25, i32 %j26, i32 %j27, i32 %j28, i32 %j29) {
entry:
%var109 = add i32 %j0, %j1
%var111 = add i32 %var109, %j2
%var113 = add i32 %var111, %j3
%var115 = add i32 %var113, %j4
%var117 = add i32 %var115, %j5
%var119 = add i32 %var117, %j6
%var121 = add i32 %var119, %j7
%var123 = add i32 %var121, %j8
%var125 = add i32 %var123, %j9
%var127 = add i32 %var125, %j10
%var129 = add i32 %var127, %j11
%var131 = add i32 %var129, %j12
%var133 = add i32 %var131, %j13
%var135 = add i32 %var133, %j14
%var137 = add i32 %var135, %j15
%var139 = add i32 %var137, %j16
%var141 = add i32 %var139, %j17
%var143 = add i32 %var141, %j18
%var145 = add i32 %var143, %j19
%var147 = add i32 %var145, %j20
%var149 = add i32 %var147, %j21
%var151 = add i32 %var149, %j22
%var153 = add i32 %var151, %j23
%var155 = add i32 %var153, %j24
%var157 = add i32 %var155, %j25
%var159 = add i32 %var157, %j26
%var161 = add i32 %var159, %j27
%var163 = add i32 %var161, %j28
%var165 = add i32 %var163, %j29
%var166 = srem i32 %var165, 100
%var169 = srem i32 %x, %y
%var170 = icmp eq i32 %var169, 0
br i1 %var170, label %if.then.1, label %if.else.1

if.then.1:
ret i32 %y

if.else.1:
%var176 = srem i32 %x, %y
%var172 = call i32 @gcd2(i32 %y, i32 %var176, i32 %var166, i32 %j1, i32 %j2, i32 %j3, i32 %j4, i32 %j5, i32 %j6, i32 %j7, i32 %j8, i32 %j9, i32 %j10, i32 %j11, i32 %j12, i32 %j13, i32 %j14, i32 %j15, i32 %j16, i32 %j17, i32 %j18, i32 %j19, i32 %j20, i32 %j21, i32 %j22, i32 %j23, i32 %j24, i32 %j25, i32 %j26, i32 %j27, i32 %j28, i32 %j29)
ret i32 %var172

}
define i32 @gcd2(i32 %x, i32 %y, i32 %j0, i32 %j1, i32 %j2, i32 %j3, i32 %j4, i32 %j5, i32 %j6, i32 %j7, i32 %j8, i32 %j9, i32 %j10, i32 %j11, i32 %j12, i32 %j13, i32 %j14, i32 %j15, i32 %j16, i32 %j17, i32 %j18, i32 %j19, i32 %j20, i32 %j21, i32 %j22, i32 %j23, i32 %j24, i32 %j25, i32 %j26, i32 %j27, i32 %j28, i32 %j29) {
entry:
%var270 = srem i32 %x, %y
%var271 = icmp eq i32 %var270, 0
br i1 %var271, label %if.then.2, label %if.else.2

if.then.2:
ret i32 %y

if.else.2:
%var277 = srem i32 %x, %y
%var273 = call i32 @gcd(i32 %y, i32 %var277, i32 %j0, i32 %j1, i32 %j2, i32 %j3, i32 %j4, i32 %j5, i32 %j6, i32 %j7, i32 %j8, i32 %j9, i32 %j10, i32 %j11, i32 %j12, i32 %j13, i32 %j14, i32 %j15, i32 %j16, i32 %j17, i32 %j18, i32 %j19, i32 %j20, i32 %j21, i32 %j22, i32 %j23, i32 %j24, i32 %j25, i32 %j26, i32 %j27, i32 %j28, i32 %j29)
ret i32 %var273

}
define i32 @main() {
entry:
call void @__init()
%var311 = call i32 @gcd(i32 10, i32 1, i32 0, i32 2, i32 4, i32 6, i32 8, i32 10, i32 12, i32 14, i32 16, i32 18, i32 20, i32 22, i32 24, i32 26, i32 28, i32 30, i32 32, i32 34, i32 36, i32 38, i32 40, i32 42, i32 44, i32 46, i32 48, i32 50, i32 52, i32 54, i32 56, i32 58)
%var312 = add i32 %var311, 1024
%var310 = call ptr @toString(i32 %var312)
call void @println(ptr %var310)
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

