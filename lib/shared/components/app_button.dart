import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_craft/core/theme/app_colors.dart';

enum AppButtonVariant { filled, text }

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final bool isLoading;
  final Color? backgroundColor;
  final Color? textColor;
  final double? height;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.variant = AppButtonVariant.filled,
    this.isLoading = false,
    this.backgroundColor,
    this.textColor,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final isFilled = variant == AppButtonVariant.filled;
    final defaultBgColor = backgroundColor ?? AppColors.primary;
    final defaultTextColor =
        textColor ?? (isFilled ? Colors.white : const Color(0xFF334155));

    // Common Text Configuration
    final textWidget = Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: onPressed == null
            ? defaultTextColor.withOpacity(0.5)
            : defaultTextColor,
        fontSize: isFilled ? 16.sp : 18.sp,
        fontWeight: FontWeight.w700,
      ),
    );

    // Loader configuration
    final content = isLoading
        ? SizedBox(
            height: 20.w,
            width: 20.w,
            child: CircularProgressIndicator(
              strokeWidth: 2.5,
              valueColor: AlwaysStoppedAnimation<Color>(defaultTextColor),
            ),
          )
        : textWidget;

    if (isFilled) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: defaultBgColor,
          disabledBackgroundColor: defaultBgColor.withOpacity(0.4),
          elevation: 0,
          minimumSize: Size(double.infinity, height ?? 56.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
        onPressed: isLoading ? null : onPressed,
        child: content,
      );
    }

    return TextButton(
      style: TextButton.styleFrom(
        minimumSize: Size(double.infinity, height ?? 56.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
      onPressed: isLoading ? null : onPressed,
      child: content,
    );
  }
}
