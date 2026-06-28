// lib/features/auth/data/datasources/auth_local_data_source.dart
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

abstract class AuthLocalDataSource {
  Future<String?> getAccessToken();
  Future<void> saveUserId(String userId);
  Future<void> saveAccessToken(String token);
  Future<String> getUserId();
  Future<void> clearSession();
}

@LazySingleton(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final FlutterSecureStorage _secureStorage;

  // 🟢 Secure storage is injected here automatically by Injectable
  AuthLocalDataSourceImpl(this._secureStorage);

  static const _tokenKey = 'supabase_access_token';

  @override
  Future<String?> getAccessToken() async {
    // 🟢 Read directly from the hardware-backed keychain/keystore container
    return await _secureStorage.read(key: _tokenKey);
  }

  @override
  Future<void> saveAccessToken(String token) async {
    // 🟢 Write the token string with encryption enabled
    await _secureStorage.write(key: _tokenKey, value: token);
  }

  @override
  Future<void> clearSession() async {
    // 🟢 Erase the token securely when logging out
    await _secureStorage.delete(key: _tokenKey);
  }
  
  @override
  Future<void> saveUserId(String userId)async {
  await _secureStorage.delete(key: 'user_id');

 await _secureStorage.write(key: 'user_id', value: userId);
  }
  
  @override
  Future<String> getUserId() async {
    return await _secureStorage.read(key: 'user_id') ??"";
  }
}
