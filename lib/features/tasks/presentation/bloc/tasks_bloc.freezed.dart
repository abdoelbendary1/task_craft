// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tasks_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProjectTasksEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectTasksEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectTasksEvent()';
}


}

/// @nodoc
class $ProjectTasksEventCopyWith<$Res>  {
$ProjectTasksEventCopyWith(ProjectTasksEvent _, $Res Function(ProjectTasksEvent) __);
}


/// Adds pattern-matching-related methods to [ProjectTasksEvent].
extension ProjectTasksEventPatterns on ProjectTasksEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _RefreshTasks value)?  refreshTasks,TResult Function( _SortByPriority value)?  sortByPriority,TResult Function( _DeleteTask value)?  deleteTask,TResult Function( _ToggleTaskStatus value)?  toggleTaskStatus,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _RefreshTasks() when refreshTasks != null:
return refreshTasks(_that);case _SortByPriority() when sortByPriority != null:
return sortByPriority(_that);case _DeleteTask() when deleteTask != null:
return deleteTask(_that);case _ToggleTaskStatus() when toggleTaskStatus != null:
return toggleTaskStatus(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _RefreshTasks value)  refreshTasks,required TResult Function( _SortByPriority value)  sortByPriority,required TResult Function( _DeleteTask value)  deleteTask,required TResult Function( _ToggleTaskStatus value)  toggleTaskStatus,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _RefreshTasks():
return refreshTasks(_that);case _SortByPriority():
return sortByPriority(_that);case _DeleteTask():
return deleteTask(_that);case _ToggleTaskStatus():
return toggleTaskStatus(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _RefreshTasks value)?  refreshTasks,TResult? Function( _SortByPriority value)?  sortByPriority,TResult? Function( _DeleteTask value)?  deleteTask,TResult? Function( _ToggleTaskStatus value)?  toggleTaskStatus,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _RefreshTasks() when refreshTasks != null:
return refreshTasks(_that);case _SortByPriority() when sortByPriority != null:
return sortByPriority(_that);case _DeleteTask() when deleteTask != null:
return deleteTask(_that);case _ToggleTaskStatus() when toggleTaskStatus != null:
return toggleTaskStatus(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String projectId)?  started,TResult Function( String projectId)?  refreshTasks,TResult Function( TaskPriority? priority,  List<TaskEntity>? tasks)?  sortByPriority,TResult Function( String taskId)?  deleteTask,TResult Function( String taskId,  int currentStatusId)?  toggleTaskStatus,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.projectId);case _RefreshTasks() when refreshTasks != null:
return refreshTasks(_that.projectId);case _SortByPriority() when sortByPriority != null:
return sortByPriority(_that.priority,_that.tasks);case _DeleteTask() when deleteTask != null:
return deleteTask(_that.taskId);case _ToggleTaskStatus() when toggleTaskStatus != null:
return toggleTaskStatus(_that.taskId,_that.currentStatusId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String projectId)  started,required TResult Function( String projectId)  refreshTasks,required TResult Function( TaskPriority? priority,  List<TaskEntity>? tasks)  sortByPriority,required TResult Function( String taskId)  deleteTask,required TResult Function( String taskId,  int currentStatusId)  toggleTaskStatus,}) {final _that = this;
switch (_that) {
case _Started():
return started(_that.projectId);case _RefreshTasks():
return refreshTasks(_that.projectId);case _SortByPriority():
return sortByPriority(_that.priority,_that.tasks);case _DeleteTask():
return deleteTask(_that.taskId);case _ToggleTaskStatus():
return toggleTaskStatus(_that.taskId,_that.currentStatusId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String projectId)?  started,TResult? Function( String projectId)?  refreshTasks,TResult? Function( TaskPriority? priority,  List<TaskEntity>? tasks)?  sortByPriority,TResult? Function( String taskId)?  deleteTask,TResult? Function( String taskId,  int currentStatusId)?  toggleTaskStatus,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.projectId);case _RefreshTasks() when refreshTasks != null:
return refreshTasks(_that.projectId);case _SortByPriority() when sortByPriority != null:
return sortByPriority(_that.priority,_that.tasks);case _DeleteTask() when deleteTask != null:
return deleteTask(_that.taskId);case _ToggleTaskStatus() when toggleTaskStatus != null:
return toggleTaskStatus(_that.taskId,_that.currentStatusId);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements ProjectTasksEvent {
  const _Started(this.projectId);
  

 final  String projectId;

/// Create a copy of ProjectTasksEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StartedCopyWith<_Started> get copyWith => __$StartedCopyWithImpl<_Started>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started&&(identical(other.projectId, projectId) || other.projectId == projectId));
}


@override
int get hashCode => Object.hash(runtimeType,projectId);

@override
String toString() {
  return 'ProjectTasksEvent.started(projectId: $projectId)';
}


}

