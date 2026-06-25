import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_craft/core/assets/app_assets.dart';
import 'package:task_craft/core/helpers/extentions.dart';
import 'package:task_craft/features/home/presentation/widgets/start_initial_project_card.dart';

class ProjectsEmptyUI extends StatelessWidget {
  final VoidCallback? onCreateProjectPressed;

  const ProjectsEmptyUI({super.key, this.onCreateProjectPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const _EmptyStateIllustration(),
        SizedBox(height: 32.h),
        const _EmptyStateTextSection(),
        SizedBox(height: 24.h),            const StartNewInitiativeCard(),
    
        // _EmptyStateActionButton(onPressed: onCreateProjectPressed),
        // SizedBox(height: 32.h),
        // const _QuickStartDivider(),
      ],
    ).px(defaultHorizontal: 16);
  }
}


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


