import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_craft/core/enum/project_status.dart';
import 'package:task_craft/features/home/domain/entities/project_entity.dart';

part 'project_model.freezed.dart';
part 'project_model.g.dart';

@freezed
abstract class ProjectModel with _$ProjectModel {
  @HiveType(typeId: 0) // 🟢 Assigned Hive Type ID
  const factory ProjectModel({
    @HiveField(0) @Default("") String id,
    @HiveField(1) @JsonKey(name: 'creator_id') @Default("") String creatorId,
    @HiveField(2) @Default("") String title,
    // 🟢 Changed key from 'body' to 'description' to match your Supabase column
    @HiveField(3) @JsonKey(name: 'description') @Default("") String description,
    @HiveField(4) @JsonKey(name: 'status_id') @Default(1) int statusId,
    @HiveField(5)
    @JsonKey(name: 'profiles')
    final Map<String, dynamic>? profiles,
  }) = _ProjectModel;

  factory ProjectModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectModelFromJson(json);
}

extension ProjectModelX on ProjectModel {
  ProjectEntity toEntity() {
    final profileData = profiles;

    return ProjectEntity(
      id: id,
      creatorId: creatorId,
      title: title,
      description: description,
      statusId: ProjectStatus.fromId(statusId).id,
      profiles: profileData ?? {},
    );
  }
}
