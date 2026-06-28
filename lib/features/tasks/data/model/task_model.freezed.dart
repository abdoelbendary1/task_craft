// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TaskModel {

@HiveField(0) String get id;@HiveField(1)@JsonKey(name: 'project_id') String get projectId;@HiveField(2) String get title;@HiveField(3) String get description;@HiveField(4)@JsonKey(name: 'status_id') int get statusId;@HiveField(5)@JsonKey(name: 'priority_id') int get priorityId;@HiveField(6)@JsonKey(name: 'created_at') DateTime? get createdAt;
/// Create a copy of TaskModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskModelCopyWith<TaskModel> get copyWith => _$TaskModelCopyWithImpl<TaskModel>(this as TaskModel, _$identity);

  /// Serializes this TaskModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskModel&&(identical(other.id, id) || other.id == id)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.statusId, statusId) || other.statusId == statusId)&&(identical(other.priorityId, priorityId) || other.priorityId == priorityId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,projectId,title,description,statusId,priorityId,createdAt);

@override
String toString() {
  return 'TaskModel(id: $id, projectId: $projectId, title: $title, description: $description, statusId: $statusId, priorityId: $priorityId, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $TaskModelCopyWith<$Res>  {
  factory $TaskModelCopyWith(TaskModel value, $Res Function(TaskModel) _then) = _$TaskModelCopyWithImpl;
@useResult
$Res call({
@HiveField(0) String id,@HiveField(1)@JsonKey(name: 'project_id') String projectId,@HiveField(2) String title,@HiveField(3) String description,@HiveField(4)@JsonKey(name: 'status_id') int statusId,@HiveField(5)@JsonKey(name: 'priority_id') int priorityId,@HiveField(6)@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class _$TaskModelCopyWithImpl<$Res>
    implements $TaskModelCopyWith<$Res> {
  _$TaskModelCopyWithImpl(this._self, this._then);

  final TaskModel _self;
  final $Res Function(TaskModel) _then;

/// Create a copy of TaskModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? projectId = null,Object? title = null,Object? description = null,Object? statusId = null,Object? priorityId = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,statusId: null == statusId ? _self.statusId : statusId // ignore: cast_nullable_to_non_nullable
as int,priorityId: null == priorityId ? _self.priorityId : priorityId // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [TaskModel].
extension TaskModelPatterns on TaskModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TaskModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TaskModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TaskModel value)  $default,){
final _that = this;
switch (_that) {
case _TaskModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TaskModel value)?  $default,){
final _that = this;
switch (_that) {
case _TaskModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)  String id, @HiveField(1)@JsonKey(name: 'project_id')  String projectId, @HiveField(2)  String title, @HiveField(3)  String description, @HiveField(4)@JsonKey(name: 'status_id')  int statusId, @HiveField(5)@JsonKey(name: 'priority_id')  int priorityId, @HiveField(6)@JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TaskModel() when $default != null:
return $default(_that.id,_that.projectId,_that.title,_that.description,_that.statusId,_that.priorityId,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)  String id, @HiveField(1)@JsonKey(name: 'project_id')  String projectId, @HiveField(2)  String title, @HiveField(3)  String description, @HiveField(4)@JsonKey(name: 'status_id')  int statusId, @HiveField(5)@JsonKey(name: 'priority_id')  int priorityId, @HiveField(6)@JsonKey(name: 'created_at')  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _TaskModel():
return $default(_that.id,_that.projectId,_that.title,_that.description,_that.statusId,_that.priorityId,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)  String id, @HiveField(1)@JsonKey(name: 'project_id')  String projectId, @HiveField(2)  String title, @HiveField(3)  String description, @HiveField(4)@JsonKey(name: 'status_id')  int statusId, @HiveField(5)@JsonKey(name: 'priority_id')  int priorityId, @HiveField(6)@JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _TaskModel() when $default != null:
return $default(_that.id,_that.projectId,_that.title,_that.description,_that.statusId,_that.priorityId,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 1)
class _TaskModel implements TaskModel {
  const _TaskModel({@HiveField(0) this.id = "", @HiveField(1)@JsonKey(name: 'project_id') this.projectId = "", @HiveField(2) this.title = "", @HiveField(3) this.description = "", @HiveField(4)@JsonKey(name: 'status_id') this.statusId = 0, @HiveField(5)@JsonKey(name: 'priority_id') this.priorityId = 1, @HiveField(6)@JsonKey(name: 'created_at') this.createdAt});
  factory _TaskModel.fromJson(Map<String, dynamic> json) => _$TaskModelFromJson(json);

@override@JsonKey()@HiveField(0) final  String id;
@override@HiveField(1)@JsonKey(name: 'project_id') final  String projectId;
@override@JsonKey()@HiveField(2) final  String title;
@override@JsonKey()@HiveField(3) final  String description;
@override@HiveField(4)@JsonKey(name: 'status_id') final  int statusId;
@override@HiveField(5)@JsonKey(name: 'priority_id') final  int priorityId;
@override@HiveField(6)@JsonKey(name: 'created_at') final  DateTime? createdAt;

/// Create a copy of TaskModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskModelCopyWith<_TaskModel> get copyWith => __$TaskModelCopyWithImpl<_TaskModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TaskModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskModel&&(identical(other.id, id) || other.id == id)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.statusId, statusId) || other.statusId == statusId)&&(identical(other.priorityId, priorityId) || other.priorityId == priorityId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,projectId,title,description,statusId,priorityId,createdAt);

@override
String toString() {
  return 'TaskModel(id: $id, projectId: $projectId, title: $title, description: $description, statusId: $statusId, priorityId: $priorityId, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$TaskModelCopyWith<$Res> implements $TaskModelCopyWith<$Res> {
  factory _$TaskModelCopyWith(_TaskModel value, $Res Function(_TaskModel) _then) = __$TaskModelCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) String id,@HiveField(1)@JsonKey(name: 'project_id') String projectId,@HiveField(2) String title,@HiveField(3) String description,@HiveField(4)@JsonKey(name: 'status_id') int statusId,@HiveField(5)@JsonKey(name: 'priority_id') int priorityId,@HiveField(6)@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class __$TaskModelCopyWithImpl<$Res>
    implements _$TaskModelCopyWith<$Res> {
  __$TaskModelCopyWithImpl(this._self, this._then);

  final _TaskModel _self;
  final $Res Function(_TaskModel) _then;

/// Create a copy of TaskModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? projectId = null,Object? title = null,Object? description = null,Object? statusId = null,Object? priorityId = null,Object? createdAt = freezed,}) {
  return _then(_TaskModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,statusId: null == statusId ? _self.statusId : statusId // ignore: cast_nullable_to_non_nullable
as int,priorityId: null == priorityId ? _self.priorityId : priorityId // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
