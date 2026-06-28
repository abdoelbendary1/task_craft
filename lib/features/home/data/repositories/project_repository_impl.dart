import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:task_craft/core/enum/https_mehtods.dart';
import 'package:task_craft/core/errors/failures.dart';
import 'package:task_craft/core/network/interceptor/api_endpoints.dart';
import 'package:task_craft/core/network/success_repsonse.dart';
import 'package:task_craft/core/services/sync/sync_manager.dart';
import 'package:task_craft/features/home/data/datasources/project_local_data_source.dart';
import 'package:task_craft/features/home/data/datasources/project_remote_data_source.dart';
import 'package:task_craft/features/home/data/models/project_model.dart';
import 'package:task_craft/features/home/domain/entities/project_entity.dart';
import 'package:task_craft/features/home/domain/repositories/project_repository.dart';
import 'package:uuid/uuid.dart';

@LazySingleton(as: ProjectRepository)
class ProjectRepositoryImpl implements ProjectRepository {
  final ProjectRemoteDataSource _remoteDataSource;
  final ProjectLocalDataSource _localDataSource;
  final Connectivity _connectivity;
  final SyncManager _syncManager;
  final _uuid = const Uuid();

  ProjectRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
    this._connectivity,
    this._syncManager,
  );

  @override
  Stream<List<ProjectEntity>> watchProjectsStream() {
    return _localDataSource.watchCachedProjects().map(
      (models) => models.map((m) => m.toEntity()).toList(),
    );
  }

  @override
  Future<Either<Failure, Success<List<ProjectEntity>>>>
  refreshProjectsCache() async {
    try {
      final connection = await _connectivity.checkConnectivity();
      if (connection.contains(ConnectivityResult.none)) {
        return Left(ServerFailure(message: "You are currently offline."));
      }

      final remoteModels = await _remoteDataSource.fetchRemoteProjects();
      final localModels = await _localDataSource.getCachedProjects();

      final _ = await _localDataSource.cacheProjectsList(remoteModels);
      return Right(
        Success(
          data: remoteModels.map((m) => m.toEntity()).toList(),
          message: "Projects refreshed",
          statusCode: 200,
        ),
      );
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Success<ProjectEntity>>> createProject(
    ProjectEntity projectEntity,
  ) async {
    final clientSideId = _uuid.v4();

    final model = projectEntity.toModel().copyWith(id: clientSideId);

    await _localDataSource.cacheSingleProject(model);

    try {
      final response = await _remoteDataSource.createRemoteProject(model);
      return Right(
        Success(
          data: response.toEntity(),
          message: "Project saved",
          statusCode: 200,
        ),
      );
    } on DioException catch (e) {
      print("🚨🚨 [SUPABASE ERROR]: ${e.response?.data}");
      print("📦📦 [PAYLOAD SENT]: ${model.toJson()}");
      if (e.type == DioExceptionType.connectionError ||
          e.response?.statusCode == 503) {
        await _syncManager.addToActionQueue(
          endpoint: ApiEndpoints.projects,
          method: HttpMethod.POST.name,
          payload: model.toJson(),
        );

        return Right(
          Success(
            data: model.toEntity(),
            message: "Saved offline",
            statusCode: 202,
          ),
        );
      }

      await _localDataSource.deleteCachedProject(model.id);
      return Left(ServerFailure(message: "Failed to save project."));
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
