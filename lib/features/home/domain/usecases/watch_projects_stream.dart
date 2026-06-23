import 'package:injectable/injectable.dart';
import 'package:task_craft/features/home/domain/entities/project_entity.dart';
import 'package:task_craft/features/home/domain/repositories/project_repository.dart';
@injectable
class WatchProjectsStream {
 final  ProjectRepository _repository;
   WatchProjectsStream(this._repository);

   Stream<List<ProjectEntity>> call(){

    return _repository.watchProjectsStream();
   }
}