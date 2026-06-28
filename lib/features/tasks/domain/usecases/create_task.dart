// features/project_tasks/domain/usecases/create_task.dart
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:task_craft/core/errors/failures.dart';
import 'package:task_craft/core/network/success_repsonse.dart';
import '../entities/task_entity.dart';
import '../repositories/task_repository.dart';

@injectable
class CreateTask {
  final TaskRepository _repository;
  CreateTask(this._repository);

  Future<Either<Failure, Success<TaskEntity>>> call({required TaskEntity task, required String projectId}) async {
    return await _repository.createTask(task: task, projectId: projectId);
  }
}