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
@LazySingleton(as:ProjectLocalDataSource)
class ProjectLocalDataSourceImpl implements ProjectLocalDataSource {
  final Box<ProjectModel> _projectBox;

  ProjectLocalDataSourceImpl(this._projectBox);

@override
  Stream<List<ProjectModel>> watchCachedProjects() async* {
    // 1. Immediately yield whatever data is currently sitting in local cache storage
    yield _projectBox.values.toList();
    
    // 2. FIXED: Changed 'move' to 'event' to cleanly handle incoming box updates
    await for (final event in _projectBox.watch()) {
      yield _projectBox.values.toList();
    }
  }

  @override
  Future<List<ProjectModel>> getCachedProjects() async {
    return _projectBox.values.toList();
  }

  @override
  Future<void> cacheProjectsList(List<ProjectModel> projects) async {
    for (var project in projects) {
      await _projectBox.put(project.id.toString(), project);
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