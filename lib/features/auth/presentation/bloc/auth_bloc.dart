import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:task_craft/features/auth/domain/usecases/auth_useCases.dart';
import 'package:task_craft/features/auth/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:task_craft/features/profile/domain/entities/user_entity.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase _loginUseCase;
  final SignUpUseCase _signUpUseCase;
  final LogoutUseCase _logoutUseCase;
  final UserBloc
  _userBloc; // 💡 Injecting UserBloc directly for unified pipelines
  AuthBloc({
    required LoginUseCase loginUseCase,
    required SignUpUseCase signUpUseCase,
    required LogoutUseCase logoutUseCase,
    required UserBloc userBloc,
  }) : _loginUseCase = loginUseCase,
       _signUpUseCase = signUpUseCase,
       _logoutUseCase = logoutUseCase,
       _userBloc = userBloc,
       super(const AuthState.initial()) {
    on<_AuthCheckRequested>((event, emit) async {
      emit(const AuthState.unauthenticated());
    });

    on<_LoginSubmitted>((event, emit) async {
      emit(const AuthState.loading());
      try {
        final result = await _loginUseCase(event.email, event.password);

        result.fold(
          (failure) =>
              emit(AuthState.unauthenticated(errorMessage: failure.toString())),
          (userEntity) {
            emit(AuthState.authenticated(user: userEntity));
            _userBloc.add(UserEvent.profileSaved(userEntity));
          },
        );
      } catch (e) {
        emit(
          AuthState.unauthenticated(
            errorMessage: e.toString().replaceAll("Exception: ", ""),
          ),
        );
      }
    });

    on<_SignUpSubmitted>((event, emit) async {
      emit(const AuthState.loading());
      try {
        final result = await _signUpUseCase(
          name: event.name,
          email: event.email,
          password: event.password,
        );

        result.fold(
          (failure) =>
              emit(AuthState.unauthenticated(errorMessage: failure.toString())),
          (userEntity) {
            emit(AuthState.authenticated(user: userEntity));
            _userBloc.add(UserEvent.profileSaved(userEntity));
          },
        );
      } catch (e) {
        emit(AuthState.unauthenticated(errorMessage: e.toString()));
      }
    });

    on<_LoggedOut>((event, emit) async {
      await _logoutUseCase();
      _userBloc.add(const UserEvent.logOut());
      emit(const AuthState.unauthenticated());
    });
  }
}
