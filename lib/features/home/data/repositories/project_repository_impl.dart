// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:injectable/injectable.dart';
// import 'package:task_craft/core/enum/https_mehtods.dart';
// import 'package:task_craft/core/errors/failures.dart';
// import 'package:task_craft/core/network/interceptor/api_endpoints.dart';
// import 'package:task_craft/core/network/success_repsonse.dart';
// import 'package:task_craft/core/services/sync/sync_manager.dart';
// import 'package:task_craft/features/home/data/datasources/project_local_data_source.dart';
// import 'package:task_craft/features/home/data/datasources/project_remote_data_source.dart';
// import 'package:task_craft/features/home/data/models/project_model.dart';
// import 'package:task_craft/features/home/domain/entities/project_entity.dart';
// import 'package:task_craft/features/home/domain/repositories/project_repository.dart';
// import 'package:uuid/uuid.dart';

// @LazySingleton(as: ProjectRepository)
// class ProjectRepositoryImpl implements ProjectRepository {
//   final ProjectRemoteDataSource _remoteDataSource;
//   final ProjectLocalDataSource _localDataSource;
//   final Connectivity _connectivity;
//   final SyncManager _syncManager;
//   final _uuid = const Uuid();

//   ProjectRepositoryImpl(
//     this._remoteDataSource,
//     this._localDataSource,
//     this._connectivity,
//     this._syncManager,
//   );

//   @override
//   Stream<List<ProjectEntity>> watchProjectsStream() {
//     return _localDataSource.watchCachedProjects().map(
//       (models) => models.map((m) => m.toEntity()).toList(),
//     );
//   }

//   @override
//   Future<Either<Failure, Success<List<ProjectEntity>>>>
//   refreshProjectsCache() async {
//     try {
//       final connection = await _connectivity.checkConnectivity();
//       if (connection.contains(ConnectivityResult.none)) {
//         return Left(ServerFailure(message: "You are currently offline."));
//       }

//       final remoteModels = await _remoteDataSource.fetchRemoteProjects();
//       final localModels = await _localDataSource.getCachedProjects();

//       final _ = await _localDataSource.cacheProjectsList(remoteModels);
//       return Right(
//         Success(
//           data: remoteModels.map((m) => m.toEntity()).toList(),
//           message: "Projects refreshed",
//           statusCode: 200,
//         ),
//       );
//     } catch (e) {
//       return Left(ServerFailure(message: e.toString()));
//     }
//   }

//   @override
//   Future<Either<Failure, Success<ProjectEntity>>> createProject(
//     ProjectEntity projectEntity,
//   ) async {
//     final clientSideId = _uuid.v4();

//     final model = projectEntity.toModel().copyWith(id: clientSideId);

//     await _localDataSource.cacheSingleProject(model);

//     try {
//       final response = await _remoteDataSource.createRemoteProject(model);
//       return Right(
//         Success(
//           data: response.toEntity(),
//           message: "Project saved",
//           statusCode: 200,
//         ),
//       );
//     } on DioException catch (e) {
//       print("🚨🚨 [SUPABASE ERROR]: ${e.response?.data}");
//       print("📦📦 [PAYLOAD SENT]: ${model.toJson()}");
//       if (e.type == DioExceptionType.connectionError ||
//           e.response?.statusCode == 503) {
//         await _syncManager.addToActionQueue(
//           endpoint: ApiEndpoints.projects,
//           method: HttpMethod.POST.name,
//           payload: model.toJson(),
//         );

//         return Right(
//           Success(
//             data: model.toEntity(),
//             message: "Saved offline",
//             statusCode: 202,
//           ),
//         );
//       }

//       await _localDataSource.deleteCachedProject(model.id);
//       return Left(ServerFailure(message: "Failed to save project."));
//     }
//   }

//   @override
//   Future<Either<Failure, Success>> deleteProject(String projectId) async {
//     try {
//       await _localDataSource.deleteCachedProject(projectId);
//       await _remoteDataSource.deleteRemoteProject(projectId);
//       return Right(
//         Success(data: unit, message: "Project removed", statusCode: 200),
//       );
//     } on DioException catch (e) {
//       if (e.type == DioExceptionType.connectionError ||
//           e.response?.statusCode == 503) {
//         await _syncManager.addToActionQueue(
//           endpoint: ApiEndpoints.deleteProject(projectId),
//           method: HttpMethod.DELETE.name,
//           payload: {'id': projectId},
//         );
//         return Right(
//           Success(data: unit, message: "Removed offline", statusCode: 202),
//         );
//       }
//       return Left(ServerFailure(message: "Failed to delete project"));
//     } catch (e) {
//       return Left(
//         ServerFailure(message: "Failed to complete project deletion: $e"),
//       );
//     }
//   }
// }
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:task_craft/core/enum/https_mehtods.dart';
import 'package:task_craft/core/errors/failures.dart';
import 'package:task_craft/core/errors/app_exceptions.dart'; // Ensure your custom exceptions are here
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
        return const Left(
          ServerFailure(message: "أنت غير متصل بالإنترنت حالياً."),
        );
      }

      final remoteModels = await _remoteDataSource.fetchRemoteProjects();
      await _localDataSource.cacheProjectsList(remoteModels);

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

    // 1. Instantly update local cache (Single Source of Truth)
    await _localDataSource.cacheSingleProject(model);

    try {
      // 2. Try remote update
      final response = await _remoteDataSource.createRemoteProject(model);
      return Right(
        Success(
          data: response.toEntity(),
          message: "Project saved successfully",
          statusCode: 200,
        ),
      );
    } catch (e) {
      // 3. Fallback to offline queue if client threw an network connection issue
      if (e is NetworkException) {
        await _syncManager.addToActionQueue(
          endpoint: ApiEndpoints.projects,
          method: HttpMethod.POST.name,
          payload: model.toJson(),
        );

        return Right(
          Success(
            data: model.toEntity(),
            message: "Saved locally (Will sync online later)",
            statusCode: 202,
          ),
        );
      }

      // 4. If it's an absolute server validation crash, revert the local cache change
      await _localDataSource.deleteCachedProject(model.id);
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Success>> deleteProject(String projectId) async {
    // 1. Instantly drop item from your local user UI flow cache
    await _localDataSource.deleteCachedProject(projectId);

    try {
      // 2. Clear remote asset entry
      await _remoteDataSource.deleteRemoteProject(projectId);
      return Right(
        Success(
          data: unit,
          message: "Project removed successfully",
          statusCode: 200,
        ),
      );
    } catch (e) {
      // 3. Queue item deletion for synchronization when connectivity drops
      if (e is NetworkException) {
        await _syncManager.addToActionQueue(
          endpoint: ApiEndpoints.deleteProject(projectId),
          method: HttpMethod.DELETE.name,
          payload: {'id': projectId},
        );
        return Right(
          Success(
            data: unit,
            message: "Removed offline (Will sync deletion later)",
            statusCode: 202,
          ),
        );
      }

      return Left(ServerFailure(message: e.toString()));
    }
  }
}
