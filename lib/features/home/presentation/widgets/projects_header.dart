import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProjectsHeader extends StatelessWidget {
  const ProjectsHeader({
    super.key,
    required this.onCreateProjectPressed,
  });

  final VoidCallback onCreateProjectPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Your Projects',
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
          ),
        ),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(120.w, 36.h),
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            backgroundColor: theme.colorScheme.secondary.withOpacity(0.4),
            foregroundColor: theme.primaryColor,
            elevation: 0,
          ),
          onPressed: onCreateProjectPressed,
          icon:  Icon(Icons.add, size: 16.r),
          label: Text('New Project', style: TextStyle(fontSize: 13.sp)),
        ),
      ],
    );
  }
}
