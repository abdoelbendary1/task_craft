import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_craft/features/home/data/models/task_model.dart';
import 'package:task_craft/features/home/domain/entities/project_entity.dart';

part 'project_model.freezed.dart';
part 'project_model.g.dart';

@freezed
@HiveType(typeId: 0) // 🟢 Ensure you have a typeId assigned
abstract class ProjectModel with _$ProjectModel {
  const factory ProjectModel({
    @HiveField(0) @Default("") String id,
    @HiveField(1) @Default("")  String userId,
    @HiveField(2) @Default("") String title,
    @HiveField(3) @JsonKey(name: 'body') @Default("") String description,
    @HiveField(4) @Default("") String status,
    @HiveField(5) @Default([]) List<TaskModel> tasks,
    @HiveField(6)@Default(false) bool isCompleted,
  }) = _ProjectModel;

  factory ProjectModel.fromJson(Map<String, dynamic> json) => _$ProjectModelFromJson(json);
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
