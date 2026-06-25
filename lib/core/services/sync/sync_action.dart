// lib/core/services/sync/sync_action.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'sync_action.freezed.dart';
part 'sync_action.g.dart';

@freezed
abstract class SyncAction extends HiveObject with _$SyncAction {
  @HiveType(typeId: 10, adapterName: 'SyncActionInternal')
  factory SyncAction({
    @HiveField(0) @Default('') String id,
    @HiveField(1) @Default('') String endpoint,
    @HiveField(2) @Default('') String method,
    @HiveField(3) @Default({}) Map<String, dynamic> payload,
    @HiveField(4) @Default(0) int timestamp,
  }) = _SyncAction;

  // 🟢 ADD THIS LINE TO FIX THE FREEZED COMPILATION ERROR:
  SyncAction._();

  factory SyncAction.fromJson(Map<String, dynamic> json) =>
      _$SyncActionFromJson(json);
}
