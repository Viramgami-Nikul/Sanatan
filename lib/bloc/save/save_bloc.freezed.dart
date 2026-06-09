// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'save_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SaveEvent {

 String get postId;
/// Create a copy of SaveEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaveEventCopyWith<SaveEvent> get copyWith => _$SaveEventCopyWithImpl<SaveEvent>(this as SaveEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaveEvent&&(identical(other.postId, postId) || other.postId == postId));
}


@override
int get hashCode => Object.hash(runtimeType,postId);

@override
String toString() {
  return 'SaveEvent(postId: $postId)';
}


}

/// @nodoc
abstract mixin class $SaveEventCopyWith<$Res>  {
  factory $SaveEventCopyWith(SaveEvent value, $Res Function(SaveEvent) _then) = _$SaveEventCopyWithImpl;
@useResult
$Res call({
 String postId
});




}
/// @nodoc
class _$SaveEventCopyWithImpl<$Res>
    implements $SaveEventCopyWith<$Res> {
  _$SaveEventCopyWithImpl(this._self, this._then);

  final SaveEvent _self;
  final $Res Function(SaveEvent) _then;

/// Create a copy of SaveEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? postId = null,}) {
  return _then(_self.copyWith(
postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SaveEvent].
extension SaveEventPatterns on SaveEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( OnCheckSaveStatus value)?  onCheckSaveStatus,TResult Function( OnToggleSave value)?  onToggleSave,required TResult orElse(),}){
final _that = this;
switch (_that) {
case OnCheckSaveStatus() when onCheckSaveStatus != null:
return onCheckSaveStatus(_that);case OnToggleSave() when onToggleSave != null:
return onToggleSave(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( OnCheckSaveStatus value)  onCheckSaveStatus,required TResult Function( OnToggleSave value)  onToggleSave,}){
final _that = this;
switch (_that) {
case OnCheckSaveStatus():
return onCheckSaveStatus(_that);case OnToggleSave():
return onToggleSave(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( OnCheckSaveStatus value)?  onCheckSaveStatus,TResult? Function( OnToggleSave value)?  onToggleSave,}){
final _that = this;
switch (_that) {
case OnCheckSaveStatus() when onCheckSaveStatus != null:
return onCheckSaveStatus(_that);case OnToggleSave() when onToggleSave != null:
return onToggleSave(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String postId)?  onCheckSaveStatus,TResult Function( String postId,  bool isSaved)?  onToggleSave,required TResult orElse(),}) {final _that = this;
switch (_that) {
case OnCheckSaveStatus() when onCheckSaveStatus != null:
return onCheckSaveStatus(_that.postId);case OnToggleSave() when onToggleSave != null:
return onToggleSave(_that.postId,_that.isSaved);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String postId)  onCheckSaveStatus,required TResult Function( String postId,  bool isSaved)  onToggleSave,}) {final _that = this;
switch (_that) {
case OnCheckSaveStatus():
return onCheckSaveStatus(_that.postId);case OnToggleSave():
return onToggleSave(_that.postId,_that.isSaved);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String postId)?  onCheckSaveStatus,TResult? Function( String postId,  bool isSaved)?  onToggleSave,}) {final _that = this;
switch (_that) {
case OnCheckSaveStatus() when onCheckSaveStatus != null:
return onCheckSaveStatus(_that.postId);case OnToggleSave() when onToggleSave != null:
return onToggleSave(_that.postId,_that.isSaved);case _:
  return null;

}
}

}

/// @nodoc


class OnCheckSaveStatus implements SaveEvent {
  const OnCheckSaveStatus({required this.postId});
  

@override final  String postId;

/// Create a copy of SaveEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnCheckSaveStatusCopyWith<OnCheckSaveStatus> get copyWith => _$OnCheckSaveStatusCopyWithImpl<OnCheckSaveStatus>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnCheckSaveStatus&&(identical(other.postId, postId) || other.postId == postId));
}


@override
int get hashCode => Object.hash(runtimeType,postId);

@override
String toString() {
  return 'SaveEvent.onCheckSaveStatus(postId: $postId)';
}


}

