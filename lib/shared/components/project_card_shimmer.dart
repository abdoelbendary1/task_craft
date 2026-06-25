import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:task_craft/core/helpers/extentions.dart';
import 'package:task_craft/core/theme/app_colors.dart';

class ProjectCardShimmer extends StatelessWidget {
  const ProjectCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    // إعداد ألوان الـ Shimmer المتوافقة مع التطبيق
    final baseColor = Colors.grey[300]!;
    final highlightColor = Colors.grey[100]!;

    return Card(
      elevation: 0,
      margin: EdgeInsets.only(bottom: 16.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
        side: BorderSide(color: AppColors.borderLight, width: 1.w),
      ),
      // 🟢 خلفية الكارت وجسمه الخارجي ثابت بلونه الأصلي ولا يلمع
      color: AppColors.surfaceWhite,
      child: Padding(
        padding: EdgeInsets.all(18.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _HeaderShimmer(
              baseColor: baseColor,
              highlightColor: highlightColor,
            ),
            14.vSpace,
            _TitleShimmer(baseColor: baseColor, highlightColor: highlightColor),
            8.vSpace,
            _DescriptionShimmer(
              baseColor: baseColor,
              highlightColor: highlightColor,
            ),
            20.vSpace,
            _BottomTrayShimmer(
              baseColor: baseColor,
              highlightColor: highlightColor,
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================================================
// 🟢 أقسام الـ Shimmer الداخلية المستقلة لعدم تداخل حركة الإضاءة
// ==========================================================================

class _HeaderShimmer extends StatelessWidget {
  final Color baseColor;
  final Color highlightColor;
  const _HeaderShimmer({required this.baseColor, required this.highlightColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Shimmer.fromColors(
          baseColor: baseColor,
          highlightColor: highlightColor,
          child: Container(
            width: 80.w,
            height: 24.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
        ),
        const Icon(Icons.more_vert, color: AppColors.borderLight),
      ],
    );
  }
}

class _TitleShimmer extends StatelessWidget {
  final Color baseColor;
  final Color highlightColor;
  const _TitleShimmer({required this.baseColor, required this.highlightColor});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Container(
        width: 180.w,
        height: 20.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4.r),
        ),
      ),
    );
  }
}

class _DescriptionShimmer extends StatelessWidget {
  final Color baseColor;
  final Color highlightColor;
  const _DescriptionShimmer({
    required this.baseColor,
    required this.highlightColor,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 14.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
          6.vSpace,
          Container(
            width: 230.w,
            height: 14.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomTrayShimmer extends StatelessWidget {
  final Color baseColor;
  final Color highlightColor;
  const _BottomTrayShimmer({
    required this.baseColor,
    required this.highlightColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Shimmer.fromColors(
          baseColor: baseColor,
          highlightColor: highlightColor,
          child: Row(
            children: [
              Container(
                width: 28.w,
                height: 28.h,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 4.w),
              Container(
                width: 28.w,
                height: 28.h,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ),
        Shimmer.fromColors(
          baseColor: baseColor,
          highlightColor: highlightColor,
          child: Row(
            children: [
              Container(
                width: 14.w,
                height: 14.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(3.r),
                ),
              ),
              SizedBox(width: 6.w),
              Container(
                width: 100.w,
                height: 14.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
