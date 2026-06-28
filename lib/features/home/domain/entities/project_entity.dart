import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_craft/features/home/data/models/project_model.dart';
import 'package:task_craft/features/tasks/data/model/task_model.dart';
part 'project_entity.freezed.dart';
part 'project_entity.g.dart';

@freezed
abstract class ProjectEntity with _$ProjectEntity {
  const factory ProjectEntity({
    @Default('') String id,
    @Default('') String creatorId,
    @Default('') String title,
    @Default('') String description,
    @Default(0) int statusId,
    DateTime? createdAt,
    DateTime? dueDate,
  }) = _ProjectEntity;

  factory ProjectEntity.fromJson(Map<String, dynamic> json) =>
      _$ProjectEntityFromJson(json);
}

extension ProjectEntityX on ProjectEntity {
  ProjectModel toModel() => ProjectModel(
    id: id,
    creatorId: creatorId,
    title: title,
    description: description,
    statusId: statusId,
    createdAt: createdAt ?? DateTime.now(),
    dueDate: dueDate,
  );
}
