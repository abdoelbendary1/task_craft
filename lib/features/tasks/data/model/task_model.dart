// features/project_tasks/data/models/task_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_craft/core/enum/task_status.dart';
import 'package:task_craft/features/tasks/domain/entities/task_entity.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

@freezed
abstract class TaskModel with _$TaskModel {
  
  @HiveType(typeId: 1)
  const factory TaskModel({
    @HiveField(0) @Default("") String id,
    @HiveField(1) @JsonKey(name: 'project_id') @Default("") String projectId,
    @HiveField(2) @Default("") String title,
    @HiveField(3) @Default("") String description,
    @HiveField(4) @JsonKey(name: 'status_id') @Default(0) int statusId,
    @HiveField(5) @JsonKey(name: 'priority_id') @Default(1) int priorityId,
    @HiveField(6) @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _TaskModel;

  factory TaskModel.fromJson(Map<String, dynamic> json) => _$TaskModelFromJson(json);
}

// 🟢 الـ Mappers التحويلية الذكية بين الـ Model والـ Entity بنفس أسلوبك
extension TaskModelX on TaskModel {


  TaskEntity toEntity() {
    return TaskEntity(
      id: id,
      projectId: projectId,
      title: title,
      description: description,
      status: TaskStatus.fromId(statusId),
      priority: TaskPriority.fromId(priorityId),
      createdAt: createdAt ?? DateTime.now(),
    );
  }
}

