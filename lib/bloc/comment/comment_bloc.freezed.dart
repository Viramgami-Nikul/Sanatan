// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CommentEvent {

 String get postId;
/// Create a copy of CommentEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentEventCopyWith<CommentEvent> get copyWith => _$CommentEventCopyWithImpl<CommentEvent>(this as CommentEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentEvent&&(identical(other.postId, postId) || other.postId == postId));
}


@override
int get hashCode => Object.hash(runtimeType,postId);

@override
String toString() {
  return 'CommentEvent(postId: $postId)';
}


}

/// @nodoc
abstract mixin class $CommentEventCopyWith<$Res>  {
  factory $CommentEventCopyWith(CommentEvent value, $Res Function(CommentEvent) _then) = _$CommentEventCopyWithImpl;
@useResult
$Res call({
 String postId
});




}
/// @nodoc
class _$CommentEventCopyWithImpl<$Res>
    implements $CommentEventCopyWith<$Res> {
  _$CommentEventCopyWithImpl(this._self, this._then);

  final CommentEvent _self;
  final $Res Function(CommentEvent) _then;

/// Create a copy of CommentEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? postId = null,}) {
  return _then(_self.copyWith(
postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CommentEvent].
extension CommentEventPatterns on CommentEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( OnLoadComments value)?  onLoadComments,TResult Function( OnAddComment value)?  onAddComment,required TResult orElse(),}){
final _that = this;
switch (_that) {
case OnLoadComments() when onLoadComments != null:
return onLoadComments(_that);case OnAddComment() when onAddComment != null:
return onAddComment(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( OnLoadComments value)  onLoadComments,required TResult Function( OnAddComment value)  onAddComment,}){
final _that = this;
switch (_that) {
case OnLoadComments():
return onLoadComments(_that);case OnAddComment():
return onAddComment(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( OnLoadComments value)?  onLoadComments,TResult? Function( OnAddComment value)?  onAddComment,}){
final _that = this;
switch (_that) {
case OnLoadComments() when onLoadComments != null:
return onLoadComments(_that);case OnAddComment() when onAddComment != null:
return onAddComment(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String postId)?  onLoadComments,TResult Function( String postId,  String commentText,  String username,  String userAvatarUrl)?  onAddComment,required TResult orElse(),}) {final _that = this;
switch (_that) {
case OnLoadComments() when onLoadComments != null:
return onLoadComments(_that.postId);case OnAddComment() when onAddComment != null:
return onAddComment(_that.postId,_that.commentText,_that.username,_that.userAvatarUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String postId)  onLoadComments,required TResult Function( String postId,  String commentText,  String username,  String userAvatarUrl)  onAddComment,}) {final _that = this;
switch (_that) {
case OnLoadComments():
return onLoadComments(_that.postId);case OnAddComment():
return onAddComment(_that.postId,_that.commentText,_that.username,_that.userAvatarUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String postId)?  onLoadComments,TResult? Function( String postId,  String commentText,  String username,  String userAvatarUrl)?  onAddComment,}) {final _that = this;
switch (_that) {
case OnLoadComments() when onLoadComments != null:
return onLoadComments(_that.postId);case OnAddComment() when onAddComment != null:
return onAddComment(_that.postId,_that.commentText,_that.username,_that.userAvatarUrl);case _:
  return null;

}
}

}

/// @nodoc


class OnLoadComments implements CommentEvent {
  const OnLoadComments({required this.postId});
  

@override final  String postId;

/// Create a copy of CommentEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnLoadCommentsCopyWith<OnLoadComments> get copyWith => _$OnLoadCommentsCopyWithImpl<OnLoadComments>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnLoadComments&&(identical(other.postId, postId) || other.postId == postId));
}


@override
int get hashCode => Object.hash(runtimeType,postId);

@override
String toString() {
  return 'CommentEvent.onLoadComments(postId: $postId)';
}


}

