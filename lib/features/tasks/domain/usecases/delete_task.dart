// features/project_tasks/domain/usecases/delete_task.dart
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:task_craft/core/errors/failures.dart';
import 'package:task_craft/core/network/success_repsonse.dart';
import '../repositories/task_repository.dart';

@injectable
class DeleteTask {
  final TaskRepository _repository;
  DeleteTask(this._repository);

  Future<Either<Failure, Success>> call(String taskId) async {
    return await _repository.deleteTask(taskId);
  }
}