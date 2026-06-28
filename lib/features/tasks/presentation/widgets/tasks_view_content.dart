import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_craft/core/helpers/extentions.dart';
import 'package:task_craft/features/tasks/presentation/add_task/add_task_controller.dart';
import 'package:task_craft/features/tasks/presentation/add_task/bloc/new_task_bloc.dart';
import 'package:task_craft/features/tasks/presentation/bloc/tasks_bloc.dart';
import 'package:task_craft/features/tasks/presentation/pages/states/tasks_empty_ui.dart';
import 'package:task_craft/features/tasks/presentation/widgets/build_task_list.dart';
import 'package:task_craft/features/tasks/presentation/widgets/build_tasks_list_header_section.dart';
import 'package:task_craft/features/tasks/presentation/widgets/task_progress_card.dart';
import 'package:task_craft/features/tasks/presentation/widgets/tasks_loading_shimmer.dart';

class TasksViewContent extends StatelessWidget {
final  String projectId;
  const TasksViewContent({super.key, required this.projectId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectTasksBloc, ProjectTasksState>(
      builder: (context, state) {
        return  CustomScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  slivers: [
                    state.maybeWhen(
                      orElse: () => SliverToBoxAdapter(
                        child: TaskProgressCard(
                          totalTasks: [],
                          completedTasks: [],
                        ),
                      ),
                      loaded:
                          (
                            tasks,
                            activeTasks,
                            completedTasks,
                            selectedPriority,
                          ) => SliverToBoxAdapter(
                            child: TaskProgressCard(
                              totalTasks: tasks,
                              completedTasks: completedTasks,
                            ),
                          ),
                    ),
                    state.maybeWhen(
                    
                      orElse: () =>
                          SliverToBoxAdapter(child: const SizedBox.shrink()),
                      loading: () => SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) => TasksLoadingShimmer(),
                          childCount: 3,
                        ),
                      ),
empty: () => SliverToBoxAdapter(
                            child: BuildTasksListHeaderSection(
                              title: "Active tasks",
                              count: 0,
                              tasks: [],
                              showSort: true,
                            ),
                          ),
                      loaded:
                          (
                            tasks,
                            activeTasks,
                            completedTasks,
                            selectedPriority,
                          ) => SliverToBoxAdapter(
                            child: BuildTasksListHeaderSection(
                              title: "Active tasks",
                              count: activeTasks.length,
                              tasks: tasks,
                              showSort: true,
                            ),
                          ),
                    ),

                    BuildTaskList(
                      isCompletedSection: false,
                      emptyMessage: "All active tasks clear!",
                    ),
                    state.maybeWhen(
                      orElse: () =>
                          SliverToBoxAdapter(child: const SizedBox.shrink()),
                      loading: () => SliverList.builder(
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.h),
                          child: TasksLoadingShimmer(),
                        ),
                      ),empty: () => SliverToBoxAdapter(
                            child: BuildTasksListHeaderSection(
                              title: "Completed tasks",
                              count: 0,
                              tasks: [],
                            ),
                          ),
                      loaded:
                          (
                            tasks,
                            activeTasks,
                            completedTasks,
                            selectedPriority,
                          ) => SliverToBoxAdapter(
                            child: BuildTasksListHeaderSection(
                              title: "Completed",
                              count: completedTasks.length,
                              tasks: tasks,
                            ),
                          ),
                    ),

                    BuildTaskList(
                      isCompletedSection: true,
                      emptyMessage: "No completed tasks",
                    ),
                  ],
                ).px(defaultHorizontal: 16);
              },
            //  loading: () => CustomScrollView(
            //    physics: const AlwaysScrollableScrollPhysics(),
            //    slivers: [
            //      SliverList.builder(
            //        itemBuilder: (context, index) => Padding(
            //          padding: EdgeInsets.symmetric(vertical: 20.h),
            //          child: TasksLoadingShimmer(),
            //        ),
            //      ),
            //    ]
            //  ),  orElse: () => const SizedBox(),
            );
            
      
    
  }
}
