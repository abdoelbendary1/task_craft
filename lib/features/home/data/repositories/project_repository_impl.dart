import 'package:connectivity_plus/connectivity_plus.dart';
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
  final Connectivity _connectivity;
  final _uuid = const Uuid();

  ProjectRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
    this._connectivity,
  );

  @override
  Stream<List<ProjectEntity>> watchProjectsStream() async* {
    // 1. Instantly listen to whatever is currently alive inside Hive
    yield* _localDataSource.watchCachedProjects().map(
      (models) => models.map((m) => m.toEntity()).toList(),
    );

    // 2. Fetch fresh rows over the air asynchronously if internet is active
    final connection = await _connectivity.checkConnectivity();
    if (!connection.contains(ConnectivityResult.none)) {
      try {
        final remoteModels = await _remoteDataSource.fetchRemoteProjects();
        await _localDataSource.cacheProjectsList(remoteModels);
      } catch (e) {
        print('Background cache sync failed silently: $e');
      }
    }
  }

  @override
  Future<Either<Failure, Success<List<ProjectEntity>>>>
  refreshProjectsCache() async {
    try {
      final remoteProjects = await _remoteDataSource.fetchRemoteProjects();
      await _localDataSource.cacheProjectsList(remoteProjects);
      return Right(
        Success(
          data: remoteProjects.map((m) => m.toEntity()).toList(),
          message: "Cache refreshed",
          statusCode: 200,
        ),
      );
    } catch (e) {
      return Left(
        ServerFailure(message: "Background project refresh failed: $e"),
      );
    }
  }

  @override
  Future<Either<Failure, Success<ProjectEntity>>> createProject(
    ProjectEntity projectEntity,
  ) async {
    final clientSideId = _uuid.v4();
    final localModel = projectEntity;

    try {
      // Write locally first. This triggers the watch stream and instantly updates the UI!
      await _localDataSource.cacheSingleProject(
        projectEntity.toModel().copyWith(id: clientSideId),
      );

      // Send the update to the remote server in the background
      await _remoteDataSource.createRemoteProject(
        projectEntity.toModel().copyWith(id: clientSideId),
      );

      return Right(
        Success(data: localModel, message: "Project created", statusCode: 201),
      );
    } catch (e) {
      // Maintain offline resilience
      return Right(
        Success(data: localModel, message: "Saved offline", statusCode: 202),
      );
    }
  }

  @override
  Future<Either<Failure, Success>> deleteProject(String projectId) async {
    try {
      await _localDataSource.deleteCachedProject(projectId);
      await _remoteDataSource.deleteRemoteProject(projectId);
      return Right(
        Success(data: unit, message: "Project removed", statusCode: 200),
      );
    } catch (e) {
      return Left(
        ServerFailure(message: "Failed to complete project deletion: $e"),
      );
    }
  }
}
