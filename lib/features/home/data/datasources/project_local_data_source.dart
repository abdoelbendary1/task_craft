import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import '../models/project_model.dart';

abstract class ProjectLocalDataSource {
  // 🟢 Returns a live reactive stream of all locally cached projects
  Stream<List<ProjectModel>> watchCachedProjects();
  Future<List<ProjectModel>> getCachedProjects();
  Future<void> cacheProjectsList(List<ProjectModel> projects);
  Future<void> cacheSingleProject(ProjectModel project);
  Future<void> deleteCachedProject(String projectId);
}

@LazySingleton(as: ProjectLocalDataSource)
class ProjectLocalDataSourceImpl implements ProjectLocalDataSource {
  final Box<ProjectModel> _projectBox;

  ProjectLocalDataSourceImpl(this._projectBox);

  @override
  Stream<List<ProjectModel>> watchCachedProjects() async* {
    // 1. Instantly emit the current stable state sitting inside the database cache
    yield _projectBox.values.whereType<ProjectModel>().toList();

    // 2. Reactively emit clean updates whenever changes occur
    await for (final _ in _projectBox.watch()) {
      yield _projectBox.values.whereType<ProjectModel>().toList();
    }
  }

  @override
  Future<List<ProjectModel>> getCachedProjects() async {
    return _projectBox.values.toList();
  }

  @override
  Future<void> cacheProjectsList(List<ProjectModel> projects) async {
    // 🟢 1. Completely clear out stale rows so that if projects is empty, Hive is accurately emptied!
    await _projectBox.clear();

    // 🟢 2. Mass-insert items efficiently using putAll instead of a slow for-loop block
    if (projects.isNotEmpty) {
      // Map list entries to a key-value pair map configuration
      final entries = {
        for (var project in projects) project.id.toString(): project,
      };
      await _projectBox.putAll(entries);
    }
  }

  @override
  Future<void> cacheSingleProject(ProjectModel project) async {
    await _projectBox.put(project.id.toString(), project);
  }

  @override
  Future<void> deleteCachedProject(String projectId) async {
    await _projectBox.delete(projectId);
  }
}
