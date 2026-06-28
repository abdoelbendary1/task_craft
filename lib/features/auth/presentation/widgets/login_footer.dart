import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_craft/core/theme/app_colors.dart';

class LoginFooterToggle extends StatelessWidget {
  final bool isSignUpMode;
  final VoidCallback onToggle;

  const LoginFooterToggle({super.key, required this.isSignUpMode, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          isSignUpMode ? "Already have an account? " : "New to Task Craft? ",
          style: TextStyle(color: theme.colorScheme.onSurface, fontSize: 15.sp),
        ),
        GestureDetector(
          onTap: onToggle,
          child: Text(
            isSignUpMode ? "Sign In" : "Create Account",
            style: TextStyle(
              color: theme.primaryColor,
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
