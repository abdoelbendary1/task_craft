import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:task_craft/core/errors/failures.dart';
import 'package:task_craft/core/network/success_repsonse.dart';
import 'package:task_craft/features/home/domain/repositories/project_repository.dart';

@injectable
class DeleteProject {
  
final   ProjectRepository _projectRepository;
   DeleteProject(this._projectRepository);
   Future<Either<Failure, Success>> call(String projectId) => _projectRepository.deleteProject(projectId);
}