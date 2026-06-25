import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppChoiceChip<T> extends StatelessWidget {
  final String label;
  final T chipValue;
  final T selectedValue;
  final ValueChanged<T> onChanged;

  final Color? activeColor;
  final Color? activeTextColor;
  final Color? inactiveColor;
  final Color? inactiveTextColor;

  const AppChoiceChip({
    super.key,
    required this.label,
    required this.chipValue,
    required this.selectedValue,
    required this.onChanged,
    this.activeColor,
    this.activeTextColor,
    this.inactiveColor,
    this.inactiveTextColor,
  });

  bool get _isActive => chipValue == selectedValue;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final resolvedBgColor = _isActive
        ? (activeColor ?? const Color(0xFFEAF0FF))
        : (inactiveColor ?? Colors.white);

    final resolvedBorderColor = _isActive
        ? (activeTextColor ?? const Color(0xFF1D3DB5))
        : const Color(0xFFCBD5E1);

    final resolvedTextColor = _isActive
        ? (activeTextColor ?? const Color(0xFF1D3DB5))
        : (inactiveTextColor ?? const Color(0xFF475569));

    return GestureDetector(
      onTap: () => onChanged(chipValue),
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: resolvedBgColor,
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(color: resolvedBorderColor, width: 1.w),
        ),
        child: Text(
          label,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: resolvedTextColor,
            fontSize: 12.sp,
            fontWeight: _isActive ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
