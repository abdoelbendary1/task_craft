part of 'projects_bloc.dart';

@freezed
class ProjectsEvent with _$ProjectsEvent {
  const factory ProjectsEvent.started() = _Started;
  const factory ProjectsEvent.refreshProjects() = _RefreshedProjects;
  const factory ProjectsEvent.addNewProject(ProjectEntity project) = _AddNewProject;
  const factory ProjectsEvent.deleteProject(ProjectEntity project ) = _DeleteProject;
  const factory ProjectsEvent.updateProject(ProjectEntity project) = _UpdateProject;
  const factory ProjectsEvent.goToProject() = _GoToProject;
}
