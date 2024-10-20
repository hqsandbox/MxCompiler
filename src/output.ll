@.str..0 = private unnamed_addr constant [14 x i8] c"no solution!\0A\00"
define void @__init() {
entry:
ret void

}
define i32 @main() {
entry:
call void @__init()
%var9 = call i32 @getInt()
%var16 = sub i32 %var9, 1
%var19 = sub i32 %var9, 1
%var28 = mul i32 %var9, %var9
%var25 = call ptr @__array.alloca(i32 4, i32 1, i32 1, i32 %var28)
br label %for.cond.0

for.cond.0:
%i.1_for.cond.0 = phi i32 [ 0, %entry ], [ %var40, %for.step.0 ]
%var33 = mul i32 %var9, %var9
%var34 = icmp slt i32 %i.1_for.cond.0, %var33
br i1 %var34, label %for.body.0, label %for.back.0

for.body.0:
%var37 = getelementptr i32, ptr %var25, i32 %i.1_for.cond.0
store i32 0, ptr %var37
br label %for.step.0

for.step.0:
%var40 = add i32 %i.1_for.cond.0, 1
br label %for.cond.0

for.back.0:
%var45 = mul i32 %var9, %var9
%var42 = call ptr @__array.alloca(i32 4, i32 1, i32 1, i32 %var45)
br label %for.cond.1

for.cond.1:
%i.1_for.cond.1 = phi i32 [ 0, %for.back.0 ], [ %var57, %for.step.1 ]
%var50 = mul i32 %var9, %var9
%var51 = icmp slt i32 %i.1_for.cond.1, %var50
br i1 %var51, label %for.body.1, label %for.back.1

for.body.1:
%var54 = getelementptr i32, ptr %var42, i32 %i.1_for.cond.1
store i32 0, ptr %var54
br label %for.step.1

for.step.1:
%var57 = add i32 %i.1_for.cond.1, 1
br label %for.cond.1

for.back.1:
%var59 = call ptr @__array.alloca(i32 4, i32 2, i32 1, i32 %var9)
br label %for.cond.2

for.cond.2:
%i.1_for.cond.2 = phi i32 [ 0, %for.back.1 ], [ %var86, %for.step.2 ]
%var64 = icmp slt i32 %i.1_for.cond.2, %var9
br i1 %var64, label %for.body.2, label %for.back.2

for.body.2:
%var67 = getelementptr ptr, ptr %var59, i32 %i.1_for.cond.2
%var69 = call ptr @__array.alloca(i32 4, i32 1, i32 1, i32 %var9)
store ptr %var69, ptr %var67
br label %for.cond.3

for.cond.3:
%j.1_for.cond.3 = phi i32 [ 0, %for.body.2 ], [ %var84, %for.step.3 ]
%var74 = icmp slt i32 %j.1_for.cond.3, %var9
br i1 %var74, label %for.body.3, label %for.back.3

for.body.3:
%var77 = getelementptr ptr, ptr %var59, i32 %i.1_for.cond.2
%var78 = load ptr, ptr %var77
%var80 = getelementptr i32, ptr %var78, i32 %j.1_for.cond.3
%var82 = sub i32 0, 1
store i32 %var82, ptr %var80
br label %for.step.3

for.step.3:
%var84 = add i32 %j.1_for.cond.3, 1
br label %for.cond.3

for.back.3:
br label %for.step.2

for.step.2:
%var86 = add i32 %i.1_for.cond.2, 1
br label %for.cond.2

for.back.2:
%var88 = getelementptr i32, ptr %var25, i32 0
store i32 0, ptr %var88
%var92 = getelementptr i32, ptr %var42, i32 0
store i32 0, ptr %var92
%var97 = getelementptr ptr, ptr %var59, i32 0
%var98 = load ptr, ptr %var97
%var100 = getelementptr i32, ptr %var98, i32 0
store i32 0, ptr %var100
br label %while.cond.0

while.cond.0:
%var550_while.cond.0 = phi i1 [ 0, %for.back.2 ], [ %var550_if.back.12, %if.back.16 ]
%var612_while.cond.0 = phi i1 [ 0, %for.back.2 ], [ %var612_if.back.14, %if.back.16 ]
%var178_while.cond.0 = phi i1 [ 0, %for.back.2 ], [ %var178_if.back.0, %if.back.16 ]
%var240_while.cond.0 = phi i1 [ 0, %for.back.2 ], [ %var240_if.back.2, %if.back.16 ]
%var364_while.cond.0 = phi i1 [ 0, %for.back.2 ], [ %var364_if.back.6, %if.back.16 ]
%head.1_while.cond.0 = phi i32 [ 0, %for.back.2 ], [ %var622, %if.back.16 ]
%tail.1_while.cond.0 = phi i32 [ 0, %for.back.2 ], [ %tail.1_if.back.14, %if.back.16 ]
%ok.1_while.cond.0 = phi i32 [ 0, %for.back.2 ], [ %ok.1_if.back.14, %if.back.16 ]
%var426_while.cond.0 = phi i1 [ 0, %for.back.2 ], [ %var426_if.back.8, %if.back.16 ]
%var302_while.cond.0 = phi i1 [ 0, %for.back.2 ], [ %var302_if.back.4, %if.back.16 ]
%var488_while.cond.0 = phi i1 [ 0, %for.back.2 ], [ %var488_if.back.10, %if.back.16 ]
%var107 = icmp sle i32 %head.1_while.cond.0, %tail.1_while.cond.0
br i1 %var107, label %while.body.0, label %while.cond.0_and_while.back.0

while.body.0:
%var112 = getelementptr i32, ptr %var25, i32 %head.1_while.cond.0
%var113 = load i32, ptr %var112
%var114 = getelementptr ptr, ptr %var59, i32 %var113
%var115 = load ptr, ptr %var114
%var118 = getelementptr i32, ptr %var42, i32 %head.1_while.cond.0
%var119 = load i32, ptr %var118
%var120 = getelementptr i32, ptr %var115, i32 %var119
%var121 = load i32, ptr %var120
%var125 = getelementptr i32, ptr %var25, i32 %head.1_while.cond.0
%var126 = load i32, ptr %var125
%var127 = sub i32 %var126, 1
%var131 = getelementptr i32, ptr %var42, i32 %head.1_while.cond.0
%var132 = load i32, ptr %var131
%var133 = sub i32 %var132, 2
%var134 = call i1 @check(i32 %var127, i32 %var9)
br i1 %var134, label %land.next..1, label %while.body.0_and_land.end..1

land.next..1:
%var138 = call i1 @check(i32 %var133, i32 %var9)
br label %land.end..1

land.end..1:
%var137_land.end..1 = phi i1 [ %var138, %land.next..1 ], [ %var134, %while.body.0_and_land.end..1 ]
br i1 %var137_land.end..1, label %land.next..2, label %land.end..1_and_land.end..2

land.next..2:
%var145 = getelementptr ptr, ptr %var59, i32 %var127
%var146 = load ptr, ptr %var145
%var148 = getelementptr i32, ptr %var146, i32 %var133
%var149 = load i32, ptr %var148
%var150 = sub i32 0, 1
%var151 = icmp eq i32 %var149, %var150
br label %land.end..2

land.end..2:
%var142_land.end..2 = phi i1 [ %var137_land.end..1, %land.end..1_and_land.end..2 ], [ %var151, %land.next..2 ]
br i1 %var142_land.end..2, label %if.then.0, label %if.else.0

if.then.0:
%var155 = add i32 %tail.1_while.cond.0, 1
%var158 = getelementptr i32, ptr %var25, i32 %var155
store i32 %var127, ptr %var158
%var163 = getelementptr i32, ptr %var42, i32 %var155
store i32 %var133, ptr %var163
%var168 = getelementptr ptr, ptr %var59, i32 %var127
%var169 = load ptr, ptr %var168
%var171 = getelementptr i32, ptr %var169, i32 %var133
%var174 = add i32 %var121, 1
store i32 %var174, ptr %var171
%var177 = icmp eq i32 %var127, %var16
br i1 %var177, label %land.next..3, label %if.then.0_and_land.end..3

land.next..3:
%var181 = icmp eq i32 %var133, %var19
br label %land.end..3

land.end..3:
%var178_land.end..3 = phi i1 [ %var181, %land.next..3 ], [ %var177, %if.then.0_and_land.end..3 ]
br i1 %var178_land.end..3, label %if.then.1, label %if.else.1

if.then.1:
br label %if.back.1

if.else.1:
br label %if.back.1

if.back.1:
%ok.1_if.back.1 = phi i32 [ 1, %if.then.1 ], [ %ok.1_while.cond.0, %if.else.1 ]
br label %if.back.0

if.else.0:
br label %if.back.0

if.back.0:
%tail.1_if.back.0 = phi i32 [ %tail.1_while.cond.0, %if.else.0 ], [ %var155, %if.back.1 ]
%ok.1_if.back.0 = phi i32 [ %ok.1_while.cond.0, %if.else.0 ], [ %ok.1_if.back.1, %if.back.1 ]
%var178_if.back.0 = phi i1 [ %var178_while.cond.0, %if.else.0 ], [ %var178_land.end..3, %if.back.1 ]
%var187 = getelementptr i32, ptr %var25, i32 %head.1_while.cond.0
%var188 = load i32, ptr %var187
%var189 = sub i32 %var188, 1
%var193 = getelementptr i32, ptr %var42, i32 %head.1_while.cond.0
%var194 = load i32, ptr %var193
%var195 = add i32 %var194, 2
%var196 = call i1 @check(i32 %var189, i32 %var9)
br i1 %var196, label %land.next..4, label %if.back.0_and_land.end..4

land.next..4:
%var200 = call i1 @check(i32 %var195, i32 %var9)
br label %land.end..4

land.end..4:
%var199_land.end..4 = phi i1 [ %var196, %if.back.0_and_land.end..4 ], [ %var200, %land.next..4 ]
br i1 %var199_land.end..4, label %land.next..5, label %land.end..4_and_land.end..5

land.next..5:
%var207 = getelementptr ptr, ptr %var59, i32 %var189
%var208 = load ptr, ptr %var207
%var210 = getelementptr i32, ptr %var208, i32 %var195
%var211 = load i32, ptr %var210
%var212 = sub i32 0, 1
%var213 = icmp eq i32 %var211, %var212
br label %land.end..5

land.end..5:
%var204_land.end..5 = phi i1 [ %var213, %land.next..5 ], [ %var199_land.end..4, %land.end..4_and_land.end..5 ]
br i1 %var204_land.end..5, label %if.then.2, label %if.else.2

if.then.2:
%var217 = add i32 %tail.1_if.back.0, 1
%var220 = getelementptr i32, ptr %var25, i32 %var217
store i32 %var189, ptr %var220
%var225 = getelementptr i32, ptr %var42, i32 %var217
store i32 %var195, ptr %var225
%var230 = getelementptr ptr, ptr %var59, i32 %var189
%var231 = load ptr, ptr %var230
%var233 = getelementptr i32, ptr %var231, i32 %var195
%var236 = add i32 %var121, 1
store i32 %var236, ptr %var233
%var239 = icmp eq i32 %var189, %var16
br i1 %var239, label %land.next..6, label %if.then.2_and_land.end..6

land.next..6:
%var243 = icmp eq i32 %var195, %var19
br label %land.end..6

land.end..6:
%var240_land.end..6 = phi i1 [ %var243, %land.next..6 ], [ %var239, %if.then.2_and_land.end..6 ]
br i1 %var240_land.end..6, label %if.then.3, label %if.else.3

if.then.3:
br label %if.back.3

if.else.3:
br label %if.back.3

if.back.3:
%ok.1_if.back.3 = phi i32 [ 1, %if.then.3 ], [ %ok.1_if.back.0, %if.else.3 ]
br label %if.back.2

if.else.2:
br label %if.back.2

if.back.2:
%var240_if.back.2 = phi i1 [ %var240_land.end..6, %if.back.3 ], [ %var240_while.cond.0, %if.else.2 ]
%tail.1_if.back.2 = phi i32 [ %var217, %if.back.3 ], [ %tail.1_if.back.0, %if.else.2 ]
%ok.1_if.back.2 = phi i32 [ %ok.1_if.back.3, %if.back.3 ], [ %ok.1_if.back.0, %if.else.2 ]
%var249 = getelementptr i32, ptr %var25, i32 %head.1_while.cond.0
%var250 = load i32, ptr %var249
%var251 = add i32 %var250, 1
%var255 = getelementptr i32, ptr %var42, i32 %head.1_while.cond.0
%var256 = load i32, ptr %var255
%var257 = sub i32 %var256, 2
%var258 = call i1 @check(i32 %var251, i32 %var9)
br i1 %var258, label %land.next..7, label %if.back.2_and_land.end..7

land.next..7:
%var262 = call i1 @check(i32 %var257, i32 %var9)
br label %land.end..7

land.end..7:
%var261_land.end..7 = phi i1 [ %var258, %if.back.2_and_land.end..7 ], [ %var262, %land.next..7 ]
br i1 %var261_land.end..7, label %land.next..8, label %land.end..7_and_land.end..8

land.next..8:
%var269 = getelementptr ptr, ptr %var59, i32 %var251
%var270 = load ptr, ptr %var269
%var272 = getelementptr i32, ptr %var270, i32 %var257
%var273 = load i32, ptr %var272
%var274 = sub i32 0, 1
%var275 = icmp eq i32 %var273, %var274
br label %land.end..8

land.end..8:
%var266_land.end..8 = phi i1 [ %var275, %land.next..8 ], [ %var261_land.end..7, %land.end..7_and_land.end..8 ]
br i1 %var266_land.end..8, label %if.then.4, label %if.else.4

if.then.4:
%var279 = add i32 %tail.1_if.back.2, 1
%var282 = getelementptr i32, ptr %var25, i32 %var279
store i32 %var251, ptr %var282
%var287 = getelementptr i32, ptr %var42, i32 %var279
store i32 %var257, ptr %var287
%var292 = getelementptr ptr, ptr %var59, i32 %var251
%var293 = load ptr, ptr %var292
%var295 = getelementptr i32, ptr %var293, i32 %var257
%var298 = add i32 %var121, 1
store i32 %var298, ptr %var295
%var301 = icmp eq i32 %var251, %var16
br i1 %var301, label %land.next..9, label %if.then.4_and_land.end..9

land.next..9:
%var305 = icmp eq i32 %var257, %var19
br label %land.end..9

land.end..9:
%var302_land.end..9 = phi i1 [ %var305, %land.next..9 ], [ %var301, %if.then.4_and_land.end..9 ]
br i1 %var302_land.end..9, label %if.then.5, label %if.else.5

if.then.5:
br label %if.back.5

if.else.5:
br label %if.back.5

if.back.5:
%ok.1_if.back.5 = phi i32 [ %ok.1_if.back.2, %if.else.5 ], [ 1, %if.then.5 ]
br label %if.back.4

if.else.4:
br label %if.back.4

if.back.4:
%tail.1_if.back.4 = phi i32 [ %tail.1_if.back.2, %if.else.4 ], [ %var279, %if.back.5 ]
%ok.1_if.back.4 = phi i32 [ %ok.1_if.back.2, %if.else.4 ], [ %ok.1_if.back.5, %if.back.5 ]
%var302_if.back.4 = phi i1 [ %var302_while.cond.0, %if.else.4 ], [ %var302_land.end..9, %if.back.5 ]
%var311 = getelementptr i32, ptr %var25, i32 %head.1_while.cond.0
%var312 = load i32, ptr %var311
%var313 = add i32 %var312, 1
%var317 = getelementptr i32, ptr %var42, i32 %head.1_while.cond.0
%var318 = load i32, ptr %var317
%var319 = add i32 %var318, 2
%var320 = call i1 @check(i32 %var313, i32 %var9)
br i1 %var320, label %land.next..10, label %if.back.4_and_land.end..10

land.next..10:
%var324 = call i1 @check(i32 %var319, i32 %var9)
br label %land.end..10

land.end..10:
%var323_land.end..10 = phi i1 [ %var320, %if.back.4_and_land.end..10 ], [ %var324, %land.next..10 ]
br i1 %var323_land.end..10, label %land.next..11, label %land.end..10_and_land.end..11

land.next..11:
%var331 = getelementptr ptr, ptr %var59, i32 %var313
%var332 = load ptr, ptr %var331
%var334 = getelementptr i32, ptr %var332, i32 %var319
%var335 = load i32, ptr %var334
%var336 = sub i32 0, 1
%var337 = icmp eq i32 %var335, %var336
br label %land.end..11

land.end..11:
%var328_land.end..11 = phi i1 [ %var323_land.end..10, %land.end..10_and_land.end..11 ], [ %var337, %land.next..11 ]
br i1 %var328_land.end..11, label %if.then.6, label %if.else.6

if.then.6:
%var341 = add i32 %tail.1_if.back.4, 1
%var344 = getelementptr i32, ptr %var25, i32 %var341
store i32 %var313, ptr %var344
%var349 = getelementptr i32, ptr %var42, i32 %var341
store i32 %var319, ptr %var349
%var354 = getelementptr ptr, ptr %var59, i32 %var313
%var355 = load ptr, ptr %var354
%var357 = getelementptr i32, ptr %var355, i32 %var319
%var360 = add i32 %var121, 1
store i32 %var360, ptr %var357
%var363 = icmp eq i32 %var313, %var16
br i1 %var363, label %land.next..12, label %if.then.6_and_land.end..12

land.next..12:
%var367 = icmp eq i32 %var319, %var19
br label %land.end..12

land.end..12:
%var364_land.end..12 = phi i1 [ %var367, %land.next..12 ], [ %var363, %if.then.6_and_land.end..12 ]
br i1 %var364_land.end..12, label %if.then.7, label %if.else.7

if.then.7:
br label %if.back.7

if.else.7:
br label %if.back.7

if.back.7:
%ok.1_if.back.7 = phi i32 [ 1, %if.then.7 ], [ %ok.1_if.back.4, %if.else.7 ]
br label %if.back.6

if.else.6:
br label %if.back.6

if.back.6:
%var364_if.back.6 = phi i1 [ %var364_land.end..12, %if.back.7 ], [ %var364_while.cond.0, %if.else.6 ]
%tail.1_if.back.6 = phi i32 [ %var341, %if.back.7 ], [ %tail.1_if.back.4, %if.else.6 ]
%ok.1_if.back.6 = phi i32 [ %ok.1_if.back.7, %if.back.7 ], [ %ok.1_if.back.4, %if.else.6 ]
%var373 = getelementptr i32, ptr %var25, i32 %head.1_while.cond.0
%var374 = load i32, ptr %var373
%var375 = sub i32 %var374, 2
%var379 = getelementptr i32, ptr %var42, i32 %head.1_while.cond.0
%var380 = load i32, ptr %var379
%var381 = sub i32 %var380, 1
%var382 = call i1 @check(i32 %var375, i32 %var9)
br i1 %var382, label %land.next..13, label %if.back.6_and_land.end..13

land.next..13:
%var386 = call i1 @check(i32 %var381, i32 %var9)
br label %land.end..13

land.end..13:
%var385_land.end..13 = phi i1 [ %var386, %land.next..13 ], [ %var382, %if.back.6_and_land.end..13 ]
br i1 %var385_land.end..13, label %land.next..14, label %land.end..13_and_land.end..14

land.next..14:
%var393 = getelementptr ptr, ptr %var59, i32 %var375
%var394 = load ptr, ptr %var393
%var396 = getelementptr i32, ptr %var394, i32 %var381
%var397 = load i32, ptr %var396
%var398 = sub i32 0, 1
%var399 = icmp eq i32 %var397, %var398
br label %land.end..14

land.end..14:
%var390_land.end..14 = phi i1 [ %var385_land.end..13, %land.end..13_and_land.end..14 ], [ %var399, %land.next..14 ]
br i1 %var390_land.end..14, label %if.then.8, label %if.else.8

if.then.8:
%var403 = add i32 %tail.1_if.back.6, 1
%var406 = getelementptr i32, ptr %var25, i32 %var403
store i32 %var375, ptr %var406
%var411 = getelementptr i32, ptr %var42, i32 %var403
store i32 %var381, ptr %var411
%var416 = getelementptr ptr, ptr %var59, i32 %var375
%var417 = load ptr, ptr %var416
%var419 = getelementptr i32, ptr %var417, i32 %var381
%var422 = add i32 %var121, 1
store i32 %var422, ptr %var419
%var425 = icmp eq i32 %var375, %var16
br i1 %var425, label %land.next..15, label %if.then.8_and_land.end..15

land.next..15:
%var429 = icmp eq i32 %var381, %var19
br label %land.end..15

land.end..15:
%var426_land.end..15 = phi i1 [ %var425, %if.then.8_and_land.end..15 ], [ %var429, %land.next..15 ]
br i1 %var426_land.end..15, label %if.then.9, label %if.else.9

if.then.9:
br label %if.back.9

if.else.9:
br label %if.back.9

if.back.9:
%ok.1_if.back.9 = phi i32 [ 1, %if.then.9 ], [ %ok.1_if.back.6, %if.else.9 ]
br label %if.back.8

if.else.8:
br label %if.back.8

if.back.8:
%tail.1_if.back.8 = phi i32 [ %var403, %if.back.9 ], [ %tail.1_if.back.6, %if.else.8 ]
%ok.1_if.back.8 = phi i32 [ %ok.1_if.back.9, %if.back.9 ], [ %ok.1_if.back.6, %if.else.8 ]
%var426_if.back.8 = phi i1 [ %var426_land.end..15, %if.back.9 ], [ %var426_while.cond.0, %if.else.8 ]
%var435 = getelementptr i32, ptr %var25, i32 %head.1_while.cond.0
%var436 = load i32, ptr %var435
%var437 = sub i32 %var436, 2
%var441 = getelementptr i32, ptr %var42, i32 %head.1_while.cond.0
%var442 = load i32, ptr %var441
%var443 = add i32 %var442, 1
%var444 = call i1 @check(i32 %var437, i32 %var9)
br i1 %var444, label %land.next..16, label %if.back.8_and_land.end..16

land.next..16:
%var448 = call i1 @check(i32 %var443, i32 %var9)
br label %land.end..16

land.end..16:
%var447_land.end..16 = phi i1 [ %var448, %land.next..16 ], [ %var444, %if.back.8_and_land.end..16 ]
br i1 %var447_land.end..16, label %land.next..17, label %land.end..16_and_land.end..17

land.next..17:
%var455 = getelementptr ptr, ptr %var59, i32 %var437
%var456 = load ptr, ptr %var455
%var458 = getelementptr i32, ptr %var456, i32 %var443
%var459 = load i32, ptr %var458
%var460 = sub i32 0, 1
%var461 = icmp eq i32 %var459, %var460
br label %land.end..17

land.end..17:
%var452_land.end..17 = phi i1 [ %var461, %land.next..17 ], [ %var447_land.end..16, %land.end..16_and_land.end..17 ]
br i1 %var452_land.end..17, label %if.then.10, label %if.else.10

if.then.10:
%var465 = add i32 %tail.1_if.back.8, 1
%var468 = getelementptr i32, ptr %var25, i32 %var465
store i32 %var437, ptr %var468
%var473 = getelementptr i32, ptr %var42, i32 %var465
store i32 %var443, ptr %var473
%var478 = getelementptr ptr, ptr %var59, i32 %var437
%var479 = load ptr, ptr %var478
%var481 = getelementptr i32, ptr %var479, i32 %var443
%var484 = add i32 %var121, 1
store i32 %var484, ptr %var481
%var487 = icmp eq i32 %var437, %var16
br i1 %var487, label %land.next..18, label %if.then.10_and_land.end..18

land.next..18:
%var491 = icmp eq i32 %var443, %var19
br label %land.end..18

land.end..18:
%var488_land.end..18 = phi i1 [ %var487, %if.then.10_and_land.end..18 ], [ %var491, %land.next..18 ]
br i1 %var488_land.end..18, label %if.then.11, label %if.else.11

if.then.11:
br label %if.back.11

if.else.11:
br label %if.back.11

if.back.11:
%ok.1_if.back.11 = phi i32 [ %ok.1_if.back.8, %if.else.11 ], [ 1, %if.then.11 ]
br label %if.back.10

if.else.10:
br label %if.back.10

if.back.10:
%tail.1_if.back.10 = phi i32 [ %tail.1_if.back.8, %if.else.10 ], [ %var465, %if.back.11 ]
%ok.1_if.back.10 = phi i32 [ %ok.1_if.back.8, %if.else.10 ], [ %ok.1_if.back.11, %if.back.11 ]
%var488_if.back.10 = phi i1 [ %var488_while.cond.0, %if.else.10 ], [ %var488_land.end..18, %if.back.11 ]
%var497 = getelementptr i32, ptr %var25, i32 %head.1_while.cond.0
%var498 = load i32, ptr %var497
%var499 = add i32 %var498, 2
%var503 = getelementptr i32, ptr %var42, i32 %head.1_while.cond.0
%var504 = load i32, ptr %var503
%var505 = sub i32 %var504, 1
%var506 = call i1 @check(i32 %var499, i32 %var9)
br i1 %var506, label %land.next..19, label %if.back.10_and_land.end..19

land.next..19:
%var510 = call i1 @check(i32 %var505, i32 %var9)
br label %land.end..19

land.end..19:
%var509_land.end..19 = phi i1 [ %var510, %land.next..19 ], [ %var506, %if.back.10_and_land.end..19 ]
br i1 %var509_land.end..19, label %land.next..20, label %land.end..19_and_land.end..20

land.next..20:
%var517 = getelementptr ptr, ptr %var59, i32 %var499
%var518 = load ptr, ptr %var517
%var520 = getelementptr i32, ptr %var518, i32 %var505
%var521 = load i32, ptr %var520
%var522 = sub i32 0, 1
%var523 = icmp eq i32 %var521, %var522
br label %land.end..20

land.end..20:
%var514_land.end..20 = phi i1 [ %var523, %land.next..20 ], [ %var509_land.end..19, %land.end..19_and_land.end..20 ]
br i1 %var514_land.end..20, label %if.then.12, label %if.else.12

if.then.12:
%var527 = add i32 %tail.1_if.back.10, 1
%var530 = getelementptr i32, ptr %var25, i32 %var527
store i32 %var499, ptr %var530
%var535 = getelementptr i32, ptr %var42, i32 %var527
store i32 %var505, ptr %var535
%var540 = getelementptr ptr, ptr %var59, i32 %var499
%var541 = load ptr, ptr %var540
%var543 = getelementptr i32, ptr %var541, i32 %var505
%var546 = add i32 %var121, 1
store i32 %var546, ptr %var543
%var549 = icmp eq i32 %var499, %var16
br i1 %var549, label %land.next..21, label %if.then.12_and_land.end..21

land.next..21:
%var553 = icmp eq i32 %var505, %var19
br label %land.end..21

land.end..21:
%var550_land.end..21 = phi i1 [ %var549, %if.then.12_and_land.end..21 ], [ %var553, %land.next..21 ]
br i1 %var550_land.end..21, label %if.then.13, label %if.else.13

if.then.13:
br label %if.back.13

if.else.13:
br label %if.back.13

if.back.13:
%ok.1_if.back.13 = phi i32 [ 1, %if.then.13 ], [ %ok.1_if.back.10, %if.else.13 ]
br label %if.back.12

if.else.12:
br label %if.back.12

if.back.12:
%var550_if.back.12 = phi i1 [ %var550_while.cond.0, %if.else.12 ], [ %var550_land.end..21, %if.back.13 ]
%tail.1_if.back.12 = phi i32 [ %tail.1_if.back.10, %if.else.12 ], [ %var527, %if.back.13 ]
%ok.1_if.back.12 = phi i32 [ %ok.1_if.back.10, %if.else.12 ], [ %ok.1_if.back.13, %if.back.13 ]
%var559 = getelementptr i32, ptr %var25, i32 %head.1_while.cond.0
%var560 = load i32, ptr %var559
%var561 = add i32 %var560, 2
%var565 = getelementptr i32, ptr %var42, i32 %head.1_while.cond.0
%var566 = load i32, ptr %var565
%var567 = add i32 %var566, 1
%var568 = call i1 @check(i32 %var561, i32 %var9)
br i1 %var568, label %land.next..22, label %if.back.12_and_land.end..22

land.next..22:
%var572 = call i1 @check(i32 %var567, i32 %var9)
br label %land.end..22

land.end..22:
%var571_land.end..22 = phi i1 [ %var568, %if.back.12_and_land.end..22 ], [ %var572, %land.next..22 ]
br i1 %var571_land.end..22, label %land.next..23, label %land.end..22_and_land.end..23

land.next..23:
%var579 = getelementptr ptr, ptr %var59, i32 %var561
%var580 = load ptr, ptr %var579
%var582 = getelementptr i32, ptr %var580, i32 %var567
%var583 = load i32, ptr %var582
%var584 = sub i32 0, 1
%var585 = icmp eq i32 %var583, %var584
br label %land.end..23

land.end..23:
%var576_land.end..23 = phi i1 [ %var571_land.end..22, %land.end..22_and_land.end..23 ], [ %var585, %land.next..23 ]
br i1 %var576_land.end..23, label %if.then.14, label %if.else.14

if.then.14:
%var589 = add i32 %tail.1_if.back.12, 1
%var592 = getelementptr i32, ptr %var25, i32 %var589
store i32 %var561, ptr %var592
%var597 = getelementptr i32, ptr %var42, i32 %var589
store i32 %var567, ptr %var597
%var602 = getelementptr ptr, ptr %var59, i32 %var561
%var603 = load ptr, ptr %var602
%var605 = getelementptr i32, ptr %var603, i32 %var567
%var608 = add i32 %var121, 1
store i32 %var608, ptr %var605
%var611 = icmp eq i32 %var561, %var16
br i1 %var611, label %land.next..24, label %if.then.14_and_land.end..24

land.next..24:
%var615 = icmp eq i32 %var567, %var19
br label %land.end..24

land.end..24:
%var612_land.end..24 = phi i1 [ %var615, %land.next..24 ], [ %var611, %if.then.14_and_land.end..24 ]
br i1 %var612_land.end..24, label %if.then.15, label %if.else.15

if.then.15:
br label %if.back.15

if.else.15:
br label %if.back.15

if.back.15:
%ok.1_if.back.15 = phi i32 [ %ok.1_if.back.12, %if.else.15 ], [ 1, %if.then.15 ]
br label %if.back.14

if.else.14:
br label %if.back.14

if.back.14:
%var612_if.back.14 = phi i1 [ %var612_while.cond.0, %if.else.14 ], [ %var612_land.end..24, %if.back.15 ]
%tail.1_if.back.14 = phi i32 [ %tail.1_if.back.12, %if.else.14 ], [ %var589, %if.back.15 ]
%ok.1_if.back.14 = phi i32 [ %ok.1_if.back.12, %if.else.14 ], [ %ok.1_if.back.15, %if.back.15 ]
%var619 = icmp eq i32 %ok.1_if.back.14, 1
br i1 %var619, label %if.then.16, label %if.else.16

if.then.16:
br label %while.back.0

if.else.16:
br label %if.back.16

if.back.16:
%var622 = add i32 %head.1_while.cond.0, 1
br label %while.cond.0

while.back.0:
%ok.1_while.back.0 = phi i32 [ %ok.1_while.cond.0, %while.cond.0_and_while.back.0 ], [ %ok.1_if.back.14, %if.then.16 ]
%var624 = icmp eq i32 %ok.1_while.back.0, 1
br i1 %var624, label %if.then.17, label %if.else.17

if.then.17:
%var629 = getelementptr ptr, ptr %var59, i32 %var16
%var630 = load ptr, ptr %var629
%var632 = getelementptr i32, ptr %var630, i32 %var19
%var633 = load i32, ptr %var632
%var626 = call ptr @toString(i32 %var633)
call void @println(ptr %var626)
br label %if.back.17

if.else.17:
call void @print(ptr @.str..0)
br label %if.back.17

if.back.17:
ret i32 0

while.cond.0_and_while.back.0:
br label %while.back.0

while.body.0_and_land.end..1:
br label %land.end..1

land.end..1_and_land.end..2:
br label %land.end..2

if.then.0_and_land.end..3:
br label %land.end..3

if.back.0_and_land.end..4:
br label %land.end..4

land.end..4_and_land.end..5:
br label %land.end..5

if.then.2_and_land.end..6:
br label %land.end..6

if.back.2_and_land.end..7:
br label %land.end..7

land.end..7_and_land.end..8:
br label %land.end..8

if.then.4_and_land.end..9:
br label %land.end..9

if.back.4_and_land.end..10:
br label %land.end..10

land.end..10_and_land.end..11:
br label %land.end..11

if.then.6_and_land.end..12:
br label %land.end..12

if.back.6_and_land.end..13:
br label %land.end..13

land.end..13_and_land.end..14:
br label %land.end..14

if.then.8_and_land.end..15:
br label %land.end..15

if.back.8_and_land.end..16:
br label %land.end..16

land.end..16_and_land.end..17:
br label %land.end..17

if.then.10_and_land.end..18:
br label %land.end..18

if.back.10_and_land.end..19:
br label %land.end..19

land.end..19_and_land.end..20:
br label %land.end..20

if.then.12_and_land.end..21:
br label %land.end..21

if.back.12_and_land.end..22:
br label %land.end..22

land.end..22_and_land.end..23:
br label %land.end..23

if.then.14_and_land.end..24:
br label %land.end..24

}
define i1 @check(i32 %a, i32 %N) {
entry:
%var2 = icmp slt i32 %a, %N
br i1 %var2, label %land.next..0, label %entry_and_land.end..0

land.next..0:
%var5 = icmp sge i32 %a, 0
br label %land.end..0

land.end..0:
%var3_land.end..0 = phi i1 [ %var5, %land.next..0 ], [ %var2, %entry_and_land.end..0 ]
ret i1 %var3_land.end..0

entry_and_land.end..0:
br label %land.end..0

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

