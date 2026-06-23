// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'projects_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProjectsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectsEvent()';
}


}

/// @nodoc
class $ProjectsEventCopyWith<$Res>  {
$ProjectsEventCopyWith(ProjectsEvent _, $Res Function(ProjectsEvent) __);
}


/// Adds pattern-matching-related methods to [ProjectsEvent].
extension ProjectsEventPatterns on ProjectsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _RefreshedProjects value)?  refreshProjects,TResult Function( _AddNewProject value)?  addNewProject,TResult Function( _DeleteProject value)?  deleteProject,TResult Function( _UpdateProject value)?  updateProject,TResult Function( _GoToProject value)?  goToProject,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _RefreshedProjects() when refreshProjects != null:
return refreshProjects(_that);case _AddNewProject() when addNewProject != null:
return addNewProject(_that);case _DeleteProject() when deleteProject != null:
return deleteProject(_that);case _UpdateProject() when updateProject != null:
return updateProject(_that);case _GoToProject() when goToProject != null:
return goToProject(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _RefreshedProjects value)  refreshProjects,required TResult Function( _AddNewProject value)  addNewProject,required TResult Function( _DeleteProject value)  deleteProject,required TResult Function( _UpdateProject value)  updateProject,required TResult Function( _GoToProject value)  goToProject,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _RefreshedProjects():
return refreshProjects(_that);case _AddNewProject():
return addNewProject(_that);case _DeleteProject():
return deleteProject(_that);case _UpdateProject():
return updateProject(_that);case _GoToProject():
return goToProject(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _RefreshedProjects value)?  refreshProjects,TResult? Function( _AddNewProject value)?  addNewProject,TResult? Function( _DeleteProject value)?  deleteProject,TResult? Function( _UpdateProject value)?  updateProject,TResult? Function( _GoToProject value)?  goToProject,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _RefreshedProjects() when refreshProjects != null:
return refreshProjects(_that);case _AddNewProject() when addNewProject != null:
return addNewProject(_that);case _DeleteProject() when deleteProject != null:
return deleteProject(_that);case _UpdateProject() when updateProject != null:
return updateProject(_that);case _GoToProject() when goToProject != null:
return goToProject(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  refreshProjects,TResult Function( ProjectEntity project)?  addNewProject,TResult Function( ProjectEntity project)?  deleteProject,TResult Function( ProjectEntity project)?  updateProject,TResult Function()?  goToProject,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _RefreshedProjects() when refreshProjects != null:
return refreshProjects();case _AddNewProject() when addNewProject != null:
return addNewProject(_that.project);case _DeleteProject() when deleteProject != null:
return deleteProject(_that.project);case _UpdateProject() when updateProject != null:
return updateProject(_that.project);case _GoToProject() when goToProject != null:
return goToProject();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  refreshProjects,required TResult Function( ProjectEntity project)  addNewProject,required TResult Function( ProjectEntity project)  deleteProject,required TResult Function( ProjectEntity project)  updateProject,required TResult Function()  goToProject,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _RefreshedProjects():
return refreshProjects();case _AddNewProject():
return addNewProject(_that.project);case _DeleteProject():
return deleteProject(_that.project);case _UpdateProject():
return updateProject(_that.project);case _GoToProject():
return goToProject();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  refreshProjects,TResult? Function( ProjectEntity project)?  addNewProject,TResult? Function( ProjectEntity project)?  deleteProject,TResult? Function( ProjectEntity project)?  updateProject,TResult? Function()?  goToProject,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _RefreshedProjects() when refreshProjects != null:
return refreshProjects();case _AddNewProject() when addNewProject != null:
return addNewProject(_that.project);case _DeleteProject() when deleteProject != null:
return deleteProject(_that.project);case _UpdateProject() when updateProject != null:
return updateProject(_that.project);case _GoToProject() when goToProject != null:
return goToProject();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements ProjectsEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectsEvent.started()';
}


}




/// @nodoc


class _RefreshedProjects implements ProjectsEvent {
  const _RefreshedProjects();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefreshedProjects);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectsEvent.refreshProjects()';
}


}




/// @nodoc


class _AddNewProject implements ProjectsEvent {
  const _AddNewProject(this.project);
  

 final  ProjectEntity project;

/// Create a copy of ProjectsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddNewProjectCopyWith<_AddNewProject> get copyWith => __$AddNewProjectCopyWithImpl<_AddNewProject>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddNewProject&&(identical(other.project, project) || other.project == project));
}


@override
int get hashCode => Object.hash(runtimeType,project);

@override
String toString() {
  return 'ProjectsEvent.addNewProject(project: $project)';
}


}

/// @nodoc
abstract mixin class _$AddNewProjectCopyWith<$Res> implements $ProjectsEventCopyWith<$Res> {
  factory _$AddNewProjectCopyWith(_AddNewProject value, $Res Function(_AddNewProject) _then) = __$AddNewProjectCopyWithImpl;
@useResult
$Res call({
 ProjectEntity project
});


$ProjectEntityCopyWith<$Res> get project;

}
/// @nodoc
class __$AddNewProjectCopyWithImpl<$Res>
    implements _$AddNewProjectCopyWith<$Res> {
  __$AddNewProjectCopyWithImpl(this._self, this._then);

  final _AddNewProject _self;
  final $Res Function(_AddNewProject) _then;

/// Create a copy of ProjectsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? project = null,}) {
  return _then(_AddNewProject(
null == project ? _self.project : project // ignore: cast_nullable_to_non_nullable
as ProjectEntity,
  ));
}

