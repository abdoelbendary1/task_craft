 import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_craft/core/di/injection.dart';
import 'package:task_craft/core/helpers/helpers.dart';
import 'package:task_craft/features/tasks/presentation/add_task/add_task_bottom_sheet.dart';
import 'package:task_craft/features/tasks/presentation/add_task/bloc/new_task_bloc.dart';

void addTask(BuildContext context , {required String projectId}) {
  return openAdditionSheet(
    context,
    builder: (_) => BlocProvider(
      create: (context) => getIt<NewTaskBloc>(),
      child: AddTaskBottomSheet(
        onTaskCreated: (newTask) {
          context.read<NewTaskBloc>().add(
            NewTaskEvent.submitTask(task:newTask, projectId: projectId),
          );
        }, projectId: projectId,
      ),
    ),
  );
} 