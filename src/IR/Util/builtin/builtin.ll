; ModuleID = 'builtin.c'
source_filename = "builtin.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-unknown-unknown-elf"

@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.4 = private unnamed_addr constant [5 x i8] c"true\00", align 1
@.str.5 = private unnamed_addr constant [6 x i8] c"false\00", align 1

; Function Attrs: nounwind
define dso_local void @print(ptr noundef %0) local_unnamed_addr #0 {
  %2 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull @.str, ptr noundef %0) #12
  ret void
}

declare dso_local i32 @printf(ptr noundef, ...) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local void @println(ptr noundef %0) local_unnamed_addr #0 {
  %2 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.1, ptr noundef %0) #12
  ret void
}

; Function Attrs: nounwind
define dso_local void @printInt(i32 noundef %0) local_unnamed_addr #0 {
  %2 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.2, i32 noundef %0) #12
  ret void
}

; Function Attrs: nounwind
define dso_local void @printlnInt(i32 noundef %0) local_unnamed_addr #0 {
  %2 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.3, i32 noundef %0) #12
  ret void
}

; Function Attrs: nofree nounwind
define dso_local i32 @getInt() local_unnamed_addr #2 {
  %1 = alloca i32, align 4
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %1) #13
  %2 = call i32 (ptr, ...) @scanf(ptr noundef nonnull @.str.2, ptr noundef nonnull %1) #14
  %3 = load i32, ptr %1, align 4, !tbaa !4
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %1) #13
  ret i32 %3
}

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #3

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @scanf(ptr nocapture noundef readonly, ...) local_unnamed_addr #4

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #3

; Function Attrs: nofree nounwind
define dso_local ptr @getString() local_unnamed_addr #2 {
  %1 = tail call dereferenceable_or_null(256) ptr @malloc(i32 noundef 256) #14
  %2 = tail call i32 (ptr, ...) @scanf(ptr noundef nonnull @.str, ptr noundef %1) #14
  ret ptr %1
}

; Function Attrs: inaccessiblememonly mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0)
declare dso_local noalias noundef ptr @malloc(i32 noundef) local_unnamed_addr #5

; Function Attrs: nofree nounwind
define dso_local noalias ptr @toString(i32 noundef %0) local_unnamed_addr #2 {
  %2 = tail call dereferenceable_or_null(16) ptr @malloc(i32 noundef 16) #14
  %3 = tail call i32 (ptr, ptr, ...) @sprintf(ptr noundef nonnull dereferenceable(1) %2, ptr noundef nonnull @.str.2, i32 noundef %0) #14
  ret ptr %2
}

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @sprintf(ptr noalias nocapture noundef writeonly, ptr nocapture noundef readonly, ...) local_unnamed_addr #4

; Function Attrs: nounwind
define dso_local ptr @string.copy(ptr noundef %0) local_unnamed_addr #0 {
  %2 = tail call i32 @strlen(ptr noundef nonnull dereferenceable(1) %0) #14
  %3 = add nsw i32 %2, 1
  %4 = tail call ptr @malloc(i32 noundef %3) #14
  %5 = tail call ptr @memcpy(ptr noundef %4, ptr noundef %0, i32 noundef %2) #12
  %6 = getelementptr inbounds i8, ptr %4, i32 %2
  store i8 0, ptr %6, align 1, !tbaa !8
  ret ptr %4
}

; Function Attrs: argmemonly mustprogress nofree nounwind readonly willreturn
declare dso_local i32 @strlen(ptr nocapture noundef) local_unnamed_addr #6

declare dso_local ptr @memcpy(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: argmemonly mustprogress nofree nounwind readonly willreturn
define dso_local i32 @string.length(ptr nocapture noundef readonly %0) local_unnamed_addr #7 {
  %2 = tail call i32 @strlen(ptr noundef nonnull dereferenceable(1) %0) #14
  ret i32 %2
}

; Function Attrs: nofree nounwind
define dso_local noalias ptr @string.substring(ptr nocapture noundef readonly %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #2 {
  %4 = sub nsw i32 %2, %1
  %5 = add nsw i32 %4, 1
  %6 = tail call ptr @malloc(i32 noundef %5) #14
  %7 = icmp sgt i32 %4, 0
  br i1 %7, label %10, label %8

8:                                                ; preds = %10, %3
  %9 = getelementptr inbounds i8, ptr %6, i32 %4
  store i8 0, ptr %9, align 1, !tbaa !8
  ret ptr %6

10:                                               ; preds = %3, %10
  %11 = phi i32 [ %16, %10 ], [ 0, %3 ]
  %12 = add nsw i32 %11, %1
  %13 = getelementptr inbounds i8, ptr %0, i32 %12
  %14 = load i8, ptr %13, align 1, !tbaa !8
  %15 = getelementptr inbounds i8, ptr %6, i32 %11
  store i8 %14, ptr %15, align 1, !tbaa !8
  %16 = add nuw nsw i32 %11, 1
  %17 = icmp eq i32 %16, %4
  br i1 %17, label %8, label %10, !llvm.loop !9
}

