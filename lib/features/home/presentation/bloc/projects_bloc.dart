import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:injectable/injectable.dart';

import 'package:task_craft/core/services/notification/notification_service.dart';

import 'package:task_craft/core/services/notification/notification_state.dart';

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
  final WatchProjectsStream _watchProjectsStream;

  final CreateProject _createProject;

  final DeleteProject _deleteProject;

  final RefreshProjectList _refreshProjectList;

  ProjectsBloc({
    required WatchProjectsStream watchProjectsStream,

    required CreateProject createProject,

    required DeleteProject deleteProject,

    required RefreshProjectList refreshProjectList,
  }) : _watchProjectsStream = watchProjectsStream,

       _createProject = createProject,

       _deleteProject = deleteProject,

       _refreshProjectList = refreshProjectList,

       super(const _Initial()) {
    on<_Started>(_onStarted);

    on<_RefreshedProjects>(_onRefreshProject);

    on<_AddNewProject>(_onAddNewProject);

    on<_DeleteProject>(_onDeleteProject);
  }

  FutureOr<void> _onStarted(_Started event, Emitter<ProjectsState> emit) async {
    final streamTask = emit.forEach<List<ProjectEntity>>(
      _watchProjectsStream.call(),

      onData: (projects) {
        if (projects.isEmpty) return const ProjectsState.empty();

        return ProjectsState.loaded(projects);
      },

      onError: (error, stackTrace) => ProjectsState.error(error.toString()),
    );

    add(const ProjectsEvent.refreshProjects());

    await streamTask;
  }

  FutureOr<void> _onRefreshProject(
    _RefreshedProjects event,

    Emitter<ProjectsState> emit,
  ) async {
    emit(const ProjectsState.loading());

    final result = await _refreshProjectList.call();

    result.fold((failure) {
      NotificationService.show(
        title: "Synchronization Status",

        message: "Displaying offline cached data. Server fetch failed.",

        type: NotificationType.info,
      );
    }, (success) {
      if (success.data?.isEmpty??false) {
        emit(const ProjectsState.empty());return;
      }
      emit(ProjectsState.loaded(success.data ?? []));
    });
  }

  FutureOr<void> _onAddNewProject(
    _AddNewProject event,

    Emitter<ProjectsState> emit,
  ) async {
    final result = await _createProject.call(event.project);

    result.fold(
      (failure) {
        NotificationService.show(
          title: "Creation Error",

          message: failure.message,

          type: NotificationType.error,
        );
      },

      (_) {
        // NotificationService.show(

        //   title: "Project Added",

        //   message: "Project successfully registered.",

        //   type: NotificationType.success,

        // );
      },
    );
  }

  FutureOr<void> _onDeleteProject(
    _DeleteProject event,

    Emitter<ProjectsState> emit,
  ) async {
    final result = await _deleteProject.call(event.project.id);

    result.fold(
      (failure) {
        NotificationService.show(
          title: "Deletion Error",

          message: failure.message,

          type: NotificationType.error,
        );
      },

      (_) {
        // NotificationService.show(

        //   title: "Project Removed",

        //   message: "Project erased successfully.",

        //   type: NotificationType.success,

        // );
      },
    );
  }
}
