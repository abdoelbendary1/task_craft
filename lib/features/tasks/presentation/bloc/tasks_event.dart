// features/project_tasks/presentation/bloc/project_tasks_event.dart

// part of 'project_tasks_bloc.dart';

part of 'tasks_bloc.dart';



@freezed
abstract class ProjectTasksEvent with _$ProjectTasksEvent {
  const factory ProjectTasksEvent.started(String projectId) = _Started;
  const factory ProjectTasksEvent.refreshTasks(String projectId) = _RefreshTasks;
  const factory ProjectTasksEvent.sortByPriority({
    TaskPriority? priority,
    List<TaskEntity>? tasks,
  })= _SortByPriority;
const factory ProjectTasksEvent.deleteTask({
  required String taskId,
}) = _DeleteTask;
  const factory ProjectTasksEvent.toggleTaskStatus({
    required String taskId,
    required int currentStatusId,
  }) = _ToggleTaskStatus;
}