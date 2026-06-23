import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import '../../domain/entities/task_entity.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

@freezed
@HiveType(typeId: 3)
abstract class TaskModel with _$TaskModel {
  const factory TaskModel({
    @HiveField(0) @JsonKey(name: 'id') @Default(0)  int id,
    @HiveField(1) @JsonKey(name: 'title')@Default("")   String title,
    @HiveField(2) @JsonKey(name: 'completed') @Default(false)  bool isCompleted,
    @HiveField(3) @JsonKey(name: 'userId') @Default(0)  int projectId, // JSONPlaceholder uses userId for todo relationships
  }) = _TaskModel;

  factory TaskModel.fromJson(Map<String, dynamic> json) => _$TaskModelFromJson(json);
}

extension TaskModelX on TaskModel {
  TaskEntity toEntity() => TaskEntity(
        id: id.toString(),
        title: title,
        isCompleted: isCompleted,
        projectId: projectId.toString(),
      );
}