/// @nodoc
abstract mixin class _$StartedCopyWith<$Res> implements $ProjectTasksEventCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) _then) = __$StartedCopyWithImpl;
@useResult
$Res call({
 String projectId
});




}
/// @nodoc
class __$StartedCopyWithImpl<$Res>
    implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(this._self, this._then);

  final _Started _self;
  final $Res Function(_Started) _then;

/// Create a copy of ProjectTasksEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? projectId = null,}) {
  return _then(_Started(
null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _RefreshTasks implements ProjectTasksEvent {
  const _RefreshTasks(this.projectId);
  

 final  String projectId;

/// Create a copy of ProjectTasksEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RefreshTasksCopyWith<_RefreshTasks> get copyWith => __$RefreshTasksCopyWithImpl<_RefreshTasks>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefreshTasks&&(identical(other.projectId, projectId) || other.projectId == projectId));
}


@override
int get hashCode => Object.hash(runtimeType,projectId);

@override
String toString() {
  return 'ProjectTasksEvent.refreshTasks(projectId: $projectId)';
}


}

/// @nodoc
abstract mixin class _$RefreshTasksCopyWith<$Res> implements $ProjectTasksEventCopyWith<$Res> {
  factory _$RefreshTasksCopyWith(_RefreshTasks value, $Res Function(_RefreshTasks) _then) = __$RefreshTasksCopyWithImpl;
@useResult
$Res call({
 String projectId
});




}
/// @nodoc
class __$RefreshTasksCopyWithImpl<$Res>
    implements _$RefreshTasksCopyWith<$Res> {
  __$RefreshTasksCopyWithImpl(this._self, this._then);

  final _RefreshTasks _self;
  final $Res Function(_RefreshTasks) _then;

/// Create a copy of ProjectTasksEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? projectId = null,}) {
  return _then(_RefreshTasks(
null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _SortByPriority implements ProjectTasksEvent {
  const _SortByPriority({this.priority, final  List<TaskEntity>? tasks}): _tasks = tasks;
  

 final  TaskPriority? priority;
 final  List<TaskEntity>? _tasks;
 List<TaskEntity>? get tasks {
  final value = _tasks;
  if (value == null) return null;
  if (_tasks is EqualUnmodifiableListView) return _tasks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ProjectTasksEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SortByPriorityCopyWith<_SortByPriority> get copyWith => __$SortByPriorityCopyWithImpl<_SortByPriority>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SortByPriority&&(identical(other.priority, priority) || other.priority == priority)&&const DeepCollectionEquality().equals(other._tasks, _tasks));
}


@override
int get hashCode => Object.hash(runtimeType,priority,const DeepCollectionEquality().hash(_tasks));

@override
String toString() {
  return 'ProjectTasksEvent.sortByPriority(priority: $priority, tasks: $tasks)';
}


}

/// @nodoc
abstract mixin class _$SortByPriorityCopyWith<$Res> implements $ProjectTasksEventCopyWith<$Res> {
  factory _$SortByPriorityCopyWith(_SortByPriority value, $Res Function(_SortByPriority) _then) = __$SortByPriorityCopyWithImpl;
@useResult
$Res call({
 TaskPriority? priority, List<TaskEntity>? tasks
});




}
/// @nodoc
class __$SortByPriorityCopyWithImpl<$Res>
    implements _$SortByPriorityCopyWith<$Res> {
  __$SortByPriorityCopyWithImpl(this._self, this._then);

  final _SortByPriority _self;
  final $Res Function(_SortByPriority) _then;

/// Create a copy of ProjectTasksEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? priority = freezed,Object? tasks = freezed,}) {
  return _then(_SortByPriority(
priority: freezed == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as TaskPriority?,tasks: freezed == tasks ? _self._tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<TaskEntity>?,
  ));
}


}

/// @nodoc


class _DeleteTask implements ProjectTasksEvent {
  const _DeleteTask({required this.taskId});
  

 final  String taskId;

/// Create a copy of ProjectTasksEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteTaskCopyWith<_DeleteTask> get copyWith => __$DeleteTaskCopyWithImpl<_DeleteTask>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteTask&&(identical(other.taskId, taskId) || other.taskId == taskId));
}


@override
int get hashCode => Object.hash(runtimeType,taskId);

@override
String toString() {
  return 'ProjectTasksEvent.deleteTask(taskId: $taskId)';
}


}

/// @nodoc
abstract mixin class _$DeleteTaskCopyWith<$Res> implements $ProjectTasksEventCopyWith<$Res> {
  factory _$DeleteTaskCopyWith(_DeleteTask value, $Res Function(_DeleteTask) _then) = __$DeleteTaskCopyWithImpl;
@useResult
$Res call({
 String taskId
});




}
/// @nodoc
class __$DeleteTaskCopyWithImpl<$Res>
    implements _$DeleteTaskCopyWith<$Res> {
  __$DeleteTaskCopyWithImpl(this._self, this._then);

  final _DeleteTask _self;
  final $Res Function(_DeleteTask) _then;

/// Create a copy of ProjectTasksEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? taskId = null,}) {
  return _then(_DeleteTask(
taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ToggleTaskStatus implements ProjectTasksEvent {
  const _ToggleTaskStatus({required this.taskId, required this.currentStatusId});
  

 final  String taskId;
 final  int currentStatusId;

/// Create a copy of ProjectTasksEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToggleTaskStatusCopyWith<_ToggleTaskStatus> get copyWith => __$ToggleTaskStatusCopyWithImpl<_ToggleTaskStatus>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToggleTaskStatus&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.currentStatusId, currentStatusId) || other.currentStatusId == currentStatusId));
}


@override
int get hashCode => Object.hash(runtimeType,taskId,currentStatusId);

@override
String toString() {
  return 'ProjectTasksEvent.toggleTaskStatus(taskId: $taskId, currentStatusId: $currentStatusId)';
}


}

/// @nodoc
abstract mixin class _$ToggleTaskStatusCopyWith<$Res> implements $ProjectTasksEventCopyWith<$Res> {
  factory _$ToggleTaskStatusCopyWith(_ToggleTaskStatus value, $Res Function(_ToggleTaskStatus) _then) = __$ToggleTaskStatusCopyWithImpl;
@useResult
$Res call({
 String taskId, int currentStatusId
});




}
/// @nodoc
class __$ToggleTaskStatusCopyWithImpl<$Res>
    implements _$ToggleTaskStatusCopyWith<$Res> {
  __$ToggleTaskStatusCopyWithImpl(this._self, this._then);

  final _ToggleTaskStatus _self;
  final $Res Function(_ToggleTaskStatus) _then;

/// Create a copy of ProjectTasksEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? taskId = null,Object? currentStatusId = null,}) {
  return _then(_ToggleTaskStatus(
taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String,currentStatusId: null == currentStatusId ? _self.currentStatusId : currentStatusId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$ProjectTasksState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectTasksState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectTasksState()';
}


}

/// @nodoc
class $ProjectTasksStateCopyWith<$Res>  {
$ProjectTasksStateCopyWith(ProjectTasksState _, $Res Function(ProjectTasksState) __);
}


/// Adds pattern-matching-related methods to [ProjectTasksState].
extension ProjectTasksStatePatterns on ProjectTasksState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Error value)?  error,TResult Function( _Empty value)?  empty,TResult Function( _Loaded value)?  loaded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Error() when error != null:
return error(_that);case _Empty() when empty != null:
return empty(_that);case _Loaded() when loaded != null:
return loaded(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Error value)  error,required TResult Function( _Empty value)  empty,required TResult Function( _Loaded value)  loaded,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Error():
return error(_that);case _Empty():
return empty(_that);case _Loaded():
return loaded(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Error value)?  error,TResult? Function( _Empty value)?  empty,TResult? Function( _Loaded value)?  loaded,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Error() when error != null:
return error(_that);case _Empty() when empty != null:
return empty(_that);case _Loaded() when loaded != null:
return loaded(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String message)?  error,TResult Function()?  empty,TResult Function( List<TaskEntity> tasks,  List<TaskEntity> activeTasks,  List<TaskEntity> completedTasks,  TaskPriority? selectedPriority)?  loaded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Error() when error != null:
return error(_that.message);case _Empty() when empty != null:
return empty();case _Loaded() when loaded != null:
return loaded(_that.tasks,_that.activeTasks,_that.completedTasks,_that.selectedPriority);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String message)  error,required TResult Function()  empty,required TResult Function( List<TaskEntity> tasks,  List<TaskEntity> activeTasks,  List<TaskEntity> completedTasks,  TaskPriority? selectedPriority)  loaded,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Error():
return error(_that.message);case _Empty():
return empty();case _Loaded():
return loaded(_that.tasks,_that.activeTasks,_that.completedTasks,_that.selectedPriority);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String message)?  error,TResult? Function()?  empty,TResult? Function( List<TaskEntity> tasks,  List<TaskEntity> activeTasks,  List<TaskEntity> completedTasks,  TaskPriority? selectedPriority)?  loaded,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Error() when error != null:
return error(_that.message);case _Empty() when empty != null:
return empty();case _Loaded() when loaded != null:
return loaded(_that.tasks,_that.activeTasks,_that.completedTasks,_that.selectedPriority);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements ProjectTasksState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectTasksState.initial()';
}


}




