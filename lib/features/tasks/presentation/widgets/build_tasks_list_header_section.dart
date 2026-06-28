import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_craft/core/enum/task_status.dart';
import 'package:task_craft/features/tasks/domain/entities/task_entity.dart';
import 'package:task_craft/features/tasks/presentation/bloc/tasks_bloc.dart';
import 'package:task_craft/shared/components/app_dropdown.dart';

class BuildTasksListHeaderSection extends StatelessWidget {
  final String title;
  final int count;
  final List<TaskEntity>? tasks;
  final bool? showSort;
  const BuildTasksListHeaderSection({
    super.key,
    required this.title,
    required this.count,
    required this.tasks,
    this.showSort,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<ProjectTasksBloc, ProjectTasksState>(
      builder: (context, state) {
        final selectedPriority = state.maybeWhen(
          loaded: (tasks, activeTasks, completedTasks, selectedPriority) =>
              selectedPriority,
          orElse: () => null,
        );
        return Padding(
          padding: EdgeInsets.only(top: 16.h, bottom: 8.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 2.h,
                    ),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Text(
                      "$count",
                      style: TextStyle(
                        color: theme.primaryColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
             Visibility(
  visible: showSort ?? false,
  child: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      // 1. القائمة المخصصة للاختيار
      AppDropdownMenu<TaskPriority>(
        items: TaskPriority.values
            .map((e) => AppDropdownItem(value: e, label: e.label))
            .toList(),
        // 💡 نمرر قيمة افتراضية للـ Dropdown الـ internal فقط لكي لا يعترض في الـ Highlight إذا كانت القيمة الحالية null
        selectedValue: selectedPriority ?? TaskPriority.low,
        onSelected: (TaskPriority value) {
          context.read<ProjectTasksBloc>().add(
                ProjectTasksEvent.sortByPriority(
                  priority: value,
                  tasks: tasks,
                ),
              );
        },
        customTrigger: Row(
          children: [
            Icon(
              Icons.keyboard_arrow_down,
              size: 16.r,
              color: theme.primaryColor,
            ),
            Text(
              // 🟢 سطر الـ UX الممتاز الخاص بك جاهز بالفعل! لو null سيعرض "Sort by Priority"
              "Sort by ${selectedPriority?.label ?? "Priority"} ",
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                color: theme.primaryColor,
              ),
            ),
          ],
        ),
      ),

      // 2. 🟢 زر الـ Reset الفوري: يظهر فقط إذا كان هناك فلتر مفعل لإلغائه
      if (selectedPriority != null) ...[
        SizedBox(width: 4.w),
        GestureDetector(
          onTap: () {
            context.read<ProjectTasksBloc>().add(
                  ProjectTasksEvent.sortByPriority(
                    priority: null, // 💡 إرسال null لإلغاء الفلترة وعرض كل التاسكات
                    tasks: tasks,
                  ),
                );
          },
          child: Icon(
            Icons.cancel, // أيقونة إغلاق صغيرة ونظيفة بجانب النص
            size: 16.r,
            color: Colors.redAccent,
          ),
        ),
      ],
    ],
  ),
),
            ],
          ),
        );
      },
    );
  }
}
