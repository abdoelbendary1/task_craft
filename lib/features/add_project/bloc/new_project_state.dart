// features/home/presentation/bloc/new_project_state.dart
part of 'new_project_bloc.dart';

enum NewProjectStatus { initial, loading, success, failure }

@freezed
abstract class NewProjectState with _$NewProjectState {
  const factory NewProjectState({
    required ProjectEntity project,
    @Default(NewProjectStatus.initial) NewProjectStatus status,
    String? errorMessage,
  }) = _NewProjectState;
}
