

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:task_craft/core/errors/failures.dart';
import 'package:task_craft/core/network/success_repsonse.dart';
import 'package:task_craft/features/home/data/data_source/project_local_data_source.dart';
import 'package:task_craft/features/home/data/data_source/project_remote_data_source.dart';
import 'package:task_craft/features/home/data/models/project_model.dart';
import 'package:task_craft/features/home/domain/entities/project_entity.dart';
import 'package:task_craft/features/home/domain/repositories/project_repository.dart';
import 'package:uuid/uuid.dart';
@LazySingleton(as: ProjectRepository)
class ProjectRepositoryImpl implements ProjectRepository {
  final ProjectRemoteDataSource _remoteDataSource;
  final ProjectLocalDataSource _localDataSource;
  final _uuid = const Uuid();

  ProjectRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Stream<List<ProjectEntity>> watchProjectsStream() {
    return _localDataSource.watchCachedProjects().map((modelsList) =>
        modelsList.map((model) => model.toEntity()).toList());
  }

  @override
  Future<Either<Failure, Success>> refreshProjectsCache() async {
    try {
      final remoteProjects = await _remoteDataSource.fetchRemoteProjects();
      await _localDataSource.cacheProjectsList(remoteProjects);
      return Right(Success(data: unit, message: "Cache refreshed", statusCode: 200));
    } catch (e) {
      return Left(ServerFailure(message:  "Background project refresh failed: $e"));
    }
  }

  @override
  Future<Either<Failure, Success<ProjectEntity>>> createProject(
   ProjectEntity projectEntity
  ) async {
    final clientSideId = _uuid.v4();
    final localModel =  projectEntity.toModel();

    try {
      // Write locally first. This triggers the watch stream and instantly updates the UI!
      await _localDataSource.cacheSingleProject(localModel.copyWith(id: clientSideId));

      // Send the update to the remote server in the background
      await _remoteDataSource.createRemoteProject(localModel.copyWith(id: clientSideId));

      return Right(Success(data: localModel.toEntity(), message: "Project created", statusCode: 201));
    } catch (e) {
      // Maintain offline resilience
      return Right(Success(data: localModel.toEntity(), message: "Saved offline", statusCode: 202));
    }
  }

  @override
  Future<Either<Failure, Success>> deleteProject(String projectId) async {
    try {
      await _localDataSource.deleteCachedProject(projectId);
      await _remoteDataSource.deleteRemoteProject(projectId);
      return Right(Success(data: unit, message: "Project removed", statusCode: 200));
    } catch (e) {
      return Left(ServerFailure(message:  "Failed to complete project deletion: $e"));
    }
  }
}