/// @nodoc
abstract mixin class $OnLoadCommentsCopyWith<$Res> implements $CommentEventCopyWith<$Res> {
  factory $OnLoadCommentsCopyWith(OnLoadComments value, $Res Function(OnLoadComments) _then) = _$OnLoadCommentsCopyWithImpl;
@override @useResult
$Res call({
 String postId
});




}
/// @nodoc
class _$OnLoadCommentsCopyWithImpl<$Res>
    implements $OnLoadCommentsCopyWith<$Res> {
  _$OnLoadCommentsCopyWithImpl(this._self, this._then);

  final OnLoadComments _self;
  final $Res Function(OnLoadComments) _then;

/// Create a copy of CommentEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? postId = null,}) {
  return _then(OnLoadComments(
postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class OnAddComment implements CommentEvent {
  const OnAddComment({required this.postId, required this.commentText, required this.username, required this.userAvatarUrl});
  

@override final  String postId;
 final  String commentText;
 final  String username;
 final  String userAvatarUrl;

/// Create a copy of CommentEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnAddCommentCopyWith<OnAddComment> get copyWith => _$OnAddCommentCopyWithImpl<OnAddComment>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnAddComment&&(identical(other.postId, postId) || other.postId == postId)&&(identical(other.commentText, commentText) || other.commentText == commentText)&&(identical(other.username, username) || other.username == username)&&(identical(other.userAvatarUrl, userAvatarUrl) || other.userAvatarUrl == userAvatarUrl));
}


@override
int get hashCode => Object.hash(runtimeType,postId,commentText,username,userAvatarUrl);

@override
String toString() {
  return 'CommentEvent.onAddComment(postId: $postId, commentText: $commentText, username: $username, userAvatarUrl: $userAvatarUrl)';
}


}

/// @nodoc
abstract mixin class $OnAddCommentCopyWith<$Res> implements $CommentEventCopyWith<$Res> {
  factory $OnAddCommentCopyWith(OnAddComment value, $Res Function(OnAddComment) _then) = _$OnAddCommentCopyWithImpl;
@override @useResult
$Res call({
 String postId, String commentText, String username, String userAvatarUrl
});




}
/// @nodoc
class _$OnAddCommentCopyWithImpl<$Res>
    implements $OnAddCommentCopyWith<$Res> {
  _$OnAddCommentCopyWithImpl(this._self, this._then);

  final OnAddComment _self;
  final $Res Function(OnAddComment) _then;

/// Create a copy of CommentEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? postId = null,Object? commentText = null,Object? username = null,Object? userAvatarUrl = null,}) {
  return _then(OnAddComment(
postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String,commentText: null == commentText ? _self.commentText : commentText // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,userAvatarUrl: null == userAvatarUrl ? _self.userAvatarUrl : userAvatarUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$CommentState {

 CommonScreenState get status; List<CommentModel> get comments; String? get errorMessage;
/// Create a copy of CommentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentStateCopyWith<CommentState> get copyWith => _$CommentStateCopyWithImpl<CommentState>(this as CommentState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.comments, comments)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(comments),errorMessage);

@override
String toString() {
  return 'CommentState(status: $status, comments: $comments, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $CommentStateCopyWith<$Res>  {
  factory $CommentStateCopyWith(CommentState value, $Res Function(CommentState) _then) = _$CommentStateCopyWithImpl;
@useResult
$Res call({
 CommonScreenState status, List<CommentModel> comments, String? errorMessage
});




}
/// @nodoc
class _$CommentStateCopyWithImpl<$Res>
    implements $CommentStateCopyWith<$Res> {
  _$CommentStateCopyWithImpl(this._self, this._then);

  final CommentState _self;
  final $Res Function(CommentState) _then;

/// Create a copy of CommentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? comments = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CommonScreenState,comments: null == comments ? _self.comments : comments // ignore: cast_nullable_to_non_nullable
as List<CommentModel>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CommentState].
extension CommentStatePatterns on CommentState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommentState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommentState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommentState value)  $default,){
final _that = this;
switch (_that) {
case _CommentState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommentState value)?  $default,){
final _that = this;
switch (_that) {
case _CommentState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CommonScreenState status,  List<CommentModel> comments,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommentState() when $default != null:
return $default(_that.status,_that.comments,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CommonScreenState status,  List<CommentModel> comments,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _CommentState():
return $default(_that.status,_that.comments,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CommonScreenState status,  List<CommentModel> comments,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _CommentState() when $default != null:
return $default(_that.status,_that.comments,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _CommentState implements CommentState {
   _CommentState({required this.status, required final  List<CommentModel> comments, this.errorMessage}): _comments = comments;
  

@override final  CommonScreenState status;
 final  List<CommentModel> _comments;
@override List<CommentModel> get comments {
  if (_comments is EqualUnmodifiableListView) return _comments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_comments);
}

@override final  String? errorMessage;

/// Create a copy of CommentState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommentStateCopyWith<_CommentState> get copyWith => __$CommentStateCopyWithImpl<_CommentState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommentState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._comments, _comments)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_comments),errorMessage);

@override
String toString() {
  return 'CommentState(status: $status, comments: $comments, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$CommentStateCopyWith<$Res> implements $CommentStateCopyWith<$Res> {
  factory _$CommentStateCopyWith(_CommentState value, $Res Function(_CommentState) _then) = __$CommentStateCopyWithImpl;
@override @useResult
$Res call({
 CommonScreenState status, List<CommentModel> comments, String? errorMessage
});




}
/// @nodoc
class __$CommentStateCopyWithImpl<$Res>
    implements _$CommentStateCopyWith<$Res> {
  __$CommentStateCopyWithImpl(this._self, this._then);

  final _CommentState _self;
  final $Res Function(_CommentState) _then;

/// Create a copy of CommentState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? comments = null,Object? errorMessage = freezed,}) {
  return _then(_CommentState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CommonScreenState,comments: null == comments ? _self._comments : comments // ignore: cast_nullable_to_non_nullable
as List<CommentModel>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
