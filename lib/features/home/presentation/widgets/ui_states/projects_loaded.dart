import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_craft/core/routing/app_router.dart';
import 'package:task_craft/features/home/domain/entities/project_entity.dart';
import 'package:task_craft/features/home/presentation/bloc/projects_bloc.dart';
import 'package:task_craft/features/home/presentation/pages/sections/build_home_body.dart';
import 'package:task_craft/shared/components/project_card_widget.dart';
import 'package:task_craft/features/home/presentation/widgets/start_initial_project_card.dart';

class ProjectsLoadedUI extends StatelessWidget {
  final List<ProjectEntity> projects;
  const ProjectsLoadedUI({super.key, required this.projects});

  @override
  Widget build(BuildContext context) {
   return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        if (index == projects.length) {
          return GestureDetector(
            onTap: () => addProject(context),
            child: const StartNewInitiativeCard(),
          );
        }
        final project = projects[index];
        return ProjectCardWidget(
          project: project,
          onTap: () {
  ProjectTasksRoute(
    id: project.id.toString(),
    title: project.title,
  ).go(context);
},
          onDismissed: (p0) => context.read<ProjectsBloc>().add(
            ProjectsEvent.deleteProject(project),
          ),
        );
      }, childCount: projects.length + 1),
    );
  }
}