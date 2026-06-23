import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_craft/core/di/injection.dart';
import 'package:task_craft/features/home/presentation/bloc/projects_bloc.dart';
import 'package:task_craft/features/home/presentation/pages/projects_dashboard_screen.dart';
import 'package:task_craft/features/home/presentation/pages/projects_dashboard_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => getIt<ProjectsBloc>())],
      child: const ProjectsDashboardView(),
    );
  }
}
