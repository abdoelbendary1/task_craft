import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardHeaderSection extends StatelessWidget {
  final String userName;
  final VoidCallback onSettingsPressed;
  final VoidCallback onCreateProjectPressed;

  const DashboardHeaderSection({
    super.key,
    required this.userName,
    required this.onSettingsPressed,
    required this.onCreateProjectPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 32.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20.r,
                  backgroundImage: const NetworkImage(
                    'https://i.pravatar.cc/150?img=11',
                  ),
                ),
                SizedBox(width: 12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Welcome back,', style: theme.textTheme.bodySmall),
                    Text(
                      userName,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            IconButton(
              icon: const Icon(Icons.settings_outlined),
              onPressed: onSettingsPressed,
              color: theme.colorScheme.onSurface,
            ),
          ],
        ),
        SizedBox(height: 32.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Your Projects',
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 24.sp,
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
              icon: const Icon(Icons.add, size: 16),
              label: Text('New Project', style: TextStyle(fontSize: 13.sp)),
            ),
          ],
        ),
        SizedBox(height: 32.h),
      ],
    );
  }
}