/// @nodoc


class _Loading implements ProjectTasksState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectTasksState.loading()';
}


}




/// @nodoc


class _Error implements ProjectTasksState {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of ProjectTasksState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ProjectTasksState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $ProjectTasksStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of ProjectTasksState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Empty implements ProjectTasksState {
  const _Empty();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Empty);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectTasksState.empty()';
}


}




/// @nodoc


class _Loaded implements ProjectTasksState {
  const _Loaded({required final  List<TaskEntity> tasks, required final  List<TaskEntity> activeTasks, required final  List<TaskEntity> completedTasks, this.selectedPriority}): _tasks = tasks,_activeTasks = activeTasks,_completedTasks = completedTasks;
  

 final  List<TaskEntity> _tasks;
 List<TaskEntity> get tasks {
  if (_tasks is EqualUnmodifiableListView) return _tasks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tasks);
}

 final  List<TaskEntity> _activeTasks;
 List<TaskEntity> get activeTasks {
  if (_activeTasks is EqualUnmodifiableListView) return _activeTasks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_activeTasks);
}

 final  List<TaskEntity> _completedTasks;
 List<TaskEntity> get completedTasks {
  if (_completedTasks is EqualUnmodifiableListView) return _completedTasks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_completedTasks);
}

 final  TaskPriority? selectedPriority;

