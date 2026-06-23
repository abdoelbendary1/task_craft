part of 'user_bloc.dart';

@freezed
@freezed
class UserState with _$UserState {
  const factory UserState.initial() = _Initial;
  const factory UserState.loading() = _Loading;
  const factory UserState.loaded({required UserEntity user}) = _Loaded;
  const factory UserState.error(String message) = _Error;
}
