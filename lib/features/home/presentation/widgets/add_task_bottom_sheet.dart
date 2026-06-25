import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_craft/core/helpers/extentions.dart';
import 'package:task_craft/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:task_craft/features/home/domain/entities/project_entity.dart';
import 'package:task_craft/shared/components/app_choice_chip.dart';

class AddTaskBottomSheet extends StatefulWidget {
  final Function(ProjectEntity) onTaskCreated;

  const AddTaskBottomSheet({super.key, required this.onTaskCreated});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  final TextEditingController _taskController = TextEditingController();
  String _selectedPriority = 'Medium';

  @override
  void dispose() {
    _taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 48.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: theme.colorScheme.secondary,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
          ),
          SizedBox(height: 24.h),
          Text(
            'What needs to be done?',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.h),
          TextField(
            controller: _taskController,
            autofocus: true,
            decoration: const InputDecoration(
              hintText: 'Enter task description...',
            ),
          ),
          SizedBox(height: 24.h),
          Text(
            'PRIORITY',
            style: theme.textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            children: ['Low', 'Medium', 'High'].map((priority) {
              return AppChoiceChip<String>(
                label: priority,
                value: priority,
                groupValue: _selectedPriority,
                onChanged: (val) => setState(() => _selectedPriority = val),
              ).pr(8);
            }).toList(),
          ),
          SizedBox(height: 32.h),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size(double.infinity, 52.h),
                    side: BorderSide(color: theme.colorScheme.secondary),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: theme.colorScheme.onSurface),
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    if (_taskController.text.trim().isNotEmpty) {
                      final authState = context.read<AuthBloc>().state;
                      authState.maybeWhen(
                        authenticated: (user) {
                          widget.onTaskCreated(
                            ProjectEntity(
                              title: _taskController.text.trim(),
                              statusId: 1,
                              creatorId: user.id,
                              description: "ssadsadsadsa dasdsa d",
                              profiles: {},
                            ),
                          );
                          Navigator.pop(context);
                        },
                        orElse: () => null,
                      );
                    }
                  },
                  child: const Text('Create Task'),
                ),
              ),
            ],
          ),
        ],
      ),
    ).pb( MediaQuery.of(context).viewInsets.bottom);
  }
}
