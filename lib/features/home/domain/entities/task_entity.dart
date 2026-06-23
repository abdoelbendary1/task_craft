// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:task_craft/features/home/data/models/task_model.dart';
// part 'task_entity.freezed.dart';

// @freezed
// abstract class TaskEntity with _$TaskEntity {
//   const factory TaskEntity({
//     required String id,
//     required String title,
//     required String description,
//     required String dueDate,
//     required String priority,
//     required String status,
//     required String projectId,
//   }) = _TaskEntity;
// }

// extension TaskEntityX on TaskEntity {
//   TaskModel toModel() => TaskModel(
//     id: id,
//     title: title,
//     description: description,
//     dueDate: dueDate,
//     priority: priority,
//     status: status,
//     projectId: projectId,
//   );
// }


class TaskEntity {
  final String id;
  final String title;
  final bool isCompleted;
  final String projectId;

  const TaskEntity({
    required this.id,
    required this.title,
    required this.isCompleted,
    required this.projectId,
  });
}