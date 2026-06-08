// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'like_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LikeEvent {

 String get postId;
/// Create a copy of LikeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LikeEventCopyWith<LikeEvent> get copyWith => _$LikeEventCopyWithImpl<LikeEvent>(this as LikeEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LikeEvent&&(identical(other.postId, postId) || other.postId == postId));
}


@override
int get hashCode => Object.hash(runtimeType,postId);

@override
String toString() {
  return 'LikeEvent(postId: $postId)';
}


}

/// @nodoc
abstract mixin class $LikeEventCopyWith<$Res>  {
  factory $LikeEventCopyWith(LikeEvent value, $Res Function(LikeEvent) _then) = _$LikeEventCopyWithImpl;
@useResult
$Res call({
 String postId
});




}
/// @nodoc
class _$LikeEventCopyWithImpl<$Res>
    implements $LikeEventCopyWith<$Res> {
  _$LikeEventCopyWithImpl(this._self, this._then);

  final LikeEvent _self;
  final $Res Function(LikeEvent) _then;

/// Create a copy of LikeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? postId = null,}) {
  return _then(_self.copyWith(
postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LikeEvent].
extension LikeEventPatterns on LikeEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( OnCheckLikeStatus value)?  onCheckLikeStatus,TResult Function( OnToggleLike value)?  onToggleLike,required TResult orElse(),}){
final _that = this;
switch (_that) {
case OnCheckLikeStatus() when onCheckLikeStatus != null:
return onCheckLikeStatus(_that);case OnToggleLike() when onToggleLike != null:
return onToggleLike(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( OnCheckLikeStatus value)  onCheckLikeStatus,required TResult Function( OnToggleLike value)  onToggleLike,}){
final _that = this;
switch (_that) {
case OnCheckLikeStatus():
return onCheckLikeStatus(_that);case OnToggleLike():
return onToggleLike(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( OnCheckLikeStatus value)?  onCheckLikeStatus,TResult? Function( OnToggleLike value)?  onToggleLike,}){
final _that = this;
switch (_that) {
case OnCheckLikeStatus() when onCheckLikeStatus != null:
return onCheckLikeStatus(_that);case OnToggleLike() when onToggleLike != null:
return onToggleLike(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String postId)?  onCheckLikeStatus,TResult Function( String postId,  bool isLiked)?  onToggleLike,required TResult orElse(),}) {final _that = this;
switch (_that) {
case OnCheckLikeStatus() when onCheckLikeStatus != null:
return onCheckLikeStatus(_that.postId);case OnToggleLike() when onToggleLike != null:
return onToggleLike(_that.postId,_that.isLiked);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String postId)  onCheckLikeStatus,required TResult Function( String postId,  bool isLiked)  onToggleLike,}) {final _that = this;
switch (_that) {
case OnCheckLikeStatus():
return onCheckLikeStatus(_that.postId);case OnToggleLike():
return onToggleLike(_that.postId,_that.isLiked);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String postId)?  onCheckLikeStatus,TResult? Function( String postId,  bool isLiked)?  onToggleLike,}) {final _that = this;
switch (_that) {
case OnCheckLikeStatus() when onCheckLikeStatus != null:
return onCheckLikeStatus(_that.postId);case OnToggleLike() when onToggleLike != null:
return onToggleLike(_that.postId,_that.isLiked);case _:
  return null;

}
}

}

/// @nodoc


class OnCheckLikeStatus implements LikeEvent {
  const OnCheckLikeStatus({required this.postId});
  

@override final  String postId;

/// Create a copy of LikeEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnCheckLikeStatusCopyWith<OnCheckLikeStatus> get copyWith => _$OnCheckLikeStatusCopyWithImpl<OnCheckLikeStatus>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnCheckLikeStatus&&(identical(other.postId, postId) || other.postId == postId));
}


@override
int get hashCode => Object.hash(runtimeType,postId);

@override
String toString() {
  return 'LikeEvent.onCheckLikeStatus(postId: $postId)';
}


}

