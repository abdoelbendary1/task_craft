
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_craft/features/tasks/presentation/widgets/build_add_task_ui.dart';
import 'package:task_craft/features/tasks/presentation/widgets/task_screen_appbar.dart';
import 'package:task_craft/features/tasks/presentation/widgets/tasks_view_content.dart';
import '../bloc/tasks_bloc.dart';

class TasksView extends StatelessWidget {
  final String projectId;
  final String projectTitle;

  const TasksView({
    super.key,
    required this.projectId,
    required this.projectTitle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: TaskListScreenAppbar(projectTitle: projectTitle),
      floatingActionButton: BuildAddTaskButton( projectId: projectId),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async => context.read<ProjectTasksBloc>().add(
                ProjectTasksEvent.refreshTasks(projectId),
              ),
          child: TasksViewContent(projectId: projectId,),
        ),
      ),
    );
    
  }


  
  
  
  
  
  
  
  
  
  
  
  
  
  


  
}