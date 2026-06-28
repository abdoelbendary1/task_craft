// lib/core/di/register_module.dart

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:task_craft/core/di/injection.dart';
import 'package:task_craft/core/network/interceptor/api_endpoints.dart';
import 'package:task_craft/core/network/keys.dart';
import 'package:task_craft/core/services/sync/sync_action.dart';
import 'package:task_craft/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:task_craft/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:task_craft/features/tasks/data/model/task_model.dart';
import '../../features/home/data/models/project_model.dart';

@module
abstract class RegisterModule {
  
  // 🟢 حقن الـ Anon Key بشكل نظيف في الـ DI Container
  @Named('supabaseAnonKey')
  String get supabaseAnonKey => 'your_actual_supabase_anon_key_here';

  // 🔐 1. نسخة الـ Dio الخاصة بالـ Auth (منعزلة ومحمية من الـ Interceptors التانية)
  @lazySingleton
  @Named('authDio') 
  Dio authDio(@Named('supabaseAnonKey') String anonKey) { 
    return Dio(
      BaseOptions(
        baseUrl: 'https://qgfhhtdlmnbfwflexduz.supabase.co/auth/v1',
        headers: {
          'apikey': anonKey,
          'Content-Type': 'application/json',
        },
      ),
    );
  }

  // 📁 2. نسخة الـ Dio الأساسية للـ Database (المشاريع والتاسكات) مع كامل الـ Interceptors
  @lazySingleton
  Dio dio(AuthLocalDataSource authLocalDataSource) {
    final dioInstance = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.restBaseUrl, 
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'apikey': supabaseAnonKey,
          'Prefer': 'return=representation',
        },
      ),
    );

    dioInstance.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await authLocalDataSource.getAccessToken();
          
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          } else {
            options.headers.remove('Authorization');
          }
          return handler.next(options);
        },
        onError: (DioException error, handler) async {
          if (error.response?.statusCode == 401) {
            final requestPath = error.requestOptions.path;
            
            if (requestPath.contains('logout') || 
                requestPath.contains('token') || 
                requestPath.contains('profiles')) {
              return handler.next(error);
            }

            if (requestPath.contains('projects') || requestPath.contains('tasks')) {
              print('⚠️ Authorization failed for database operation: $requestPath');
              return handler.next(error); 
            }

            print('❌ Session expired or invalid token! Instigating structural logouts...');
            await authLocalDataSource.clearSession();
            getIt<AuthBloc>().add(const AuthEvent.loggedOut());
          }
          return handler.next(error);
        },
      ),
    );

    return dioInstance;
  }

  @preResolve
  Future<Box<ProjectModel>> get projectBox async {
    return await Hive.openBox<ProjectModel>('projects_cache_box');
  }

  @preResolve
  Future<Box<TaskModel>> get taskBox async {
    return await Hive.openBox<TaskModel>('tasks_cache_box');
  }

  @preResolve
  Future<Box<SyncAction>> get syncActionBox async =>
      await Hive.openBox<SyncAction>('sync_queue');

  @lazySingleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage(
        aOptions: AndroidOptions(encryptedSharedPreferences: true),
      );

  @lazySingleton
  SupabaseClient get supabaseClient => Supabase.instance.client;

  @lazySingleton
  Connectivity get connectivity => Connectivity();

  @preResolve
  Future<SharedPreferences> get sharedPreferences async =>
      await SharedPreferences.getInstance();
}