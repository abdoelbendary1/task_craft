// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProjectEntity {

 String get id; String get creatorId; String get title; String get description; int get statusId; DateTime? get createdAt; DateTime? get dueDate;
/// Create a copy of ProjectEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectEntityCopyWith<ProjectEntity> get copyWith => _$ProjectEntityCopyWithImpl<ProjectEntity>(this as ProjectEntity, _$identity);

  /// Serializes this ProjectEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.creatorId, creatorId) || other.creatorId == creatorId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.statusId, statusId) || other.statusId == statusId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,creatorId,title,description,statusId,createdAt,dueDate);

@override
String toString() {
  return 'ProjectEntity(id: $id, creatorId: $creatorId, title: $title, description: $description, statusId: $statusId, createdAt: $createdAt, dueDate: $dueDate)';
}


}

/// @nodoc
abstract mixin class $ProjectEntityCopyWith<$Res>  {
  factory $ProjectEntityCopyWith(ProjectEntity value, $Res Function(ProjectEntity) _then) = _$ProjectEntityCopyWithImpl;
@useResult
$Res call({
 String id, String creatorId, String title, String description, int statusId, DateTime? createdAt, DateTime? dueDate
});




}
/// @nodoc
class _$ProjectEntityCopyWithImpl<$Res>
    implements $ProjectEntityCopyWith<$Res> {
  _$ProjectEntityCopyWithImpl(this._self, this._then);

  final ProjectEntity _self;
  final $Res Function(ProjectEntity) _then;

/// Create a copy of ProjectEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? creatorId = null,Object? title = null,Object? description = null,Object? statusId = null,Object? createdAt = freezed,Object? dueDate = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,creatorId: null == creatorId ? _self.creatorId : creatorId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,statusId: null == statusId ? _self.statusId : statusId // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProjectEntity].
extension ProjectEntityPatterns on ProjectEntity {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectEntity() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectEntity value)  $default,){
final _that = this;
switch (_that) {
case _ProjectEntity():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectEntity() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String creatorId,  String title,  String description,  int statusId,  DateTime? createdAt,  DateTime? dueDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectEntity() when $default != null:
return $default(_that.id,_that.creatorId,_that.title,_that.description,_that.statusId,_that.createdAt,_that.dueDate);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String creatorId,  String title,  String description,  int statusId,  DateTime? createdAt,  DateTime? dueDate)  $default,) {final _that = this;
switch (_that) {
case _ProjectEntity():
return $default(_that.id,_that.creatorId,_that.title,_that.description,_that.statusId,_that.createdAt,_that.dueDate);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String creatorId,  String title,  String description,  int statusId,  DateTime? createdAt,  DateTime? dueDate)?  $default,) {final _that = this;
switch (_that) {
case _ProjectEntity() when $default != null:
return $default(_that.id,_that.creatorId,_that.title,_that.description,_that.statusId,_that.createdAt,_that.dueDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProjectEntity implements ProjectEntity {
  const _ProjectEntity({this.id = '', this.creatorId = '', this.title = '', this.description = '', this.statusId = 0, this.createdAt, this.dueDate});
  factory _ProjectEntity.fromJson(Map<String, dynamic> json) => _$ProjectEntityFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String creatorId;
@override@JsonKey() final  String title;
@override@JsonKey() final  String description;
@override@JsonKey() final  int statusId;
@override final  DateTime? createdAt;
@override final  DateTime? dueDate;

/// Create a copy of ProjectEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectEntityCopyWith<_ProjectEntity> get copyWith => __$ProjectEntityCopyWithImpl<_ProjectEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProjectEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.creatorId, creatorId) || other.creatorId == creatorId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.statusId, statusId) || other.statusId == statusId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,creatorId,title,description,statusId,createdAt,dueDate);

@override
String toString() {
  return 'ProjectEntity(id: $id, creatorId: $creatorId, title: $title, description: $description, statusId: $statusId, createdAt: $createdAt, dueDate: $dueDate)';
}


}

/// @nodoc
abstract mixin class _$ProjectEntityCopyWith<$Res> implements $ProjectEntityCopyWith<$Res> {
  factory _$ProjectEntityCopyWith(_ProjectEntity value, $Res Function(_ProjectEntity) _then) = __$ProjectEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String creatorId, String title, String description, int statusId, DateTime? createdAt, DateTime? dueDate
});




}
/// @nodoc
class __$ProjectEntityCopyWithImpl<$Res>
    implements _$ProjectEntityCopyWith<$Res> {
  __$ProjectEntityCopyWithImpl(this._self, this._then);

  final _ProjectEntity _self;
  final $Res Function(_ProjectEntity) _then;

/// Create a copy of ProjectEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? creatorId = null,Object? title = null,Object? description = null,Object? statusId = null,Object? createdAt = freezed,Object? dueDate = freezed,}) {
  return _then(_ProjectEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,creatorId: null == creatorId ? _self.creatorId : creatorId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,statusId: null == statusId ? _self.statusId : statusId // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
