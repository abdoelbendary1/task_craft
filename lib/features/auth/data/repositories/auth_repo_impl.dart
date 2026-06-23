// data/repositories/auth_repository_impl.dart
import 'package:dartz/dartz.dart';
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
      return Right(model!.toEntity());
    } catch (e) {
      return const Left(ServerFailure(message: 'خطاء في تسجيل الدخول.'));
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
      return Right(model!.toEntity());
    } catch (e) {
      return const Left(ServerFailure(message: 'خطاء في التسجيل.'));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await remoteDataSource.logout();
      return const Right(null);
    } catch (e) {
      return const Left(ServerFailure(message: 'خطاء في تسجيل الخروج.'));
    }
  }

  @override
  Future<Either<Failure, UserEntity?>> fetchUserProfile() async {
    try {
      final model = await remoteDataSource.getCurrentUser();
      return Right(model?.toEntity());
    } catch (e) {
      return const Left(ServerFailure(message: 'خطاء في تحميل الملف الشخصي.'));
    }
  }
}
