// features/tasks/presentation/bloc/new_task_event.dart
part of 'new_task_bloc.dart';

@freezed
class NewTaskEvent with _$NewTaskEvent {
  const factory NewTaskEvent.initProjectId(String projectId) = _InitProjectId;
  const factory NewTaskEvent.titleChanged(String title) = _TitleChanged;
  const factory NewTaskEvent.descriptionChanged(String description) = _DescriptionChanged;
  const factory NewTaskEvent.priorityChanged(int priorityId) = _PriorityChanged;
  const factory NewTaskEvent.dueDateChanged(DateTime? dueDate) = _DueDateChanged;
  const factory NewTaskEvent.submitTask({TaskEntity? task ,String? projectId } ) = _SubmitTask;
}