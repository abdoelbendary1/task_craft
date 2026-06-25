import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task_craft/core/helpers/extentions.dart';
import 'package:task_craft/core/theme/app_colors.dart';
import 'package:task_craft/features/add_project/bloc/new_project_bloc.dart';
import 'package:task_craft/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:task_craft/features/home/domain/entities/project_entity.dart';
import 'package:task_craft/features/add_project/widgets/action_button.dart';
import 'package:task_craft/features/add_project/widgets/bottom_sheet_input.dart';
import 'package:task_craft/features/add_project/widgets/date_time_picker_row.dart';
import 'package:task_craft/features/add_project/widgets/drag_handle.dart';
import 'package:task_craft/features/add_project/widgets/status_section.dart';

class AddTaskBottomSheet extends StatelessWidget {
  final ValueChanged<ProjectEntity> onTaskCreated;

  const AddTaskBottomSheet({super.key, required this.onTaskCreated});

  @override
  Widget build(BuildContext context) {
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
            onChanged: (value) => context.read<NewProjectBloc>().add(
              NewProjectEvent.titleChanged(value),
            ),
          ),
          28.vSpace,
          BottomSheetInput(
            hintText: "And Describe it",
            onChanged: (value) => context.read<NewProjectBloc>().add(
              NewProjectEvent.descriptionChanged(value),
            ),
          ),
          28.vSpace,
          StatusSection(),
          28.vSpace,

          const DateTimePickerRow(),
          28.vSpace,

          BlocListener<NewProjectBloc, NewProjectState>(
            listener: (context, state) {
              state.maybeWhen((project, status, errorMessage) {
                if (status == NewProjectStatus.success) {
                  context.pop();
                }
              }, orElse: () {});
            },
            child: ActionButtons(
              onCancel: () => context.pop(),
              onCreate: () => context.read<AuthBloc>().state.maybeWhen(
                authenticated: (user) {
                  final state = context.read<NewProjectBloc>().state;
                  context.read<NewProjectBloc>().add(
                    NewProjectEvent.submitProject(
                      state.project.copyWith(
                        creatorId: user.id,
                        createdAt: DateTime.now().toUtc(),
                        dueDate: DateTime.now()
                            .add(const Duration(days: 7))
                            .toUtc(),
                      ),
                    ),
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
    ).pb(MediaQuery.of(context).viewInsets.bottom);
  }
}
