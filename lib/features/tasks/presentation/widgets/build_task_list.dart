import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_craft/features/tasks/presentation/add_task/add_task_controller.dart';
import 'package:task_craft/features/tasks/presentation/bloc/tasks_bloc.dart';
import 'package:task_craft/features/tasks/presentation/pages/states/tasks_empty_ui.dart';
import 'package:task_craft/features/tasks/presentation/widgets/task_item_widget.dart';
import 'package:task_craft/features/tasks/presentation/widgets/tasks_loading_shimmer.dart';

class BuildTaskList extends StatelessWidget {
  final bool isCompletedSection;
  final String emptyMessage;
  const BuildTaskList({
    super.key,
    required this.isCompletedSection,
    required this.emptyMessage,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<ProjectTasksBloc, ProjectTasksState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => SliverToBoxAdapter(child: const SizedBox.shrink()),
          loading: () => SliverList.builder(
            itemCount: 1,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: TasksLoadingShimmer(),
            ),
          ),
          empty: () => SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: Center(
                    child: Text(emptyMessage, style: theme.textTheme.bodySmall),
                  ),
                ),
              ),
          loaded: (tasks, activeTasks, completedTasks, selectedPriority) {
            final currentList = isCompletedSection
                ? completedTasks
                : activeTasks;

            if (currentList.isEmpty) {
              return SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: Center(
                    child: Text(emptyMessage, style: theme.textTheme.bodySmall),
                  ),
                ),
              );
            }

            return SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final task = currentList[index];

                return TaskItemWidget(
                  key: ValueKey('task_item_${task.id}'),
                  task: task,
                  onToggleStatus: () {
                    context.read<ProjectTasksBloc>().add(
                      ProjectTasksEvent.toggleTaskStatus(
                        taskId: task.id ?? "",
                        currentStatusId: task.status?.id ?? 0,
                      ),
                    );
                  },
                  onDismissed: () {
                    context.read<ProjectTasksBloc>().add(
                      ProjectTasksEvent.deleteTask(taskId: task.id ?? ""),
                    );
                  },
                );
              }, childCount: currentList.length),
            );
          },
        );
      },
    );
  }
}
