// features/project_tasks/domain/entities/task_entity.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_craft/core/enum/task_status.dart'; 
import 'package:task_craft/features/tasks/data/model/task_model.dart';

part 'task_entity.freezed.dart';

@freezed 
abstract class TaskEntity with _$TaskEntity {
  // 🟢 Senior Tip: الـ Constructor الفارغ هذا إجباري في Freezed إذا كنت تضيف Extensions أو Custom Methods للكلاس
  const TaskEntity._(); 

  const factory TaskEntity({
    String? id,
    String? projectId,
    String? title,
    String? description,
    TaskStatus? status,
    TaskPriority? priority, // تأكد أن الـ TaskPriority معرفة داخل الـ enum أو الملف المستورد فوق
    DateTime? createdAt,
  }) = _TaskEntity;
}

// 🟢 الـ Extension منفصلة تماماً ومحمية
extension TaskEntityX on TaskEntity {
  TaskModel toModel() => TaskModel(
        id: id ?? "",
        projectId: projectId ?? "",
        title: title ?? "",
        description: description ?? "",
        statusId: status?.id ?? 0,
        priorityId: priority?.id ?? 0,
        createdAt: createdAt,
      );
}