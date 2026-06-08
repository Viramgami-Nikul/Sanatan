// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'share_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ShareEvent {

 String get postId;
/// Create a copy of ShareEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShareEventCopyWith<ShareEvent> get copyWith => _$ShareEventCopyWithImpl<ShareEvent>(this as ShareEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShareEvent&&(identical(other.postId, postId) || other.postId == postId));
}


@override
int get hashCode => Object.hash(runtimeType,postId);

@override
String toString() {
  return 'ShareEvent(postId: $postId)';
}


}

/// @nodoc
abstract mixin class $ShareEventCopyWith<$Res>  {
  factory $ShareEventCopyWith(ShareEvent value, $Res Function(ShareEvent) _then) = _$ShareEventCopyWithImpl;
@useResult
$Res call({
 String postId
});




}
/// @nodoc
class _$ShareEventCopyWithImpl<$Res>
    implements $ShareEventCopyWith<$Res> {
  _$ShareEventCopyWithImpl(this._self, this._then);

  final ShareEvent _self;
  final $Res Function(ShareEvent) _then;

/// Create a copy of ShareEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? postId = null,}) {
  return _then(_self.copyWith(
postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ShareEvent].
extension ShareEventPatterns on ShareEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( OnSharePost value)?  onSharePost,required TResult orElse(),}){
final _that = this;
switch (_that) {
case OnSharePost() when onSharePost != null:
return onSharePost(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( OnSharePost value)  onSharePost,}){
final _that = this;
switch (_that) {
case OnSharePost():
return onSharePost(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( OnSharePost value)?  onSharePost,}){
final _that = this;
switch (_that) {
case OnSharePost() when onSharePost != null:
return onSharePost(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String postId)?  onSharePost,required TResult orElse(),}) {final _that = this;
switch (_that) {
case OnSharePost() when onSharePost != null:
return onSharePost(_that.postId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String postId)  onSharePost,}) {final _that = this;
switch (_that) {
case OnSharePost():
return onSharePost(_that.postId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String postId)?  onSharePost,}) {final _that = this;
switch (_that) {
case OnSharePost() when onSharePost != null:
return onSharePost(_that.postId);case _:
  return null;

}
}

}

/// @nodoc


class OnSharePost implements ShareEvent {
  const OnSharePost({required this.postId});
  

@override final  String postId;

/// Create a copy of ShareEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnSharePostCopyWith<OnSharePost> get copyWith => _$OnSharePostCopyWithImpl<OnSharePost>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnSharePost&&(identical(other.postId, postId) || other.postId == postId));
}


@override
int get hashCode => Object.hash(runtimeType,postId);

@override
String toString() {
  return 'ShareEvent.onSharePost(postId: $postId)';
}


}

/// @nodoc
abstract mixin class $OnSharePostCopyWith<$Res> implements $ShareEventCopyWith<$Res> {
  factory $OnSharePostCopyWith(OnSharePost value, $Res Function(OnSharePost) _then) = _$OnSharePostCopyWithImpl;
@override @useResult
$Res call({
 String postId
});




}
/// @nodoc
class _$OnSharePostCopyWithImpl<$Res>
    implements $OnSharePostCopyWith<$Res> {
  _$OnSharePostCopyWithImpl(this._self, this._then);

  final OnSharePost _self;
  final $Res Function(OnSharePost) _then;

/// Create a copy of ShareEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? postId = null,}) {
  return _then(OnSharePost(
postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ShareState {

 CommonScreenState get status; String? get errorMessage;
/// Create a copy of ShareState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShareStateCopyWith<ShareState> get copyWith => _$ShareStateCopyWithImpl<ShareState>(this as ShareState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShareState&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,errorMessage);

@override
String toString() {
  return 'ShareState(status: $status, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ShareStateCopyWith<$Res>  {
  factory $ShareStateCopyWith(ShareState value, $Res Function(ShareState) _then) = _$ShareStateCopyWithImpl;
@useResult
$Res call({
 CommonScreenState status, String? errorMessage
});




}
/// @nodoc
class _$ShareStateCopyWithImpl<$Res>
    implements $ShareStateCopyWith<$Res> {
  _$ShareStateCopyWithImpl(this._self, this._then);

  final ShareState _self;
  final $Res Function(ShareState) _then;

/// Create a copy of ShareState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CommonScreenState,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ShareState].
extension ShareStatePatterns on ShareState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShareState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShareState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShareState value)  $default,){
final _that = this;
switch (_that) {
case _ShareState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShareState value)?  $default,){
final _that = this;
switch (_that) {
case _ShareState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CommonScreenState status,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShareState() when $default != null:
return $default(_that.status,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CommonScreenState status,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _ShareState():
return $default(_that.status,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CommonScreenState status,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _ShareState() when $default != null:
return $default(_that.status,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _ShareState implements ShareState {
   _ShareState({required this.status, this.errorMessage});
  

@override final  CommonScreenState status;
@override final  String? errorMessage;

/// Create a copy of ShareState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShareStateCopyWith<_ShareState> get copyWith => __$ShareStateCopyWithImpl<_ShareState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShareState&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,errorMessage);

@override
String toString() {
  return 'ShareState(status: $status, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$ShareStateCopyWith<$Res> implements $ShareStateCopyWith<$Res> {
  factory _$ShareStateCopyWith(_ShareState value, $Res Function(_ShareState) _then) = __$ShareStateCopyWithImpl;
@override @useResult
$Res call({
 CommonScreenState status, String? errorMessage
});




}
/// @nodoc
class __$ShareStateCopyWithImpl<$Res>
    implements _$ShareStateCopyWith<$Res> {
  __$ShareStateCopyWithImpl(this._self, this._then);

  final _ShareState _self;
  final $Res Function(_ShareState) _then;

/// Create a copy of ShareState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? errorMessage = freezed,}) {
  return _then(_ShareState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CommonScreenState,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
