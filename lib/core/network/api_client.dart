import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:task_craft/core/network/interceptor/api_endpoints.dart';
import 'package:task_craft/core/network/keys.dart';
import 'package:task_craft/core/services/sync/sync_action.dart';
import 'package:task_craft/features/auth/data/datasources/auth_local_data_source.dart';
import '../../features/home/data/models/project_model.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Dio dio(AuthLocalDataSource authLocalDataSource) {
    // 🟢 Replace this string with the actual public anon JWT key from your Supabase Dashboard

    final dioInstance = Dio(
      BaseOptions(
        // 🟢 Pointing directly to your unique Supabase REST v1 engine deployment
        baseUrl: ApiEndpoints.baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          // 🟢 Supabase Gateway identity authorization parameters
          'apikey': supabaseAnonKey,
          // 🔥 CRITICAL: PostgREST won't pass back created/updated records without this header!
          'Prefer': 'return=representation',
        },
      ),
    );

    dioInstance.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // Automatically extract the encrypted token from hardware keychains
          final token = await authLocalDataSource.getAccessToken();

          if (token != null && token.isNotEmpty) {
            // If the user logged in, use their private account session token
            options.headers['Authorization'] = 'Bearer $token';
          } else {
            // Fall back to public anon token if they aren't authenticated yet
            options.headers['Authorization'] = 'Bearer $supabaseAnonKey';
          }

          return handler.next(options); // Continue out to the web network
        },
        onError: (DioException error, handler) {
          if (error.response?.statusCode == 401) {
            print(
              '❌ Session expired or invalid token! Routing to login flow...',
            );
          }
          return handler.next(error);
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

  @preResolve
  Future<Box<SyncAction>> get syncActionBox async =>
      await Hive.openBox<SyncAction>('sync_queue');
  @lazySingleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage(
    // 🟢 Android options to ensure encrypted backups function correctly
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
