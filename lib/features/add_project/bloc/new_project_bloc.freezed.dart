// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_project_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NewProjectEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewProjectEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NewProjectEvent()';
}


}

/// @nodoc
class $NewProjectEventCopyWith<$Res>  {
$NewProjectEventCopyWith(NewProjectEvent _, $Res Function(NewProjectEvent) __);
}


/// Adds pattern-matching-related methods to [NewProjectEvent].
extension NewProjectEventPatterns on NewProjectEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _TitleChanged value)?  titleChanged,TResult Function( _DescriptionChanged value)?  descriptionChanged,TResult Function( _StatusIdChanged value)?  statusIdChanged,TResult Function( _DueDateChanged value)?  dueDateChanged,TResult Function( _SubmitProject value)?  submitProject,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TitleChanged() when titleChanged != null:
return titleChanged(_that);case _DescriptionChanged() when descriptionChanged != null:
return descriptionChanged(_that);case _StatusIdChanged() when statusIdChanged != null:
return statusIdChanged(_that);case _DueDateChanged() when dueDateChanged != null:
return dueDateChanged(_that);case _SubmitProject() when submitProject != null:
return submitProject(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _TitleChanged value)  titleChanged,required TResult Function( _DescriptionChanged value)  descriptionChanged,required TResult Function( _StatusIdChanged value)  statusIdChanged,required TResult Function( _DueDateChanged value)  dueDateChanged,required TResult Function( _SubmitProject value)  submitProject,}){
final _that = this;
switch (_that) {
case _TitleChanged():
return titleChanged(_that);case _DescriptionChanged():
return descriptionChanged(_that);case _StatusIdChanged():
return statusIdChanged(_that);case _DueDateChanged():
return dueDateChanged(_that);case _SubmitProject():
return submitProject(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _TitleChanged value)?  titleChanged,TResult? Function( _DescriptionChanged value)?  descriptionChanged,TResult? Function( _StatusIdChanged value)?  statusIdChanged,TResult? Function( _DueDateChanged value)?  dueDateChanged,TResult? Function( _SubmitProject value)?  submitProject,}){
final _that = this;
switch (_that) {
case _TitleChanged() when titleChanged != null:
return titleChanged(_that);case _DescriptionChanged() when descriptionChanged != null:
return descriptionChanged(_that);case _StatusIdChanged() when statusIdChanged != null:
return statusIdChanged(_that);case _DueDateChanged() when dueDateChanged != null:
return dueDateChanged(_that);case _SubmitProject() when submitProject != null:
return submitProject(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String title)?  titleChanged,TResult Function( String description)?  descriptionChanged,TResult Function( int statusId)?  statusIdChanged,TResult Function( DateTime? dueDate)?  dueDateChanged,TResult Function( ProjectEntity project)?  submitProject,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TitleChanged() when titleChanged != null:
return titleChanged(_that.title);case _DescriptionChanged() when descriptionChanged != null:
return descriptionChanged(_that.description);case _StatusIdChanged() when statusIdChanged != null:
return statusIdChanged(_that.statusId);case _DueDateChanged() when dueDateChanged != null:
return dueDateChanged(_that.dueDate);case _SubmitProject() when submitProject != null:
return submitProject(_that.project);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String title)  titleChanged,required TResult Function( String description)  descriptionChanged,required TResult Function( int statusId)  statusIdChanged,required TResult Function( DateTime? dueDate)  dueDateChanged,required TResult Function( ProjectEntity project)  submitProject,}) {final _that = this;
switch (_that) {
case _TitleChanged():
return titleChanged(_that.title);case _DescriptionChanged():
return descriptionChanged(_that.description);case _StatusIdChanged():
return statusIdChanged(_that.statusId);case _DueDateChanged():
return dueDateChanged(_that.dueDate);case _SubmitProject():
return submitProject(_that.project);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String title)?  titleChanged,TResult? Function( String description)?  descriptionChanged,TResult? Function( int statusId)?  statusIdChanged,TResult? Function( DateTime? dueDate)?  dueDateChanged,TResult? Function( ProjectEntity project)?  submitProject,}) {final _that = this;
switch (_that) {
case _TitleChanged() when titleChanged != null:
return titleChanged(_that.title);case _DescriptionChanged() when descriptionChanged != null:
return descriptionChanged(_that.description);case _StatusIdChanged() when statusIdChanged != null:
return statusIdChanged(_that.statusId);case _DueDateChanged() when dueDateChanged != null:
return dueDateChanged(_that.dueDate);case _SubmitProject() when submitProject != null:
return submitProject(_that.project);case _:
  return null;

}
}

}