/// @nodoc
abstract mixin class $OnCheckSaveStatusCopyWith<$Res> implements $SaveEventCopyWith<$Res> {
  factory $OnCheckSaveStatusCopyWith(OnCheckSaveStatus value, $Res Function(OnCheckSaveStatus) _then) = _$OnCheckSaveStatusCopyWithImpl;
@override @useResult
$Res call({
 String postId
});




}
/// @nodoc
class _$OnCheckSaveStatusCopyWithImpl<$Res>
    implements $OnCheckSaveStatusCopyWith<$Res> {
  _$OnCheckSaveStatusCopyWithImpl(this._self, this._then);

  final OnCheckSaveStatus _self;
  final $Res Function(OnCheckSaveStatus) _then;

/// Create a copy of SaveEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? postId = null,}) {
  return _then(OnCheckSaveStatus(
postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class OnToggleSave implements SaveEvent {
  const OnToggleSave({required this.postId, required this.isSaved});
  

@override final  String postId;
 final  bool isSaved;

/// Create a copy of SaveEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnToggleSaveCopyWith<OnToggleSave> get copyWith => _$OnToggleSaveCopyWithImpl<OnToggleSave>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnToggleSave&&(identical(other.postId, postId) || other.postId == postId)&&(identical(other.isSaved, isSaved) || other.isSaved == isSaved));
}


@override
int get hashCode => Object.hash(runtimeType,postId,isSaved);

@override
String toString() {
  return 'SaveEvent.onToggleSave(postId: $postId, isSaved: $isSaved)';
}


}

/// @nodoc
abstract mixin class $OnToggleSaveCopyWith<$Res> implements $SaveEventCopyWith<$Res> {
  factory $OnToggleSaveCopyWith(OnToggleSave value, $Res Function(OnToggleSave) _then) = _$OnToggleSaveCopyWithImpl;
@override @useResult
$Res call({
 String postId, bool isSaved
});




}
/// @nodoc
class _$OnToggleSaveCopyWithImpl<$Res>
    implements $OnToggleSaveCopyWith<$Res> {
  _$OnToggleSaveCopyWithImpl(this._self, this._then);

  final OnToggleSave _self;
  final $Res Function(OnToggleSave) _then;

/// Create a copy of SaveEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? postId = null,Object? isSaved = null,}) {
  return _then(OnToggleSave(
postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String,isSaved: null == isSaved ? _self.isSaved : isSaved // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$SaveState {

 CommonScreenState get status; bool get isSaved; String? get errorMessage;
/// Create a copy of SaveState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaveStateCopyWith<SaveState> get copyWith => _$SaveStateCopyWithImpl<SaveState>(this as SaveState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaveState&&(identical(other.status, status) || other.status == status)&&(identical(other.isSaved, isSaved) || other.isSaved == isSaved)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,isSaved,errorMessage);

@override
String toString() {
  return 'SaveState(status: $status, isSaved: $isSaved, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $SaveStateCopyWith<$Res>  {
  factory $SaveStateCopyWith(SaveState value, $Res Function(SaveState) _then) = _$SaveStateCopyWithImpl;
@useResult
$Res call({
 CommonScreenState status, bool isSaved, String? errorMessage
});




}
/// @nodoc
class _$SaveStateCopyWithImpl<$Res>
    implements $SaveStateCopyWith<$Res> {
  _$SaveStateCopyWithImpl(this._self, this._then);

  final SaveState _self;
  final $Res Function(SaveState) _then;

/// Create a copy of SaveState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? isSaved = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CommonScreenState,isSaved: null == isSaved ? _self.isSaved : isSaved // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SaveState].
extension SaveStatePatterns on SaveState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SaveState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SaveState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SaveState value)  $default,){
final _that = this;
switch (_that) {
case _SaveState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SaveState value)?  $default,){
final _that = this;
switch (_that) {
case _SaveState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CommonScreenState status,  bool isSaved,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SaveState() when $default != null:
return $default(_that.status,_that.isSaved,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CommonScreenState status,  bool isSaved,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _SaveState():
return $default(_that.status,_that.isSaved,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CommonScreenState status,  bool isSaved,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _SaveState() when $default != null:
return $default(_that.status,_that.isSaved,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _SaveState implements SaveState {
   _SaveState({required this.status, required this.isSaved, this.errorMessage});
  

@override final  CommonScreenState status;
@override final  bool isSaved;
@override final  String? errorMessage;

/// Create a copy of SaveState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaveStateCopyWith<_SaveState> get copyWith => __$SaveStateCopyWithImpl<_SaveState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaveState&&(identical(other.status, status) || other.status == status)&&(identical(other.isSaved, isSaved) || other.isSaved == isSaved)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,isSaved,errorMessage);

@override
String toString() {
  return 'SaveState(status: $status, isSaved: $isSaved, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$SaveStateCopyWith<$Res> implements $SaveStateCopyWith<$Res> {
  factory _$SaveStateCopyWith(_SaveState value, $Res Function(_SaveState) _then) = __$SaveStateCopyWithImpl;
@override @useResult
$Res call({
 CommonScreenState status, bool isSaved, String? errorMessage
});




}
/// @nodoc
class __$SaveStateCopyWithImpl<$Res>
    implements _$SaveStateCopyWith<$Res> {
  __$SaveStateCopyWithImpl(this._self, this._then);

  final _SaveState _self;
  final $Res Function(_SaveState) _then;

/// Create a copy of SaveState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? isSaved = null,Object? errorMessage = freezed,}) {
  return _then(_SaveState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CommonScreenState,isSaved: null == isSaved ? _self.isSaved : isSaved // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
