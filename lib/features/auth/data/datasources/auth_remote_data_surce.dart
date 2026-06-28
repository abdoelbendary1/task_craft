




















  





































        
























































      

































































import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:task_craft/core/network/api_client.dart';
import 'package:task_craft/features/profile/data/models/user_model.dart';
import 'package:task_craft/features/auth/data/datasources/auth_local_data_source.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel?> login({required String email, required String password});
  Future<UserModel?> signUp({required String name, required String email, required String password});
  Future<UserModel?> getCurrentUser();
  Future<UserModel?> checkAuthStatus();
  Future<void> logout();
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient _apiClient;
  final AuthLocalDataSource _authLocalDataSource;
  final Dio _authDio;
  final String _anonKey;

  AuthRemoteDataSourceImpl(
    this._apiClient,
    this._authLocalDataSource,
    @Named('authDio') this._authDio,               
    @Named('supabaseAnonKey') this._anonKey,       
  );

  @override
  Future<UserModel?> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      
      final response = await _authDio.post(
        '/signup',
        data: {
          'email': email,
          'password': password,
          'data': { 
            'full_name': name,
          },
        },
      );

      final data = response.data as Map<String, dynamic>;
      final token = data['access_token'] as String?;
      final userId = data['user']?['id'] as String?;

      if (token != null && userId != null) {
        await _authLocalDataSource.saveUserId(userId);
        await _authLocalDataSource.saveAccessToken(token);
        
        
        return await _fetchUserProfile(userId, emailFallback: email);
      }
    } catch (e) {
      print("💥 [SignUp Remote Error]: $e");
      rethrow;
    }
    return null;
  }

  @override
  Future<UserModel?> login({required String email, required String password}) async {
    try {
      final response = await _authDio.post(
        '/token?grant_type=password',
        data: {'email': email, 'password': password},
      );

      final data = response.data as Map<String, dynamic>;
      final token = data['access_token'] as String?;
      final userId = data['user']?['id'] as String?;
      final userEmail = data['user']?['email'] as String?;

      if (token != null && userId != null) {
        await _authLocalDataSource.saveUserId(userId);
        await _authLocalDataSource.saveAccessToken(token);
        return await _fetchUserProfile(userId, emailFallback: userEmail);
      }
    } catch (e) {
      print("💥 [Login Remote Error]: $e");
      rethrow;
    }
    return null;
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    try {
      final token = await _authLocalDataSource.getAccessToken();
      if (token == null || token.isEmpty) return null;

      final response = await _authDio.get(
        '/user',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token', 
          },
        ),
      );
      
      final data = response.data as Map<String, dynamic>;
      final userId = data['id'] as String?;
      final userEmail = data['email'] as String?;
      if (userId != null) return await _fetchUserProfile(userId, emailFallback: userEmail);
    } catch (_) {
      return null;
    }
    return null;
  }

  @override
  Future<void> logout() async {
    try {
      final token = await _authLocalDataSource.getAccessToken();
      if (token != null && token.isNotEmpty) {
        await _authDio.post(
          '/logout',
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
          ),
        );
      }
    } catch (_) {
      
    } finally {
      await _authLocalDataSource.clearSession();
    }
  }

  @override
  Future<UserModel?> checkAuthStatus() async {
    final userId = await _authLocalDataSource.getUserId();
    if (userId == null || userId.isEmpty) return null;
    return await _fetchUserProfile(userId);
  }

  
  Future<UserModel?> _fetchUserProfile(String userId, {String? emailFallback}) async {
    try {
      final response = await _apiClient.request<UserModel?>(
        path: '/profiles?id=eq.$userId', 
        method: 'GET',
        fromJson: (json) {
          
          if (json is List && json.isNotEmpty) {
            final profileMap = json.first as Map<String, dynamic>;
            return UserModel.fromJson({
              'id': userId,
              'name': profileMap['full_name'] ?? 'New Member',
              'email': emailFallback ?? '',
              'avatar_url': profileMap['avatar_url'] ?? '',
            });
          }
          return null;
        },
      );
      return response;
    } catch (e) {
      print('❌ [Fetch User Profile Crash]: $e');
      return null;
    }
  }
}