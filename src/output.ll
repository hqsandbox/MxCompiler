@.str..0 = private unnamed_addr constant [3 x i8] c": \00"
@seed = global i32 0
@MAX = global i32 128
@MaxRandInt = global i32 0
@root = global ptr null
%class..Node = type { i32, i32, i32, i32 }
define ptr @findLargest(ptr %cur) {
entry:
%var77 = getelementptr %class..Node, ptr %cur, i32 0, i32 1
%var78 = load ptr, ptr %var77
%var79 = getelementptr ptr, ptr %var78, i32 1
%var80 = load ptr, ptr %var79
%var81 = icmp eq ptr %var80, null
br i1 %var81, label %if.then.4, label %if.else.4

if.then.4:
ret ptr %cur

if.else.4:
br label %if.back.4

if.back.4:
%var85 = getelementptr %class..Node, ptr %cur, i32 0, i32 1
%var86 = load ptr, ptr %var85
%var87 = getelementptr ptr, ptr %var86, i32 1
%var88 = load ptr, ptr %var87
%var83 = call ptr @findLargest(ptr %var88)
ret ptr %var83

}
define i32 @erase(i32 %key) {
entry:
%var287 = load ptr, ptr @root
%var288 = icmp eq ptr %var287, null
br i1 %var288, label %if.then.19, label %if.else.19

if.then.19:
ret i32 0

if.else.19:
br label %if.back.19

if.back.19:
%var290 = load ptr, ptr @root
%var291 = sub i32 0, 1
%var289 = call i32 @eraseImpl(ptr %var290, ptr null, i32 %var291, i32 %key)
ret i32 %var289

}
define ptr @constructNode(i32 %key, ptr %pnt, ptr %lchild, ptr %rchild) {
entry:
%var0 = call ptr @_malloc(i32 16)
%var2 = getelementptr %class..Node, ptr %var0, i32 0, i32 1
%var4 = call ptr @__array.alloca(i32 4, i32 1, i32 1, i32 2)
store ptr %var4, ptr %var2
%var6 = getelementptr %class..Node, ptr %var0, i32 0, i32 2
store i32 %key, ptr %var6
%var10 = getelementptr %class..Node, ptr %var0, i32 0, i32 3
store i32 1, ptr %var10
%var13 = getelementptr %class..Node, ptr %var0, i32 0, i32 0
store ptr %pnt, ptr %var13
%var17 = getelementptr %class..Node, ptr %var0, i32 0, i32 1
%var18 = load ptr, ptr %var17
%var19 = getelementptr ptr, ptr %var18, i32 0
store ptr %lchild, ptr %var19
%var23 = getelementptr %class..Node, ptr %var0, i32 0, i32 1
%var24 = load ptr, ptr %var23
%var25 = getelementptr ptr, ptr %var24, i32 1
store ptr %rchild, ptr %var25
ret ptr %var0

}
define i32 @randOp(i32 %n) {
entry:
%var349 = call i32 @randInt31()
%var351 = icmp slt i32 %var349, %n
br i1 %var351, label %if.then.21, label %if.else.21

if.then.21:
ret i32 1

if.else.21:
br label %if.back.21

if.back.21:
ret i32 2

}
define i32 @eraseImpl(ptr %cur, ptr %pnt, i32 %childId, i32 %key) {
entry:
%var90 = icmp eq ptr %cur, null
br i1 %var90, label %if.then.5, label %if.else.5

if.then.5:
ret i32 0

if.else.5:
br label %if.back.5

if.back.5:
%var92 = getelementptr %class..Node, ptr %cur, i32 0, i32 2
%var93 = load i32, ptr %var92
%var95 = icmp sgt i32 %var93, %key
br i1 %var95, label %if.then.6, label %if.else.6

if.then.6:
%var98 = getelementptr %class..Node, ptr %cur, i32 0, i32 1
%var99 = load ptr, ptr %var98
%var100 = getelementptr ptr, ptr %var99, i32 0
%var101 = load ptr, ptr %var100
%var96 = call i32 @eraseImpl(ptr %var101, ptr %cur, i32 0, i32 %key)
ret i32 %var96

if.else.6:
br label %if.back.6

if.back.6:
%var105 = getelementptr %class..Node, ptr %cur, i32 0, i32 2
%var106 = load i32, ptr %var105
%var108 = icmp slt i32 %var106, %key
br i1 %var108, label %if.then.7, label %if.else.7

if.then.7:
%var111 = getelementptr %class..Node, ptr %cur, i32 0, i32 1
%var112 = load ptr, ptr %var111
%var113 = getelementptr ptr, ptr %var112, i32 1
%var114 = load ptr, ptr %var113
%var109 = call i32 @eraseImpl(ptr %var114, ptr %cur, i32 1, i32 %key)
ret i32 %var109

if.else.7:
br label %if.back.7

if.back.7:
%var118 = getelementptr %class..Node, ptr %cur, i32 0, i32 3
%var119 = load i32, ptr %var118
%var120 = sub i32 %var119, 1
store i32 %var120, ptr %var118
%var122 = getelementptr %class..Node, ptr %cur, i32 0, i32 3
%var123 = load i32, ptr %var122
%var124 = icmp sgt i32 %var123, 0
br i1 %var124, label %if.then.8, label %if.else.8

if.then.8:
ret i32 1

if.else.8:
br label %if.back.8

if.back.8:
%var126 = getelementptr %class..Node, ptr %cur, i32 0, i32 1
%var127 = load ptr, ptr %var126
%var128 = getelementptr ptr, ptr %var127, i32 0
%var129 = load ptr, ptr %var128
%var130 = icmp eq ptr %var129, null
br i1 %var130, label %if.then.9, label %if.else.9

if.then.9:
%var132 = icmp ne ptr %pnt, null
br i1 %var132, label %if.then.10, label %if.else.10

if.then.10:
%var134 = getelementptr %class..Node, ptr %pnt, i32 0, i32 1
%var135 = load ptr, ptr %var134
%var137 = getelementptr ptr, ptr %var135, i32 %childId
%var140 = getelementptr %class..Node, ptr %cur, i32 0, i32 1
%var141 = load ptr, ptr %var140
%var142 = getelementptr ptr, ptr %var141, i32 1
%var143 = load ptr, ptr %var142
store ptr %var143, ptr %var137
br label %if.back.10

if.else.10:
br label %if.back.10

if.back.10:
%var145 = getelementptr %class..Node, ptr %cur, i32 0, i32 1
%var146 = load ptr, ptr %var145
%var147 = getelementptr ptr, ptr %var146, i32 1
%var148 = load ptr, ptr %var147
%var149 = icmp ne ptr %var148, null
br i1 %var149, label %if.then.11, label %if.else.11

if.then.11:
%var151 = getelementptr %class..Node, ptr %cur, i32 0, i32 1
%var152 = load ptr, ptr %var151
%var153 = getelementptr ptr, ptr %var152, i32 1
%var154 = load ptr, ptr %var153
%var155 = getelementptr %class..Node, ptr %var154, i32 0, i32 0
store ptr %pnt, ptr %var155
br label %if.back.11

if.else.11:
br label %if.back.11

if.back.11:
%var159 = load ptr, ptr @root
%var160 = getelementptr %class..Node, ptr %var159, i32 0, i32 2
%var161 = load i32, ptr %var160
%var162 = icmp eq i32 %key, %var161
br i1 %var162, label %if.then.12, label %if.else.12

if.then.12:
%var165 = getelementptr %class..Node, ptr %cur, i32 0, i32 1
%var166 = load ptr, ptr %var165
%var167 = getelementptr ptr, ptr %var166, i32 1
%var168 = load ptr, ptr %var167
store ptr %var168, ptr @root
br label %if.back.12

if.else.12:
br label %if.back.12

if.back.12:
ret i32 1

if.else.9:
br label %if.back.9

if.back.9:
%var171 = getelementptr %class..Node, ptr %cur, i32 0, i32 1
%var172 = load ptr, ptr %var171
%var173 = getelementptr ptr, ptr %var172, i32 0
%var174 = load ptr, ptr %var173
%var169 = call ptr @findLargest(ptr %var174)
%var176 = load ptr, ptr @root
%var177 = getelementptr %class..Node, ptr %var176, i32 0, i32 2
%var178 = load i32, ptr %var177
%var179 = icmp eq i32 %key, %var178
br i1 %var179, label %if.then.13, label %if.else.13

if.then.13:
store ptr %var169, ptr @root
br label %if.back.13

if.else.13:
br label %if.back.13

if.back.13:
%var183 = getelementptr %class..Node, ptr %var169, i32 0, i32 2
%var184 = load i32, ptr %var183
%var186 = getelementptr %class..Node, ptr %cur, i32 0, i32 1
%var187 = load ptr, ptr %var186
%var188 = getelementptr ptr, ptr %var187, i32 0
%var189 = load ptr, ptr %var188
%var190 = getelementptr %class..Node, ptr %var189, i32 0, i32 2
%var191 = load i32, ptr %var190
%var192 = icmp ne i32 %var184, %var191
br i1 %var192, label %if.then.14, label %if.else.14

if.then.14:
%var194 = getelementptr %class..Node, ptr %var169, i32 0, i32 0
%var195 = load ptr, ptr %var194
%var196 = getelementptr %class..Node, ptr %var195, i32 0, i32 1
%var197 = load ptr, ptr %var196
%var198 = getelementptr ptr, ptr %var197, i32 1
%var201 = getelementptr %class..Node, ptr %var169, i32 0, i32 1
%var202 = load ptr, ptr %var201
%var203 = getelementptr ptr, ptr %var202, i32 0
%var204 = load ptr, ptr %var203
store ptr %var204, ptr %var198
%var206 = getelementptr %class..Node, ptr %var169, i32 0, i32 1
%var207 = load ptr, ptr %var206
%var208 = getelementptr ptr, ptr %var207, i32 0
%var209 = load ptr, ptr %var208
%var210 = icmp ne ptr %var209, null
br i1 %var210, label %if.then.15, label %if.else.15

if.then.15:
%var212 = getelementptr %class..Node, ptr %var169, i32 0, i32 1
%var213 = load ptr, ptr %var212
%var214 = getelementptr ptr, ptr %var213, i32 0
%var215 = load ptr, ptr %var214
%var216 = getelementptr %class..Node, ptr %var215, i32 0, i32 0
%var219 = getelementptr %class..Node, ptr %var169, i32 0, i32 0
%var220 = load ptr, ptr %var219
store ptr %var220, ptr %var216
br label %if.back.15

if.else.15:
br label %if.back.15

if.back.15:
br label %if.back.14

if.else.14:
br label %if.back.14

if.back.14:
%var222 = icmp ne ptr %pnt, null
br i1 %var222, label %if.then.16, label %if.else.16

if.then.16:
%var224 = getelementptr %class..Node, ptr %pnt, i32 0, i32 1
%var225 = load ptr, ptr %var224
%var227 = getelementptr ptr, ptr %var225, i32 %childId
store ptr %var169, ptr %var227
br label %if.back.16

if.else.16:
br label %if.back.16

if.back.16:
%var231 = getelementptr %class..Node, ptr %var169, i32 0, i32 0
store ptr %pnt, ptr %var231
%var235 = getelementptr %class..Node, ptr %var169, i32 0, i32 1
%var236 = load ptr, ptr %var235
%var237 = getelementptr ptr, ptr %var236, i32 1
%var240 = getelementptr %class..Node, ptr %cur, i32 0, i32 1
%var241 = load ptr, ptr %var240
%var242 = getelementptr ptr, ptr %var241, i32 1
%var243 = load ptr, ptr %var242
store ptr %var243, ptr %var237
%var245 = getelementptr %class..Node, ptr %cur, i32 0, i32 1
%var246 = load ptr, ptr %var245
%var247 = getelementptr ptr, ptr %var246, i32 1
%var248 = load ptr, ptr %var247
%var249 = icmp ne ptr %var248, null
br i1 %var249, label %if.then.17, label %if.else.17

if.then.17:
%var251 = getelementptr %class..Node, ptr %cur, i32 0, i32 1
%var252 = load ptr, ptr %var251
%var253 = getelementptr ptr, ptr %var252, i32 1
%var254 = load ptr, ptr %var253
%var255 = getelementptr %class..Node, ptr %var254, i32 0, i32 0
store ptr %var169, ptr %var255
br label %if.back.17

if.else.17:
br label %if.back.17

if.back.17:
%var259 = getelementptr %class..Node, ptr %var169, i32 0, i32 2
%var260 = load i32, ptr %var259
%var262 = getelementptr %class..Node, ptr %cur, i32 0, i32 1
%var263 = load ptr, ptr %var262
%var264 = getelementptr ptr, ptr %var263, i32 0
%var265 = load ptr, ptr %var264
%var266 = getelementptr %class..Node, ptr %var265, i32 0, i32 2
%var267 = load i32, ptr %var266
%var268 = icmp ne i32 %var260, %var267
br i1 %var268, label %if.then.18, label %if.else.18

if.then.18:
%var270 = getelementptr %class..Node, ptr %var169, i32 0, i32 1
%var271 = load ptr, ptr %var270
%var272 = getelementptr ptr, ptr %var271, i32 0
%var275 = getelementptr %class..Node, ptr %cur, i32 0, i32 1
%var276 = load ptr, ptr %var275
%var277 = getelementptr ptr, ptr %var276, i32 0
%var278 = load ptr, ptr %var277
store ptr %var278, ptr %var272
%var280 = getelementptr %class..Node, ptr %cur, i32 0, i32 1
%var281 = load ptr, ptr %var280
%var282 = getelementptr ptr, ptr %var281, i32 0
%var283 = load ptr, ptr %var282
%var284 = getelementptr %class..Node, ptr %var283, i32 0, i32 0
store ptr %var169, ptr %var284
br label %if.back.18

if.else.18:
br label %if.back.18

if.back.18:
ret i32 1

}
define void @__init() {
entry:
%var318 = shl i32 1, 31
%var319 = xor i32 %var318, -1
store i32 %var319, ptr @MaxRandInt
ret void

}
define i32 @insertImpl(ptr %cur, ptr %pnt, i32 %childId, i32 %key) {
entry:
%var30 = icmp eq ptr %cur, null
br i1 %var30, label %if.then.0, label %if.else.0

if.then.0:
%var32 = call ptr @constructNode(i32 %key, ptr %pnt, ptr null, ptr null)
%var36 = getelementptr %class..Node, ptr %pnt, i32 0, i32 1
%var37 = load ptr, ptr %var36
%var39 = getelementptr ptr, ptr %var37, i32 %childId
store ptr %var32, ptr %var39
ret i32 0

if.else.0:
br label %if.back.0

if.back.0:
%var43 = getelementptr %class..Node, ptr %cur, i32 0, i32 2
%var44 = load i32, ptr %var43
%var46 = icmp eq i32 %var44, %key
br i1 %var46, label %if.then.1, label %if.else.1

if.then.1:
%var48 = getelementptr %class..Node, ptr %cur, i32 0, i32 3
%var49 = load i32, ptr %var48
%var50 = add i32 %var49, 1
store i32 %var50, ptr %var48
ret i32 1

if.else.1:
br label %if.back.1

if.back.1:
%var52 = getelementptr %class..Node, ptr %cur, i32 0, i32 2
%var53 = load i32, ptr %var52
%var55 = icmp slt i32 %var53, %key
br i1 %var55, label %if.then.2, label %if.else.2

if.then.2:
br label %if.back.2

if.else.2:
br label %if.back.2

if.back.2:
%id.1_if.back.2 = phi i32 [ 1, %if.then.2 ], [ 0, %if.else.2 ]
%var59 = getelementptr %class..Node, ptr %cur, i32 0, i32 1
%var60 = load ptr, ptr %var59
%var62 = getelementptr ptr, ptr %var60, i32 %id.1_if.back.2
%var63 = load ptr, ptr %var62
%var57 = call i32 @insertImpl(ptr %var63, ptr %cur, i32 %id.1_if.back.2, i32 %key)
ret i32 %var57

}
define void @generateOperations(i32 %n, i32 %t) {
entry:
br label %for.cond.0

for.cond.0:
%i.1_for.cond.0 = phi i32 [ 0, %entry ], [ %var367, %for.step.0 ]
%var355 = icmp slt i32 %i.1_for.cond.0, %t
br i1 %var355, label %for.body.0, label %for.back.0

for.body.0:
%var356 = call i32 @randInt31()
%var357 = load i32, ptr @MAX
%var358 = srem i32 %var356, %var357
%var359 = call i32 @randOp(i32 %n)
%var361 = icmp eq i32 %var359, 1
br i1 %var361, label %if.then.22, label %if.else.22

if.then.22:
call void @insert(i32 %var358)
br label %if.back.22

if.else.22:
call void @erase(i32 %var358)
br label %if.back.22

if.back.22:
br label %for.step.0

for.step.0:
%var367 = add i32 %i.1_for.cond.0, 1
br label %for.cond.0

for.back.0:
ret void

}
define i32 @insert(i32 %key) {
entry:
%var67 = load ptr, ptr @root
%var68 = icmp ne ptr %var67, null
br i1 %var68, label %if.then.3, label %if.else.3

if.then.3:
%var70 = load ptr, ptr @root
%var71 = sub i32 0, 1
%var69 = call i32 @insertImpl(ptr %var70, ptr null, i32 %var71, i32 %key)
ret i32 %var69

if.else.3:
br label %if.back.3

if.back.3:
%var74 = call ptr @constructNode(i32 %key, ptr null, ptr null, ptr null)
store ptr %var74, ptr @root
ret i32 0

}
define i32 @main() {
entry:
call void @__init()
%var370 = call i32 @getInt()
store i32 %var370, ptr @seed
%var372 = load i32, ptr @MaxRandInt
%var373 = sdiv i32 %var372, 10
%var374 = mul i32 8, %var373
call void @generateOperations(i32 %var374, i32 50000)
%var377 = load i32, ptr @MaxRandInt
%var378 = sdiv i32 %var377, 10
%var379 = mul i32 2, %var378
%var381 = mul i32 2, 50000
call void @generateOperations(i32 %var379, i32 %var381)
%var383 = load i32, ptr @MaxRandInt
%var384 = sdiv i32 %var383, 10
%var385 = mul i32 4, %var384
call void @generateOperations(i32 %var385, i32 50000)
%var388 = load ptr, ptr @root
call void @printTree(ptr %var388)
ret i32 0

}
define i32 @randInt31() {
entry:
%var320 = load i32, ptr @seed
%var324 = shl i32 %var320, 13
%var325 = xor i32 %var320, %var324
%var328 = shl i32 1, 31
%var329 = xor i32 %var328, -1
%var330 = and i32 %var325, %var329
%var334 = ashr i32 %var330, 17
%var335 = xor i32 %var330, %var334
%var339 = shl i32 %var335, 5
%var340 = xor i32 %var335, %var339
%var343 = shl i32 1, 31
%var344 = xor i32 %var343, -1
%var345 = and i32 %var340, %var344
store i32 %var345, ptr @seed
ret i32 %var345

}
define void @printTree(ptr %cur) {
entry:
%var294 = icmp eq ptr %cur, null
br i1 %var294, label %if.then.20, label %if.else.20

if.then.20:
ret void

if.else.20:
br label %if.back.20

if.back.20:
%var297 = getelementptr %class..Node, ptr %cur, i32 0, i32 1
%var298 = load ptr, ptr %var297
%var299 = getelementptr ptr, ptr %var298, i32 0
%var300 = load ptr, ptr %var299
call void @printTree(ptr %var300)
%var304 = getelementptr %class..Node, ptr %cur, i32 0, i32 2
%var305 = load i32, ptr %var304
%var302 = call ptr @toString(i32 %var305)
%var306 = call ptr @string.add(ptr %var302, ptr @.str..0)
%var309 = getelementptr %class..Node, ptr %cur, i32 0, i32 3
%var310 = load i32, ptr %var309
%var307 = call ptr @toString(i32 %var310)
%var311 = call ptr @string.add(ptr %var306, ptr %var307)
call void @println(ptr %var311)
%var314 = getelementptr %class..Node, ptr %cur, i32 0, i32 1
%var315 = load ptr, ptr %var314
%var316 = getelementptr ptr, ptr %var315, i32 1
%var317 = load ptr, ptr %var316
call void @printTree(ptr %var317)
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

