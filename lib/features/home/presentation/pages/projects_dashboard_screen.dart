import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_craft/core/di/injection.dart';
import 'package:task_craft/features/home/presentation/bloc/projects_bloc.dart';
import 'package:task_craft/features/home/presentation/pages/projects_dashboard_view.dart';

class ProjectsDashboardScreen extends StatelessWidget {
  const ProjectsDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectsBloc, ProjectsState>(
      bloc: getIt<ProjectsBloc>()..add(const ProjectsEvent.fetchedProjects()),
      builder: (context, state) {
        return state.when(
          initial: () => const Scaffold(
            body: Center(child: CircularProgressIndicator.adaptive()),
          ),
          loading: () => const Scaffold(
            body: Center(child: CircularProgressIndicator.adaptive()),
          ),
          error: (message) => Scaffold(
            body: Center(
              child: Text(
                message,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            ),
          ),
          loaded: (projects) => ProjectsDashboardView(
            projects: projects,
            onRefresh: () {
              context.read<ProjectsBloc>().add(
                const ProjectsEvent.fetchedProjects(),
              );
            },
            handleTaskCreation: (title, priority) {
              context.read<ProjectsBloc>().add(ProjectsEvent.addNewProject());
            },
          ),
        );
      },
    );
  }
}
