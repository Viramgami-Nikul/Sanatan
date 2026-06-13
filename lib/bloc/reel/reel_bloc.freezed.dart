// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reel_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReelEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReelEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReelEvent()';
}


}

/// @nodoc
class $ReelEventCopyWith<$Res>  {
$ReelEventCopyWith(ReelEvent _, $Res Function(ReelEvent) __);
}


/// Adds pattern-matching-related methods to [ReelEvent].
extension ReelEventPatterns on ReelEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FetchReels value)?  fetchReels,TResult Function( OnSelectVideo value)?  onSelectVideo,TResult Function( OnCaptionChanged value)?  onCaptionChanged,TResult Function( OnCategoryChanged value)?  onCategoryChanged,TResult Function( OnSubmitReel value)?  onSubmitReel,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FetchReels() when fetchReels != null:
return fetchReels(_that);case OnSelectVideo() when onSelectVideo != null:
return onSelectVideo(_that);case OnCaptionChanged() when onCaptionChanged != null:
return onCaptionChanged(_that);case OnCategoryChanged() when onCategoryChanged != null:
return onCategoryChanged(_that);case OnSubmitReel() when onSubmitReel != null:
return onSubmitReel(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FetchReels value)  fetchReels,required TResult Function( OnSelectVideo value)  onSelectVideo,required TResult Function( OnCaptionChanged value)  onCaptionChanged,required TResult Function( OnCategoryChanged value)  onCategoryChanged,required TResult Function( OnSubmitReel value)  onSubmitReel,}){
final _that = this;
switch (_that) {
case FetchReels():
return fetchReels(_that);case OnSelectVideo():
return onSelectVideo(_that);case OnCaptionChanged():
return onCaptionChanged(_that);case OnCategoryChanged():
return onCategoryChanged(_that);case OnSubmitReel():
return onSubmitReel(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FetchReels value)?  fetchReels,TResult? Function( OnSelectVideo value)?  onSelectVideo,TResult? Function( OnCaptionChanged value)?  onCaptionChanged,TResult? Function( OnCategoryChanged value)?  onCategoryChanged,TResult? Function( OnSubmitReel value)?  onSubmitReel,}){
final _that = this;
switch (_that) {
case FetchReels() when fetchReels != null:
return fetchReels(_that);case OnSelectVideo() when onSelectVideo != null:
return onSelectVideo(_that);case OnCaptionChanged() when onCaptionChanged != null:
return onCaptionChanged(_that);case OnCategoryChanged() when onCategoryChanged != null:
return onCategoryChanged(_that);case OnSubmitReel() when onSubmitReel != null:
return onSubmitReel(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  fetchReels,TResult Function( String videoPath)?  onSelectVideo,TResult Function( String caption)?  onCaptionChanged,TResult Function( String category)?  onCategoryChanged,TResult Function()?  onSubmitReel,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FetchReels() when fetchReels != null:
return fetchReels();case OnSelectVideo() when onSelectVideo != null:
return onSelectVideo(_that.videoPath);case OnCaptionChanged() when onCaptionChanged != null:
return onCaptionChanged(_that.caption);case OnCategoryChanged() when onCategoryChanged != null:
return onCategoryChanged(_that.category);case OnSubmitReel() when onSubmitReel != null:
return onSubmitReel();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  fetchReels,required TResult Function( String videoPath)  onSelectVideo,required TResult Function( String caption)  onCaptionChanged,required TResult Function( String category)  onCategoryChanged,required TResult Function()  onSubmitReel,}) {final _that = this;
switch (_that) {
case FetchReels():
return fetchReels();case OnSelectVideo():
return onSelectVideo(_that.videoPath);case OnCaptionChanged():
return onCaptionChanged(_that.caption);case OnCategoryChanged():
return onCategoryChanged(_that.category);case OnSubmitReel():
return onSubmitReel();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  fetchReels,TResult? Function( String videoPath)?  onSelectVideo,TResult? Function( String caption)?  onCaptionChanged,TResult? Function( String category)?  onCategoryChanged,TResult? Function()?  onSubmitReel,}) {final _that = this;
switch (_that) {
case FetchReels() when fetchReels != null:
return fetchReels();case OnSelectVideo() when onSelectVideo != null:
return onSelectVideo(_that.videoPath);case OnCaptionChanged() when onCaptionChanged != null:
return onCaptionChanged(_that.caption);case OnCategoryChanged() when onCategoryChanged != null:
return onCategoryChanged(_that.category);case OnSubmitReel() when onSubmitReel != null:
return onSubmitReel();case _:
  return null;

}
}

}

/// @nodoc


