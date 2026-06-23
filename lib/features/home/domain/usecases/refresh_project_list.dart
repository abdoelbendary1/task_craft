// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:task_craft/core/errors/failures.dart';
import 'package:task_craft/core/network/success_repsonse.dart'; 
import 'package:task_craft/features/home/domain/repositories/project_repository.dart';
@injectable
class RefreshProjectList {
 final ProjectRepository _repository;
  RefreshProjectList(
     this._repository,
  );
  Future<Either<Failure,Success>> call()async{
    return await _repository.refreshProjectsCache();
  }
}
