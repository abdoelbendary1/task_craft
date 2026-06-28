import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_craft/core/enum/task_status.dart';
import 'package:task_craft/core/helpers/extentions.dart';
import 'package:task_craft/core/theme/app_colors.dart';
import 'package:task_craft/features/tasks/presentation/add_task/bloc/new_task_bloc.dart';
import 'package:task_craft/shared/components/app_choice_chip.dart';

class TaskPriortiesSection extends StatelessWidget {
  const TaskPriortiesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Status',
            style: TextStyle(
              color: AppColors.textMuted,
              fontSize: 12.sp,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.8,
            ),
          ),
          10.vSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: TaskPriority.values.map((priority) {
              return BlocBuilder<NewTaskBloc, NewTaskState>(
                builder: (context, state) {
                  return AppChoiceChip<TaskPriority>(
                    label: priority.name,
                    chipValue: priority,
                    selectedValue: state.task?.priority??TaskPriority.low,

                    onChanged: (value) => context.read<NewTaskBloc>().add(
                      NewTaskEvent.priorityChanged(value.id),
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
