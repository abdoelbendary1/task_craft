import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:task_craft/core/errors/failures.dart';
import 'package:task_craft/features/auth/domain/repositories/auth_repo.dart';
import 'package:task_craft/features/profile/domain/entities/user_entity.dart';


@injectable
class LoginUseCase {
  final AuthRepository repository;
  const LoginUseCase(this.repository);

  Future<Either<Failure, UserEntity>> call(
    String email,
    String password,
  ) async {
    return await repository.login(email: email, password: password);
  }
}

@injectable
class SignUpUseCase {
  final AuthRepository repository;
  const SignUpUseCase(this.repository);

  Future<Either<Failure, UserEntity>> call({
    required String name,
    required String email,
    required String password,
  }) async {
    return await repository.signUp(
      name: name,
      email: email,
      password: password,
    );
  }
}

@injectable
class LogoutUseCase {
  final AuthRepository repository;
  const LogoutUseCase(this.repository);

  Future<Either<Failure, void>> call() async {
    return await repository.logout();
  }
}
@injectable
class CheckAuthStatusUseCase {
  final AuthRepository repository;
  const CheckAuthStatusUseCase(this.repository);

  /// Checks the persistent storage for a valid token and fetches the current [UserEntity].
  /// Returns a [UserEntity] if authenticated, or `null` if no active session exists.
  Future<Either<Failure, UserEntity?>> call() async {
    return await repository.checkAuthStatus();
  }}

