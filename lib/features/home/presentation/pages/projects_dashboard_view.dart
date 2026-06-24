import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_craft/core/enum/project_status.dart';
import 'package:task_craft/features/home/presentation/bloc/projects_bloc.dart';
import 'package:task_craft/features/home/presentation/components/project_card_widget.dart';
import 'package:task_craft/features/home/presentation/sections/add_task_bottom_sheet.dart';
import 'package:task_craft/features/home/presentation/sections/dashboard_header_section.dart';
import 'package:task_craft/features/home/presentation/widgets/projects_empty_ui.dart';

class ProjectsDashboardView extends StatelessWidget {
  const ProjectsDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            context.read<ProjectsBloc>().add(
              const ProjectsEvent.refreshProjects(),
            );
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                SliverAppBar(
                  pinned: false,
                  floating: true,
                  snap: true,
                  elevation: 0,
                  backgroundColor: theme.scaffoldBackgroundColor,
                  surfaceTintColor: theme.scaffoldBackgroundColor,
                  toolbarHeight: 150.h,
                  title: DashboardHeaderSection(
                    userName: 'Abdelrahman',
                    onSettingsPressed: () {},
                    onCreateProjectPressed: () => _openAddTaskSheet(context),
                  ),
                ),

                const SliverToBoxAdapter(child: SizedBox(height: 12)),

                // 🟢 FIXED: Removed the outer SliverToBoxAdapter container.
                BlocConsumer<ProjectsBloc, ProjectsState>(
                  bloc: context.read<ProjectsBloc>()
                    ..add(const ProjectsEvent.started()),
                  listener: (context, state) {
                    state.maybeWhen(
                      orElse: () {},
                      error: (message) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(message),
                            backgroundColor: Theme.of(
                              context,
                            ).colorScheme.error,
                          ),
                        );
                      },
                    );
                  },
                  // buildWhen: (previous, current) => previous != current,
                  builder: (innerContext, state) {
                    return state.when(
                      // 🟢 Box widgets wrapped in SliverToBoxAdapter internally
                      initial: () =>
                          const SliverToBoxAdapter(child: SizedBox.shrink()),
                      loading: () => const SliverToBoxAdapter(
                        child: SizedBox(
                          height: 200,
                          child: Center(
                            child: CircularProgressIndicator.adaptive(),
                          ),
                        ),
                      ),
                      error: (message) => SliverToBoxAdapter(
                        child: Column(
                          children: [
                            ProjectsEmptyUI(
                              onCreateProjectPressed: () =>
                                  _openAddTaskSheet(context),
                            ),
                            const _StartNewInitiativeCard(),
                          ],
                        ),
                      ),
                      empty: () => SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.only(top: 60.h),
                          child: Column(
                            children: [
                              ProjectsEmptyUI(
                                onCreateProjectPressed: () =>
                                    _openAddTaskSheet(context),
                              ),
                              const _StartNewInitiativeCard(),
                            ],
                          ),
                        ),
                      ),
                      // 🟢 Returns a native SliverList directly to the viewport
                      loaded: (projects) => SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          if (index == projects.length) {
                            return GestureDetector(
                              onTap: () => _openAddTaskSheet(context),
                              child: const _StartNewInitiativeCard(),
                            );
                          }

                          final project = projects[index];
                          return Padding(
                            padding: EdgeInsets.only(bottom: 12.h),
                            child: Dismissible(
                              key: Key(project.id),
                              onDismissed: (direction) {
                                context.read<ProjectsBloc>().add(
                                  ProjectsEvent.deleteProject(project),
                                );
                              },
                              background: Container(
                                color: Colors.red,
                                alignment: Alignment.centerRight,
                                child: const Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                              ),
                              child: ProjectCardWidget(
                                title: project.title,
                                description: project.description,
                                status: ProjectStatus.fromId(
                                  project.statusId,
                                ).label,
                                dueDate: 'Due tomorrow',
                                onTap: () {},
                              ),
                            ),
                          );
                        }, childCount: projects.length + 1),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _openAddTaskSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => AddTaskBottomSheet(
        onTaskCreated: (newProject) {
          context.read<ProjectsBloc>().add(
            ProjectsEvent.addNewProject(newProject),
          );
        },
      ),
    );
  }
}

class _StartNewInitiativeCard extends StatelessWidget {
  const _StartNewInitiativeCard();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(top: 8.h, bottom: 24.h),
      padding: EdgeInsets.symmetric(vertical: 28.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: theme.primaryColor.withOpacity(0.02),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: theme.primaryColor.withOpacity(0.25),
          width: 1.5.w,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 22.r,
            backgroundColor: theme.colorScheme.surface,
            child: Icon(Icons.add, color: theme.primaryColor, size: 24.r),
          ),
          SizedBox(height: 14.h),
          Text(
            'Start New Initiative',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            'Create a new project workspace for your team.',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.hintColor.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }
}
