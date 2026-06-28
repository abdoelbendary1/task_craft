import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:injectable/injectable.dart';

import 'package:task_craft/core/enum/task_status.dart';

import 'package:task_craft/core/services/notification/notification_service.dart';

import 'package:task_craft/core/services/notification/notification_state.dart';

import 'package:task_craft/features/tasks/domain/entities/task_entity.dart';

import 'package:task_craft/features/tasks/domain/usecases/delete_task.dart';

import 'package:task_craft/features/tasks/domain/usecases/refresh_tasks_cache.dart';

import 'package:task_craft/features/tasks/domain/usecases/update_task_status.dart';

import 'package:task_craft/features/tasks/domain/usecases/watch_tasks_stream.dart';

part 'tasks_event.dart';

part 'tasks_state.dart';

part 'tasks_bloc.freezed.dart';

@injectable
class ProjectTasksBloc extends Bloc<ProjectTasksEvent, ProjectTasksState> {
  final WatchTasksStream _watchTasksStream;

  final RefreshTasksCache _refreshTasksCache;

  final UpdateTaskStatus _updateTaskStatus;

  final DeleteTask _deleteTask;

  ProjectTasksBloc({
    required WatchTasksStream watchTasksStream,

    required RefreshTasksCache refreshTasksCache,

    required UpdateTaskStatus updateTaskStatus,

    required DeleteTask deleteTask,
  }) : _deleteTask = deleteTask,

       _watchTasksStream = watchTasksStream,

       _refreshTasksCache = refreshTasksCache,

       _updateTaskStatus = updateTaskStatus,

       super(const _Initial()) {
    on<_Started>(_onStarted);

    on<_RefreshTasks>(_onRefreshTasks);

    on<_ToggleTaskStatus>(_onToggleTaskStatus);

    on<_DeleteTask>(_onDeleteTask);

    on<_SortByPriority>(_sortByPriority);
  }

  FutureOr<void> _onDeleteTask(
    _DeleteTask event,

    Emitter<ProjectTasksState> emit,
  ) async {
    final result = await _deleteTask.call(event.taskId);

    result.fold((failure) {
      NotificationService.show(
        title: "Deletion Error",

        message: failure.message,

        type: NotificationType.error,
      );
    }, (_) {});
  }

  FutureOr<void> _onStarted(
    _Started event,

    Emitter<ProjectTasksState> emit,
  ) async {
    final streamTask = emit.forEach<List<TaskEntity>>(
      _watchTasksStream.call(event.projectId),

      onData: (tasks) {
        final activeTasks = tasks
            .where((t) => t.status != TaskStatus.done)
            .toList();

        final completedTasks = tasks
            .where((t) => t.status == TaskStatus.done)
            .toList();

        if (tasks.isEmpty) return const ProjectTasksState.empty();

        return ProjectTasksState.loaded(
          tasks: tasks,
          activeTasks: activeTasks,
          completedTasks: completedTasks,
        );
      },

      onError: (error, stackTrace) => ProjectTasksState.error(error.toString()),
    );

    add(ProjectTasksEvent.refreshTasks(event.projectId));

    await streamTask;
  }

  FutureOr<void> _onRefreshTasks(
    _RefreshTasks event,

    Emitter<ProjectTasksState> emit,
  ) async {
    emit(const ProjectTasksState.loading());

    final result = await _refreshTasksCache.call(event.projectId);

    result.fold(
      (failure) {
        NotificationService.show(
          title: "Synchronization Status",

          message: "Displaying offline cached tasks. Server fetch failed.",

          type: NotificationType.info,
        );

        emit(ProjectTasksState.error(failure.message));
      },

      (success) {
      //  if (success.data?.isEmpty??false) {
      //    emit(const ProjectTasksState.empty());return;
      //  }
        final tasks = success.data ?? [];

        final activeTasks = tasks
            .where((t) => t.status != TaskStatus.done)
            .toList();

        final completedTasks = tasks
            .where((t) => t.status == TaskStatus.done)
            .toList();

        emit(
          ProjectTasksState.loaded(
            tasks: tasks,
            activeTasks: activeTasks,
            completedTasks: completedTasks,
          ),
        );
      },
    );
  }

  FutureOr<void> _onToggleTaskStatus(
    _ToggleTaskStatus event,

    Emitter<ProjectTasksState> emit,
  ) async {
    final nextStatusId = event.currentStatusId == 2 ? 1 : 2;

    final result = await _updateTaskStatus.call(
      taskId: event.taskId,

      statusId: nextStatusId,
    );

    result.fold((failure) {
      NotificationService.show(
        title: "Update Error",

        message: failure.message,

        type: NotificationType.error,
      );
    }, (_) {});
  }

  FutureOr<void> _sortByPriority(
    _SortByPriority event,

    Emitter<ProjectTasksState> emit,
  ) {
    final TaskPriority? selectedPriority = event.priority;

    final List<TaskEntity> tasks = event.tasks ?? [];

    final activeTasks = tasks
        .where((t) => t.status != TaskStatus.done)
        .toList();

    final completedTasks = tasks
        .where((t) => t.status == TaskStatus.done)
        .toList();

    final sortedActiveTasks = selectedPriority == null
        ? activeTasks
        : activeTasks.where((t) => t.priority == selectedPriority).toList();

    final sortedCompletedTasks = selectedPriority == null
        ? completedTasks
        : completedTasks.where((t) => t.priority == selectedPriority).toList();

    emit(
      ProjectTasksState.loaded(
        tasks: tasks,

        activeTasks: sortedActiveTasks,

        completedTasks: sortedCompletedTasks,

        selectedPriority: selectedPriority,
      ),
    );
  }
}
