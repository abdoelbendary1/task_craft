part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.fetchUserProfile() = _FetchUserProfile;
  const factory UserEvent.profileSaved(UserEntity user) = _ProfileSaved;
  const factory UserEvent.logOut() = _LogOut;
}
