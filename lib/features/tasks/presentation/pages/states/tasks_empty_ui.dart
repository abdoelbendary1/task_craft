// features/tasks/presentation/pages/sections/tasks_empty_ui.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_craft/core/assets/app_assets.dart';

class TasksEmptyUI extends StatelessWidget {
  final VoidCallback onAddTaskPressed;

  const TasksEmptyUI({super.key, required this.onAddTaskPressed});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 160.h,
          width: 160.w,
          child: Image.asset(AppAssets.emptyIllustration), // استخدام نفس الـ illustration الخاصة بك
        ),
        SizedBox(height: 24.h),
        Text(
          'No tasks inside this workspace',
          textAlign: TextAlign.center,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onSurface,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          'Break down your project into simple actionable checklist items to coordinate and measure output effectively.',
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.hintColor,
            height: 1.4,
          ),
        ),
        SizedBox(height: 24.h),
        ElevatedButton.icon(
          onPressed: onAddTaskPressed,
          icon: const Icon(Icons.add, color: Colors.white),
          label: const Text("Create First Task"),
          style: ElevatedButton.styleFrom(
            minimumSize: Size(200.w, 48.h),
          ),
        )
      ],
    );
  }
}