/// @nodoc


class _TitleChanged implements NewProjectEvent {
  const _TitleChanged(this.title);
  

 final  String title;

/// Create a copy of NewProjectEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TitleChangedCopyWith<_TitleChanged> get copyWith => __$TitleChangedCopyWithImpl<_TitleChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TitleChanged&&(identical(other.title, title) || other.title == title));
}


@override
int get hashCode => Object.hash(runtimeType,title);

@override
String toString() {
  return 'NewProjectEvent.titleChanged(title: $title)';
}


}

/// @nodoc
abstract mixin class _$TitleChangedCopyWith<$Res> implements $NewProjectEventCopyWith<$Res> {
  factory _$TitleChangedCopyWith(_TitleChanged value, $Res Function(_TitleChanged) _then) = __$TitleChangedCopyWithImpl;
@useResult
$Res call({
 String title
});




}
/// @nodoc
class __$TitleChangedCopyWithImpl<$Res>
    implements _$TitleChangedCopyWith<$Res> {
  __$TitleChangedCopyWithImpl(this._self, this._then);

  final _TitleChanged _self;
  final $Res Function(_TitleChanged) _then;

/// Create a copy of NewProjectEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? title = null,}) {
  return _then(_TitleChanged(
null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _DescriptionChanged implements NewProjectEvent {
  const _DescriptionChanged(this.description);
  

 final  String description;

/// Create a copy of NewProjectEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DescriptionChangedCopyWith<_DescriptionChanged> get copyWith => __$DescriptionChangedCopyWithImpl<_DescriptionChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DescriptionChanged&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,description);

@override
String toString() {
  return 'NewProjectEvent.descriptionChanged(description: $description)';
}


}

/// @nodoc
abstract mixin class _$DescriptionChangedCopyWith<$Res> implements $NewProjectEventCopyWith<$Res> {
  factory _$DescriptionChangedCopyWith(_DescriptionChanged value, $Res Function(_DescriptionChanged) _then) = __$DescriptionChangedCopyWithImpl;
@useResult
$Res call({
 String description
});




}
/// @nodoc
class __$DescriptionChangedCopyWithImpl<$Res>
    implements _$DescriptionChangedCopyWith<$Res> {
  __$DescriptionChangedCopyWithImpl(this._self, this._then);

  final _DescriptionChanged _self;
  final $Res Function(_DescriptionChanged) _then;

/// Create a copy of NewProjectEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? description = null,}) {
  return _then(_DescriptionChanged(
null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _StatusIdChanged implements NewProjectEvent {
  const _StatusIdChanged(this.statusId);
  

 final  int statusId;

/// Create a copy of NewProjectEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StatusIdChangedCopyWith<_StatusIdChanged> get copyWith => __$StatusIdChangedCopyWithImpl<_StatusIdChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StatusIdChanged&&(identical(other.statusId, statusId) || other.statusId == statusId));
}


@override
int get hashCode => Object.hash(runtimeType,statusId);

@override
String toString() {
  return 'NewProjectEvent.statusIdChanged(statusId: $statusId)';
}


}

/// @nodoc
abstract mixin class _$StatusIdChangedCopyWith<$Res> implements $NewProjectEventCopyWith<$Res> {
  factory _$StatusIdChangedCopyWith(_StatusIdChanged value, $Res Function(_StatusIdChanged) _then) = __$StatusIdChangedCopyWithImpl;
@useResult
$Res call({
 int statusId
});




}
/// @nodoc
class __$StatusIdChangedCopyWithImpl<$Res>
    implements _$StatusIdChangedCopyWith<$Res> {
  __$StatusIdChangedCopyWithImpl(this._self, this._then);

  final _StatusIdChanged _self;
  final $Res Function(_StatusIdChanged) _then;

/// Create a copy of NewProjectEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? statusId = null,}) {
  return _then(_StatusIdChanged(
null == statusId ? _self.statusId : statusId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _DueDateChanged implements NewProjectEvent {
  const _DueDateChanged(this.dueDate);
  

 final  DateTime? dueDate;

/// Create a copy of NewProjectEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DueDateChangedCopyWith<_DueDateChanged> get copyWith => __$DueDateChangedCopyWithImpl<_DueDateChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DueDateChanged&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate));
}


@override
int get hashCode => Object.hash(runtimeType,dueDate);

@override
String toString() {
  return 'NewProjectEvent.dueDateChanged(dueDate: $dueDate)';
}


}

/// @nodoc
abstract mixin class _$DueDateChangedCopyWith<$Res> implements $NewProjectEventCopyWith<$Res> {
  factory _$DueDateChangedCopyWith(_DueDateChanged value, $Res Function(_DueDateChanged) _then) = __$DueDateChangedCopyWithImpl;
@useResult
$Res call({
 DateTime? dueDate
});




}
/// @nodoc
class __$DueDateChangedCopyWithImpl<$Res>
    implements _$DueDateChangedCopyWith<$Res> {
  __$DueDateChangedCopyWithImpl(this._self, this._then);

  final _DueDateChanged _self;
  final $Res Function(_DueDateChanged) _then;

/// Create a copy of NewProjectEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? dueDate = freezed,}) {
  return _then(_DueDateChanged(
freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc


class _SubmitProject implements NewProjectEvent {
  const _SubmitProject(this.project);
  

 final  ProjectEntity project;

/// Create a copy of NewProjectEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubmitProjectCopyWith<_SubmitProject> get copyWith => __$SubmitProjectCopyWithImpl<_SubmitProject>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubmitProject&&(identical(other.project, project) || other.project == project));
}


@override
int get hashCode => Object.hash(runtimeType,project);

@override
String toString() {
  return 'NewProjectEvent.submitProject(project: $project)';
}


}

/// @nodoc
abstract mixin class _$SubmitProjectCopyWith<$Res> implements $NewProjectEventCopyWith<$Res> {
  factory _$SubmitProjectCopyWith(_SubmitProject value, $Res Function(_SubmitProject) _then) = __$SubmitProjectCopyWithImpl;
@useResult
$Res call({
 ProjectEntity project
});


$ProjectEntityCopyWith<$Res> get project;

}
/// @nodoc
class __$SubmitProjectCopyWithImpl<$Res>
    implements _$SubmitProjectCopyWith<$Res> {
  __$SubmitProjectCopyWithImpl(this._self, this._then);

  final _SubmitProject _self;
  final $Res Function(_SubmitProject) _then;

/// Create a copy of NewProjectEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? project = null,}) {
  return _then(_SubmitProject(
null == project ? _self.project : project // ignore: cast_nullable_to_non_nullable
as ProjectEntity,
  ));
}

/// Create a copy of NewProjectEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProjectEntityCopyWith<$Res> get project {
  
  return $ProjectEntityCopyWith<$Res>(_self.project, (value) {
    return _then(_self.copyWith(project: value));
  });
}
}

/// @nodoc
mixin _$NewProjectState {

 ProjectEntity get project; NewProjectStatus get status; String? get errorMessage;
/// Create a copy of NewProjectState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewProjectStateCopyWith<NewProjectState> get copyWith => _$NewProjectStateCopyWithImpl<NewProjectState>(this as NewProjectState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewProjectState&&(identical(other.project, project) || other.project == project)&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,project,status,errorMessage);

@override
String toString() {
  return 'NewProjectState(project: $project, status: $status, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $NewProjectStateCopyWith<$Res>  {
  factory $NewProjectStateCopyWith(NewProjectState value, $Res Function(NewProjectState) _then) = _$NewProjectStateCopyWithImpl;
@useResult
$Res call({
 ProjectEntity project, NewProjectStatus status, String? errorMessage
});


$ProjectEntityCopyWith<$Res> get project;

}
/// @nodoc
class _$NewProjectStateCopyWithImpl<$Res>
    implements $NewProjectStateCopyWith<$Res> {
  _$NewProjectStateCopyWithImpl(this._self, this._then);

  final NewProjectState _self;
  final $Res Function(NewProjectState) _then;

/// Create a copy of NewProjectState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? project = null,Object? status = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
project: null == project ? _self.project : project // ignore: cast_nullable_to_non_nullable
as ProjectEntity,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as NewProjectStatus,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of NewProjectState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProjectEntityCopyWith<$Res> get project {
  
  return $ProjectEntityCopyWith<$Res>(_self.project, (value) {
    return _then(_self.copyWith(project: value));
  });
}
}


/// Adds pattern-matching-related methods to [NewProjectState].
extension NewProjectStatePatterns on NewProjectState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NewProjectState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NewProjectState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NewProjectState value)  $default,){
final _that = this;
switch (_that) {
case _NewProjectState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NewProjectState value)?  $default,){
final _that = this;
switch (_that) {
case _NewProjectState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ProjectEntity project,  NewProjectStatus status,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NewProjectState() when $default != null:
return $default(_that.project,_that.status,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ProjectEntity project,  NewProjectStatus status,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _NewProjectState():
return $default(_that.project,_that.status,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ProjectEntity project,  NewProjectStatus status,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _NewProjectState() when $default != null:
return $default(_that.project,_that.status,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _NewProjectState implements NewProjectState {
  const _NewProjectState({required this.project, this.status = NewProjectStatus.initial, this.errorMessage});
  

@override final  ProjectEntity project;
@override@JsonKey() final  NewProjectStatus status;
@override final  String? errorMessage;

/// Create a copy of NewProjectState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewProjectStateCopyWith<_NewProjectState> get copyWith => __$NewProjectStateCopyWithImpl<_NewProjectState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewProjectState&&(identical(other.project, project) || other.project == project)&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,project,status,errorMessage);

@override
String toString() {
  return 'NewProjectState(project: $project, status: $status, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$NewProjectStateCopyWith<$Res> implements $NewProjectStateCopyWith<$Res> {
  factory _$NewProjectStateCopyWith(_NewProjectState value, $Res Function(_NewProjectState) _then) = __$NewProjectStateCopyWithImpl;
@override @useResult
$Res call({
 ProjectEntity project, NewProjectStatus status, String? errorMessage
});


@override $ProjectEntityCopyWith<$Res> get project;

}
/// @nodoc
class __$NewProjectStateCopyWithImpl<$Res>
    implements _$NewProjectStateCopyWith<$Res> {
  __$NewProjectStateCopyWithImpl(this._self, this._then);

  final _NewProjectState _self;
  final $Res Function(_NewProjectState) _then;

/// Create a copy of NewProjectState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? project = null,Object? status = null,Object? errorMessage = freezed,}) {
  return _then(_NewProjectState(
project: null == project ? _self.project : project // ignore: cast_nullable_to_non_nullable
as ProjectEntity,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as NewProjectStatus,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of NewProjectState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProjectEntityCopyWith<$Res> get project {
  
  return $ProjectEntityCopyWith<$Res>(_self.project, (value) {
    return _then(_self.copyWith(project: value));
  });
}
}

// dart format on
