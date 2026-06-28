// lib/features/home/data/datasources/project_remote_data_source.dart
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:task_craft/core/enum/https_mehtods.dart';
import 'package:task_craft/core/network/api_client.dart';
import 'package:task_craft/core/network/interceptor/api_endpoints.dart';
import '../models/project_model.dart';

abstract class ProjectRemoteDataSource {
  Future<List<ProjectModel>> fetchRemoteProjects();
  Future<ProjectModel> createRemoteProject(ProjectModel project);
  Future<void> deleteRemoteProject(String projectId);
}

@LazySingleton(as: ProjectRemoteDataSource)
class ProjectRemoteDataSourceImpl implements ProjectRemoteDataSource {
  final ApiClient _apiClient; // 🟢 حقن الـ Client الجديد بدلاً من دايو مباشرة

  ProjectRemoteDataSourceImpl(this._apiClient);

  @override
  Future<List<ProjectModel>> fetchRemoteProjects() async {
    return await _apiClient.request<List<ProjectModel>>(
      path: ApiEndpoints.getProjects(),
      method: HttpMethod.GET.name,
      fromJson: (json) => (json as List).map((e) => ProjectModel.fromJson(e)).toList(),
    );
  }

  @override
  Future<ProjectModel> createRemoteProject(ProjectModel project) async {
    return await _apiClient.request<ProjectModel>(
      path: ApiEndpoints.projects,
      method: HttpMethod.POST.name,
      data: project.toJson(),
      fromJson: (json) => ProjectModel.fromJson((json as List).first),
    );
  }

  @override
  Future<void> deleteRemoteProject(String projectId) async {
    await _apiClient.request<void>(
      path: ApiEndpoints.deleteProject(projectId),
      method: HttpMethod.DELETE.name,
      fromJson: (_) {}, // لا نتوقع عودة بيانات عند الحذف
    );
  }
}