// features/project_tasks/data/datasources/task_local_data_source.dart
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:task_craft/features/tasks/data/model/task_model.dart';

abstract class TaskLocalDataSource {
  Stream<List<TaskModel>> watchCachedTasks(String projectId);
  Future<List<TaskModel>> getCachedTasks(String projectId);
  Future<TaskModel?> getCachedTaskById(String taskId); // 👈 السطر الجديد هنا
  Future<void> cacheTasksList(String projectId, List<TaskModel> tasks);
  Future<void> cacheSingleTask(TaskModel task);
  Future<void> deleteCachedTask(String taskId);
}

@LazySingleton(as: TaskLocalDataSource)
class TaskLocalDataSourceImpl implements TaskLocalDataSource {
  final Box<TaskModel> _taskBox;

  TaskLocalDataSourceImpl(this._taskBox);

  @override
  Stream<List<TaskModel>> watchCachedTasks(String projectId) async* {
    yield _taskBox.values.where((t) => t.projectId == projectId).toList();

    await for (final _ in _taskBox.watch()) {
      yield _taskBox.values.where((t) => t.projectId == projectId).toList();
    }
  }

  @override
  Future<List<TaskModel>> getCachedTasks(String projectId) async {
    return _taskBox.values.where((t) => t.projectId == projectId).toList();
  }

  // 👈 الـ Implementation الجديد هنا
  @override
  Future<TaskModel?> getCachedTaskById(String taskId) async {
    return _taskBox.get(taskId);
  }

  @override
  Future<void> cacheTasksList(String projectId, List<TaskModel> tasks) async {
    // حذف المهام القديمة المتعلقة بهذا المشروع فقط لحماية كاش المشاريع الأخرى
    final keysToDelete = _taskBox.values
        .where((t) => t.projectId == projectId)
        .map((t) => t.id.toString());
    await _taskBox.deleteAll(keysToDelete);

    if (tasks.isNotEmpty) {
      final entries = {for (var task in tasks) task.id.toString(): task};
      await _taskBox.putAll(entries);
    }
  }

  @override
  Future<void> cacheSingleTask(TaskModel task) async {
    await _taskBox.put(task.id.toString(), task);
  }

  @override
  Future<void> deleteCachedTask(String taskId) async {
    await _taskBox.delete(taskId);
  }
}