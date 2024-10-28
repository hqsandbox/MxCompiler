@outputBuffer = global ptr null
@inputBuffer = global ptr null
@MAXCHUNK = global i32 100
@chunks = global ptr null
@.str..7 = private unnamed_addr constant [11 x i8] c"Not Found!\00"
@.str..5 = private unnamed_addr constant [14 x i8] c"Invalid input\00"
@MAXLENGTH = global i32 0
@.str..6 = private unnamed_addr constant [1 x i8] c"\00"
@.str..3 = private unnamed_addr constant [19 x i8] c"nChunk > MAXCHUNK!\00"
@.str..4 = private unnamed_addr constant [1 x i8] c"\00"
@.str..1 = private unnamed_addr constant [1 x i8] c"\00"
@.str..2 = private unnamed_addr constant [1 x i8] c"\00"
@asciiTable = global ptr null
@.str..0 = private unnamed_addr constant [96 x i8] c" !\22#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~\00"
define i32 @add(i32 %x, i32 %y) {
entry:
%var125 = and i32 %x, 65535
%var127 = and i32 %y, 65535
%var128 = add i32 %var125, %var127
%var130 = ashr i32 %x, 16
%var131 = and i32 %var130, 65535
%var133 = ashr i32 %y, 16
%var134 = and i32 %var133, 65535
%var135 = add i32 %var131, %var134
%var137 = ashr i32 %var128, 16
%var138 = add i32 %var135, %var137
%var139 = and i32 %var138, 65535
%var141 = shl i32 %var139, 16
%var143 = and i32 %var128, 65535
%var144 = or i32 %var141, %var143
ret i32 %var144

}
define i1 @nextText(ptr %now, i32 %length) {
entry:
%var489 = sub i32 %length, 1
br label %for.cond.10

for.cond.10:
%i.5_for.cond.10 = phi i32 [ %var489, %entry ], [ %var512, %for.step.10 ]
%var491 = icmp sge i32 %i.5_for.cond.10, 0
br i1 %var491, label %for.body.10, label %for.back.10

for.body.10:
%var494 = getelementptr i32, ptr %now, i32 %i.5_for.cond.10
%var499 = getelementptr i32, ptr %now, i32 %i.5_for.cond.10
%var500 = load i32, ptr %var499
%var496 = call i32 @nextLetter(i32 %var500)
store i32 %var496, ptr %var494
%var503 = getelementptr i32, ptr %now, i32 %i.5_for.cond.10
%var504 = load i32, ptr %var503
%var505 = sub i32 0, 1
%var506 = icmp eq i32 %var504, %var505
br i1 %var506, label %if.then.14, label %if.else.14

if.then.14:
%var509 = getelementptr i32, ptr %now, i32 %i.5_for.cond.10
store i32 48, ptr %var509
br label %if.back.14

if.else.14:
ret i1 true

if.back.14:
br label %for.step.10

for.step.10:
%var512 = sub i32 %i.5_for.cond.10, 1
br label %for.cond.10

for.back.10:
ret i1 false

}
define i32 @main() {
entry:
call void @__init()
br label %while.cond.1

while.cond.1:
%input.4_while.cond.1 = phi ptr [ null, %entry ], [ %input.4_if.back.21, %if.back.21 ]
br i1 true, label %while.body.1, label %while.cond.1_and_while.back.1

while.body.1:
%var619 = call i32 @getInt()
%var621 = icmp eq i32 %var619, 0
br i1 %var621, label %if.then.20, label %if.else.20

if.then.20:
br label %while.back.1

if.else.20:
br label %if.back.20

if.back.20:
%var623 = icmp eq i32 %var619, 1
br i1 %var623, label %if.then.21, label %if.else.21

if.then.21:
%var625 = call ptr @getString()
%var626 = call ptr @string.copy(ptr %var625)
call void @computeSHA1(ptr %var626)
br label %if.back.21

if.else.21:
%var630 = icmp eq i32 %var619, 2
br i1 %var630, label %if.then.22, label %if.else.22

if.then.22:
%var632 = call ptr @getString()
%var633 = call ptr @string.copy(ptr %var632)
call void @crackSHA1(ptr %var633)
br label %if.back.22

if.else.22:
br label %if.back.22

if.back.22:
%input.4_if.back.22 = phi ptr [ %var633, %if.then.22 ], [ %input.4_while.cond.1, %if.else.22 ]
br label %if.back.21

if.back.21:
%input.4_if.back.21 = phi ptr [ %input.4_if.back.22, %if.back.22 ], [ %var626, %if.then.21 ]
br label %while.cond.1

while.back.1:
ret i32 0

while.cond.1_and_while.back.1:
br label %while.back.1

}
define i32 @hex2int(ptr %x) {
entry:
br label %for.cond.0

for.cond.0:
%result.1_for.cond.0 = phi i32 [ 0, %entry ], [ %result.1_if.back.0, %for.step.0 ]
%i.1_for.cond.0 = phi i32 [ 0, %entry ], [ %var47, %for.step.0 ]
%var35_for.cond.0 = phi i1 [ 0, %entry ], [ %var35_if.back.0, %for.step.0 ]
%var22_for.cond.0 = phi i1 [ 0, %entry ], [ %var22_if.back.0, %for.step.0 ]
%var3 = call i32 @string.length(ptr %x)
%var4 = icmp slt i32 %i.1_for.cond.0, %var3
br i1 %var4, label %for.body.0, label %for.back.0

for.body.0:
%var7 = call i32 @string.ord(ptr %x, i32 %i.1_for.cond.0)
%var9 = icmp sge i32 %var7, 48
br i1 %var9, label %land.next..0, label %for.body.0_and_land.end..0

land.next..0:
%var12 = icmp sle i32 %var7, 57
br label %land.end..0

land.end..0:
%var10_land.end..0 = phi i1 [ %var12, %land.next..0 ], [ %var9, %for.body.0_and_land.end..0 ]
br i1 %var10_land.end..0, label %if.then.0, label %if.else.0

if.then.0:
%var16 = mul i32 %result.1_for.cond.0, 16
%var18 = add i32 %var16, %var7
%var19 = sub i32 %var18, 48
br label %if.back.0

if.else.0:
%var21 = icmp sge i32 %var7, 65
br i1 %var21, label %land.next..1, label %if.else.0_and_land.end..1

land.next..1:
%var24 = icmp sle i32 %var7, 70
br label %land.end..1

land.end..1:
%var22_land.end..1 = phi i1 [ %var24, %land.next..1 ], [ %var21, %if.else.0_and_land.end..1 ]
br i1 %var22_land.end..1, label %if.then.1, label %if.else.1

if.then.1:
%var28 = mul i32 %result.1_for.cond.0, 16
%var30 = add i32 %var28, %var7
%var31 = sub i32 %var30, 65
%var32 = add i32 %var31, 10
br label %if.back.1

if.else.1:
%var34 = icmp sge i32 %var7, 97
br i1 %var34, label %land.next..2, label %if.else.1_and_land.end..2

land.next..2:
%var37 = icmp sle i32 %var7, 102
br label %land.end..2

land.end..2:
%var35_land.end..2 = phi i1 [ %var37, %land.next..2 ], [ %var34, %if.else.1_and_land.end..2 ]
br i1 %var35_land.end..2, label %if.then.2, label %if.else.2

if.then.2:
%var41 = mul i32 %result.1_for.cond.0, 16
%var43 = add i32 %var41, %var7
%var44 = sub i32 %var43, 97
%var45 = add i32 %var44, 10
br label %if.back.2

if.else.2:
ret i32 0

if.back.2:
br label %if.back.1

if.back.1:
%result.1_if.back.1 = phi i32 [ %var32, %if.then.1 ], [ %var45, %if.back.2 ]
%var35_if.back.1 = phi i1 [ %var35_for.cond.0, %if.then.1 ], [ %var35_land.end..2, %if.back.2 ]
br label %if.back.0

if.back.0:
%result.1_if.back.0 = phi i32 [ %var19, %if.then.0 ], [ %result.1_if.back.1, %if.back.1 ]
%var35_if.back.0 = phi i1 [ %var35_for.cond.0, %if.then.0 ], [ %var35_if.back.1, %if.back.1 ]
%var22_if.back.0 = phi i1 [ %var22_for.cond.0, %if.then.0 ], [ %var22_land.end..1, %if.back.1 ]
br label %for.step.0

for.step.0:
%var47 = add i32 %i.1_for.cond.0, 1
br label %for.cond.0

for.back.0:
ret i32 %result.1_for.cond.0

for.body.0_and_land.end..0:
br label %land.end..0

if.else.0_and_land.end..1:
br label %land.end..1

if.else.1_and_land.end..2:
br label %land.end..2

}
define void @crackSHA1(ptr %input) {
entry:
%var534 = call ptr @__array.alloca(i32 4, i32 1, i32 1, i32 5)
%var536 = call i32 @string.length(ptr %input)
%var537 = icmp ne i32 %var536, 40
br i1 %var537, label %if.then.17, label %if.else.17

if.then.17:
call void @println(ptr @.str..5)
ret void

if.else.17:
br label %if.back.17

if.back.17:
br label %for.cond.12

for.cond.12:
%i.7_for.cond.12 = phi i32 [ 0, %if.back.17 ], [ %var547, %for.step.12 ]
%var541 = icmp slt i32 %i.7_for.cond.12, 5
br i1 %var541, label %for.body.12, label %for.back.12

for.body.12:
%var544 = getelementptr i32, ptr %var534, i32 %i.7_for.cond.12
store i32 0, ptr %var544
br label %for.step.12

for.step.12:
%var547 = add i32 %i.7_for.cond.12, 1
br label %for.cond.12

for.back.12:
br label %for.cond.13

for.cond.13:
%i.7_for.cond.13 = phi i32 [ 0, %for.back.12 ], [ %var576, %for.step.13 ]
%var550 = icmp slt i32 %i.7_for.cond.13, 40
br i1 %var550, label %for.body.13, label %for.back.13

for.body.13:
%var553 = sdiv i32 %i.7_for.cond.13, 8
%var554 = getelementptr i32, ptr %var534, i32 %var553
%var558 = sdiv i32 %i.7_for.cond.13, 8
%var559 = getelementptr i32, ptr %var534, i32 %var558
%var560 = load i32, ptr %var559
%var565 = add i32 %i.7_for.cond.13, 4
%var566 = call ptr @string.substring(ptr %input, i32 %i.7_for.cond.13, i32 %var565)
%var561 = call i32 @hex2int(ptr %var566)
%var568 = sdiv i32 %i.7_for.cond.13, 4
%var569 = srem i32 %var568, 2
%var570 = sub i32 1, %var569
%var571 = mul i32 %var570, 16
%var572 = shl i32 %var561, %var571
%var573 = or i32 %var560, %var572
store i32 %var573, ptr %var554
br label %for.step.13

for.step.13:
%var576 = add i32 %i.7_for.cond.13, 4
br label %for.cond.13

for.back.13:
br label %for.cond.14

for.cond.14:
%digit.3_for.cond.14 = phi i32 [ 1, %for.back.13 ], [ %var615, %for.step.14 ]
%out.1_for.cond.14 = phi ptr [ null, %for.back.13 ], [ %out.1_while.back.0, %for.step.14 ]
%var580 = icmp sle i32 %digit.3_for.cond.14, 4
br i1 %var580, label %for.body.14, label %for.back.14

for.body.14:
br label %for.cond.15

for.cond.15:
%i.7_for.cond.15 = phi i32 [ 0, %for.body.14 ], [ %var590, %for.step.15 ]
%var584 = icmp slt i32 %i.7_for.cond.15, %digit.3_for.cond.14
br i1 %var584, label %for.body.15, label %for.back.15

for.body.15:
%var585 = load ptr, ptr @inputBuffer
%var587 = getelementptr i32, ptr %var585, i32 %i.7_for.cond.15
store i32 48, ptr %var587
br label %for.step.15

for.step.15:
%var590 = add i32 %i.7_for.cond.15, 1
br label %for.cond.15

for.back.15:
br label %while.cond.0

while.cond.0:
%out.1_while.cond.0 = phi ptr [ %out.1_for.cond.14, %for.back.15 ], [ %var591, %if.back.19 ]
br i1 true, label %while.body.0, label %while.cond.0_and_while.back.0

while.body.0:
%var592 = load ptr, ptr @inputBuffer
%var591 = call ptr @sha1(ptr %var592, i32 %digit.3_for.cond.14)
%var594 = call i1 @array_equal(ptr %var591, ptr %var534)
br i1 %var594, label %if.then.18, label %if.else.18

if.then.18:
br label %for.cond.16

for.cond.16:
%i.7_for.cond.16 = phi i32 [ 0, %if.then.18 ], [ %var608, %for.step.16 ]
%var600 = icmp slt i32 %i.7_for.cond.16, %digit.3_for.cond.14
br i1 %var600, label %for.body.16, label %for.back.16

for.body.16:
%var603 = load ptr, ptr @inputBuffer
%var605 = getelementptr i32, ptr %var603, i32 %i.7_for.cond.16
%var606 = load i32, ptr %var605
%var602 = call ptr @int2chr(i32 %var606)
call void @print(ptr %var602)
br label %for.step.16

for.step.16:
%var608 = add i32 %i.7_for.cond.16, 1
br label %for.cond.16

for.back.16:
call void @println(ptr @.str..6)
ret void

if.else.18:
br label %if.back.18

if.back.18:
%var611 = load ptr, ptr @inputBuffer
%var610 = call i1 @nextText(ptr %var611, i32 %digit.3_for.cond.14)
%var613 = xor i1 %var610, true
br i1 %var613, label %if.then.19, label %if.else.19

if.then.19:
br label %while.back.0

if.else.19:
br label %if.back.19

if.back.19:
br label %while.cond.0

while.back.0:
%out.1_while.back.0 = phi ptr [ %out.1_while.cond.0, %while.cond.0_and_while.back.0 ], [ %var591, %if.then.19 ]
br label %for.step.14

for.step.14:
%var615 = add i32 %digit.3_for.cond.14, 1
br label %for.cond.14

for.back.14:
call void @println(ptr @.str..7)
ret void

while.cond.0_and_while.back.0:
br label %while.back.0

}
define ptr @toStringHex(i32 %x) {
entry:
br label %for.cond.1

for.cond.1:
%ret.1_for.cond.1 = phi ptr [ @.str..2, %entry ], [ %ret.1_if.back.4, %for.step.1 ]
%i.2_for.cond.1 = phi i32 [ 28, %entry ], [ %var87, %for.step.1 ]
%var63 = icmp sge i32 %i.2_for.cond.1, 0
br i1 %var63, label %for.body.1, label %for.back.1

for.body.1:
%var66 = ashr i32 %x, %i.2_for.cond.1
%var67 = and i32 %var66, 15
%var69 = icmp slt i32 %var67, 10
br i1 %var69, label %if.then.4, label %if.else.4

if.then.4:
%var74 = add i32 48, %var67
%var72 = call ptr @int2chr(i32 %var74)
%var75 = call ptr @string.add(ptr %ret.1_for.cond.1, ptr %var72)
%var76 = call ptr @string.copy(ptr %var75)
br label %if.back.4

if.else.4:
%var81 = add i32 65, %var67
%var82 = sub i32 %var81, 10
%var79 = call ptr @int2chr(i32 %var82)
%var83 = call ptr @string.add(ptr %ret.1_for.cond.1, ptr %var79)
%var84 = call ptr @string.copy(ptr %var83)
br label %if.back.4

if.back.4:
%ret.1_if.back.4 = phi ptr [ %var84, %if.else.4 ], [ %var76, %if.then.4 ]
br label %for.step.1

for.step.1:
%var87 = sub i32 %i.2_for.cond.1, 4
br label %for.cond.1

for.back.1:
ret ptr %ret.1_for.cond.1

}
define void @computeSHA1(ptr %input) {
entry:
br label %for.cond.8

for.cond.8:
%i.4_for.cond.8 = phi i32 [ 0, %entry ], [ %var459, %for.step.8 ]
%var449 = call i32 @string.length(ptr %input)
%var450 = icmp slt i32 %i.4_for.cond.8, %var449
br i1 %var450, label %for.body.8, label %for.back.8

for.body.8:
%var451 = load ptr, ptr @inputBuffer
%var453 = getelementptr i32, ptr %var451, i32 %i.4_for.cond.8
%var457 = call i32 @string.ord(ptr %input, i32 %i.4_for.cond.8)
store i32 %var457, ptr %var453
br label %for.step.8

for.step.8:
%var459 = add i32 %i.4_for.cond.8, 1
br label %for.cond.8

for.back.8:
%var461 = load ptr, ptr @inputBuffer
%var463 = call i32 @string.length(ptr %input)
%var460 = call ptr @sha1(ptr %var461, i32 %var463)
br label %for.cond.9

for.cond.9:
%i.4_for.cond.9 = phi i32 [ 0, %for.back.8 ], [ %var476, %for.step.9 ]
%var467 = call i32 @array.size(ptr %var460)
%var468 = icmp slt i32 %i.4_for.cond.9, %var467
br i1 %var468, label %for.body.9, label %for.back.9

for.body.9:
%var473 = getelementptr i32, ptr %var460, i32 %i.4_for.cond.9
%var474 = load i32, ptr %var473
%var470 = call ptr @toStringHex(i32 %var474)
call void @print(ptr %var470)
br label %for.step.9

for.step.9:
%var476 = add i32 %i.4_for.cond.9, 1
br label %for.cond.9

for.back.9:
call void @println(ptr @.str..4)
ret void

}
define ptr @sha1(ptr %input, i32 %length) {
entry:
%var159 = add i32 %length, 64
%var160 = sub i32 %var159, 56
%var161 = sdiv i32 %var160, 64
%var162 = add i32 %var161, 1
%var164 = load i32, ptr @MAXCHUNK
%var165 = icmp sgt i32 %var162, %var164
br i1 %var165, label %if.then.7, label %if.else.7

if.then.7:
call void @println(ptr @.str..3)
ret ptr null

if.else.7:
br label %if.back.7

if.back.7:
br label %for.cond.2

for.cond.2:
%i.3_for.cond.2 = phi i32 [ 0, %if.back.7 ], [ %var184, %for.step.2 ]
%var170 = icmp slt i32 %i.3_for.cond.2, %var162
br i1 %var170, label %for.body.2, label %for.back.2

for.body.2:
br label %for.cond.3

for.cond.3:
%j.1_for.cond.3 = phi i32 [ 0, %for.body.2 ], [ %var182, %for.step.3 ]
%var173 = icmp slt i32 %j.1_for.cond.3, 80
br i1 %var173, label %for.body.3, label %for.back.3

for.body.3:
%var174 = load ptr, ptr @chunks
%var176 = getelementptr ptr, ptr %var174, i32 %i.3_for.cond.2
%var177 = load ptr, ptr %var176
%var179 = getelementptr i32, ptr %var177, i32 %j.1_for.cond.3
store i32 0, ptr %var179
br label %for.step.3

for.step.3:
%var182 = add i32 %j.1_for.cond.3, 1
br label %for.cond.3

for.back.3:
br label %for.step.2

for.step.2:
%var184 = add i32 %i.3_for.cond.2, 1
br label %for.cond.2

for.back.2:
br label %for.cond.4

for.cond.4:
%i.3_for.cond.4 = phi i32 [ 0, %for.back.2 ], [ %var220, %for.step.4 ]
%var188 = icmp slt i32 %i.3_for.cond.4, %length
br i1 %var188, label %for.body.4, label %for.back.4

for.body.4:
%var189 = load ptr, ptr @chunks
%var191 = sdiv i32 %i.3_for.cond.4, 64
%var192 = getelementptr ptr, ptr %var189, i32 %var191
%var193 = load ptr, ptr %var192
%var195 = srem i32 %i.3_for.cond.4, 64
%var196 = sdiv i32 %var195, 4
%var197 = getelementptr i32, ptr %var193, i32 %var196
%var199 = load ptr, ptr @chunks
%var201 = sdiv i32 %i.3_for.cond.4, 64
%var202 = getelementptr ptr, ptr %var199, i32 %var201
%var203 = load ptr, ptr %var202
%var205 = srem i32 %i.3_for.cond.4, 64
%var206 = sdiv i32 %var205, 4
%var207 = getelementptr i32, ptr %var203, i32 %var206
%var208 = load i32, ptr %var207
%var211 = getelementptr i32, ptr %input, i32 %i.3_for.cond.4
%var212 = load i32, ptr %var211
%var214 = srem i32 %i.3_for.cond.4, 4
%var215 = sub i32 3, %var214
%var216 = mul i32 %var215, 8
%var217 = shl i32 %var212, %var216
%var218 = or i32 %var208, %var217
store i32 %var218, ptr %var197
br label %for.step.4

for.step.4:
%var220 = add i32 %i.3_for.cond.4, 1
br label %for.cond.4

for.back.4:
%var221 = load ptr, ptr @chunks
%var223 = sdiv i32 %i.3_for.cond.4, 64
%var224 = getelementptr ptr, ptr %var221, i32 %var223
%var225 = load ptr, ptr %var224
%var227 = srem i32 %i.3_for.cond.4, 64
%var228 = sdiv i32 %var227, 4
%var229 = getelementptr i32, ptr %var225, i32 %var228
%var231 = load ptr, ptr @chunks
%var233 = sdiv i32 %i.3_for.cond.4, 64
%var234 = getelementptr ptr, ptr %var231, i32 %var233
%var235 = load ptr, ptr %var234
%var237 = srem i32 %i.3_for.cond.4, 64
%var238 = sdiv i32 %var237, 4
%var239 = getelementptr i32, ptr %var235, i32 %var238
%var240 = load i32, ptr %var239
%var242 = srem i32 %i.3_for.cond.4, 4
%var243 = sub i32 3, %var242
%var244 = mul i32 %var243, 8
%var245 = shl i32 128, %var244
%var246 = or i32 %var240, %var245
store i32 %var246, ptr %var229
%var247 = load ptr, ptr @chunks
%var249 = sub i32 %var162, 1
%var250 = getelementptr ptr, ptr %var247, i32 %var249
%var251 = load ptr, ptr %var250
%var252 = getelementptr i32, ptr %var251, i32 15
%var255 = shl i32 %length, 3
store i32 %var255, ptr %var252
%var256 = load ptr, ptr @chunks
%var258 = sub i32 %var162, 1
%var259 = getelementptr ptr, ptr %var256, i32 %var258
%var260 = load ptr, ptr %var259
%var261 = getelementptr i32, ptr %var260, i32 14
%var264 = ashr i32 %length, 29
%var265 = and i32 %var264, 7
store i32 %var265, ptr %var261
%var266 = call i32 @lohi(i32 43913, i32 61389)
%var267 = call i32 @lohi(i32 56574, i32 39098)
%var268 = call i32 @lohi(i32 57840, i32 50130)
br label %for.cond.5

for.cond.5:
%temp.1_for.cond.5 = phi i32 [ 0, %for.back.4 ], [ %temp.1_for.cond.7, %for.step.5 ]
%h1.1_for.cond.5 = phi i32 [ %var266, %for.back.4 ], [ %var408, %for.step.5 ]
%h0.1_for.cond.5 = phi i32 [ 1732584193, %for.back.4 ], [ %var404, %for.step.5 ]
%h3.1_for.cond.5 = phi i32 [ 271733878, %for.back.4 ], [ %var416, %for.step.5 ]
%h2.1_for.cond.5 = phi i32 [ %var267, %for.back.4 ], [ %var412, %for.step.5 ]
%h4.1_for.cond.5 = phi i32 [ %var268, %for.back.4 ], [ %var420, %for.step.5 ]
%f.1_for.cond.5 = phi i32 [ 0, %for.back.4 ], [ %f.1_for.cond.7, %for.step.5 ]
%i.3_for.cond.5 = phi i32 [ 0, %for.back.4 ], [ %var424, %for.step.5 ]
%k.1_for.cond.5 = phi i32 [ 0, %for.back.4 ], [ %k.1_for.cond.7, %for.step.5 ]
%var272 = icmp slt i32 %i.3_for.cond.5, %var162
br i1 %var272, label %for.body.5, label %for.back.5

for.body.5:
br label %for.cond.6

for.cond.6:
%j.1_for.cond.6 = phi i32 [ 16, %for.body.5 ], [ %var320, %for.step.6 ]
%var275 = icmp slt i32 %j.1_for.cond.6, 80
br i1 %var275, label %for.body.6, label %for.back.6

for.body.6:
%var276 = load ptr, ptr @chunks
%var278 = getelementptr ptr, ptr %var276, i32 %i.3_for.cond.5
%var279 = load ptr, ptr %var278
%var281 = getelementptr i32, ptr %var279, i32 %j.1_for.cond.6
%var284 = load ptr, ptr @chunks
%var286 = getelementptr ptr, ptr %var284, i32 %i.3_for.cond.5
%var287 = load ptr, ptr %var286
%var289 = sub i32 %j.1_for.cond.6, 3
%var290 = getelementptr i32, ptr %var287, i32 %var289
%var291 = load i32, ptr %var290
%var292 = load ptr, ptr @chunks
%var294 = getelementptr ptr, ptr %var292, i32 %i.3_for.cond.5
%var295 = load ptr, ptr %var294
%var297 = sub i32 %j.1_for.cond.6, 8
%var298 = getelementptr i32, ptr %var295, i32 %var297
%var299 = load i32, ptr %var298
%var300 = xor i32 %var291, %var299
%var301 = load ptr, ptr @chunks
%var303 = getelementptr ptr, ptr %var301, i32 %i.3_for.cond.5
%var304 = load ptr, ptr %var303
%var306 = sub i32 %j.1_for.cond.6, 14
%var307 = getelementptr i32, ptr %var304, i32 %var306
%var308 = load i32, ptr %var307
%var309 = xor i32 %var300, %var308
%var310 = load ptr, ptr @chunks
%var312 = getelementptr ptr, ptr %var310, i32 %i.3_for.cond.5
%var313 = load ptr, ptr %var312
%var315 = sub i32 %j.1_for.cond.6, 16
%var316 = getelementptr i32, ptr %var313, i32 %var315
%var317 = load i32, ptr %var316
%var318 = xor i32 %var309, %var317
%var283 = call i32 @rotate_left(i32 %var318, i32 1)
store i32 %var283, ptr %var281
br label %for.step.6

for.step.6:
%var320 = add i32 %j.1_for.cond.6, 1
br label %for.cond.6

for.back.6:
br label %for.cond.7

for.cond.7:
%d.1_for.cond.7 = phi i32 [ %h3.1_for.cond.5, %for.back.6 ], [ %c.1_for.cond.7, %for.step.7 ]
%e.1_for.cond.7 = phi i32 [ %h4.1_for.cond.5, %for.back.6 ], [ %d.1_for.cond.7, %for.step.7 ]
%b.1_for.cond.7 = phi i32 [ %h1.1_for.cond.5, %for.back.6 ], [ %a.1_for.cond.7, %for.step.7 ]
%c.1_for.cond.7 = phi i32 [ %h2.1_for.cond.5, %for.back.6 ], [ %var395, %for.step.7 ]
%f.1_for.cond.7 = phi i32 [ %f.1_for.cond.5, %for.back.6 ], [ %f.1_if.back.8, %for.step.7 ]
%temp.1_for.cond.7 = phi i32 [ %temp.1_for.cond.5, %for.back.6 ], [ %var374, %for.step.7 ]
%j.1_for.cond.7 = phi i32 [ 0, %for.back.6 ], [ %var402, %for.step.7 ]
%k.1_for.cond.7 = phi i32 [ %k.1_for.cond.5, %for.back.6 ], [ %k.1_if.back.8, %for.step.7 ]
%a.1_for.cond.7 = phi i32 [ %h0.1_for.cond.5, %for.back.6 ], [ %var374, %for.step.7 ]
%var328 = icmp slt i32 %j.1_for.cond.7, 80
br i1 %var328, label %for.body.7, label %for.back.7

for.body.7:
%var330 = icmp slt i32 %j.1_for.cond.7, 20
br i1 %var330, label %if.then.8, label %if.else.8

if.then.8:
%var334 = and i32 %b.1_for.cond.7, %c.1_for.cond.7
%var336 = xor i32 %b.1_for.cond.7, -1
%var338 = and i32 %var336, %d.1_for.cond.7
%var339 = or i32 %var334, %var338
br label %if.back.8

if.else.8:
%var342 = icmp slt i32 %j.1_for.cond.7, 40
br i1 %var342, label %if.then.9, label %if.else.9

if.then.9:
%var346 = xor i32 %b.1_for.cond.7, %c.1_for.cond.7
%var348 = xor i32 %var346, %d.1_for.cond.7
br label %if.back.9

if.else.9:
%var351 = icmp slt i32 %j.1_for.cond.7, 60
br i1 %var351, label %if.then.10, label %if.else.10

if.then.10:
%var355 = and i32 %b.1_for.cond.7, %c.1_for.cond.7
%var358 = and i32 %b.1_for.cond.7, %d.1_for.cond.7
%var359 = or i32 %var355, %var358
%var362 = and i32 %c.1_for.cond.7, %d.1_for.cond.7
%var363 = or i32 %var359, %var362
%var365 = call i32 @lohi(i32 48348, i32 36635)
br label %if.back.10

if.else.10:
%var369 = xor i32 %b.1_for.cond.7, %c.1_for.cond.7
%var371 = xor i32 %var369, %d.1_for.cond.7
%var373 = call i32 @lohi(i32 49622, i32 51810)
br label %if.back.10

if.back.10:
%f.1_if.back.10 = phi i32 [ %var363, %if.then.10 ], [ %var371, %if.else.10 ]
%k.1_if.back.10 = phi i32 [ %var365, %if.then.10 ], [ %var373, %if.else.10 ]
br label %if.back.9

if.back.9:
%f.1_if.back.9 = phi i32 [ %f.1_if.back.10, %if.back.10 ], [ %var348, %if.then.9 ]
%k.1_if.back.9 = phi i32 [ %k.1_if.back.10, %if.back.10 ], [ 1859775393, %if.then.9 ]
br label %if.back.8

if.back.8:
%f.1_if.back.8 = phi i32 [ %f.1_if.back.9, %if.back.9 ], [ %var339, %if.then.8 ]
%k.1_if.back.8 = phi i32 [ %k.1_if.back.9, %if.back.9 ], [ 1518500249, %if.then.8 ]
%var377 = call i32 @rotate_left(i32 %a.1_for.cond.7, i32 5)
%var376 = call i32 @add(i32 %var377, i32 %e.1_for.cond.7)
%var380 = call i32 @add(i32 %f.1_if.back.8, i32 %k.1_if.back.8)
%var375 = call i32 @add(i32 %var376, i32 %var380)
%var383 = load ptr, ptr @chunks
%var385 = getelementptr ptr, ptr %var383, i32 %i.3_for.cond.5
%var386 = load ptr, ptr %var385
%var388 = getelementptr i32, ptr %var386, i32 %j.1_for.cond.7
%var389 = load i32, ptr %var388
%var374 = call i32 @add(i32 %var375, i32 %var389)
%var395 = call i32 @rotate_left(i32 %b.1_for.cond.7, i32 30)
br label %for.step.7

for.step.7:
%var402 = add i32 %j.1_for.cond.7, 1
br label %for.cond.7

for.back.7:
%var404 = call i32 @add(i32 %h0.1_for.cond.5, i32 %a.1_for.cond.7)
%var408 = call i32 @add(i32 %h1.1_for.cond.5, i32 %b.1_for.cond.7)
%var412 = call i32 @add(i32 %h2.1_for.cond.5, i32 %c.1_for.cond.7)
%var416 = call i32 @add(i32 %h3.1_for.cond.5, i32 %d.1_for.cond.7)
%var420 = call i32 @add(i32 %h4.1_for.cond.5, i32 %e.1_for.cond.7)
br label %for.step.5

for.step.5:
%var424 = add i32 %i.3_for.cond.5, 1
br label %for.cond.5

for.back.5:
%var425 = load ptr, ptr @outputBuffer
%var426 = getelementptr i32, ptr %var425, i32 0
store i32 %h0.1_for.cond.5, ptr %var426
%var429 = load ptr, ptr @outputBuffer
%var430 = getelementptr i32, ptr %var429, i32 1
store i32 %h1.1_for.cond.5, ptr %var430
%var433 = load ptr, ptr @outputBuffer
%var434 = getelementptr i32, ptr %var433, i32 2
store i32 %h2.1_for.cond.5, ptr %var434
%var437 = load ptr, ptr @outputBuffer
%var438 = getelementptr i32, ptr %var437, i32 3
store i32 %h3.1_for.cond.5, ptr %var438
%var441 = load ptr, ptr @outputBuffer
%var442 = getelementptr i32, ptr %var441, i32 4
store i32 %h4.1_for.cond.5, ptr %var442
%var445 = load ptr, ptr @outputBuffer
ret ptr %var445

}
define ptr @int2chr(i32 %x) {
entry:
%var50 = icmp sge i32 %x, 32
br i1 %var50, label %land.next..3, label %entry_and_land.end..3

land.next..3:
%var53 = icmp sle i32 %x, 126
br label %land.end..3

land.end..3:
%var51_land.end..3 = phi i1 [ %var50, %entry_and_land.end..3 ], [ %var53, %land.next..3 ]
br i1 %var51_land.end..3, label %if.then.3, label %if.else.3

if.then.3:
%var55 = load ptr, ptr @asciiTable
%var57 = sub i32 %x, 32
%var59 = sub i32 %x, 31
%var60 = call ptr @string.substring(ptr %var55, i32 %var57, i32 %var59)
ret ptr %var60

if.else.3:
br label %if.back.3

if.back.3:
ret ptr @.str..1

entry_and_land.end..3:
br label %land.end..3

}
define i1 @array_equal(ptr %a, ptr %b) {
entry:
%var514 = call i32 @array.size(ptr %a)
%var516 = call i32 @array.size(ptr %b)
%var517 = icmp ne i32 %var514, %var516
br i1 %var517, label %if.then.15, label %if.else.15

if.then.15:
ret i1 false

if.else.15:
br label %if.back.15

if.back.15:
br label %for.cond.11

for.cond.11:
%i.6_for.cond.11 = phi i32 [ 0, %if.back.15 ], [ %var533, %for.step.11 ]
%var521 = call i32 @array.size(ptr %a)
%var522 = icmp slt i32 %i.6_for.cond.11, %var521
br i1 %var522, label %for.body.11, label %for.back.11

for.body.11:
%var525 = getelementptr i32, ptr %a, i32 %i.6_for.cond.11
%var526 = load i32, ptr %var525
%var529 = getelementptr i32, ptr %b, i32 %i.6_for.cond.11
%var530 = load i32, ptr %var529
%var531 = icmp ne i32 %var526, %var530
br i1 %var531, label %if.then.16, label %if.else.16

if.then.16:
ret i1 false

if.else.16:
br label %if.back.16

if.back.16:
br label %for.step.11

for.step.11:
%var533 = add i32 %i.6_for.cond.11, 1
br label %for.cond.11

for.back.11:
ret i1 true

}
define i32 @rotate_left(i32 %x, i32 %shift) {
entry:
%var90 = icmp eq i32 %shift, 1
br i1 %var90, label %if.then.5, label %if.else.5

if.then.5:
%var92 = and i32 %x, 2147483647
%var93 = shl i32 %var92, 1
%var95 = ashr i32 %x, 31
%var96 = and i32 %var95, 1
%var97 = or i32 %var93, %var96
ret i32 %var97

if.else.5:
br label %if.back.5

if.back.5:
%var99 = icmp eq i32 %shift, 31
br i1 %var99, label %if.then.6, label %if.else.6

if.then.6:
%var101 = and i32 %x, 1
%var102 = shl i32 %var101, 31
%var104 = ashr i32 %x, 1
%var105 = and i32 %var104, 2147483647
%var106 = or i32 %var102, %var105
ret i32 %var106

if.else.6:
br label %if.back.6

if.back.6:
%var109 = sub i32 32, %shift
%var110 = shl i32 1, %var109
%var111 = sub i32 %var110, 1
%var112 = and i32 %x, %var111
%var114 = shl i32 %var112, %shift
%var117 = sub i32 32, %shift
%var118 = ashr i32 %x, %var117
%var120 = shl i32 1, %shift
%var121 = sub i32 %var120, 1
%var122 = and i32 %var118, %var121
%var123 = or i32 %var114, %var122
ret i32 %var123

}
define i32 @lohi(i32 %lo, i32 %hi) {
entry:
%var147 = shl i32 %hi, 16
%var148 = or i32 %lo, %var147
ret i32 %var148

}
define void @__init() {
entry:
store ptr @.str..0, ptr @asciiTable
%var149 = load i32, ptr @MAXCHUNK
%var150 = sub i32 %var149, 1
%var151 = mul i32 %var150, 64
%var152 = sub i32 %var151, 16
store i32 %var152, ptr @MAXLENGTH
%var154 = load i32, ptr @MAXCHUNK
%var153 = call ptr @__array.alloca(i32 4, i32 2, i32 2, i32 %var154, i32 80)
store ptr %var153, ptr @chunks
%var156 = load i32, ptr @MAXLENGTH
%var155 = call ptr @__array.alloca(i32 4, i32 1, i32 1, i32 %var156)
store ptr %var155, ptr @inputBuffer
%var157 = call ptr @__array.alloca(i32 4, i32 1, i32 1, i32 5)
store ptr %var157, ptr @outputBuffer
ret void

}
define i32 @nextLetter(i32 %now) {
entry:
%var479 = icmp eq i32 %now, 122
br i1 %var479, label %if.then.11, label %if.else.11

if.then.11:
%var480 = sub i32 0, 1
ret i32 %var480

if.else.11:
br label %if.back.11

if.back.11:
%var482 = icmp eq i32 %now, 90
br i1 %var482, label %if.then.12, label %if.else.12

if.then.12:
ret i32 97

if.else.12:
br label %if.back.12

if.back.12:
%var484 = icmp eq i32 %now, 57
br i1 %var484, label %if.then.13, label %if.else.13

if.then.13:
ret i32 65

if.else.13:
br label %if.back.13

if.back.13:
%var486 = add i32 %now, 1
ret i32 %var486

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

