// features/home/presentation/bloc/new_project_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:task_craft/core/services/notification/notification_service.dart';
import 'package:task_craft/core/services/notification/notification_state.dart';
import 'package:task_craft/features/home/domain/entities/project_entity.dart';
import 'package:task_craft/features/home/domain/usecases/create_project.dart';

part 'new_project_event.dart';
part 'new_project_state.dart';
part 'new_project_bloc.freezed.dart';

@injectable
class NewProjectBloc extends Bloc<NewProjectEvent, NewProjectState> {
  final CreateProject _createProject;

  NewProjectBloc(this._createProject)
    : super(NewProjectState(project: const ProjectEntity())) {
    on<_TitleChanged>(_onTitleChanged);
    on<_DescriptionChanged>(_onDescriptionChanged);
    on<_StatusIdChanged>(_onStatusIdChanged);
    on<_DueDateChanged>(_onDueDateChanged);
    on<_SubmitProject>(_onSubmitProject);
  }

  void _onTitleChanged(_TitleChanged event, Emitter<NewProjectState> emit) {
    emit(
      state.copyWith(
        status: NewProjectStatus.initial,
        project: state.project.copyWith(title: event.title),
      ),
    );
  }

  void _onDescriptionChanged(
    _DescriptionChanged event,
    Emitter<NewProjectState> emit,
  ) {
    emit(
      state.copyWith(
        status: NewProjectStatus.initial,
        project: state.project.copyWith(description: event.description),
      ),
    );
  }

  void _onStatusIdChanged(
    _StatusIdChanged event,
    Emitter<NewProjectState> emit,
  ) {
    emit(
      state.copyWith(
        status: NewProjectStatus.initial,
        project: state.project.copyWith(statusId: event.statusId),
      ),
    );
  }

  void _onDueDateChanged(_DueDateChanged event, Emitter<NewProjectState> emit) {
    emit(
      state.copyWith(
        status: NewProjectStatus.initial,
        project: state.project.copyWith(dueDate: event.dueDate?.toUtc()),
      ),
    );
  }

  Future<void> _onSubmitProject(
    _SubmitProject event,
    Emitter<NewProjectState> emit,
  ) async {
    if (state.project.title.trim().isEmpty) {
      emit(
        state.copyWith(
          status: NewProjectStatus.failure,
          errorMessage: 'Title cannot be empty',
        ),
      );
      return;
    }

    emit(state.copyWith(status: NewProjectStatus.loading));
    try {
      final result = await _createProject.call(event.project);

      result.fold(
        (failure) {
          NotificationService.show(
            title: "Creation Error",
            message: failure.message,
            type: NotificationType.error,
          );
          // 🟢 تحويل الـ State للفشل الحقيقي بناءً على رد السيرفر
          emit(
            state.copyWith(
              status: NewProjectStatus.failure,
              errorMessage: failure.message,
            ),
          );
        },
        (_) {
          // NotificationService.show(
          //   title: "Project Added",
          //   message: "Project successfully registered.",
          //   type: NotificationType.success,
          // );
          // 🟢 تحويل الـ State للنجاح الحقيقي فقط عند نجاح الحفظ
          emit(state.copyWith(status: NewProjectStatus.success));
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: NewProjectStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
