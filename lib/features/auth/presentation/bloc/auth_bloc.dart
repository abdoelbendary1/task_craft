// lib/features/auth/presentation/bloc/auth_bloc.dart

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:task_craft/features/auth/domain/usecases/auth_useCases.dart';
import 'package:task_craft/features/profile/domain/entities/user_entity.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@lazySingleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase _loginUseCase;
  final SignUpUseCase _signUpUseCase;
  final LogoutUseCase _logoutUseCase;
  final CheckAuthStatusUseCase _checkAuthStatusUseCase; // 💡 Added UseCase to check storage

  AuthBloc({
    required LoginUseCase loginUseCase,
    required SignUpUseCase signUpUseCase,
    required LogoutUseCase logoutUseCase,
    required CheckAuthStatusUseCase checkAuthStatusUseCase,
  }) : _loginUseCase = loginUseCase,
       _signUpUseCase = signUpUseCase,
       _logoutUseCase = logoutUseCase,
       _checkAuthStatusUseCase = checkAuthStatusUseCase,
       super(const AuthState.initial()) {
    
    on<_AuthCheckRequested>(_onAuthCheckRequested);
    on<_LoginSubmitted>(_onLoginSubmitted);
    on<_SignUpSubmitted>(_onSignUpSubmitted);
    on<_LoggedOut>(_onLoggedOut);
  }

  Future<void> _onAuthCheckRequested(_AuthCheckRequested event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    final result = await _checkAuthStatusUseCase();
    
    result.fold(
      (failure) => emit(const AuthState.unauthenticated()),
      (userEntity) {
        if (userEntity != null) {
          emit(AuthState.authenticated(user: userEntity));
        } else {
          emit(const AuthState.unauthenticated());
        }
      },
    );
  }

  Future<void> _onLoginSubmitted(_LoginSubmitted event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    final result = await _loginUseCase(event.email, event.password);

    result.fold(
      (failure) => emit(AuthState.unauthenticated(errorMessage: failure.message)),
      (userEntity) => emit(AuthState.authenticated(user: userEntity)),
    );
  }

  Future<void> _onSignUpSubmitted(_SignUpSubmitted event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    final result = await _signUpUseCase(
      name: event.name,
      email: event.email,
      password: event.password,
    );

    result.fold(
      (failure) => emit(AuthState.unauthenticated(errorMessage: failure.message)),
      (userEntity) => emit(AuthState.authenticated(user: userEntity)),
    );
  }

  Future<void> _onLoggedOut(_LoggedOut event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    await _logoutUseCase();
    emit(const AuthState.unauthenticated());
  }
}