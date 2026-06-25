import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_craft/core/helpers/extentions.dart';
import 'package:task_craft/features/home/presentation/bloc/projects_bloc.dart';
import 'package:task_craft/features/home/presentation/pages/sections/build_home_header.dart';
import 'package:task_craft/features/home/presentation/pages/sections/build_home_body.dart';

class ProjectsView extends StatelessWidget {
  const ProjectsView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async => context.read<ProjectsBloc>().add(
            const ProjectsEvent.refreshProjects(),
          ),
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
          BuildHomeHeader( ),
           BuildHomeBody()    ,          ],
          ).px(defaultHorizontal: 16),
        ),
      ),
    );
  }

 





  

 
}

