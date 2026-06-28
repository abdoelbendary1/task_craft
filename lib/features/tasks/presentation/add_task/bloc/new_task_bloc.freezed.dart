// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_task_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NewTaskEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewTaskEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NewTaskEvent()';
}


}

/// @nodoc
class $NewTaskEventCopyWith<$Res>  {
$NewTaskEventCopyWith(NewTaskEvent _, $Res Function(NewTaskEvent) __);
}


/// Adds pattern-matching-related methods to [NewTaskEvent].
extension NewTaskEventPatterns on NewTaskEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _InitProjectId value)?  initProjectId,TResult Function( _TitleChanged value)?  titleChanged,TResult Function( _DescriptionChanged value)?  descriptionChanged,TResult Function( _PriorityChanged value)?  priorityChanged,TResult Function( _DueDateChanged value)?  dueDateChanged,TResult Function( _SubmitTask value)?  submitTask,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InitProjectId() when initProjectId != null:
return initProjectId(_that);case _TitleChanged() when titleChanged != null:
return titleChanged(_that);case _DescriptionChanged() when descriptionChanged != null:
return descriptionChanged(_that);case _PriorityChanged() when priorityChanged != null:
return priorityChanged(_that);case _DueDateChanged() when dueDateChanged != null:
return dueDateChanged(_that);case _SubmitTask() when submitTask != null:
return submitTask(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _InitProjectId value)  initProjectId,required TResult Function( _TitleChanged value)  titleChanged,required TResult Function( _DescriptionChanged value)  descriptionChanged,required TResult Function( _PriorityChanged value)  priorityChanged,required TResult Function( _DueDateChanged value)  dueDateChanged,required TResult Function( _SubmitTask value)  submitTask,}){
final _that = this;
switch (_that) {
case _InitProjectId():
return initProjectId(_that);case _TitleChanged():
return titleChanged(_that);case _DescriptionChanged():
return descriptionChanged(_that);case _PriorityChanged():
return priorityChanged(_that);case _DueDateChanged():
return dueDateChanged(_that);case _SubmitTask():
return submitTask(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _InitProjectId value)?  initProjectId,TResult? Function( _TitleChanged value)?  titleChanged,TResult? Function( _DescriptionChanged value)?  descriptionChanged,TResult? Function( _PriorityChanged value)?  priorityChanged,TResult? Function( _DueDateChanged value)?  dueDateChanged,TResult? Function( _SubmitTask value)?  submitTask,}){
final _that = this;
switch (_that) {
case _InitProjectId() when initProjectId != null:
return initProjectId(_that);case _TitleChanged() when titleChanged != null:
return titleChanged(_that);case _DescriptionChanged() when descriptionChanged != null:
return descriptionChanged(_that);case _PriorityChanged() when priorityChanged != null:
return priorityChanged(_that);case _DueDateChanged() when dueDateChanged != null:
return dueDateChanged(_that);case _SubmitTask() when submitTask != null:
return submitTask(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String projectId)?  initProjectId,TResult Function( String title)?  titleChanged,TResult Function( String description)?  descriptionChanged,TResult Function( int priorityId)?  priorityChanged,TResult Function( DateTime? dueDate)?  dueDateChanged,TResult Function( TaskEntity? task,  String? projectId)?  submitTask,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InitProjectId() when initProjectId != null:
return initProjectId(_that.projectId);case _TitleChanged() when titleChanged != null:
return titleChanged(_that.title);case _DescriptionChanged() when descriptionChanged != null:
return descriptionChanged(_that.description);case _PriorityChanged() when priorityChanged != null:
return priorityChanged(_that.priorityId);case _DueDateChanged() when dueDateChanged != null:
return dueDateChanged(_that.dueDate);case _SubmitTask() when submitTask != null:
return submitTask(_that.task,_that.projectId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String projectId)  initProjectId,required TResult Function( String title)  titleChanged,required TResult Function( String description)  descriptionChanged,required TResult Function( int priorityId)  priorityChanged,required TResult Function( DateTime? dueDate)  dueDateChanged,required TResult Function( TaskEntity? task,  String? projectId)  submitTask,}) {final _that = this;
switch (_that) {
case _InitProjectId():
return initProjectId(_that.projectId);case _TitleChanged():
return titleChanged(_that.title);case _DescriptionChanged():
return descriptionChanged(_that.description);case _PriorityChanged():
return priorityChanged(_that.priorityId);case _DueDateChanged():
return dueDateChanged(_that.dueDate);case _SubmitTask():
return submitTask(_that.task,_that.projectId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String projectId)?  initProjectId,TResult? Function( String title)?  titleChanged,TResult? Function( String description)?  descriptionChanged,TResult? Function( int priorityId)?  priorityChanged,TResult? Function( DateTime? dueDate)?  dueDateChanged,TResult? Function( TaskEntity? task,  String? projectId)?  submitTask,}) {final _that = this;
switch (_that) {
case _InitProjectId() when initProjectId != null:
return initProjectId(_that.projectId);case _TitleChanged() when titleChanged != null:
return titleChanged(_that.title);case _DescriptionChanged() when descriptionChanged != null:
return descriptionChanged(_that.description);case _PriorityChanged() when priorityChanged != null:
return priorityChanged(_that.priorityId);case _DueDateChanged() when dueDateChanged != null:
return dueDateChanged(_that.dueDate);case _SubmitTask() when submitTask != null:
return submitTask(_that.task,_that.projectId);case _:
  return null;

}
}

}

