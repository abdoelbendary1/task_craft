part of 'projects_bloc.dart';

@freezed
class ProjectsEvent with _$ProjectsEvent {
  const factory ProjectsEvent.fetchedProjects() = _FetchedProjects;
  const factory ProjectsEvent.addNewProject() = _AddNewProject;
  const factory ProjectsEvent.deleteProject() = _DeleteProject;
  const factory ProjectsEvent.updateProject() = _UpdateProject;
  const factory ProjectsEvent.goToProject() = _GoToProject;
}
