import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_craft/core/assets/app_assets.dart';

class ProjectsEmptyUI extends StatelessWidget {
  final VoidCallback? onCreateProjectPressed;

  const ProjectsEmptyUI({super.key, this.onCreateProjectPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const _EmptyStateIllustration(),
          SizedBox(height: 32.h),
          const _EmptyStateTextSection(),
          SizedBox(height: 24.h),
          // _EmptyStateActionButton(onPressed: onCreateProjectPressed),
          // SizedBox(height: 32.h),
          // const _QuickStartDivider(),
        ],
      ),
    );
  }
}

// =========================================================================
// SUB-WIDGETS: Separated sections for modularity and readability
// =========================================================================

class _EmptyStateIllustration extends StatelessWidget {
  const _EmptyStateIllustration();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.h,
      width: 180.w,
      child: Image.asset(AppAssets.emptyIllustration),
    );
  }
}

class _EmptyStateTextSection extends StatelessWidget {
  const _EmptyStateTextSection();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Text(
          'No projects yet',
          textAlign: TextAlign.center,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onSurface,
          ),
        ),
        SizedBox(height: 12.h),
        Text(
          'Start by creating your first project workspace to organize your tasks and collaborate with your team.',
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.hintColor,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}

class _EmptyStateActionButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const _EmptyStateActionButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
        minimumSize: Size(180.w, 48.h),
        backgroundColor: theme.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.r),
        ),
        elevation: 2,
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.add_circle, size: 20.r, color: Colors.white),
          SizedBox(width: 8.w),
          Text(
            'New Project',
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickStartDivider extends StatelessWidget {
  const _QuickStartDivider();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Expanded(
          child: Divider(color: theme.colorScheme.secondary.withOpacity(0.5)),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            'QUICK START',
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.hintColor.withOpacity(0.6),
              letterSpacing: 1.5,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Divider(color: theme.colorScheme.secondary.withOpacity(0.5)),
        ),
      ],
    );
  }
}