/// @nodoc


class _InitProjectId implements NewTaskEvent {
  const _InitProjectId(this.projectId);
  

 final  String projectId;

/// Create a copy of NewTaskEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitProjectIdCopyWith<_InitProjectId> get copyWith => __$InitProjectIdCopyWithImpl<_InitProjectId>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InitProjectId&&(identical(other.projectId, projectId) || other.projectId == projectId));
}


@override
int get hashCode => Object.hash(runtimeType,projectId);

@override
String toString() {
  return 'NewTaskEvent.initProjectId(projectId: $projectId)';
}


}

/// @nodoc
abstract mixin class _$InitProjectIdCopyWith<$Res> implements $NewTaskEventCopyWith<$Res> {
  factory _$InitProjectIdCopyWith(_InitProjectId value, $Res Function(_InitProjectId) _then) = __$InitProjectIdCopyWithImpl;
@useResult
$Res call({
 String projectId
});




}
/// @nodoc
class __$InitProjectIdCopyWithImpl<$Res>
    implements _$InitProjectIdCopyWith<$Res> {
  __$InitProjectIdCopyWithImpl(this._self, this._then);

  final _InitProjectId _self;
  final $Res Function(_InitProjectId) _then;

/// Create a copy of NewTaskEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? projectId = null,}) {
  return _then(_InitProjectId(
null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _TitleChanged implements NewTaskEvent {
  const _TitleChanged(this.title);
  

 final  String title;

/// Create a copy of NewTaskEvent
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
  return 'NewTaskEvent.titleChanged(title: $title)';
}


}

/// @nodoc
abstract mixin class _$TitleChangedCopyWith<$Res> implements $NewTaskEventCopyWith<$Res> {
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

/// Create a copy of NewTaskEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? title = null,}) {
  return _then(_TitleChanged(
null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _DescriptionChanged implements NewTaskEvent {
  const _DescriptionChanged(this.description);
  

 final  String description;

/// Create a copy of NewTaskEvent
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
  return 'NewTaskEvent.descriptionChanged(description: $description)';
}


}

/// @nodoc
abstract mixin class _$DescriptionChangedCopyWith<$Res> implements $NewTaskEventCopyWith<$Res> {
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

/// Create a copy of NewTaskEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? description = null,}) {
  return _then(_DescriptionChanged(
null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _PriorityChanged implements NewTaskEvent {
  const _PriorityChanged(this.priorityId);
  

 final  int priorityId;

/// Create a copy of NewTaskEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PriorityChangedCopyWith<_PriorityChanged> get copyWith => __$PriorityChangedCopyWithImpl<_PriorityChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PriorityChanged&&(identical(other.priorityId, priorityId) || other.priorityId == priorityId));
}


@override
int get hashCode => Object.hash(runtimeType,priorityId);

@override
String toString() {
  return 'NewTaskEvent.priorityChanged(priorityId: $priorityId)';
}


}

/// @nodoc
abstract mixin class _$PriorityChangedCopyWith<$Res> implements $NewTaskEventCopyWith<$Res> {
  factory _$PriorityChangedCopyWith(_PriorityChanged value, $Res Function(_PriorityChanged) _then) = __$PriorityChangedCopyWithImpl;
@useResult
$Res call({
 int priorityId
});




}
/// @nodoc
class __$PriorityChangedCopyWithImpl<$Res>
    implements _$PriorityChangedCopyWith<$Res> {
  __$PriorityChangedCopyWithImpl(this._self, this._then);

  final _PriorityChanged _self;
  final $Res Function(_PriorityChanged) _then;

/// Create a copy of NewTaskEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? priorityId = null,}) {
  return _then(_PriorityChanged(
null == priorityId ? _self.priorityId : priorityId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _DueDateChanged implements NewTaskEvent {
  const _DueDateChanged(this.dueDate);
  

 final  DateTime? dueDate;

/// Create a copy of NewTaskEvent
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
  return 'NewTaskEvent.dueDateChanged(dueDate: $dueDate)';
}


}

/// @nodoc
abstract mixin class _$DueDateChangedCopyWith<$Res> implements $NewTaskEventCopyWith<$Res> {
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

/// Create a copy of NewTaskEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? dueDate = freezed,}) {
  return _then(_DueDateChanged(
freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc


class _SubmitTask implements NewTaskEvent {
  const _SubmitTask({this.task, this.projectId});
  

 final  TaskEntity? task;
 final  String? projectId;

/// Create a copy of NewTaskEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubmitTaskCopyWith<_SubmitTask> get copyWith => __$SubmitTaskCopyWithImpl<_SubmitTask>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubmitTask&&(identical(other.task, task) || other.task == task)&&(identical(other.projectId, projectId) || other.projectId == projectId));
}


@override
int get hashCode => Object.hash(runtimeType,task,projectId);

@override
String toString() {
  return 'NewTaskEvent.submitTask(task: $task, projectId: $projectId)';
}


}

/// @nodoc
abstract mixin class _$SubmitTaskCopyWith<$Res> implements $NewTaskEventCopyWith<$Res> {
  factory _$SubmitTaskCopyWith(_SubmitTask value, $Res Function(_SubmitTask) _then) = __$SubmitTaskCopyWithImpl;
@useResult
$Res call({
 TaskEntity? task, String? projectId
});


$TaskEntityCopyWith<$Res>? get task;

}
/// @nodoc
class __$SubmitTaskCopyWithImpl<$Res>
    implements _$SubmitTaskCopyWith<$Res> {
  __$SubmitTaskCopyWithImpl(this._self, this._then);

  final _SubmitTask _self;
  final $Res Function(_SubmitTask) _then;

/// Create a copy of NewTaskEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? task = freezed,Object? projectId = freezed,}) {
  return _then(_SubmitTask(
task: freezed == task ? _self.task : task // ignore: cast_nullable_to_non_nullable
as TaskEntity?,projectId: freezed == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of NewTaskEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TaskEntityCopyWith<$Res>? get task {
    if (_self.task == null) {
    return null;
  }

  return $TaskEntityCopyWith<$Res>(_self.task!, (value) {
    return _then(_self.copyWith(task: value));
  });
}
}

/// @nodoc
mixin _$NewTaskState {

 TaskEntity? get task; String? get projectId; NewTaskStatus? get status; String? get errorMessage;
/// Create a copy of NewTaskState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewTaskStateCopyWith<NewTaskState> get copyWith => _$NewTaskStateCopyWithImpl<NewTaskState>(this as NewTaskState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewTaskState&&(identical(other.task, task) || other.task == task)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,task,projectId,status,errorMessage);

@override
String toString() {
  return 'NewTaskState(task: $task, projectId: $projectId, status: $status, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $NewTaskStateCopyWith<$Res>  {
  factory $NewTaskStateCopyWith(NewTaskState value, $Res Function(NewTaskState) _then) = _$NewTaskStateCopyWithImpl;
@useResult
$Res call({
 TaskEntity? task, String? projectId, NewTaskStatus? status, String? errorMessage
});


$TaskEntityCopyWith<$Res>? get task;

}
/// @nodoc
class _$NewTaskStateCopyWithImpl<$Res>
    implements $NewTaskStateCopyWith<$Res> {
  _$NewTaskStateCopyWithImpl(this._self, this._then);

  final NewTaskState _self;
  final $Res Function(NewTaskState) _then;

/// Create a copy of NewTaskState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? task = freezed,Object? projectId = freezed,Object? status = freezed,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
task: freezed == task ? _self.task : task // ignore: cast_nullable_to_non_nullable
as TaskEntity?,projectId: freezed == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as NewTaskStatus?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of NewTaskState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TaskEntityCopyWith<$Res>? get task {
    if (_self.task == null) {
    return null;
  }

  return $TaskEntityCopyWith<$Res>(_self.task!, (value) {
    return _then(_self.copyWith(task: value));
  });
}
}


/// Adds pattern-matching-related methods to [NewTaskState].
extension NewTaskStatePatterns on NewTaskState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NewTaskState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NewTaskState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NewTaskState value)  $default,){
final _that = this;
switch (_that) {
case _NewTaskState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NewTaskState value)?  $default,){
final _that = this;
switch (_that) {
case _NewTaskState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TaskEntity? task,  String? projectId,  NewTaskStatus? status,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NewTaskState() when $default != null:
return $default(_that.task,_that.projectId,_that.status,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TaskEntity? task,  String? projectId,  NewTaskStatus? status,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _NewTaskState():
return $default(_that.task,_that.projectId,_that.status,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TaskEntity? task,  String? projectId,  NewTaskStatus? status,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _NewTaskState() when $default != null:
return $default(_that.task,_that.projectId,_that.status,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _NewTaskState implements NewTaskState {
  const _NewTaskState({this.task = const TaskEntity(), this.projectId = "", this.status = NewTaskStatus.initial, this.errorMessage = ""});
  

@override@JsonKey() final  TaskEntity? task;
@override@JsonKey() final  String? projectId;
@override@JsonKey() final  NewTaskStatus? status;
@override@JsonKey() final  String? errorMessage;

/// Create a copy of NewTaskState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewTaskStateCopyWith<_NewTaskState> get copyWith => __$NewTaskStateCopyWithImpl<_NewTaskState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewTaskState&&(identical(other.task, task) || other.task == task)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,task,projectId,status,errorMessage);

@override
String toString() {
  return 'NewTaskState(task: $task, projectId: $projectId, status: $status, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$NewTaskStateCopyWith<$Res> implements $NewTaskStateCopyWith<$Res> {
  factory _$NewTaskStateCopyWith(_NewTaskState value, $Res Function(_NewTaskState) _then) = __$NewTaskStateCopyWithImpl;
@override @useResult
$Res call({
 TaskEntity? task, String? projectId, NewTaskStatus? status, String? errorMessage
});


@override $TaskEntityCopyWith<$Res>? get task;

}
/// @nodoc
class __$NewTaskStateCopyWithImpl<$Res>
    implements _$NewTaskStateCopyWith<$Res> {
  __$NewTaskStateCopyWithImpl(this._self, this._then);

  final _NewTaskState _self;
  final $Res Function(_NewTaskState) _then;

/// Create a copy of NewTaskState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? task = freezed,Object? projectId = freezed,Object? status = freezed,Object? errorMessage = freezed,}) {
  return _then(_NewTaskState(
task: freezed == task ? _self.task : task // ignore: cast_nullable_to_non_nullable
as TaskEntity?,projectId: freezed == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as NewTaskStatus?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of NewTaskState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TaskEntityCopyWith<$Res>? get task {
    if (_self.task == null) {
    return null;
  }

  return $TaskEntityCopyWith<$Res>(_self.task!, (value) {
    return _then(_self.copyWith(task: value));
  });
}
}

// dart format on
