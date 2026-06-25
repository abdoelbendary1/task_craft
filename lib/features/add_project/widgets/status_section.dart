import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_craft/core/enum/project_status.dart';
import 'package:task_craft/core/enum/task_priority.dart';
import 'package:task_craft/core/helpers/extentions.dart';
import 'package:task_craft/core/theme/app_colors.dart';
import 'package:task_craft/features/add_project/bloc/new_project_bloc.dart';
import 'package:task_craft/shared/components/app_choice_chip.dart';

class StatusSection extends StatelessWidget {
  const StatusSection({super.key});

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
            children: ProjectStatus.values.map((priority) {
              return BlocBuilder<NewProjectBloc, NewProjectState>(
                builder: (context, state) {
                  return AppChoiceChip<ProjectStatus>(
                    label: priority.name,
                    chipValue: priority,
                    selectedValue: ProjectStatus.values[state.project.statusId],

                    onChanged: (value) => context.read<NewProjectBloc>().add(
                      NewProjectEvent.statusIdChanged(value.id),
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
