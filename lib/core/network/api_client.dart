import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import '../../features/home/data/models/project_model.dart';

@module
abstract class RegisterModule {
  // 🟢 1. Register Dio as a Lazy Singleton
  @lazySingleton
 @lazySingleton
  Dio get dio {
    final dioInstance = Dio(
      BaseOptions(
        // 🟢 Directing traffic to JSONPlaceholder's core branch
        baseUrl: 'https://jsonplaceholder.typicode.com/', 
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    // 🟢 Interceptor wrapper safely catches public API rate limits or drops
    dioInstance.interceptors.add(
      InterceptorsWrapper(
        onError: (DioException error, handler) {
          if (error.type == DioExceptionType.connectionTimeout || 
              error.type == DioExceptionType.receiveTimeout) {
            print('⚠️ JSONPlaceholder timed out. Serving local storage data fallback!');
          }
          return handler.next(error); // Pass failure safely through to Clean Architecture failures wrapper
        },
      ),
    );

    return dioInstance;
  }

  // 🟢 2. Register your opened Hive Cache Box
 @preResolve
  Future<Box<ProjectModel>> get projectBox async {
    return await Hive.openBox<ProjectModel>('projects_cache_box');
  }
}