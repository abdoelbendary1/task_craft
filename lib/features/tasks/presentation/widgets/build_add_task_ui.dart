import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_craft/features/tasks/presentation/add_task/add_task_controller.dart';
import 'package:task_craft/features/tasks/presentation/bloc/tasks_bloc.dart';

class BuildAddTaskButton extends StatelessWidget {
 final String projectId;
  const BuildAddTaskButton({super.key , required this.projectId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectTasksBloc, ProjectTasksState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (tasks , activeTasks, completedTasks,selectedPriority) => FloatingActionButton(
            // backgroundColor: theme.colorScheme.primary,
            onPressed: () => addTask(context, projectId: projectId),
            child: const Icon(Icons.add),
          ),
          empty: () => FloatingActionButton(
            // backgroundColor: theme.colorScheme.primary,
            onPressed: () => addTask(context, projectId: projectId),
            child: const Icon(Icons.add),
          ),
          orElse: () => const SizedBox(),
        );
      },
    );
  }
 
}


   
  