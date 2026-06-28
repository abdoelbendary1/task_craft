// features/auth/data/repositories/auth_repository.dart

import 'package:dartz/dartz.dart';
import 'package:task_craft/core/errors/failures.dart';
import 'package:task_craft/features/profile/domain/entities/user_entity.dart';

abstract class AuthRepository {
  // Simulate network/database request delay
  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserEntity>> signUp({
    required String name,
    required String email,
    required String password,
  });
  Future<Either<Failure, UserEntity?>> fetchUserProfile();
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, UserEntity?>> checkAuthStatus( ) ;
}
