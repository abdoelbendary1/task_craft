// data/datasources/auth_remote_data_source.dart
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:task_craft/features/profile/data/models/user_model.dart';
import 'package:task_craft/features/auth/data/datasources/auth_local_data_source.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel?> login({required String email, required String password});
  Future<UserModel?> signUp({
    required String name,
    required String email,
    required String password,
  });
  Future<UserModel?> getCurrentUser();
  
  Future<void> logout();
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio _dio;
  final AuthLocalDataSource _authLocalDataSource;

  // 🟢 Injecting Dio (configured with BaseURL) and local storage for token management
  AuthRemoteDataSourceImpl(this._dio, this._authLocalDataSource);

  @override
  Future<UserModel?> login({
    required String email,
    required String password,
  }) async {
    // 1. Authenticate with Supabase Auth Engine via API route
    final response = await _dio.post(
      'https://qgfhhtdlmnbfwflexduz.supabase.co/auth/v1/token?grant_type=password',
      data: {'email': email, 'password': password},
    );

    final data = response.data as Map<String, dynamic>;
    final token = data['access_token'] as String?;
    final userId = data['user']?['id'] as String?;

    if (token != null && userId != null) {
      // 2. Persist token locally so Dio Interceptors capture it for subsequent requests
      await _authLocalDataSource.saveAccessToken(token);

      // 3. Fetch full profile model payload context
      return await _fetchUserProfile(userId);
    }
    return null;
  }

  @override
  Future<UserModel?> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    // 1. Create account in Supabase Auth Endpoint
    final response = await _dio.post(
      'https://qgfhhtdlmnbfwflexduz.supabase.co/auth/v1/signup',
      data: {
        'email': email,
        'password': password,
        'options': {
          'data': {
            'name':
                name, // ⚡ Triggers the DB function to create a matching profile row
          },
        },
      },
    );

    final data = response.data as Map<String, dynamic>;
    final token = data['access_token'] as String?;
    final userId = data['user']?['id'] as String?;

    if (token != null && userId != null) {
      await _authLocalDataSource.saveAccessToken(token);
      return await _fetchUserProfile(userId);
    }
    return null;
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    try {
      // 1. Pull current user from Supabase identity provider metadata
      final response = await _dio.get(
        'https://qgfhhtdlmnbfwflexduz.supabase.co/auth/v1/user',
      );
      final userId = response.data['id'] as String?;

      if (userId != null) {
        return await _fetchUserProfile(userId);
      }
    } catch (_) {
      // Token might be expired or invalid
      return null;
    }
    return null;
  }

  @override
  Future<void> logout() async {
    try {
      // 1. Terminate server-side authorization state tracking
      await _dio.post(
        'https://qgfhhtdlmnbfwflexduz.supabase.co/auth/v1/logout',
      );
    } finally {
      // 2. ALWAYS clear local persistence tokens regardless of network response code status
      await _authLocalDataSource.clearSession();
    }
  }

  // 🟢 Helper method to fetch and parse profile metadata from DB
  @override
  Future<UserModel?> _fetchUserProfile(String userId) async {
    // Pulls from our custom app profiles table schema using raw Rest configuration setup
    final response = await _dio.get('profiles?id=eq.$userId');
    final List<dynamic> list = response.data;

    if (list.isNotEmpty) {
      final profileJson = list.first as Map<String, dynamic>;

      // Construct your UserModel mapping profile fields appropriately
      return UserModel.fromJson({
        'id': userId,
        'name': profileJson['full_name'] ?? "",
        'avatar_url': profileJson['avatar_url'] ?? "",
      });
    }
    return null;
  }
}
