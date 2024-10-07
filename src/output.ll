@pre = global ptr null
@c = global ptr null
@f = global ptr null
@ans = global i32 0
@i = global i32 0
@closed = global i32 0
@j = global i32 0
@visit = global ptr null
@open = global i32 0
define i32 @build(i32 %start, i32 %ending) {
entry:
store i32 1, ptr @i
br label %for.cond.2

for.cond.2:
%var32 = load i32, ptr @i
%var33 = icmp sle i32 %var32, 49
br i1 %var33, label %for.body.2, label %for.back.2

for.body.2:
store i32 50, ptr @j
br label %for.cond.3

for.cond.3:
%var35 = load i32, ptr @j
%var36 = load i32, ptr @i
%var37 = sub i32 98, %var36
%var38 = add i32 %var37, 1
%var39 = icmp sle i32 %var35, %var38
br i1 %var39, label %for.body.3, label %for.back.3

for.body.3:
%var40 = load ptr, ptr @c
%var41 = load i32, ptr @i
%var42 = getelementptr ptr, ptr %var40, i32 %var41
%var43 = load ptr, ptr %var42
%var44 = load i32, ptr @j
%var45 = getelementptr i32, ptr %var43, i32 %var44
store i32 1, ptr %var45
br label %for.step.3

for.step.3:
%var47 = load i32, ptr @j
%var48 = add i32 %var47, 1
store i32 %var48, ptr @j
br label %for.cond.3

for.back.3:
br label %for.step.2

for.step.2:
%var49 = load i32, ptr @i
%var50 = add i32 %var49, 1
store i32 %var50, ptr @i
br label %for.cond.2

for.back.2:
store i32 1, ptr @i
br label %for.cond.4

for.cond.4:
%var52 = load i32, ptr @i
%var53 = icmp sle i32 %var52, 49
br i1 %var53, label %for.body.4, label %for.back.4

for.body.4:
%var54 = load ptr, ptr @c
%var56 = getelementptr ptr, ptr %var54, i32 %start
%var57 = load ptr, ptr %var56
%var58 = load i32, ptr @i
%var59 = getelementptr i32, ptr %var57, i32 %var58
store i32 1, ptr %var59
br label %for.step.4

for.step.4:
%var61 = load i32, ptr @i
%var62 = add i32 %var61, 1
store i32 %var62, ptr @i
br label %for.cond.4

for.back.4:
store i32 50, ptr @i
br label %for.cond.5

for.cond.5:
%var64 = load i32, ptr @i
%var65 = icmp sle i32 %var64, 98
br i1 %var65, label %for.body.5, label %for.back.5

for.body.5:
%var66 = load ptr, ptr @c
%var67 = load i32, ptr @i
%var68 = getelementptr ptr, ptr %var66, i32 %var67
%var69 = load ptr, ptr %var68
%var71 = getelementptr i32, ptr %var69, i32 %ending
store i32 1, ptr %var71
br label %for.step.5

for.step.5:
%var73 = load i32, ptr @i
%var74 = add i32 %var73, 1
store i32 %var74, ptr @i
br label %for.cond.5

for.back.5:
ret i32 0

}
define i32 @find(i32 %ending, i32 %start, i32 %flag) {
entry:
store i32 0, ptr @open
store i32 1, ptr @closed
store i32 1, ptr @i
br label %for.cond.6

for.cond.6:
%var78 = load i32, ptr @i
%var80 = icmp sle i32 %var78, %ending
br i1 %var80, label %for.body.6, label %for.back.6

for.body.6:
%var81 = load ptr, ptr @visit
%var82 = load i32, ptr @i
%var83 = getelementptr i32, ptr %var81, i32 %var82
store i32 0, ptr %var83
br label %for.step.6

for.step.6:
%var85 = load i32, ptr @i
%var86 = add i32 %var85, 1
store i32 %var86, ptr @i
br label %for.cond.6

for.back.6:
%var87 = load ptr, ptr @f
%var88 = getelementptr i32, ptr %var87, i32 1
store i32 %start, ptr %var88
%var91 = load ptr, ptr @visit
%var93 = getelementptr i32, ptr %var91, i32 %start
store i32 1, ptr %var93
%var95 = load ptr, ptr @pre
%var97 = getelementptr i32, ptr %var95, i32 %start
store i32 0, ptr %var97
%var100 = load i32, ptr @open
%var101 = load i32, ptr @closed
%var102 = icmp slt i32 %var100, %var101
br i1 %var102, label %land.next..0, label %land.end..0

land.next..0:
br label %land.end..0

land.end..0:
%var103_land.end..0 = phi i1 [ %var102, %for.back.6 ], [ %var105, %land.next..0 ]
br label %while.cond.0

while.cond.0:
%flag.1_while.cond.0 = phi i32 [ 0, %land.end..0 ], [ %flag.1_for.cond.7, %for.back.7 ]
%var133_while.cond.0 = phi i1 [ 0, %land.end..0 ], [ %var133_for.cond.7, %for.back.7 ]
%var110_while.cond.0 = phi i1 [ 0, %land.end..0 ], [ %var110_land.end..1, %for.back.7 ]
%var107 = load i32, ptr @open
%var108 = load i32, ptr @closed
%var109 = icmp slt i32 %var107, %var108
br i1 %var109, label %land.next..1, label %land.end..1

land.next..1:
%var112 = icmp eq i32 %flag.1_while.cond.0, 0
br label %land.end..1

land.end..1:
%var110_land.end..1 = phi i1 [ %var109, %while.cond.0 ], [ %var112, %land.next..1 ]
br i1 %var110_land.end..1, label %while.body.0, label %while.back.0

while.body.0:
%var114 = load i32, ptr @open
%var115 = add i32 %var114, 1
store i32 %var115, ptr @open
%var117 = load ptr, ptr @f
%var118 = load i32, ptr @open
%var119 = getelementptr i32, ptr %var117, i32 %var118
%var120 = load i32, ptr %var119
store i32 %var120, ptr @i
store i32 1, ptr @j
br label %for.cond.7

for.cond.7:
%flag.1_for.cond.7 = phi i32 [ %flag.1_while.cond.0, %while.body.0 ], [ %flag.1_if.back.0, %for.step.7 ]
%var133_for.cond.7 = phi i1 [ %var133_while.cond.0, %while.body.0 ], [ %var133_land.end..2, %for.step.7 ]
%var122 = load i32, ptr @j
%var124 = icmp sle i32 %var122, %ending
br i1 %var124, label %for.body.7, label %for.back.7

for.body.7:
%var125 = load ptr, ptr @c
%var126 = load i32, ptr @i
%var127 = getelementptr ptr, ptr %var125, i32 %var126
%var128 = load ptr, ptr %var127
%var129 = load i32, ptr @j
%var130 = getelementptr i32, ptr %var128, i32 %var129
%var131 = load i32, ptr %var130
%var132 = icmp sgt i32 %var131, 0
br i1 %var132, label %land.next..2, label %land.end..2

land.next..2:
%var134 = load ptr, ptr @visit
%var135 = load i32, ptr @j
%var136 = getelementptr i32, ptr %var134, i32 %var135
%var137 = load i32, ptr %var136
%var138 = icmp eq i32 %var137, 0
br label %land.end..2

land.end..2:
%var133_land.end..2 = phi i1 [ %var138, %land.next..2 ], [ %var132, %for.body.7 ]
br i1 %var133_land.end..2, label %if.then.0, label %if.else.0

if.then.0:
%var140 = load ptr, ptr @visit
%var141 = load i32, ptr @j
%var142 = getelementptr i32, ptr %var140, i32 %var141
store i32 1, ptr %var142
%var144 = load i32, ptr @closed
%var145 = add i32 %var144, 1
store i32 %var145, ptr @closed
%var146 = load ptr, ptr @f
%var147 = load i32, ptr @closed
%var148 = getelementptr i32, ptr %var146, i32 %var147
%var150 = load i32, ptr @j
store i32 %var150, ptr %var148
%var151 = load ptr, ptr @pre
%var152 = load i32, ptr @j
%var153 = getelementptr i32, ptr %var151, i32 %var152
%var155 = load i32, ptr @i
store i32 %var155, ptr %var153
%var156 = load i32, ptr @closed
%var158 = icmp eq i32 %var156, %ending
br i1 %var158, label %if.then.1, label %if.else.1

if.then.1:
br label %if.back.1

if.else.1:
br label %if.back.1

if.back.1:
%flag.1_if.back.1 = phi i32 [ 1, %if.then.1 ], [ %flag.1_for.cond.7, %if.else.1 ]
br label %if.back.0

if.else.0:
br label %if.back.0

if.back.0:
%flag.1_if.back.0 = phi i32 [ %flag.1_if.back.1, %if.back.1 ], [ %flag.1_for.cond.7, %if.else.0 ]
br label %for.step.7

for.step.7:
%var160 = load i32, ptr @j
%var161 = add i32 %var160, 1
store i32 %var161, ptr @j
br label %for.cond.7

for.back.7:
br label %while.cond.0

while.back.0:
ret i32 %flag.1_while.cond.0

}
define i32 @improve(i32 %ending) {
entry:
store i32 %ending, ptr @i
%var165 = load i32, ptr @ans
%var166 = add i32 %var165, 1
store i32 %var166, ptr @ans
br label %while.cond.1

while.cond.1:
%var172 = load ptr, ptr @pre
%var173 = load i32, ptr @i
%var174 = getelementptr i32, ptr %var172, i32 %var173
%var175 = load i32, ptr %var174
%var176 = icmp sgt i32 %var175, 0
br i1 %var176, label %while.body.1, label %while.back.1

while.body.1:
%var178 = load ptr, ptr @pre
%var179 = load i32, ptr @i
%var180 = getelementptr i32, ptr %var178, i32 %var179
%var181 = load i32, ptr %var180
store i32 %var181, ptr @j
%var182 = load ptr, ptr @c
%var183 = load i32, ptr @j
%var184 = getelementptr ptr, ptr %var182, i32 %var183
%var185 = load ptr, ptr %var184
%var186 = load i32, ptr @i
%var187 = getelementptr i32, ptr %var185, i32 %var186
%var188 = load i32, ptr %var187
%var189 = sub i32 %var188, 1
store i32 %var189, ptr %var187
%var190 = load ptr, ptr @c
%var191 = load i32, ptr @i
%var192 = getelementptr ptr, ptr %var190, i32 %var191
%var193 = load ptr, ptr %var192
%var194 = load i32, ptr @j
%var195 = getelementptr i32, ptr %var193, i32 %var194
%var196 = load i32, ptr %var195
%var197 = add i32 %var196, 1
store i32 %var197, ptr %var195
%var199 = load i32, ptr @j
store i32 %var199, ptr @i
br label %while.cond.1

while.back.1:
ret i32 0

}
define void @origin(i32 %N) {
entry:
%var4 = call ptr @__array.alloca(i32 4, i32 2, i32 1, i32 %N)
store ptr %var4, ptr @c
store i32 0, ptr @i
br label %for.cond.0

for.cond.0:
%var7 = load i32, ptr @i
%var9 = icmp slt i32 %var7, %N
br i1 %var9, label %for.body.0, label %for.back.0

for.body.0:
%var10 = load ptr, ptr @c
%var11 = load i32, ptr @i
%var12 = getelementptr ptr, ptr %var10, i32 %var11
%var14 = call ptr @__array.alloca(i32 4, i32 1, i32 1, i32 %N)
store ptr %var14, ptr %var12
store i32 0, ptr @j
br label %for.cond.1

for.cond.1:
%var17 = load i32, ptr @j
%var19 = icmp slt i32 %var17, %N
br i1 %var19, label %for.body.1, label %for.back.1

for.body.1:
%var20 = load ptr, ptr @c
%var21 = load i32, ptr @i
%var22 = getelementptr ptr, ptr %var20, i32 %var21
%var23 = load ptr, ptr %var22
%var24 = load i32, ptr @j
%var25 = getelementptr i32, ptr %var23, i32 %var24
store i32 0, ptr %var25
br label %for.step.1

for.step.1:
%var27 = load i32, ptr @j
%var28 = add i32 %var27, 1
store i32 %var28, ptr @j
br label %for.cond.1

for.back.1:
br label %for.step.0

for.step.0:
%var29 = load i32, ptr @i
%var30 = add i32 %var29, 1
store i32 %var30, ptr @i
br label %for.cond.0

for.back.0:
ret void

}
define void @__init() {
entry:
%var0 = call ptr @__array.alloca(i32 4, i32 1, i32 1, i32 110)
store ptr %var0, ptr @visit
%var1 = call ptr @__array.alloca(i32 4, i32 1, i32 1, i32 110)
store ptr %var1, ptr @pre
%var2 = call ptr @__array.alloca(i32 4, i32 1, i32 1, i32 110)
store ptr %var2, ptr @f
ret void

}
define i32 @main() {
entry:
call void @__init()
call void @origin(i32 110)
call void @build(i32 99, i32 100)
call void @find(i32 100, i32 99, i32 0)
br label %while.cond.2

while.cond.2:
%var214 = call i32 @find(i32 100, i32 99, i32 0)
%var218 = icmp sgt i32 %var214, 0
br i1 %var218, label %while.body.2, label %while.back.2

while.body.2:
call void @improve(i32 100)
br label %while.cond.2

while.back.2:
%var223 = load i32, ptr @ans
%var222 = call ptr @toString(i32 %var223)
call void @println(ptr %var222)
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

