import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_craft/features/home/data/models/project_model.dart';
import 'package:task_craft/features/home/data/models/task_model.dart';
part 'project_entity.freezed.dart';
part 'project_entity.g.dart';

@freezed
abstract class ProjectEntity with _$ProjectEntity {
  const factory ProjectEntity({
    required String id,
    required String userId,
    required String title,
    required String description,
    required String status,
    required List<TaskModel> tasks,
    required bool isCompleted,
  }) = _ProjectEntity;

  factory ProjectEntity.fromJson(Map<String, dynamic> json) =>
      _$ProjectEntityFromJson(json);
}

extension ProjectEntityX on ProjectEntity {
  ProjectModel toModel() => ProjectModel(
    id: id,
    userId: userId,
    title: title,
    description: description,
    status: status,
    tasks: tasks.map((task) => task).toList(),
    isCompleted: isCompleted,
  );
}
