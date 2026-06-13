// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reel_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReelModel {

 String get reelId; String get uid; String get videoUrl; String get caption; int get likesCount; int get commentsCount; dynamic get createdAt; String? get category;
/// Create a copy of ReelModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReelModelCopyWith<ReelModel> get copyWith => _$ReelModelCopyWithImpl<ReelModel>(this as ReelModel, _$identity);

  /// Serializes this ReelModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReelModel&&(identical(other.reelId, reelId) || other.reelId == reelId)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&(identical(other.caption, caption) || other.caption == caption)&&(identical(other.likesCount, likesCount) || other.likesCount == likesCount)&&(identical(other.commentsCount, commentsCount) || other.commentsCount == commentsCount)&&const DeepCollectionEquality().equals(other.createdAt, createdAt)&&(identical(other.category, category) || other.category == category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,reelId,uid,videoUrl,caption,likesCount,commentsCount,const DeepCollectionEquality().hash(createdAt),category);

@override
String toString() {
  return 'ReelModel(reelId: $reelId, uid: $uid, videoUrl: $videoUrl, caption: $caption, likesCount: $likesCount, commentsCount: $commentsCount, createdAt: $createdAt, category: $category)';
}


}

/// @nodoc
abstract mixin class $ReelModelCopyWith<$Res>  {
  factory $ReelModelCopyWith(ReelModel value, $Res Function(ReelModel) _then) = _$ReelModelCopyWithImpl;
@useResult
$Res call({
 String reelId, String uid, String videoUrl, String caption, int likesCount, int commentsCount, dynamic createdAt, String? category
});




}
/// @nodoc
class _$ReelModelCopyWithImpl<$Res>
    implements $ReelModelCopyWith<$Res> {
  _$ReelModelCopyWithImpl(this._self, this._then);

  final ReelModel _self;
  final $Res Function(ReelModel) _then;

/// Create a copy of ReelModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reelId = null,Object? uid = null,Object? videoUrl = null,Object? caption = null,Object? likesCount = null,Object? commentsCount = null,Object? createdAt = freezed,Object? category = freezed,}) {
  return _then(_self.copyWith(
reelId: null == reelId ? _self.reelId : reelId // ignore: cast_nullable_to_non_nullable
as String,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,videoUrl: null == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String,caption: null == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String,likesCount: null == likesCount ? _self.likesCount : likesCount // ignore: cast_nullable_to_non_nullable
as int,commentsCount: null == commentsCount ? _self.commentsCount : commentsCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as dynamic,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReelModel].
extension ReelModelPatterns on ReelModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReelModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReelModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReelModel value)  $default,){
final _that = this;
switch (_that) {
case _ReelModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReelModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReelModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String reelId,  String uid,  String videoUrl,  String caption,  int likesCount,  int commentsCount,  dynamic createdAt,  String? category)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReelModel() when $default != null:
return $default(_that.reelId,_that.uid,_that.videoUrl,_that.caption,_that.likesCount,_that.commentsCount,_that.createdAt,_that.category);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String reelId,  String uid,  String videoUrl,  String caption,  int likesCount,  int commentsCount,  dynamic createdAt,  String? category)  $default,) {final _that = this;
switch (_that) {
case _ReelModel():
return $default(_that.reelId,_that.uid,_that.videoUrl,_that.caption,_that.likesCount,_that.commentsCount,_that.createdAt,_that.category);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String reelId,  String uid,  String videoUrl,  String caption,  int likesCount,  int commentsCount,  dynamic createdAt,  String? category)?  $default,) {final _that = this;
switch (_that) {
case _ReelModel() when $default != null:
return $default(_that.reelId,_that.uid,_that.videoUrl,_that.caption,_that.likesCount,_that.commentsCount,_that.createdAt,_that.category);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReelModel implements ReelModel {
  const _ReelModel({required this.reelId, required this.uid, required this.videoUrl, required this.caption, required this.likesCount, required this.commentsCount, required this.createdAt, this.category});
  factory _ReelModel.fromJson(Map<String, dynamic> json) => _$ReelModelFromJson(json);

@override final  String reelId;
@override final  String uid;
@override final  String videoUrl;
@override final  String caption;
@override final  int likesCount;
@override final  int commentsCount;
@override final  dynamic createdAt;
@override final  String? category;

/// Create a copy of ReelModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReelModelCopyWith<_ReelModel> get copyWith => __$ReelModelCopyWithImpl<_ReelModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReelModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReelModel&&(identical(other.reelId, reelId) || other.reelId == reelId)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&(identical(other.caption, caption) || other.caption == caption)&&(identical(other.likesCount, likesCount) || other.likesCount == likesCount)&&(identical(other.commentsCount, commentsCount) || other.commentsCount == commentsCount)&&const DeepCollectionEquality().equals(other.createdAt, createdAt)&&(identical(other.category, category) || other.category == category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,reelId,uid,videoUrl,caption,likesCount,commentsCount,const DeepCollectionEquality().hash(createdAt),category);

@override
String toString() {
  return 'ReelModel(reelId: $reelId, uid: $uid, videoUrl: $videoUrl, caption: $caption, likesCount: $likesCount, commentsCount: $commentsCount, createdAt: $createdAt, category: $category)';
}


}

/// @nodoc
abstract mixin class _$ReelModelCopyWith<$Res> implements $ReelModelCopyWith<$Res> {
  factory _$ReelModelCopyWith(_ReelModel value, $Res Function(_ReelModel) _then) = __$ReelModelCopyWithImpl;
@override @useResult
$Res call({
 String reelId, String uid, String videoUrl, String caption, int likesCount, int commentsCount, dynamic createdAt, String? category
});




}
/// @nodoc
class __$ReelModelCopyWithImpl<$Res>
    implements _$ReelModelCopyWith<$Res> {
  __$ReelModelCopyWithImpl(this._self, this._then);

  final _ReelModel _self;
  final $Res Function(_ReelModel) _then;

/// Create a copy of ReelModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reelId = null,Object? uid = null,Object? videoUrl = null,Object? caption = null,Object? likesCount = null,Object? commentsCount = null,Object? createdAt = freezed,Object? category = freezed,}) {
  return _then(_ReelModel(
reelId: null == reelId ? _self.reelId : reelId // ignore: cast_nullable_to_non_nullable
as String,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,videoUrl: null == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String,caption: null == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String,likesCount: null == likesCount ? _self.likesCount : likesCount // ignore: cast_nullable_to_non_nullable
as int,commentsCount: null == commentsCount ? _self.commentsCount : commentsCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as dynamic,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
