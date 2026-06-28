// features/project_tasks/domain/usecases/refresh_tasks_cache.dart
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:task_craft/core/errors/failures.dart';
import 'package:task_craft/core/network/success_repsonse.dart';
import '../entities/task_entity.dart';
import '../repositories/task_repository.dart';

@injectable
class RefreshTasksCache {
  final TaskRepository _repository;
  RefreshTasksCache(this._repository);

  Future<Either<Failure, Success<List<TaskEntity>>>> call(String projectId) async {
    return await _repository.refreshTasksCache(projectId);
  }
}