; Function Attrs: nofree nounwind
define dso_local i32 @string.parseInt(ptr nocapture noundef readonly %0) local_unnamed_addr #2 {
  %2 = alloca i32, align 4
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %2) #13
  %3 = call i32 (ptr, ptr, ...) @sscanf(ptr noundef %0, ptr noundef nonnull @.str.2, ptr noundef nonnull %2) #14
  %4 = load i32, ptr %2, align 4, !tbaa !4
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %2) #13
  ret i32 %4
}

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @sscanf(ptr nocapture noundef readonly, ptr nocapture noundef readonly, ...) local_unnamed_addr #4

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind readonly willreturn
define dso_local i32 @string.ord(ptr nocapture noundef readonly %0, i32 noundef %1) local_unnamed_addr #8 {
  %3 = getelementptr inbounds i8, ptr %0, i32 %1
  %4 = load i8, ptr %3, align 1, !tbaa !8
  %5 = zext i8 %4 to i32
  ret i32 %5
}

; Function Attrs: nounwind
define dso_local ptr @string.add(ptr noundef %0, ptr noundef %1) local_unnamed_addr #0 {
  %3 = tail call i32 @strlen(ptr noundef nonnull dereferenceable(1) %0) #14
  %4 = tail call i32 @strlen(ptr noundef nonnull dereferenceable(1) %1) #14
  %5 = add nsw i32 %4, %3
  %6 = add nsw i32 %5, 1
  %7 = tail call ptr @malloc(i32 noundef %6) #14
  %8 = tail call ptr @memcpy(ptr noundef %7, ptr noundef %0, i32 noundef %3) #12
  %9 = getelementptr inbounds i8, ptr %7, i32 %3
  %10 = tail call ptr @memcpy(ptr noundef %9, ptr noundef %1, i32 noundef %4) #12
  %11 = getelementptr inbounds i8, ptr %7, i32 %5
  store i8 0, ptr %11, align 1, !tbaa !8
  ret ptr %7
}

; Function Attrs: argmemonly mustprogress nofree nounwind readonly willreturn
define dso_local zeroext i1 @string.equal(ptr nocapture noundef readonly %0, ptr nocapture noundef readonly %1) local_unnamed_addr #7 {
  %3 = tail call i32 @strcmp(ptr noundef nonnull dereferenceable(1) %0, ptr noundef nonnull dereferenceable(1) %1) #14
  %4 = icmp eq i32 %3, 0
  ret i1 %4
}

; Function Attrs: argmemonly mustprogress nofree nounwind readonly willreturn
declare dso_local i32 @strcmp(ptr nocapture noundef, ptr nocapture noundef) local_unnamed_addr #6

; Function Attrs: argmemonly mustprogress nofree nounwind readonly willreturn
define dso_local zeroext i1 @string.notEqual(ptr nocapture noundef readonly %0, ptr nocapture noundef readonly %1) local_unnamed_addr #7 {
  %3 = tail call i32 @strcmp(ptr noundef nonnull dereferenceable(1) %0, ptr noundef nonnull dereferenceable(1) %1) #14
  %4 = icmp ne i32 %3, 0
  ret i1 %4
}

; Function Attrs: argmemonly mustprogress nofree nounwind readonly willreturn
define dso_local zeroext i1 @string.less(ptr nocapture noundef readonly %0, ptr nocapture noundef readonly %1) local_unnamed_addr #7 {
  %3 = tail call i32 @strcmp(ptr noundef nonnull dereferenceable(1) %0, ptr noundef nonnull dereferenceable(1) %1) #14
  %4 = icmp slt i32 %3, 0
  ret i1 %4
}

; Function Attrs: argmemonly mustprogress nofree nounwind readonly willreturn
define dso_local zeroext i1 @string.lessOrEqual(ptr nocapture noundef readonly %0, ptr nocapture noundef readonly %1) local_unnamed_addr #7 {
  %3 = tail call i32 @strcmp(ptr noundef nonnull dereferenceable(1) %0, ptr noundef nonnull dereferenceable(1) %1) #14
  %4 = icmp slt i32 %3, 1
  ret i1 %4
}

