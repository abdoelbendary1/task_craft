import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:task_craft/features/home/domain/entities/project_entity.dart';

part 'projects_event.dart';
part 'projects_state.dart';
part 'projects_bloc.freezed.dart';

@injectable
class ProjectsBloc extends Bloc<ProjectsEvent, ProjectsState> {
  ProjectsBloc() : super(_Initial()) {
    on<_FetchedProjects>(_fetchProjects);
  }

  FutureOr<void> _fetchProjects(
    _FetchedProjects event,
    Emitter<ProjectsState> emit,
  ) {
    emit(
      const ProjectsState.loaded([
        ProjectEntity(
          id: '1',
          title: 'TaskCraft UI Redesign',
          tasks: [],
          userId: '',
          description:
              "Implementing the new Functional Minimalism design system across all core dashboard",
          status: 'Active',
          isCompleted: false,
        ),
        ProjectEntity(
          id: '2',
          title: 'API Integration Phase 2',
          tasks: [],
          userId: '',
          description:
              "Connecting the backend microservices with the new real-time synchronization engine for",
          status: 'On Hold',
          isCompleted: false,
        ),
        ProjectEntity(
          id: '3',
          title: 'Mobile App Onboarding',
          tasks: [],
          userId: '',
          description:
              "Optimizing the first-time user experience for mobile users to reduce churn and increase engagement",
          status: 'Completed',
          isCompleted: true,
        ),
      ]),
    );
  }
}
