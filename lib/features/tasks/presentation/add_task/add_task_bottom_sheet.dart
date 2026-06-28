import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task_craft/core/di/injection.dart';
import 'package:task_craft/core/helpers/extentions.dart';
import 'package:task_craft/core/theme/app_colors.dart';
import 'package:task_craft/features/tasks/presentation/add_task/bloc/new_task_bloc.dart';
import 'package:task_craft/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:task_craft/features/home/presentation/add_project/widgets/action_button.dart';
import 'package:task_craft/features/home/presentation/add_project/widgets/bottom_sheet_input.dart';
import 'package:task_craft/features/home/presentation/add_project/widgets/drag_handle.dart';
import 'package:task_craft/features/tasks/domain/entities/task_entity.dart';
import 'package:task_craft/features/tasks/presentation/add_task/widgets/task_priorties_section.dart';

class AddTaskBottomSheet extends StatelessWidget {
  final String projectId;
  final ValueChanged<TaskEntity> onTaskCreated;

  const AddTaskBottomSheet({super.key, required this.onTaskCreated, required this.projectId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewTaskBloc, NewTaskState>(
      bloc: getIt<NewTaskBloc>()..add(NewTaskEvent.initProjectId(projectId)),
      builder: (context, state) {
        return Container(
          decoration: const BoxDecoration(
            color: AppColors.scaffoldBackground,
            borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              12.vSpace,
              const DragHandle(),
              28.vSpace,
              BottomSheetInput(
                hintText: 'What needs to be done?',
                onChanged: (value) => context.read<NewTaskBloc>().add(
                  NewTaskEvent.titleChanged(value),
                ),
              ),
              28.vSpace,
              BottomSheetInput(
                hintText: "And Describe it",
                onChanged: (value) => context.read<NewTaskBloc>().add(
                  NewTaskEvent.descriptionChanged(value),
                ),
              ),
              28.vSpace,
              TaskPriortiesSection(),
              28.vSpace,

              BlocListener<NewTaskBloc, NewTaskState>(
                listener: (context, state) {
                  state.maybeWhen((task, status, errorMessage, projectId) {
                    if (status == NewTaskStatus.success) {
                      context.pop();
                    }
                  }, orElse: () {});
                },
                child: ActionButtons(
                  onCancel: () => context.pop(),
                  onCreate: () => context.read<AuthBloc>().state.maybeWhen(
                    authenticated: (user) {
                      final state = context.read<NewTaskBloc>().state;
                      context.read<NewTaskBloc>().add(
                        NewTaskEvent.submitTask(task: state.task,projectId: projectId),
                      );
                      Navigator.pop(context);
                      return null;
                    },
                    orElse: () => null,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ).pb(MediaQuery.of(context).viewInsets.bottom);
  }
}