; Function Attrs: argmemonly mustprogress nofree nounwind readonly willreturn
define dso_local zeroext i1 @string.greater(ptr nocapture noundef readonly %0, ptr nocapture noundef readonly %1) local_unnamed_addr #7 {
  %3 = tail call i32 @strcmp(ptr noundef nonnull dereferenceable(1) %0, ptr noundef nonnull dereferenceable(1) %1) #14
  %4 = icmp sgt i32 %3, 0
  ret i1 %4
}

; Function Attrs: argmemonly mustprogress nofree nounwind readonly willreturn
define dso_local zeroext i1 @string.greaterOrEqual(ptr nocapture noundef readonly %0, ptr nocapture noundef readonly %1) local_unnamed_addr #7 {
  %3 = tail call i32 @strcmp(ptr noundef nonnull dereferenceable(1) %0, ptr noundef nonnull dereferenceable(1) %1) #14
  %4 = icmp sgt i32 %3, -1
  ret i1 %4
}

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind readonly willreturn
define dso_local i32 @array.size(ptr nocapture noundef readonly %0) local_unnamed_addr #8 {
  %2 = getelementptr inbounds i32, ptr %0, i32 -1
  %3 = load i32, ptr %2, align 4, !tbaa !4
  ret i32 %3
}

; Function Attrs: mustprogress nofree nounwind willreturn
define dso_local noalias ptr @_malloc(i32 noundef %0) local_unnamed_addr #9 {
  %2 = tail call ptr @malloc(i32 noundef %0) #14
  ret ptr %2
}

; Function Attrs: mustprogress nofree nounwind willreturn
define dso_local noalias nonnull ptr @__alloca_helper(i32 noundef %0, i32 noundef %1) local_unnamed_addr #9 {
  %3 = mul nsw i32 %1, %0
  %4 = add nsw i32 %3, 4
  %5 = tail call ptr @malloc(i32 noundef %4) #14
  store i32 %1, ptr %5, align 4, !tbaa !4
  %6 = getelementptr inbounds i32, ptr %5, i32 1
  ret ptr %6
}

; Function Attrs: nofree nounwind
define dso_local noalias nonnull ptr @__array.alloca_inside(i32 noundef %0, i32 noundef %1, ptr nocapture noundef readonly %2, i32 noundef %3) local_unnamed_addr #2 {
  %5 = icmp eq i32 %1, 1
  br i1 %5, label %6, label %12

6:                                                ; preds = %4
  %7 = load i32, ptr %2, align 4, !tbaa !4
  %8 = mul nsw i32 %7, %0
  %9 = add nsw i32 %8, 4
  %10 = tail call ptr @malloc(i32 noundef %9) #14
  store i32 %7, ptr %10, align 4, !tbaa !4
  %11 = getelementptr inbounds i32, ptr %10, i32 1
  br label %32

12:                                               ; preds = %4
  %13 = icmp ne i32 %3, 1
  %14 = load i32, ptr %2, align 4, !tbaa !4
  %15 = shl nsw i32 %14, 2
  %16 = add nsw i32 %15, 4
  %17 = tail call ptr @malloc(i32 noundef %16) #14
  store i32 %14, ptr %17, align 4, !tbaa !4
  %18 = getelementptr inbounds i32, ptr %17, i32 1
  %19 = icmp sgt i32 %14, 0
  %20 = select i1 %13, i1 %19, i1 false
  br i1 %20, label %21, label %32

21:                                               ; preds = %12
  %22 = add nsw i32 %1, -1
  %23 = getelementptr inbounds i32, ptr %2, i32 1
  %24 = add nsw i32 %3, -1
  br label %25

25:                                               ; preds = %21, %25
  %26 = phi i32 [ 0, %21 ], [ %29, %25 ]
  %27 = tail call ptr @__array.alloca_inside(i32 noundef %0, i32 noundef %22, ptr noundef nonnull %23, i32 noundef %24) #14
  %28 = getelementptr inbounds ptr, ptr %18, i32 %26
  store ptr %27, ptr %28, align 4, !tbaa !11
  %29 = add nuw nsw i32 %26, 1
  %30 = load i32, ptr %2, align 4, !tbaa !4
  %31 = icmp slt i32 %29, %30
  br i1 %31, label %25, label %32, !llvm.loop !13

32:                                               ; preds = %25, %12, %6
  %33 = phi ptr [ %11, %6 ], [ %18, %12 ], [ %18, %25 ]
  ret ptr %33
}

