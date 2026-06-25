// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProjectEntity _$ProjectEntityFromJson(Map<String, dynamic> json) =>
    _ProjectEntity(
      id: json['id'] as String? ?? '',
      creatorId: json['creatorId'] as String? ?? '',
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      statusId: (json['statusId'] as num?)?.toInt() ?? 0,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      dueDate: json['dueDate'] == null
          ? null
          : DateTime.parse(json['dueDate'] as String),
    );

Map<String, dynamic> _$ProjectEntityToJson(_ProjectEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'creatorId': instance.creatorId,
      'title': instance.title,
      'description': instance.description,
      'statusId': instance.statusId,
      'createdAt': instance.createdAt?.toIso8601String(),
      'dueDate': instance.dueDate?.toIso8601String(),
    };
