// data/datasources/auth_remote_data_source.dart
import 'package:injectable/injectable.dart';
import 'package:task_craft/features/profile/data/models/user_model.dart';

abstract class AuthLocalDataSource {
  Future<UserModel?> login({required String email, required String password});
  Future<UserModel?> signUp({
    required String name,
    required String email,
    required String password,
  });
  Future<UserModel?> getCurrentUser();
  Future<void> logout();
}

@LazySingleton(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  AuthLocalDataSourceImpl();

  @override
  Future<UserModel?> login({
    required String email,
    required String password,
  }) async {
    // 1. Authenticate with Supabase Auth
  }

  @override
  Future<UserModel?> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    // 1. Create account in Supabase Auth
  }

  @override
  Future<UserModel?> getCurrentUser() async {}

  @override
  Future<void> logout() async {}

  // Helper method to fetch and parse profile metadata from DB
  Future<UserModel?> _fetchUserProfile(String userId) async {}
}