/// Create a copy of ProjectTasksState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&const DeepCollectionEquality().equals(other._tasks, _tasks)&&const DeepCollectionEquality().equals(other._activeTasks, _activeTasks)&&const DeepCollectionEquality().equals(other._completedTasks, _completedTasks)&&(identical(other.selectedPriority, selectedPriority) || other.selectedPriority == selectedPriority));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_tasks),const DeepCollectionEquality().hash(_activeTasks),const DeepCollectionEquality().hash(_completedTasks),selectedPriority);

@override
String toString() {
  return 'ProjectTasksState.loaded(tasks: $tasks, activeTasks: $activeTasks, completedTasks: $completedTasks, selectedPriority: $selectedPriority)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $ProjectTasksStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 List<TaskEntity> tasks, List<TaskEntity> activeTasks, List<TaskEntity> completedTasks, TaskPriority? selectedPriority
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of ProjectTasksState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tasks = null,Object? activeTasks = null,Object? completedTasks = null,Object? selectedPriority = freezed,}) {
  return _then(_Loaded(
tasks: null == tasks ? _self._tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<TaskEntity>,activeTasks: null == activeTasks ? _self._activeTasks : activeTasks // ignore: cast_nullable_to_non_nullable
as List<TaskEntity>,completedTasks: null == completedTasks ? _self._completedTasks : completedTasks // ignore: cast_nullable_to_non_nullable
as List<TaskEntity>,selectedPriority: freezed == selectedPriority ? _self.selectedPriority : selectedPriority // ignore: cast_nullable_to_non_nullable
as TaskPriority?,
  ));
}


}

// dart format on