; Function Attrs: nofree nounwind
define dso_local noalias nonnull ptr @__array.alloca(i32 noundef %0, i32 noundef %1, i32 noundef %2, ...) local_unnamed_addr #2 {
  %4 = alloca ptr, align 4
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %4) #13
  %5 = shl i32 %2, 2
  %6 = tail call ptr @malloc(i32 noundef %5) #14
  call void @llvm.va_start(ptr nonnull %4)
  %7 = icmp sgt i32 %2, 0
  br i1 %7, label %8, label %10

8:                                                ; preds = %3
  %9 = load ptr, ptr %4, align 4
  br label %12

10:                                               ; preds = %12, %3
  call void @llvm.va_end(ptr nonnull %4)
  %11 = call ptr @__array.alloca_inside(i32 noundef %0, i32 noundef %1, ptr noundef %6, i32 noundef %2) #14
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %4) #13
  ret ptr %11

12:                                               ; preds = %8, %12
  %13 = phi ptr [ %15, %12 ], [ %9, %8 ]
  %14 = phi i32 [ %18, %12 ], [ 0, %8 ]
  %15 = getelementptr inbounds i8, ptr %13, i32 4
  store ptr %15, ptr %4, align 4
  %16 = load i32, ptr %13, align 4
  %17 = getelementptr inbounds i32, ptr %6, i32 %14
  store i32 %16, ptr %17, align 4, !tbaa !4
  %18 = add nuw nsw i32 %14, 1
  %19 = icmp eq i32 %18, %2
  br i1 %19, label %10, label %12, !llvm.loop !14
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.va_start(ptr) #10

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.va_end(ptr) #10

; Function Attrs: nofree nounwind
define dso_local noalias ptr @Int_toString(i32 noundef %0) local_unnamed_addr #2 {
  %2 = tail call dereferenceable_or_null(10) ptr @malloc(i32 noundef 10) #14
  %3 = tail call i32 (ptr, ptr, ...) @sprintf(ptr noundef nonnull dereferenceable(1) %2, ptr noundef nonnull @.str.2, i32 noundef %0) #14
  ret ptr %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define dso_local nonnull ptr @Bool_toString(i1 noundef zeroext %0) local_unnamed_addr #11 {
  %2 = select i1 %0, ptr @.str.4, ptr @.str.5
  ret ptr %2
}

attributes #0 = { nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtin-memcpy" "no-builtin-printf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+a,+c,+m,+relax,-save-restore" }
attributes #1 = { "frame-pointer"="none" "no-builtin-memcpy" "no-builtin-printf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+a,+c,+m,+relax,-save-restore" }
attributes #2 = { nofree nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtin-memcpy" "no-builtin-printf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+a,+c,+m,+relax,-save-restore" }
attributes #3 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #4 = { nofree nounwind "frame-pointer"="none" "no-builtin-memcpy" "no-builtin-printf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+a,+c,+m,+relax,-save-restore" }
attributes #5 = { inaccessiblememonly mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) "alloc-family"="malloc" "frame-pointer"="none" "no-builtin-memcpy" "no-builtin-printf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+a,+c,+m,+relax,-save-restore" }
attributes #6 = { argmemonly mustprogress nofree nounwind readonly willreturn "frame-pointer"="none" "no-builtin-memcpy" "no-builtin-printf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+a,+c,+m,+relax,-save-restore" }
attributes #7 = { argmemonly mustprogress nofree nounwind readonly willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtin-memcpy" "no-builtin-printf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+a,+c,+m,+relax,-save-restore" }
attributes #8 = { argmemonly mustprogress nofree norecurse nosync nounwind readonly willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtin-memcpy" "no-builtin-printf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+a,+c,+m,+relax,-save-restore" }
attributes #9 = { mustprogress nofree nounwind willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtin-memcpy" "no-builtin-printf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+a,+c,+m,+relax,-save-restore" }
attributes #10 = { mustprogress nocallback nofree nosync nounwind willreturn }
attributes #11 = { mustprogress nofree norecurse nosync nounwind readnone willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtin-memcpy" "no-builtin-printf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+a,+c,+m,+relax,-save-restore" }
attributes #12 = { nobuiltin nounwind "no-builtin-memcpy" "no-builtin-printf" }
attributes #13 = { nounwind }
attributes #14 = { "no-builtin-memcpy" "no-builtin-printf" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"ilp32"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"Ubuntu clang version 15.0.7"}
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!6, !6, i64 0}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
!11 = !{!12, !12, i64 0}
!12 = !{!"any pointer", !6, i64 0}
!13 = distinct !{!13, !10}
!14 = distinct !{!14, !10}
