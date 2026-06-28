import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_craft/core/theme/app_colors.dart';

class BottomSheetInput extends StatelessWidget {
  final String hintText;
  void Function(String)? onChanged;

  BottomSheetInput({
    super.key,
    this.hintText = 'What needs to be done?',
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 100.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: TextField(
          autofocus: true,
          maxLines: null,
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 28.sp,
            fontWeight: FontWeight.w700,
          ),
          onChanged: onChanged,
          decoration: InputDecoration(
            fillColor: Colors.transparent,
            hintText: hintText,
            hintStyle: TextStyle(
              color: AppColors.primaryNavy.withOpacity(0.5),
              fontSize: 28.sp,
              fontWeight: FontWeight.w700,
            ),
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
        
            contentPadding: EdgeInsets.zero,
          ),
        ),
      ),
    );
  }
}
