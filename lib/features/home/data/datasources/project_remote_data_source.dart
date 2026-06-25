// lib/features/home/data/datasources/project_remote_data_source.dart
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:task_craft/core/network/interceptor/api_endpoints.dart';
import '../models/project_model.dart';

abstract class ProjectRemoteDataSource {
  Future<List<ProjectModel>> fetchRemoteProjects();
  Future<ProjectModel> createRemoteProject(ProjectModel project);
  Future<void> deleteRemoteProject(String projectId);
}

@LazySingleton(as: ProjectRemoteDataSource)
class ProjectRemoteDataSourceImpl implements ProjectRemoteDataSource {
  final Dio _dio;

  ProjectRemoteDataSourceImpl(this._dio);

  @override
  Future<List<ProjectModel>> fetchRemoteProjects() async {
    final response = await _dio.get(ApiEndpoints.getProjects());

    final List<dynamic> data = response.data;
    return data.map((json) => ProjectModel.fromJson(json)).toList();
  }

  @override
  Future<ProjectModel> createRemoteProject(ProjectModel project) async {
    final response = await _dio.post(
      ApiEndpoints.projectsPath,
      data: project.toJson(),
    );
    return ProjectModel.fromJson((response.data as List).first);
  }

  @override
  Future<void> deleteRemoteProject(String projectId) async {
    await _dio.delete(ApiEndpoints.deleteProject(projectId));
  }
}
