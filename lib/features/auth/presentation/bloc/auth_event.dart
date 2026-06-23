part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.authCheckRequested() = _AuthCheckRequested;
  const factory AuthEvent.loginSubmitted({
    required String email,
    required String password,
  }) = _LoginSubmitted;
  const factory AuthEvent.signUpSubmitted({
    required String name,
    required String email,
    required String password,
  }) = _SignUpSubmitted;
  const factory AuthEvent.loggedOut() = _LoggedOut;
}
