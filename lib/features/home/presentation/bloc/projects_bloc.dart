import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:task_craft/features/home/domain/entities/project_entity.dart';
import 'package:task_craft/features/home/domain/usecases/create_project.dart';
import 'package:task_craft/features/home/domain/usecases/delete_project.dart';
import 'package:task_craft/features/home/domain/usecases/refresh_project_list.dart';
import 'package:task_craft/features/home/domain/usecases/watch_projects_stream.dart';

part 'projects_event.dart';
part 'projects_state.dart';
part 'projects_bloc.freezed.dart';

@injectable
class ProjectsBloc extends Bloc<ProjectsEvent, ProjectsState> {
 final WatchProjectsStream _watchProjectsStream ;
 final CreateProject _createProject;
final DeleteProject _deleteProject;
final RefreshProjectList _refreshProjectList;

  ProjectsBloc(
    {
      required WatchProjectsStream watchProjectsStream,
      required CreateProject createProject,
      required DeleteProject deleteProject,
      required RefreshProjectList refreshProjectList,}
  ) : 
  _watchProjectsStream = watchProjectsStream,
  _createProject =createProject,
  _deleteProject=deleteProject,
  _refreshProjectList=refreshProjectList, 
  super(_Initial()) {
    on<_Started>(_started);
    on<_RefreshedProjects>(_refreshProject);    on<_AddNewProject>(_addNewProject);

  }

  // FutureOr<void> _fetchProjects(
  //   _FetchedProjects event,
  //   Emitter<ProjectsState> emit,
  // ) {
  //   emit(
  //     const ProjectsState.loaded([
  //       ProjectEntity(
  //         id: '1',
  //         title: 'TaskCraft UI Redesign',
  //         tasks: [],
  //         userId: '',
  //         description:
  //             "Implementing the new Functional Minimalism design system across all core dashboard",
  //         status: 'Active',
  //         isCompleted: false,
  //       ),
  //       ProjectEntity(
  //         id: '2',
  //         title: 'API Integration Phase 2',
  //         tasks: [],
  //         userId: '',
  //         description:
  //             "Connecting the backend microservices with the new real-time synchronization engine for",
  //         status: 'On Hold',
  //         isCompleted: false,
  //       ),
  //       ProjectEntity(
  //         id: '3',
  //         title: 'Mobile App Onboarding',
  //         tasks: [],
  //         userId: '',
  //         description:
  //             "Optimizing the first-time user experience for mobile users to reduce churn and increase engagement",
  //         status: 'Completed',
  //         isCompleted: true,
  //       ),
  //     ]),
  //   );
  // }

  FutureOr<void> _refreshProject(_RefreshedProjects event, Emitter<ProjectsState> emit)async {
    emit(_Loading());
    final result = await _refreshProjectList.call();
    result.fold((failure) => emit(_Error(failure.message)), (success) {
    },);

  }

  FutureOr<void> _started(_Started event, Emitter<ProjectsState> emit) async {
  emit(const ProjectsState.loading());

  // 🔄 Safely handle and subscribe to your live background stream
  final streamTask = emit.forEach<List<ProjectEntity>>(
    _watchProjectsStream.call(),
    onData: (projects) => ProjectsState.loaded(projects),
    onError: (error, stackTrace) => ProjectsState.error(error.toString()),
  );

  // Execute background network cache synchronizations 
  final result = await _refreshProjectList.call();
  
  result.fold(
    (failure) => emit(ProjectsState.error(failure.message)),
    (_) => null, // Success is handled automatically by the live database stream above!
  );

  // Await the stream stream task to keep the execution channel operational
  await streamTask;
}

  FutureOr<void> _addNewProject(_AddNewProject event, Emitter<ProjectsState> emit)async {
    emit(_Loading());
    final result = await _createProject.call(event.project);
    result.fold((failure) => emit(_Error(failure.message)), (success) {

    },);
  }
}
