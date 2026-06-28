import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_craft/core/theme/app_colors.dart';
import 'package:task_craft/shared/components/app_button.dart';

class ActionButtons extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onCreate;
  final bool
  isCreating; // 💡 Bonus parameter to pass downstream when saving triggers network hits

  const ActionButtons({
    super.key,
    required this.onCancel,
    required this.onCreate,
    this.isCreating = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.scaffoldBackground,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            Expanded(
              child: AppButton(
                text: 'Cancel',
                variant: AppButtonVariant.text,
                onPressed: onCancel,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              flex: 2,
              child: AppButton(
                text: 'Create Task',
                variant: AppButtonVariant.filled,
                isLoading: isCreating,
                onPressed: onCreate,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
