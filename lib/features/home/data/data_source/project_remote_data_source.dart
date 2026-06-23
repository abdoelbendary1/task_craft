import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../models/project_model.dart';

abstract class ProjectRemoteDataSource {
  Future<List<ProjectModel>> fetchRemoteProjects();
  Future<ProjectModel> createRemoteProject(ProjectModel project);
  Future<void> deleteRemoteProject(String projectId);
}

// 🟢 FIXED: Removed whitespace gap so the generator tracks the type system signature correctly
@LazySingleton(as: ProjectRemoteDataSource)
class ProjectRemoteDataSourceImpl implements ProjectRemoteDataSource {
  final Dio _dio;

  ProjectRemoteDataSourceImpl(this._dio);

  @override
  Future<List<ProjectModel>> fetchRemoteProjects() async {
    final response = await _dio.get('https://jsonplaceholder.typicode.com/posts?_limit=10');
    final List<dynamic> data = response.data;
    return data.map((json) => ProjectModel.fromJson(json)).toList();
  }

  @override
  Future<ProjectModel> createRemoteProject(ProjectModel project) async {
    final response = await _dio.post(
      'https://jsonplaceholder.typicode.com/posts', 
      data: {
        'title': project.title,
        'body': project.description, // Correctly matches JSONPlaceholder outbound field specs
        'userId': project.userId,
      },
    );
    return ProjectModel.fromJson(response.data);
  }

  @override
  Future<void> deleteRemoteProject(String projectId) async {
    await _dio.delete('https://jsonplaceholder.typicode.com/posts/$projectId');
  }
}