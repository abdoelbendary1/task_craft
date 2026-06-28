part of 'tasks_bloc.dart';

@freezed
class ProjectTasksState with _$ProjectTasksState {
  const factory ProjectTasksState.initial() = _Initial;
  const factory ProjectTasksState.loading() = _Loading;
  const factory ProjectTasksState.error(String message) = _Error;
  const factory ProjectTasksState.empty() = _Empty;
  const factory ProjectTasksState.loaded({
    required List<TaskEntity> tasks,
    required List<TaskEntity> activeTasks,
    required List<TaskEntity> completedTasks,
    TaskPriority? selectedPriority,
  }) = _Loaded;
}
