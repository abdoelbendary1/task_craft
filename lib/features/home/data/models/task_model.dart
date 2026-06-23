import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_craft/features/home/domain/entities/task_entity.dart';
part 'task_model.freezed.dart';
part 'task_model.g.dart';

@freezed
abstract class TaskModel with _$TaskModel {
  const factory TaskModel({
    required String id,
    required String title,
    required String description,
    required String dueDate,
    required String priority,
    required String status,
    required String projectId,
  }) = _TaskModel;

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);
}

extension TaskModelX on TaskModel {
  TaskEntity toEntity() => TaskEntity(
    id: id,
    title: title,
    description: description,
    dueDate: dueDate,
    priority: priority,
    status: status,
    projectId: projectId,
  );
}
