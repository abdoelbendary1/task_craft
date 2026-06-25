import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_craft/core/theme/app_colors.dart';

class DragHandle extends StatelessWidget {
  const DragHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 36.w,
        height: 4.h,
        decoration: BoxDecoration(
          color: AppColors.titleGrey,
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }
}
