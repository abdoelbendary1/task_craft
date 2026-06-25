import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_craft/core/di/injection.dart';
import 'package:task_craft/core/helpers/helpers.dart';
import 'package:task_craft/core/services/notification/notification_service.dart';
import 'package:task_craft/core/services/notification/notification_state.dart';
import 'package:task_craft/features/add_project/bloc/new_project_bloc.dart';
import 'package:task_craft/features/home/domain/entities/project_entity.dart';
import 'package:task_craft/features/home/presentation/bloc/projects_bloc.dart';
import 'package:task_craft/features/add_project/add_task_bottom_sheet.dart';
import 'package:task_craft/features/home/presentation/widgets/ui_states/projects_empty_ui.dart';
import 'package:task_craft/features/home/presentation/widgets/start_initial_project_card.dart';
import 'package:task_craft/features/home/presentation/widgets/ui_states/projects_loaded.dart';
import 'package:task_craft/features/home/presentation/widgets/ui_states/projects_loading.dart';

class BuildHomeBody extends StatelessWidget {
  const BuildHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProjectsBloc, ProjectsState>(
      bloc: context.read<ProjectsBloc>()..add(const ProjectsEvent.started()),
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          // loaded: (projects) => NotificationService.show(
          //   message: 'You have ${projects.length} projects',
          //   type: NotificationType.success,
          // ),
          error: (message) => NotificationService.show(
            message: message,
            type: NotificationType.error,
          ),
        );
      },
      builder: (innerContext, state) {
        return state.when(
          initial: () => buildInitialUI(),
          loading: () => buildLoadingUI(),
          error: (message) => buildErrorUI(context),
          empty: () => buildEmptyListUI(context),
          // 🟢 Returns a native SliverList directly to the viewport
          loaded: (projects) => buildProjectsUI(projects),
        );
      },
    );
  }
}

Widget buildInitialUI() => const SliverToBoxAdapter(child: SizedBox.shrink());

Widget buildLoadingUI() {
  // 🟢 ترجع الـ Sliver Shimmer فوراً للـ CustomScrollView بدون مشاكل Layout
  return const ProjectsLoadingShimmerList(itemCount: 3);
}

Widget buildEmptyListUI(BuildContext context) {
  return SliverToBoxAdapter(
    child: ProjectsEmptyUI(onCreateProjectPressed: () => addTask(context)),
  );
}

Widget buildErrorUI(BuildContext context) {
  return SliverToBoxAdapter(
    child: ProjectsEmptyUI(onCreateProjectPressed: () => addTask(context)),
  );
}

Widget buildProjectsUI(List<ProjectEntity> projects) =>
    ProjectsLoadedUI(projects: projects);
void addTask(BuildContext context) {
  return openAdditionSheet(
    context,
    builder: (_) => BlocProvider(
      create: (context) => getIt<NewProjectBloc>(),
      child: AddTaskBottomSheet(
        onTaskCreated: (newProject) {
          context.read<ProjectsBloc>().add(
            ProjectsEvent.addNewProject(newProject),
          );
        },
      ),
    ),
  );
}
