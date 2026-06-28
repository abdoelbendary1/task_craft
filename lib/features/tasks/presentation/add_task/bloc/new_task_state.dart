// features/tasks/presentation/bloc/new_task_state.dart
part of 'new_task_bloc.dart';

enum NewTaskStatus { initial, loading, success, failure }

@freezed
abstract class NewTaskState with _$NewTaskState {
  const factory NewTaskState({
     @Default(TaskEntity()) TaskEntity? task,    
    @Default("")   String? projectId,
    @Default(NewTaskStatus.initial) NewTaskStatus? status,
    @Default("") String? errorMessage,
  }) = _NewTaskState;
}