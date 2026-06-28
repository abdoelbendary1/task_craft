// features/project_tasks/data/repositories/task_repository_impl.dart
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:task_craft/core/enum/https_mehtods.dart';
import 'package:task_craft/core/enum/task_status.dart';
import 'package:task_craft/core/errors/failures.dart';
import 'package:task_craft/core/network/interceptor/api_endpoints.dart';
import 'package:task_craft/core/network/success_repsonse.dart';
import 'package:task_craft/core/services/sync/sync_manager.dart';
import 'package:task_craft/features/tasks/data/model/task_model.dart';
import 'package:task_craft/features/tasks/domain/entities/task_entity.dart';
import 'package:uuid/uuid.dart';

import '../../domain/repositories/task_repository.dart';
import '../datasources/task_local_data_source.dart';
import '../datasources/task_remote_data_source.dart';

@LazySingleton(as: TaskRepository)
class TaskRepositoryImpl implements TaskRepository {
  final TaskRemoteDataSource _remoteDataSource;
  final TaskLocalDataSource _localDataSource;
  final Connectivity _connectivity;
  final SyncManager _syncManager;
  final _uuid = const Uuid();

  TaskRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
    this._connectivity,
    this._syncManager,
  );

  @override
  Stream<List<TaskEntity>> watchTasksStream(String projectId) {
    return _localDataSource.watchCachedTasks(projectId).map(
          (models) => models.map((m) => m.toEntity()).toList(),
        );
  }

  @override
  Future<Either<Failure, Success<List<TaskEntity>>>> refreshTasksCache(String projectId) async {
    try {
      final connection = await _connectivity.checkConnectivity();
      if (connection.contains(ConnectivityResult.none)) {
        return Left(ServerFailure(message: "You are currently offline."));
      }

      final remoteModels = await _remoteDataSource.fetchRemoteTasks(projectId);
      await _localDataSource.cacheTasksList(projectId, remoteModels);

      return Right(
        Success(
          data: remoteModels.map((m) => m.toEntity()).toList(),
          message: "Tasks refreshed",
          statusCode: 200,
        ),
      );
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Success<TaskEntity>>> createTask({required TaskEntity task, required String projectId}) async {
    final clientSideId = _uuid.v4();
    final model = task.toModel().copyWith(id: clientSideId, createdAt: DateTime.now(),projectId: projectId);

    await _localDataSource.cacheSingleTask(model);

    try {
      final response = await _remoteDataSource.createRemoteTask(task: model, projectId: projectId);
      return Right(
        Success(data: response.toEntity(), message: "Task saved successfully", statusCode: 200),
      );
    } on DioException catch (e) {  
       print("🚨🚨 [SUPABASE ERROR]: ${e.response?.data}");
      print("📦📦 [PAYLOAD SENT]: ${model.toJson()}");
      if (e.type == DioExceptionType.connectionError || e.response?.statusCode == 503) {
        await _syncManager.addToActionQueue(
          endpoint: ApiEndpoints.tasks,
          method: HttpMethod.POST.name,
          payload: model.toJson(),
        );
        return Right(
          Success(data: model.toEntity(), message: "Saved offline", statusCode: 202),
        );
      }
      return Left(ServerFailure(message: "Failed to sync task."));
    }
  }

@override
Future<Either<Failure, Success<TaskEntity>>> updateTaskStatus(String taskId, int statusId) async {
  // 1. قراءة التاسك الحالية من الكاش
  final cachedTask = await _localDataSource.getCachedTaskById(taskId);
  if (cachedTask == null) {
    return Left(CacheFailure(message: "Task not found locally."));
  }

  // 2. تحديث الـ Status محلياً (Optimistic Update)
  final updatedModel = cachedTask.copyWith(
    statusId: statusId,
  );

  // حفظ التعديل فوراً في الكاش (الـ UI كدا كدا هيتحدث ويحس إنها نجحت)
  await _localDataSource.cacheSingleTask(updatedModel);

  try {
    // 3. محاولة تحديث السيرفر
    final response = await _remoteDataSource.updateRemoteTaskStatus(taskId, statusId);
    
    // تأكيد الداتا من السيرفر
    await _localDataSource.cacheSingleTask(response);
    
    return Right(
      Success(data: response.toEntity(), message: "Task updated successfully", statusCode: 200),
    );
  } on DioException catch (e) {
    print("🚨 [Dio Error caught]: ${e.type} | StatusCode: ${e.response?.statusCode}");

    // 4. هنا السحر كله: لو الخطأ بسبب السيرفر نفسه (مثلاً 400 Bad Request / 401 Unauthorized)
    // يعني السيرفر شغال بس رافض الداتا، هنا بس نعمل Rollback ونطلع Error
    if (e.response != null && e.response!.statusCode! >= 400 && e.response!.statusCode! < 500) {
      await _localDataSource.cacheSingleTask(cachedTask); // رجع الداتا القديمة
      return Left(ServerFailure(message: "Server rejected the update."));
    }

    // 5. أي خطأ تاني (مفيش نت، تيم أوت، السيرفر واقع 502/503، أو خطأ Unknown)
    // احفظ في الـ Queue فوراً ورجّع Right (نجاح أوفلاين) عشان الـ UI ميبوظش!
    await _syncManager.addToActionQueue(
      endpoint: ApiEndpoints.updateOrDeleteTask(taskId),
      method: HttpMethod.PATCH.name,
      payload: {'status_id': statusId},
    );
    
    return Right(
      Success(data: updatedModel.toEntity(), message: "Saved offline", statusCode: 202),
    );
  } catch (e) {
    // خطأ غير متوقع، برضه هنعتبره أوفلاين ومبوظش الـ UX
    await _syncManager.addToActionQueue(
      endpoint: ApiEndpoints.updateOrDeleteTask(taskId),
      method: HttpMethod.PATCH.name,
      payload: {'status_id': statusId},
    );
    return Right(
      Success(data: updatedModel.toEntity(), message: "Saved offline", statusCode: 202),
    );
  }
}
@override
Future<Either<Failure, Success>> deleteTask(String taskId) async {
  try {
    // 1. الحذف الفوري من الكاش المحلي لتحديث الـ UI لحظياً (Optimistic UI Update)
    await _localDataSource.deleteCachedTask(taskId);
    
    // 2. محاولة الحذف من السيرفر
    await _remoteDataSource.deleteRemoteTask(taskId);
    return Right(
      Success(data: unit, message: "Task permanently removed", statusCode: 200),
    );
  } on DioException catch (e) {
    // 3. في حالة الـ Offline يتم دفع العملية لـ Sync Queue الذكي الخاص بك
    if (e.type == DioExceptionType.connectionError || e.response?.statusCode == 503) {
      await _syncManager.addToActionQueue(
        endpoint: 'tasks?id=eq.$taskId',
        method: 'DELETE',
        payload: {},
      );
      return Right(
        Success(data: unit, message: "Removed offline successfully", statusCode: 202),
      );
    }
    return Left(ServerFailure(message: "Failed to delete task from server."));
  }
}
}