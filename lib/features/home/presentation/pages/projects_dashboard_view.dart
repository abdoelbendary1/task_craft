import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_craft/features/home/domain/entities/project_entity.dart';
import 'package:task_craft/features/home/presentation/components/project_card_widget.dart';
import 'package:task_craft/features/home/presentation/sections/add_task_bottom_sheet.dart';
import 'package:task_craft/features/home/presentation/sections/dashboard_header_section.dart';
import 'package:task_craft/features/home/presentation/widgets/projects_empty_ui.dart';

class ProjectsDashboardView extends StatelessWidget {
  final List<ProjectEntity> projects;
  final VoidCallback onRefresh;
  final Function(String title, String priority) handleTaskCreation;

  const ProjectsDashboardView({
    super.key,
    required this.projects,
    required this.onRefresh,
    required this.handleTaskCreation,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async => onRefresh(),
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

                if (projects.isEmpty)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.only(top: 60.h),
                      child: ProjectsEmptyUI(
                        onCreateProjectPressed: () =>
                            _openAddTaskSheet(context),
                      ),
                    ),
                  )
                else
                  SliverList(
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
                        child: ProjectCardWidget(
                          title: project.title,
                          description: project.description,
                          status: project.status,
                          dueDate: 'Due tomorrow',
                          onTap: () {},
                        ),
                      );
                    }, childCount: projects.length + 1),
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
      builder: (_) => AddTaskBottomSheet(onTaskCreated: handleTaskCreation),
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
