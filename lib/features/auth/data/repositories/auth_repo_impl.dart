// // lib/features/auth/data/repositories/auth_repository_impl.dart

// import 'package:dartz/dartz.dart';
// import 'package:injectable/injectable.dart';
// import 'package:task_craft/core/errors/app_exceptions.dart'; // 🟢 استيراد ملف الـ Exceptions الجديد
// import 'package:task_craft/core/errors/failures.dart';
// import 'package:task_craft/features/auth/data/datasources/auth_local_data_source.dart';
// import 'package:task_craft/features/auth/data/datasources/auth_remote_data_surce.dart';
// import 'package:task_craft/features/auth/domain/repositories/auth_repo.dart';
// import 'package:task_craft/features/profile/data/models/user_model.dart';
// import 'package:task_craft/features/profile/domain/entities/user_entity.dart';

// @LazySingleton(as: AuthRepository)
// class AuthRepositoryImpl implements AuthRepository {
//   final AuthRemoteDataSource remoteDataSource;
//   final AuthLocalDataSource localDataSource;

//   AuthRepositoryImpl({
//     required this.remoteDataSource, 
//     required this.localDataSource,
//   });

//   @override
//   Future<Either<Failure, UserEntity>> login({
//     required String email,
//     required String password,
//   }) async {
//     try {
//       final model = await remoteDataSource.login(
//         email: email,
//         password: password,
//       );
//       if (model == null) {
//         return const Left(ServerFailure(message: 'User is not found.'));
//       }
//       return Right(model.toEntity());
//     } on AppException catch (e) {
//       // 🟢 الـ ApiClient قام بالفعل بفلترة وترجمة الخطأ، نمرر الـ e.message مباشرة للـ Bloc
//       return Left(ServerFailure(message: e.message));
//     } catch (e) {
//       return const Left(ServerFailure(message: 'An unexpected authentication error occurred.'));
//     }
//   }

//   @override
//   Future<Either<Failure, UserEntity>> signUp({
//     required String name,
//     required String email,
//     required String password,
//   }) async {
//     try {
//       final model = await remoteDataSource.signUp(
//         name: name,
//         email: email,
//         password: password,
//       );
//       if (model == null) {
//         return const Left(ServerFailure(message: 'Account creation failed. Please verify your details.'));
//       }
//       return Right(model.toEntity());
//     } on AppException catch (e) {
//       return Left(ServerFailure(message: e.message));
//     } catch (e) {
//       return const Left(ServerFailure(message: 'An unexpected registration error occurred.'));
//     }
//   }

//   @override
//   Future<Either<Failure, void>> logout() async {
//     try {
//       await remoteDataSource.logout();
//       return const Right(null);
//     } on AppException catch (e) {
//       return Left(ServerFailure(message: e.message));
//     } catch (e) {
//       return const Left(ServerFailure(message: 'Failed to securely close your session. Please check connection.'));
//     }
//   }

//   @override
//   Future<Either<Failure, UserEntity?>> fetchUserProfile() async {
//     try {
//       final model = await remoteDataSource.getCurrentUser();
//       return Right(model?.toEntity());
//     } on AppException catch (e) {
//       return Left(ServerFailure(message: e.message));
//     } catch (e) {
//       return const Left(ServerFailure(message: 'Could not retrieve your user profile at this moment.'));
//     }
//   }
  
//   @override
//   Future<Either<Failure, UserEntity?>> checkAuthStatus() async {
//     try {
//       // 1. Core Auto-Login Check: Is there a cached JWT signature?
//       final savedToken = await localDataSource.getAccessToken();
//       if (savedToken == null || savedToken.isEmpty) {
//         return const Right(null); // Triggers Unauthenticated clean boundary
//       }

//       // 2. Validate session by attempting a token verification fetch profile call
//       final userModel = await remoteDataSource.getCurrentUser();
//       return Right(userModel?.toEntity());
//     } on NetworkException catch (_) {
//       // Mid-session network dropout shouldn't log out immediately unless 401 occurs.
//       return const Left(ServerFailure(message: 'Network unreachable. Auto-login validation deferred.'));
//     } on AppException catch (_) {
//       // If any token/session corruption exception occurs, yield null gracefully to route to LoginScreen
//       return const Right(null); 
//     } catch (e) {
//       return const Right(null); // Fallback gracefully if mapping fails
//     }
//   }
// }


// data/repositories/auth_repository_impl.dart
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:task_craft/core/errors/failures.dart';
import 'package:task_craft/features/auth/data/datasources/auth_remote_data_surce.dart';
import 'package:task_craft/features/auth/domain/repositories/auth_repo.dart';
import 'package:task_craft/features/profile/data/models/user_model.dart';
import 'package:task_craft/features/profile/domain/entities/user_entity.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final model = await remoteDataSource.login(
        email: email,
        password: password,
      );
      if (model == null) {
        return const Left(ServerFailure(message: 'بيانات الجلسة فارغة.'));
      }
      return Right(model.toEntity());
    } on DioException catch (e) {
      final msg =
          e.response?.data['error_description'] ??
          'خطأ في تسجيل الدخول. تأكد من البيانات.';
      return Left(ServerFailure(message: msg));
    } catch (e) {
      return const Left(ServerFailure(message: 'حدث خطأ غير متوقع.'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final model = await remoteDataSource.signUp(
        name: name,
        email: email,
        password: password,
      );
      if (model == null)
        return const Left(ServerFailure(message: 'فشل إنشاء الحساب.'));
      return Right(model.toEntity());
    } on DioException catch (e) {
      final msg =
          e.response?.data['error_description'] ??
          'خطأ في التسجيل. البريد الإلكتروني قد يكون مستخدم.';
      return Left(ServerFailure(message: msg));
    } catch (e) {
      return const Left(ServerFailure(message: 'حدث خطأ غير متوقع.'));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await remoteDataSource.logout();
      return const Right(null);
    } catch (e) {
      return const Left(ServerFailure(message: 'خطأ في تسجيل الخروج.'));
    }
  }

  @override
  Future<Either<Failure, UserEntity?>> fetchUserProfile() async {
    try {
      final model = await remoteDataSource.getCurrentUser();
      return Right(model?.toEntity());
    } catch (e) {
      return const Left(ServerFailure(message: 'خطأ في تحميل الملف الشخصي.'));
    }
  }
  
  @override
  Future<Either<Failure, UserEntity?>> checkAuthStatus( ) async{
    try {
      final model = await remoteDataSource.checkAuthStatus( );
      return Right(model?.toEntity());
    } catch (e) {
      return const Left(ServerFailure(message: 'خطأ في تحميل الملف الشخصي.'));
    }}
}