import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_craft/core/helpers/extentions.dart';

class StartNewInitiativeCard extends StatelessWidget {
  final String? description;
  final String? buttonText;
  final IconData? icon;
  final VoidCallback? onTap;
  const StartNewInitiativeCard({
    super.key,
    this.description = "Create a new project workspace for your team.",
    this.buttonText = "Start a new project",
    this.icon = Icons.add,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 28.h, horizontal: 8.w),
        decoration: BoxDecoration(
          color: theme.primaryColor.withOpacity(0.02),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: theme.primaryColor.withOpacity(0.25),
            width: 1.5.w,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 22.r,
              backgroundColor: theme.colorScheme.surface,
              child: Icon(icon, color: theme.primaryColor, size: 24.r),
            ),
            8.vSpace,
            Text(
              buttonText!,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            4.vSpace,
            Text(
              description!,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.hintColor.withOpacity(0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
