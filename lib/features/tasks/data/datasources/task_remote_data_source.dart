// lib/features/project_tasks/data/datasources/task_remote_data_source.dart
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:task_craft/core/enum/https_mehtods.dart';
import 'package:task_craft/core/network/api_client.dart';
import 'package:task_craft/core/network/interceptor/api_endpoints.dart';
import 'package:task_craft/features/tasks/data/model/task_model.dart';

abstract class TaskRemoteDataSource {
  Future<List<TaskModel>> fetchRemoteTasks(String projectId);
  Future<TaskModel> createRemoteTask({required TaskModel task, required String projectId});
  Future<TaskModel> updateRemoteTaskStatus(String taskId, int statusId);
  Future<void> deleteRemoteTask(String taskId);
}

@LazySingleton(as: TaskRemoteDataSource)
class TaskRemoteDataSourceImpl implements TaskRemoteDataSource {
  final ApiClient _apiClient;

  TaskRemoteDataSourceImpl(this._apiClient);

  @override
  Future<List<TaskModel>> fetchRemoteTasks(String projectId) async {
    return await _apiClient.request<List<TaskModel>>(
      path: ApiEndpoints.getTasks(projectId),
      method: HttpMethod.GET.name,
      fromJson: (json) => (json as List).map((e) => TaskModel.fromJson(e)).toList(),
    );
  }

  @override
  Future<TaskModel> createRemoteTask({required TaskModel task, required String projectId}) async {
    final updatedTask = task.copyWith(projectId: projectId);
    return await _apiClient.request<TaskModel>(
      path: ApiEndpoints.tasks,
      method: HttpMethod.POST.name,
      data: updatedTask.toJson(),
      options: Options(headers: {'Prefer': 'return=representation'}),
      fromJson: (json) => TaskModel.fromJson((json as List).first),
    );
  }

  @override
  Future<TaskModel> updateRemoteTaskStatus(String taskId, int statusId) async {
    return await _apiClient.request<TaskModel>(
      path: ApiEndpoints.updateOrDeleteTask(taskId),
      method: HttpMethod.PATCH.name,
      data: {'status_id': statusId},
      options: Options(headers: {'Prefer': 'return=representation'}),
      fromJson: (json) => TaskModel.fromJson((json as List).first),
    );
  }

  @override
  Future<void> deleteRemoteTask(String taskId) async {
    await _apiClient.request<void>(
      path: ApiEndpoints.updateOrDeleteTask(taskId),
      method: HttpMethod.DELETE.name,
      fromJson: (_) {},
    );
  }
}