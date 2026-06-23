import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:task_craft/core/errors/failures.dart';
import 'package:task_craft/features/auth/domain/repositories/auth_repo.dart';
import 'package:task_craft/features/profile/domain/entities/user_entity.dart';

@injectable
class FetchUserProfileUseCase {
  final AuthRepository repository;
  const FetchUserProfileUseCase(this.repository);

  Future<Either<Failure, UserEntity?>> call() async {
    return await repository.fetchUserProfile();
  }
}