/// Create a copy of ProjectsEvent
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


class _DeleteProject implements ProjectsEvent {
  const _DeleteProject(this.project);
  

 final  ProjectEntity project;

/// Create a copy of ProjectsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteProjectCopyWith<_DeleteProject> get copyWith => __$DeleteProjectCopyWithImpl<_DeleteProject>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteProject&&(identical(other.project, project) || other.project == project));
}


@override
int get hashCode => Object.hash(runtimeType,project);

@override
String toString() {
  return 'ProjectsEvent.deleteProject(project: $project)';
}


}

/// @nodoc
abstract mixin class _$DeleteProjectCopyWith<$Res> implements $ProjectsEventCopyWith<$Res> {
  factory _$DeleteProjectCopyWith(_DeleteProject value, $Res Function(_DeleteProject) _then) = __$DeleteProjectCopyWithImpl;
@useResult
$Res call({
 ProjectEntity project
});


$ProjectEntityCopyWith<$Res> get project;

}
/// @nodoc
class __$DeleteProjectCopyWithImpl<$Res>
    implements _$DeleteProjectCopyWith<$Res> {
  __$DeleteProjectCopyWithImpl(this._self, this._then);

  final _DeleteProject _self;
  final $Res Function(_DeleteProject) _then;

/// Create a copy of ProjectsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? project = null,}) {
  return _then(_DeleteProject(
null == project ? _self.project : project // ignore: cast_nullable_to_non_nullable
as ProjectEntity,
  ));
}

/// Create a copy of ProjectsEvent
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


class _UpdateProject implements ProjectsEvent {
  const _UpdateProject(this.project);
  

 final  ProjectEntity project;

/// Create a copy of ProjectsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateProjectCopyWith<_UpdateProject> get copyWith => __$UpdateProjectCopyWithImpl<_UpdateProject>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateProject&&(identical(other.project, project) || other.project == project));
}


@override
int get hashCode => Object.hash(runtimeType,project);

@override
String toString() {
  return 'ProjectsEvent.updateProject(project: $project)';
}


}

/// @nodoc
abstract mixin class _$UpdateProjectCopyWith<$Res> implements $ProjectsEventCopyWith<$Res> {
  factory _$UpdateProjectCopyWith(_UpdateProject value, $Res Function(_UpdateProject) _then) = __$UpdateProjectCopyWithImpl;
@useResult
$Res call({
 ProjectEntity project
});


$ProjectEntityCopyWith<$Res> get project;

}
/// @nodoc
class __$UpdateProjectCopyWithImpl<$Res>
    implements _$UpdateProjectCopyWith<$Res> {
  __$UpdateProjectCopyWithImpl(this._self, this._then);

  final _UpdateProject _self;
  final $Res Function(_UpdateProject) _then;

/// Create a copy of ProjectsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? project = null,}) {
  return _then(_UpdateProject(
null == project ? _self.project : project // ignore: cast_nullable_to_non_nullable
as ProjectEntity,
  ));
}

/// Create a copy of ProjectsEvent
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


class _GoToProject implements ProjectsEvent {
  const _GoToProject();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GoToProject);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectsEvent.goToProject()';
}


}




/// @nodoc
mixin _$ProjectsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectsState()';
}


}

/// @nodoc
class $ProjectsStateCopyWith<$Res>  {
$ProjectsStateCopyWith(ProjectsState _, $Res Function(ProjectsState) __);
}


/// Adds pattern-matching-related methods to [ProjectsState].
extension ProjectsStatePatterns on ProjectsState {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String message)?  error,TResult Function()?  empty,TResult Function( List<ProjectEntity> projects)?  loaded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Error() when error != null:
return error(_that.message);case _Empty() when empty != null:
return empty();case _Loaded() when loaded != null:
return loaded(_that.projects);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String message)  error,required TResult Function()  empty,required TResult Function( List<ProjectEntity> projects)  loaded,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Error():
return error(_that.message);case _Empty():
return empty();case _Loaded():
return loaded(_that.projects);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String message)?  error,TResult? Function()?  empty,TResult? Function( List<ProjectEntity> projects)?  loaded,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Error() when error != null:
return error(_that.message);case _Empty() when empty != null:
return empty();case _Loaded() when loaded != null:
return loaded(_that.projects);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements ProjectsState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectsState.initial()';
}


}




/// @nodoc


class _Loading implements ProjectsState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectsState.loading()';
}


}




/// @nodoc


class _Error implements ProjectsState {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of ProjectsState
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
  return 'ProjectsState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $ProjectsStateCopyWith<$Res> {
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

/// Create a copy of ProjectsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Empty implements ProjectsState {
  const _Empty();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Empty);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectsState.empty()';
}


}




/// @nodoc


class _Loaded implements ProjectsState {
  const _Loaded(final  List<ProjectEntity> projects): _projects = projects;
  

 final  List<ProjectEntity> _projects;
 List<ProjectEntity> get projects {
  if (_projects is EqualUnmodifiableListView) return _projects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_projects);
}


/// Create a copy of ProjectsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&const DeepCollectionEquality().equals(other._projects, _projects));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_projects));

@override
String toString() {
  return 'ProjectsState.loaded(projects: $projects)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $ProjectsStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 List<ProjectEntity> projects
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of ProjectsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? projects = null,}) {
  return _then(_Loaded(
null == projects ? _self._projects : projects // ignore: cast_nullable_to_non_nullable
as List<ProjectEntity>,
  ));
}


}

// dart format on
