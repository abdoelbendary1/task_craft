// features/project_tasks/domain/usecases/update_task_status.dart
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:task_craft/core/errors/failures.dart';
import 'package:task_craft/core/network/success_repsonse.dart';
import '../entities/task_entity.dart';
import '../repositories/task_repository.dart';

@injectable
class UpdateTaskStatus {
  final TaskRepository _repository;
  UpdateTaskStatus(this._repository);

  Future<Either<Failure, Success<TaskEntity>>> call({
    required String taskId,
    required int statusId,
  }) async {
    return await _repository.updateTaskStatus(taskId, statusId);
  }
}