class FetchReels implements ReelEvent {
  const FetchReels();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FetchReels);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReelEvent.fetchReels()';
}


}




/// @nodoc


class OnSelectVideo implements ReelEvent {
  const OnSelectVideo({required this.videoPath});
  

 final  String videoPath;

/// Create a copy of ReelEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnSelectVideoCopyWith<OnSelectVideo> get copyWith => _$OnSelectVideoCopyWithImpl<OnSelectVideo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnSelectVideo&&(identical(other.videoPath, videoPath) || other.videoPath == videoPath));
}


@override
int get hashCode => Object.hash(runtimeType,videoPath);

@override
String toString() {
  return 'ReelEvent.onSelectVideo(videoPath: $videoPath)';
}


}

/// @nodoc
abstract mixin class $OnSelectVideoCopyWith<$Res> implements $ReelEventCopyWith<$Res> {
  factory $OnSelectVideoCopyWith(OnSelectVideo value, $Res Function(OnSelectVideo) _then) = _$OnSelectVideoCopyWithImpl;
@useResult
$Res call({
 String videoPath
});




}
/// @nodoc
class _$OnSelectVideoCopyWithImpl<$Res>
    implements $OnSelectVideoCopyWith<$Res> {
  _$OnSelectVideoCopyWithImpl(this._self, this._then);

  final OnSelectVideo _self;
  final $Res Function(OnSelectVideo) _then;

/// Create a copy of ReelEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? videoPath = null,}) {
  return _then(OnSelectVideo(
videoPath: null == videoPath ? _self.videoPath : videoPath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class OnCaptionChanged implements ReelEvent {
  const OnCaptionChanged({required this.caption});
  

 final  String caption;

/// Create a copy of ReelEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnCaptionChangedCopyWith<OnCaptionChanged> get copyWith => _$OnCaptionChangedCopyWithImpl<OnCaptionChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnCaptionChanged&&(identical(other.caption, caption) || other.caption == caption));
}


@override
int get hashCode => Object.hash(runtimeType,caption);

@override
String toString() {
  return 'ReelEvent.onCaptionChanged(caption: $caption)';
}


}

/// @nodoc
abstract mixin class $OnCaptionChangedCopyWith<$Res> implements $ReelEventCopyWith<$Res> {
  factory $OnCaptionChangedCopyWith(OnCaptionChanged value, $Res Function(OnCaptionChanged) _then) = _$OnCaptionChangedCopyWithImpl;
@useResult
$Res call({
 String caption
});




}
/// @nodoc
class _$OnCaptionChangedCopyWithImpl<$Res>
    implements $OnCaptionChangedCopyWith<$Res> {
  _$OnCaptionChangedCopyWithImpl(this._self, this._then);

  final OnCaptionChanged _self;
  final $Res Function(OnCaptionChanged) _then;

/// Create a copy of ReelEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? caption = null,}) {
  return _then(OnCaptionChanged(
caption: null == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class OnCategoryChanged implements ReelEvent {
  const OnCategoryChanged({required this.category});
  

 final  String category;

/// Create a copy of ReelEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnCategoryChangedCopyWith<OnCategoryChanged> get copyWith => _$OnCategoryChangedCopyWithImpl<OnCategoryChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnCategoryChanged&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode => Object.hash(runtimeType,category);

@override
String toString() {
  return 'ReelEvent.onCategoryChanged(category: $category)';
}


}

/// @nodoc
abstract mixin class $OnCategoryChangedCopyWith<$Res> implements $ReelEventCopyWith<$Res> {
  factory $OnCategoryChangedCopyWith(OnCategoryChanged value, $Res Function(OnCategoryChanged) _then) = _$OnCategoryChangedCopyWithImpl;
@useResult
$Res call({
 String category
});




}
/// @nodoc
class _$OnCategoryChangedCopyWithImpl<$Res>
    implements $OnCategoryChangedCopyWith<$Res> {
  _$OnCategoryChangedCopyWithImpl(this._self, this._then);

  final OnCategoryChanged _self;
  final $Res Function(OnCategoryChanged) _then;

/// Create a copy of ReelEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? category = null,}) {
  return _then(OnCategoryChanged(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class OnSubmitReel implements ReelEvent {
  const OnSubmitReel();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnSubmitReel);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReelEvent.onSubmitReel()';
}


}




/// @nodoc
mixin _$ReelState {

 CommonScreenState get status; List<ReelModel> get reels; String get localVideoPath; String get caption; String? get category; String? get errorMessage;
/// Create a copy of ReelState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReelStateCopyWith<ReelState> get copyWith => _$ReelStateCopyWithImpl<ReelState>(this as ReelState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReelState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.reels, reels)&&(identical(other.localVideoPath, localVideoPath) || other.localVideoPath == localVideoPath)&&(identical(other.caption, caption) || other.caption == caption)&&(identical(other.category, category) || other.category == category)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(reels),localVideoPath,caption,category,errorMessage);

@override
String toString() {
  return 'ReelState(status: $status, reels: $reels, localVideoPath: $localVideoPath, caption: $caption, category: $category, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ReelStateCopyWith<$Res>  {
  factory $ReelStateCopyWith(ReelState value, $Res Function(ReelState) _then) = _$ReelStateCopyWithImpl;
@useResult
$Res call({
 CommonScreenState status, List<ReelModel> reels, String localVideoPath, String caption, String? category, String? errorMessage
});




}
/// @nodoc
class _$ReelStateCopyWithImpl<$Res>
    implements $ReelStateCopyWith<$Res> {
  _$ReelStateCopyWithImpl(this._self, this._then);

  final ReelState _self;
  final $Res Function(ReelState) _then;

/// Create a copy of ReelState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? reels = null,Object? localVideoPath = null,Object? caption = null,Object? category = freezed,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CommonScreenState,reels: null == reels ? _self.reels : reels // ignore: cast_nullable_to_non_nullable
as List<ReelModel>,localVideoPath: null == localVideoPath ? _self.localVideoPath : localVideoPath // ignore: cast_nullable_to_non_nullable
as String,caption: null == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReelState].
extension ReelStatePatterns on ReelState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReelState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReelState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReelState value)  $default,){
final _that = this;
switch (_that) {
case _ReelState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReelState value)?  $default,){
final _that = this;
switch (_that) {
case _ReelState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CommonScreenState status,  List<ReelModel> reels,  String localVideoPath,  String caption,  String? category,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReelState() when $default != null:
return $default(_that.status,_that.reels,_that.localVideoPath,_that.caption,_that.category,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CommonScreenState status,  List<ReelModel> reels,  String localVideoPath,  String caption,  String? category,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _ReelState():
return $default(_that.status,_that.reels,_that.localVideoPath,_that.caption,_that.category,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CommonScreenState status,  List<ReelModel> reels,  String localVideoPath,  String caption,  String? category,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _ReelState() when $default != null:
return $default(_that.status,_that.reels,_that.localVideoPath,_that.caption,_that.category,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _ReelState implements ReelState {
   _ReelState({required this.status, required final  List<ReelModel> reels, required this.localVideoPath, required this.caption, this.category, this.errorMessage}): _reels = reels;
  

@override final  CommonScreenState status;
 final  List<ReelModel> _reels;
@override List<ReelModel> get reels {
  if (_reels is EqualUnmodifiableListView) return _reels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reels);
}

@override final  String localVideoPath;
@override final  String caption;
@override final  String? category;
@override final  String? errorMessage;

/// Create a copy of ReelState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReelStateCopyWith<_ReelState> get copyWith => __$ReelStateCopyWithImpl<_ReelState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReelState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._reels, _reels)&&(identical(other.localVideoPath, localVideoPath) || other.localVideoPath == localVideoPath)&&(identical(other.caption, caption) || other.caption == caption)&&(identical(other.category, category) || other.category == category)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_reels),localVideoPath,caption,category,errorMessage);

@override
String toString() {
  return 'ReelState(status: $status, reels: $reels, localVideoPath: $localVideoPath, caption: $caption, category: $category, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$ReelStateCopyWith<$Res> implements $ReelStateCopyWith<$Res> {
  factory _$ReelStateCopyWith(_ReelState value, $Res Function(_ReelState) _then) = __$ReelStateCopyWithImpl;
@override @useResult
$Res call({
 CommonScreenState status, List<ReelModel> reels, String localVideoPath, String caption, String? category, String? errorMessage
});




}
/// @nodoc
class __$ReelStateCopyWithImpl<$Res>
    implements _$ReelStateCopyWith<$Res> {
  __$ReelStateCopyWithImpl(this._self, this._then);

  final _ReelState _self;
  final $Res Function(_ReelState) _then;

/// Create a copy of ReelState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? reels = null,Object? localVideoPath = null,Object? caption = null,Object? category = freezed,Object? errorMessage = freezed,}) {
  return _then(_ReelState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CommonScreenState,reels: null == reels ? _self._reels : reels // ignore: cast_nullable_to_non_nullable
as List<ReelModel>,localVideoPath: null == localVideoPath ? _self.localVideoPath : localVideoPath // ignore: cast_nullable_to_non_nullable
as String,caption: null == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
