// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sync_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SyncAction {

@HiveField(0) String get id;@HiveField(1) String get endpoint;@HiveField(2) String get method;@HiveField(3) Map<String, dynamic> get payload;@HiveField(4) int get timestamp;
/// Create a copy of SyncAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SyncActionCopyWith<SyncAction> get copyWith => _$SyncActionCopyWithImpl<SyncAction>(this as SyncAction, _$identity);

  /// Serializes this SyncAction to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SyncAction&&(identical(other.id, id) || other.id == id)&&(identical(other.endpoint, endpoint) || other.endpoint == endpoint)&&(identical(other.method, method) || other.method == method)&&const DeepCollectionEquality().equals(other.payload, payload)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,endpoint,method,const DeepCollectionEquality().hash(payload),timestamp);

@override
String toString() {
  return 'SyncAction(id: $id, endpoint: $endpoint, method: $method, payload: $payload, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class $SyncActionCopyWith<$Res>  {
  factory $SyncActionCopyWith(SyncAction value, $Res Function(SyncAction) _then) = _$SyncActionCopyWithImpl;
@useResult
$Res call({
@HiveField(0) String id,@HiveField(1) String endpoint,@HiveField(2) String method,@HiveField(3) Map<String, dynamic> payload,@HiveField(4) int timestamp
});




}
/// @nodoc
class _$SyncActionCopyWithImpl<$Res>
    implements $SyncActionCopyWith<$Res> {
  _$SyncActionCopyWithImpl(this._self, this._then);

  final SyncAction _self;
  final $Res Function(SyncAction) _then;

/// Create a copy of SyncAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? endpoint = null,Object? method = null,Object? payload = null,Object? timestamp = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,endpoint: null == endpoint ? _self.endpoint : endpoint // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,payload: null == payload ? _self.payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SyncAction].
extension SyncActionPatterns on SyncAction {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SyncAction value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SyncAction() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SyncAction value)  $default,){
final _that = this;
switch (_that) {
case _SyncAction():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SyncAction value)?  $default,){
final _that = this;
switch (_that) {
case _SyncAction() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)  String id, @HiveField(1)  String endpoint, @HiveField(2)  String method, @HiveField(3)  Map<String, dynamic> payload, @HiveField(4)  int timestamp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SyncAction() when $default != null:
return $default(_that.id,_that.endpoint,_that.method,_that.payload,_that.timestamp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)  String id, @HiveField(1)  String endpoint, @HiveField(2)  String method, @HiveField(3)  Map<String, dynamic> payload, @HiveField(4)  int timestamp)  $default,) {final _that = this;
switch (_that) {
case _SyncAction():
return $default(_that.id,_that.endpoint,_that.method,_that.payload,_that.timestamp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)  String id, @HiveField(1)  String endpoint, @HiveField(2)  String method, @HiveField(3)  Map<String, dynamic> payload, @HiveField(4)  int timestamp)?  $default,) {final _that = this;
switch (_that) {
case _SyncAction() when $default != null:
return $default(_that.id,_that.endpoint,_that.method,_that.payload,_that.timestamp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 10, adapterName: 'SyncActionInternal')
class _SyncAction extends SyncAction {
   _SyncAction({@HiveField(0) this.id = '', @HiveField(1) this.endpoint = '', @HiveField(2) this.method = '', @HiveField(3) final  Map<String, dynamic> payload = const {}, @HiveField(4) this.timestamp = 0}): _payload = payload,super._();
  factory _SyncAction.fromJson(Map<String, dynamic> json) => _$SyncActionFromJson(json);

@override@JsonKey()@HiveField(0) final  String id;
@override@JsonKey()@HiveField(1) final  String endpoint;
@override@JsonKey()@HiveField(2) final  String method;
 final  Map<String, dynamic> _payload;
@override@JsonKey()@HiveField(3) Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}

@override@JsonKey()@HiveField(4) final  int timestamp;

/// Create a copy of SyncAction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SyncActionCopyWith<_SyncAction> get copyWith => __$SyncActionCopyWithImpl<_SyncAction>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SyncActionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SyncAction&&(identical(other.id, id) || other.id == id)&&(identical(other.endpoint, endpoint) || other.endpoint == endpoint)&&(identical(other.method, method) || other.method == method)&&const DeepCollectionEquality().equals(other._payload, _payload)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,endpoint,method,const DeepCollectionEquality().hash(_payload),timestamp);

@override
String toString() {
  return 'SyncAction(id: $id, endpoint: $endpoint, method: $method, payload: $payload, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class _$SyncActionCopyWith<$Res> implements $SyncActionCopyWith<$Res> {
  factory _$SyncActionCopyWith(_SyncAction value, $Res Function(_SyncAction) _then) = __$SyncActionCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) String id,@HiveField(1) String endpoint,@HiveField(2) String method,@HiveField(3) Map<String, dynamic> payload,@HiveField(4) int timestamp
});




}
/// @nodoc
class __$SyncActionCopyWithImpl<$Res>
    implements _$SyncActionCopyWith<$Res> {
  __$SyncActionCopyWithImpl(this._self, this._then);

  final _SyncAction _self;
  final $Res Function(_SyncAction) _then;

/// Create a copy of SyncAction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? endpoint = null,Object? method = null,Object? payload = null,Object? timestamp = null,}) {
  return _then(_SyncAction(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,endpoint: null == endpoint ? _self.endpoint : endpoint // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
