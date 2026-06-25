import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_craft/core/enum/project_status.dart';
import 'package:task_craft/features/home/domain/entities/project_entity.dart';

part 'project_model.freezed.dart';
part 'project_model.g.dart';

@freezed
@freezed
abstract class ProjectModel with _$ProjectModel {
  @HiveType(typeId: 0)
  const factory ProjectModel({
    @HiveField(0) @Default("") String id,
    @HiveField(1)
    @JsonKey(name: 'creator_id')
    String?
    creatorId, // ممتاز إنه Nullable لأن السيرفر أحياناً بياخده من الـ Auth Session
    @HiveField(2) @Default("") String title,
    @HiveField(3) @JsonKey(name: 'description') @Default("") String description,
    @HiveField(4) @JsonKey(name: 'status_id') @Default(1) int statusId,
    @HiveField(5) @JsonKey(name: 'created_at') DateTime? createdAt,
    @HiveField(6) @JsonKey(name: 'due_date') DateTime? dueDate,
  }) = _ProjectModel;

  // 🟢 إجبار الـ Generator على قراءة الـ من الـ factory الفوقاني
  factory ProjectModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectModelFromJson(json);
}

extension ProjectModelX on ProjectModel {
  ProjectEntity toEntity() {
    return ProjectEntity(
      id: id,
      creatorId: creatorId ?? "",
      title: title,
      description: description,
      statusId: ProjectStatus.fromId(statusId).id,
      createdAt: createdAt,
      dueDate: dueDate,
    );
  }
}
