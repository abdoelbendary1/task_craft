import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_craft/core/helpers/extentions.dart';
import 'package:task_craft/core/theme/app_colors.dart';

class LoginHeaderSection extends StatelessWidget {
  final bool isSignUpMode;
  const LoginHeaderSection({super.key, required this.isSignUpMode});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Column(
      children: [
        Text(
          "Task Craft",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: theme.colorScheme.primary,
            fontSize: 48.sp,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.5,
          ),
        ),
        8.vSpace,
        Text(
          isSignUpMode
              ? "Create your new workspace to start tracking your momentum."
              : "Log in to your workspace to continue managing your professional momentum.",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isDark ? AppColors.darkTextMuted : AppColors.titleGrey,
            fontSize: 16.sp,
            height: 1.3,
          ),
        ),
      ],
    );
  }
}
