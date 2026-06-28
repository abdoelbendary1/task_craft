// features/project_tasks/domain/usecases/watch_tasks_stream.dart
import 'package:injectable/injectable.dart';
import '../entities/task_entity.dart';
import '../repositories/task_repository.dart';

@injectable
class WatchTasksStream {
  final TaskRepository _repository;
  WatchTasksStream(this._repository);

  Stream<List<TaskEntity>> call(String projectId) {
    return _repository.watchTasksStream(projectId);
  }
}