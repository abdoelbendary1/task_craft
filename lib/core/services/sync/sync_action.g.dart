// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_action.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SyncActionInternal extends TypeAdapter<_SyncAction> {
  @override
  final typeId = 10;

  @override
  _SyncAction read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _SyncAction();
  }

  @override
  void write(BinaryWriter writer, _SyncAction obj) {
    writer.writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SyncActionInternal &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SyncAction _$SyncActionFromJson(Map<String, dynamic> json) => _SyncAction(
  id: json['id'] as String? ?? '',
  endpoint: json['endpoint'] as String? ?? '',
  method: json['method'] as String? ?? '',
  payload: json['payload'] as Map<String, dynamic>? ?? const {},
  timestamp: (json['timestamp'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$SyncActionToJson(_SyncAction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'endpoint': instance.endpoint,
      'method': instance.method,
      'payload': instance.payload,
      'timestamp': instance.timestamp,
    };
