// features/tasks/presentation/bloc/new_task_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:task_craft/core/enum/task_status.dart';
import 'package:task_craft/core/services/notification/notification_service.dart';
import 'package:task_craft/core/services/notification/notification_state.dart';
import 'package:task_craft/features/tasks/domain/entities/task_entity.dart';
import 'package:task_craft/features/tasks/domain/usecases/create_task.dart';

part 'new_task_event.dart';
part 'new_task_state.dart';
part 'new_task_bloc.freezed.dart';

@injectable
class NewTaskBloc extends Bloc<NewTaskEvent, NewTaskState> {
  final CreateTask _createTask;

  NewTaskBloc(this._createTask)
      : super(const NewTaskState(task: TaskEntity(),projectId:"" )) { // 🟢 تم تعديل الاسم هنا إلى task ليطابق الـ State
  on<_InitProjectId>(_onInitProjectId);
on<_TitleChanged>(_onTitleChanged);
on<_DescriptionChanged>(_onDescriptionChanged);
on<_PriorityChanged>(_onPriorityChanged);
on<_DueDateChanged>(_onDueDateChanged);
on<_SubmitTask>(_onSubmitTask);
  }

  void _onInitProjectId(_InitProjectId event, Emitter<NewTaskState> emit) {
    emit(
      state.copyWith(
        task: state.task!.copyWith(projectId: event.projectId),
        projectId: event.projectId,
      ),
    );
  }

  void _onTitleChanged(_TitleChanged event, Emitter<NewTaskState> emit) {
    emit(
      state.copyWith(
        status: NewTaskStatus.initial,
        task: state.task?.copyWith(title: event.title),
      ),
    );
  }

  void _onDescriptionChanged(_DescriptionChanged event, Emitter<NewTaskState> emit) {
    emit(
      state.copyWith(
        status: NewTaskStatus.initial,
        task: state.task?.copyWith(description: event.description),
      ),
    );
  }

  void _onPriorityChanged(_PriorityChanged event, Emitter<NewTaskState> emit) {
    emit(
      state.copyWith(
        status: NewTaskStatus.initial,
        task: state.task?.copyWith(priority: TaskPriority.fromId(  event.priorityId)),
      ),
    );
  }

  void _onDueDateChanged(_DueDateChanged event, Emitter<NewTaskState> emit) {
   
  }

  Future<void> _onSubmitTask(_SubmitTask event, Emitter<NewTaskState> emit) async {
    if (state.task?.title?.trim().isEmpty??false) {
      emit(
        state.copyWith(
          status: NewTaskStatus.failure,
          errorMessage: 'Task title cannot be empty',
        ),
      );
      return;
    }

    emit(state.copyWith(status: NewTaskStatus.loading));
    
    try {
      final result = await _createTask.call(task: event.task!,projectId: event.projectId!);

      result.fold(
        (failure) {
          NotificationService.show(
            title: "Creation Error",
            message: failure.message,
            type: NotificationType.error,
          );
          emit(
            state.copyWith(
              status: NewTaskStatus.failure,
              errorMessage: failure.message,
            ),
          );
        },
        (_) {
          // NotificationService.show(
          //   title: "Task Added",
          //   message: "Task successfully registered to this project.",
          //   type: NotificationType.success,
          // );
          emit(state.copyWith(status: NewTaskStatus.success));
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: NewTaskStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}