/// @nodoc
abstract mixin class $OnCheckLikeStatusCopyWith<$Res> implements $LikeEventCopyWith<$Res> {
  factory $OnCheckLikeStatusCopyWith(OnCheckLikeStatus value, $Res Function(OnCheckLikeStatus) _then) = _$OnCheckLikeStatusCopyWithImpl;
@override @useResult
$Res call({
 String postId
});




}
/// @nodoc
class _$OnCheckLikeStatusCopyWithImpl<$Res>
    implements $OnCheckLikeStatusCopyWith<$Res> {
  _$OnCheckLikeStatusCopyWithImpl(this._self, this._then);

  final OnCheckLikeStatus _self;
  final $Res Function(OnCheckLikeStatus) _then;

/// Create a copy of LikeEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? postId = null,}) {
  return _then(OnCheckLikeStatus(
postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class OnToggleLike implements LikeEvent {
  const OnToggleLike({required this.postId, required this.isLiked});
  

@override final  String postId;
 final  bool isLiked;

/// Create a copy of LikeEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnToggleLikeCopyWith<OnToggleLike> get copyWith => _$OnToggleLikeCopyWithImpl<OnToggleLike>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnToggleLike&&(identical(other.postId, postId) || other.postId == postId)&&(identical(other.isLiked, isLiked) || other.isLiked == isLiked));
}


@override
int get hashCode => Object.hash(runtimeType,postId,isLiked);

@override
String toString() {
  return 'LikeEvent.onToggleLike(postId: $postId, isLiked: $isLiked)';
}


}

/// @nodoc
abstract mixin class $OnToggleLikeCopyWith<$Res> implements $LikeEventCopyWith<$Res> {
  factory $OnToggleLikeCopyWith(OnToggleLike value, $Res Function(OnToggleLike) _then) = _$OnToggleLikeCopyWithImpl;
@override @useResult
$Res call({
 String postId, bool isLiked
});




}
/// @nodoc
class _$OnToggleLikeCopyWithImpl<$Res>
    implements $OnToggleLikeCopyWith<$Res> {
  _$OnToggleLikeCopyWithImpl(this._self, this._then);

  final OnToggleLike _self;
  final $Res Function(OnToggleLike) _then;

/// Create a copy of LikeEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? postId = null,Object? isLiked = null,}) {
  return _then(OnToggleLike(
postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String,isLiked: null == isLiked ? _self.isLiked : isLiked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$LikeState {

 CommonScreenState get status; bool get isLiked; int get likesCount; String? get errorMessage;
/// Create a copy of LikeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LikeStateCopyWith<LikeState> get copyWith => _$LikeStateCopyWithImpl<LikeState>(this as LikeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LikeState&&(identical(other.status, status) || other.status == status)&&(identical(other.isLiked, isLiked) || other.isLiked == isLiked)&&(identical(other.likesCount, likesCount) || other.likesCount == likesCount)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,isLiked,likesCount,errorMessage);

@override
String toString() {
  return 'LikeState(status: $status, isLiked: $isLiked, likesCount: $likesCount, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $LikeStateCopyWith<$Res>  {
  factory $LikeStateCopyWith(LikeState value, $Res Function(LikeState) _then) = _$LikeStateCopyWithImpl;
@useResult
$Res call({
 CommonScreenState status, bool isLiked, int likesCount, String? errorMessage
});




}
/// @nodoc
class _$LikeStateCopyWithImpl<$Res>
    implements $LikeStateCopyWith<$Res> {
  _$LikeStateCopyWithImpl(this._self, this._then);

  final LikeState _self;
  final $Res Function(LikeState) _then;

/// Create a copy of LikeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? isLiked = null,Object? likesCount = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CommonScreenState,isLiked: null == isLiked ? _self.isLiked : isLiked // ignore: cast_nullable_to_non_nullable
as bool,likesCount: null == likesCount ? _self.likesCount : likesCount // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LikeState].
extension LikeStatePatterns on LikeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LikeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LikeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LikeState value)  $default,){
final _that = this;
switch (_that) {
case _LikeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LikeState value)?  $default,){
final _that = this;
switch (_that) {
case _LikeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CommonScreenState status,  bool isLiked,  int likesCount,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LikeState() when $default != null:
return $default(_that.status,_that.isLiked,_that.likesCount,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CommonScreenState status,  bool isLiked,  int likesCount,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _LikeState():
return $default(_that.status,_that.isLiked,_that.likesCount,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CommonScreenState status,  bool isLiked,  int likesCount,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _LikeState() when $default != null:
return $default(_that.status,_that.isLiked,_that.likesCount,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _LikeState implements LikeState {
   _LikeState({required this.status, required this.isLiked, required this.likesCount, this.errorMessage});
  

@override final  CommonScreenState status;
@override final  bool isLiked;
@override final  int likesCount;
@override final  String? errorMessage;

/// Create a copy of LikeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LikeStateCopyWith<_LikeState> get copyWith => __$LikeStateCopyWithImpl<_LikeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LikeState&&(identical(other.status, status) || other.status == status)&&(identical(other.isLiked, isLiked) || other.isLiked == isLiked)&&(identical(other.likesCount, likesCount) || other.likesCount == likesCount)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,isLiked,likesCount,errorMessage);

@override
String toString() {
  return 'LikeState(status: $status, isLiked: $isLiked, likesCount: $likesCount, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$LikeStateCopyWith<$Res> implements $LikeStateCopyWith<$Res> {
  factory _$LikeStateCopyWith(_LikeState value, $Res Function(_LikeState) _then) = __$LikeStateCopyWithImpl;
@override @useResult
$Res call({
 CommonScreenState status, bool isLiked, int likesCount, String? errorMessage
});




}
/// @nodoc
class __$LikeStateCopyWithImpl<$Res>
    implements _$LikeStateCopyWith<$Res> {
  __$LikeStateCopyWithImpl(this._self, this._then);

  final _LikeState _self;
  final $Res Function(_LikeState) _then;

/// Create a copy of LikeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? isLiked = null,Object? likesCount = null,Object? errorMessage = freezed,}) {
  return _then(_LikeState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CommonScreenState,isLiked: null == isLiked ? _self.isLiked : isLiked // ignore: cast_nullable_to_non_nullable
as bool,likesCount: null == likesCount ? _self.likesCount : likesCount // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
