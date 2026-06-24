import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_craft/features/profile/domain/entities/user_entity.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required String? id,
    required String? name,
    required String? email,
    required String? avatarUrl,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(
    json,
  ); // Custom mapper to convert model to domain entity safely
}

extension UserModelX on UserModel {
  UserEntity toEntity() =>
      UserEntity(id: id??"", name: name??"" , email: email??"", avatarUrl: avatarUrl);
}
