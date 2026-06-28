// features/project_tasks/domain/repositories/task_repository.dart
import 'package:dartz/dartz.dart';
import 'package:task_craft/core/errors/failures.dart';
import 'package:task_craft/core/network/success_repsonse.dart';
import 'package:task_craft/features/tasks/domain/entities/task_entity.dart';

abstract class TaskRepository {
  // بث مباشر للمهام الخاصة بمشروع محدد
  Stream<List<TaskEntity>> watchTasksStream(String projectId);

  // تحديث الكاش للمهام من السيرفر
  Future<Either<Failure, Success<List<TaskEntity>>>> refreshTasksCache(String projectId);

  // إنشاء مهمة جديدة وتحديث حالة المهمة (مثل التبديل إلى Done)
  Future<Either<Failure, Success<TaskEntity>>> createTask({required TaskEntity task, required String projectId});
  Future<Either<Failure, Success<TaskEntity>>> updateTaskStatus(String taskId, int statusId);

  // حذف مهمة
  Future<Either<Failure, Success>> deleteTask(String taskId);
}