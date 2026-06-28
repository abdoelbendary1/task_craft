import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_craft/features/tasks/presentation/bloc/tasks_bloc.dart';

// 1️⃣ هنا قمنا بإضافة implements PreferredSizeWidget
class TaskListScreenAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String projectTitle;
  
  const TaskListScreenAppbar({super.key, required this.projectTitle});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      backgroundColor: theme.scaffoldBackgroundColor,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new),
        onPressed: () => Navigator.pop(context),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            projectTitle,
            style: theme.textTheme.titleLarge?.copyWith(
              color: theme.colorScheme.onSurface,
              fontWeight: FontWeight.bold,
            ),
          ),
          BlocBuilder<ProjectTasksBloc, ProjectTasksState>(
            builder: (context, state) {
              final count = state.maybeWhen(
                loaded: (tasks, activeTasks, completedTasks, selectedPriority) => '${tasks.length} Tasks Total',
                orElse: () => '0 Tasks Total',
              );
              return Text(count, style: theme.textTheme.bodySmall);
            },
          ),
        ],
      ),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: CircleAvatar(
            radius: 18.r,
            backgroundImage: const NetworkImage('https://i.imgur.com/Cx73ftR.png'),
          ),
        ),
      ],
    );
  }

  // 2️⃣ هذا هو السطر السحري المطلوب لتحديد الارتفاع القياسي للـ AppBar
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}