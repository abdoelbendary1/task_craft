part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.authenticated({required String userId}) =
      _Authenticated;
  const factory AuthState.unauthenticated({String? errorMessage}) =
      _Unauthenticated;
}
