// lib/features/home/data/datasources/project_remote_data_source.dart
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
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
    // 🟢 FIX: profiles!creator_id tells Supabase exactly which foreign key column maps the join
    final response = await _dio.get(
      'projects?select=*,profiles!creator_id(full_name)',
    );

    final List<dynamic> data = response.data;
    return data.map((json) => ProjectModel.fromJson(json)).toList();
  }

  @override
  Future<ProjectModel> createRemoteProject(ProjectModel project) async {
    // 🟢 FIXED: Routing directly to your custom Postgres projects table schema layout
    final response = await _dio.post(
      'projects',
      data: {
        'creator_id': project.creatorId,
        'title': project.title,
        'description': project.description,
        'status_id': project.statusId,
      },
    );
    // Prefer: return=representation header returns a List block; grab the single map item
    return ProjectModel.fromJson((response.data as List).first);
  }

  @override
  Future<void> deleteRemoteProject(String projectId) async {
    // 🟢 FIXED: Supabase PostgREST uses conditional column matching filters on deletion requests
    final response = await _dio.delete('projects?id=eq.$projectId');
    print(response.data);
  }
}
