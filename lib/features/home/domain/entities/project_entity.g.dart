// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProjectEntity _$ProjectEntityFromJson(Map<String, dynamic> json) =>
    _ProjectEntity(
      id: json['id'] as String,
      userId: json['userId'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      status: json['status'] as String,
      tasks: (json['tasks'] as List<dynamic>)
          .map((e) => TaskModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      isCompleted: json['isCompleted'] as bool,
    );

Map<String, dynamic> _$ProjectEntityToJson(_ProjectEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'title': instance.title,
      'description': instance.description,
      'status': instance.status,
      'tasks': instance.tasks,
      'isCompleted': instance.isCompleted,
    };
