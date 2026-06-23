import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_craft/features/home/data/models/task_model.dart';
import 'package:task_craft/features/home/domain/entities/project_entity.dart';
part 'project_model.freezed.dart';
part 'project_model.g.dart';

@freezed
abstract class ProjectModel with _$ProjectModel {
  const factory ProjectModel({
    required String id,
    required String userId,
    required String title,
    required String description,
    required String status,
    required List<TaskModel> tasks,
    required bool isCompleted,
  }) = _ProjectModel;

  factory ProjectModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectModelFromJson(json);
}

extension ProjectModelX on ProjectModel {
  ProjectEntity toEntity() => ProjectEntity(
    id: id,
    userId: userId,
    title: title,
    description: description,
    status: status,
    tasks: tasks.map((task) => task).toList(),
    isCompleted: isCompleted,
  );
}
