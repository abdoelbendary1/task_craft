import 'package:dartz/dartz.dart';
import 'package:task_craft/core/errors/failures.dart';
import 'package:task_craft/core/network/success_repsonse.dart';
import '../entities/project_entity.dart';

abstract class ProjectRepository {
  Stream<List<ProjectEntity>> watchProjectsStream();
  
  // Background Sync Force Actions
  Future<Either<Failure, Success<List<ProjectEntity>>>> refreshProjectsCache();
  
  // Create & Delete Workspace Sync Controls
  Future<Either<Failure, Success<ProjectEntity>>> createProject(ProjectEntity project);
  Future<Either<Failure, Success>> deleteProject(String projectId);
}