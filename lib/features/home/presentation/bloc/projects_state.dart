part of 'projects_bloc.dart';

@freezed
class ProjectsState with _$ProjectsState {
  const factory ProjectsState.initial() = _Initial;
  const factory ProjectsState.loading() = _Loading;
  const factory ProjectsState.error(String message) = _Error;
  const factory ProjectsState.empty() = _Empty;
  const factory ProjectsState.loaded(List<ProjectEntity> projects) = _Loaded;
}
