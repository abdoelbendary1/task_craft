// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:task_craft/features/home/presentation/bloc/projects_bloc.dart';
// import 'package:task_craft/features/home/presentation/pages/projects_dashboard_view.dart';

// class ProjectsDashboardScreen extends StatelessWidget {
//   const ProjectsDashboardScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
// return  BlocBuilder<ProjectsBloc, ProjectsState>(
//           builder: (innerContext, state) {
//             return state.when(
//               initial: () => const Center(),
//               loading: () => const Center(child: CircularProgressIndicator.adaptive()),
//               error: (message) => Center(child: Text(message)),
//               loaded: (projects) => ProjectsDashboardView(
//                 projects: projects,
//                 onRefresh: () {
//                   // 🟢 FIXED: Use innerContext so Flutter looks UP past the Scaffold and finds the provider!
//                   innerContext.read<ProjectsBloc>().add(
//                     const ProjectsEvent.refreshProjects(),
//                   );
//                 },
//                 handleprojetcCreation: (project) {
//                   // 🟢 FIXED: Use innerContext here as well
//                   innerContext.read<ProjectsBloc>().add(
//                     ProjectsEvent.addNewProject(project),
//                   );
//                 },
//               ),
//             );
//           },
  
//         );
//   }
// }