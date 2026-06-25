import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StartNewInitiativeCard extends StatelessWidget {
  const StartNewInitiativeCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(top: 8.h, bottom: 24.h),
      padding: EdgeInsets.symmetric(vertical: 28.h, horizontal: 16.w),
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
            child: Icon(Icons.add, color: theme.primaryColor, size: 24.r),
          ),
          SizedBox(height: 14.h),
          Text(
            'Start New Initiative',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            'Create a new project workspace for your team.',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.hintColor.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }
}
