// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskModelAdapter extends TypeAdapter<_TaskModel> {
  @override
  final typeId = 1;

  @override
  _TaskModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _TaskModel();
  }

  @override
  void write(BinaryWriter writer, _TaskModel obj) {
    writer.writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TaskModel _$TaskModelFromJson(Map<String, dynamic> json) => _TaskModel(
  id: json['id'] as String? ?? "",
  projectId: json['project_id'] as String? ?? "",
  title: json['title'] as String? ?? "",
  description: json['description'] as String? ?? "",
  statusId: (json['status_id'] as num?)?.toInt() ?? 0,
  priorityId: (json['priority_id'] as num?)?.toInt() ?? 1,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$TaskModelToJson(_TaskModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'project_id': instance.projectId,
      'title': instance.title,
      'description': instance.description,
      'status_id': instance.statusId,
      'priority_id': instance.priorityId,
      'created_at': instance.createdAt?.toIso8601String(),
    };
