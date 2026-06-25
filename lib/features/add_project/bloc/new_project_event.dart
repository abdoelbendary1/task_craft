
part of 'new_project_bloc.dart';

@freezed
class NewProjectEvent with _$NewProjectEvent {
  
  const factory NewProjectEvent.titleChanged(String title) = _TitleChanged;

  
  const factory NewProjectEvent.descriptionChanged(String description) =
      _DescriptionChanged;

  
  const factory NewProjectEvent.statusIdChanged(int statusId) =
      _StatusIdChanged;

  
  const factory NewProjectEvent.dueDateChanged(DateTime? dueDate) =
      _DueDateChanged;

  
  const factory NewProjectEvent.submitProject(ProjectEntity project) =
      _SubmitProject;
}
