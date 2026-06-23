import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:task_craft/core/errors/failures.dart';
import 'package:task_craft/core/network/success_repsonse.dart'; 
import 'package:task_craft/features/home/domain/entities/project_entity.dart';
import 'package:task_craft/features/home/domain/repositories/project_repository.dart';

@injectable 
class CreateProject {
  final ProjectRepository _repository;

  CreateProject(this._repository);

  Future<Either<Failure, Success<ProjectEntity>>> call(ProjectEntity project) async {
    return await _repository.createProject(project);
  }
}