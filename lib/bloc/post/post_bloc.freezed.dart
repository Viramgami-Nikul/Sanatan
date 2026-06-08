// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PostEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PostEvent()';
}


}

/// @nodoc
class $PostEventCopyWith<$Res>  {
$PostEventCopyWith(PostEvent _, $Res Function(PostEvent) __);
}


/// Adds pattern-matching-related methods to [PostEvent].
extension PostEventPatterns on PostEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( OnSelectImage value)?  onSelectImage,TResult Function( OnCaptionChanged value)?  onCaptionChanged,TResult Function( OnCategoryChanged value)?  onCategoryChanged,TResult Function( OnSubmitPost value)?  onSubmitPost,required TResult orElse(),}){
final _that = this;
switch (_that) {
case OnSelectImage() when onSelectImage != null:
return onSelectImage(_that);case OnCaptionChanged() when onCaptionChanged != null:
return onCaptionChanged(_that);case OnCategoryChanged() when onCategoryChanged != null:
return onCategoryChanged(_that);case OnSubmitPost() when onSubmitPost != null:
return onSubmitPost(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( OnSelectImage value)  onSelectImage,required TResult Function( OnCaptionChanged value)  onCaptionChanged,required TResult Function( OnCategoryChanged value)  onCategoryChanged,required TResult Function( OnSubmitPost value)  onSubmitPost,}){
final _that = this;
switch (_that) {
case OnSelectImage():
return onSelectImage(_that);case OnCaptionChanged():
return onCaptionChanged(_that);case OnCategoryChanged():
return onCategoryChanged(_that);case OnSubmitPost():
return onSubmitPost(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( OnSelectImage value)?  onSelectImage,TResult? Function( OnCaptionChanged value)?  onCaptionChanged,TResult? Function( OnCategoryChanged value)?  onCategoryChanged,TResult? Function( OnSubmitPost value)?  onSubmitPost,}){
final _that = this;
switch (_that) {
case OnSelectImage() when onSelectImage != null:
return onSelectImage(_that);case OnCaptionChanged() when onCaptionChanged != null:
return onCaptionChanged(_that);case OnCategoryChanged() when onCategoryChanged != null:
return onCategoryChanged(_that);case OnSubmitPost() when onSubmitPost != null:
return onSubmitPost(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String imagePath)?  onSelectImage,TResult Function( String caption)?  onCaptionChanged,TResult Function( String category)?  onCategoryChanged,TResult Function()?  onSubmitPost,required TResult orElse(),}) {final _that = this;
switch (_that) {
case OnSelectImage() when onSelectImage != null:
return onSelectImage(_that.imagePath);case OnCaptionChanged() when onCaptionChanged != null:
return onCaptionChanged(_that.caption);case OnCategoryChanged() when onCategoryChanged != null:
return onCategoryChanged(_that.category);case OnSubmitPost() when onSubmitPost != null:
return onSubmitPost();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String imagePath)  onSelectImage,required TResult Function( String caption)  onCaptionChanged,required TResult Function( String category)  onCategoryChanged,required TResult Function()  onSubmitPost,}) {final _that = this;
switch (_that) {
case OnSelectImage():
return onSelectImage(_that.imagePath);case OnCaptionChanged():
return onCaptionChanged(_that.caption);case OnCategoryChanged():
return onCategoryChanged(_that.category);case OnSubmitPost():
return onSubmitPost();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String imagePath)?  onSelectImage,TResult? Function( String caption)?  onCaptionChanged,TResult? Function( String category)?  onCategoryChanged,TResult? Function()?  onSubmitPost,}) {final _that = this;
switch (_that) {
case OnSelectImage() when onSelectImage != null:
return onSelectImage(_that.imagePath);case OnCaptionChanged() when onCaptionChanged != null:
return onCaptionChanged(_that.caption);case OnCategoryChanged() when onCategoryChanged != null:
return onCategoryChanged(_that.category);case OnSubmitPost() when onSubmitPost != null:
return onSubmitPost();case _:
  return null;

}
}

}

/// @nodoc


class OnSelectImage implements PostEvent {
  const OnSelectImage({required this.imagePath});
  

 final  String imagePath;

/// Create a copy of PostEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnSelectImageCopyWith<OnSelectImage> get copyWith => _$OnSelectImageCopyWithImpl<OnSelectImage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnSelectImage&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath));
}


@override
int get hashCode => Object.hash(runtimeType,imagePath);

@override
String toString() {
  return 'PostEvent.onSelectImage(imagePath: $imagePath)';
}


}

/// @nodoc
abstract mixin class $OnSelectImageCopyWith<$Res> implements $PostEventCopyWith<$Res> {
  factory $OnSelectImageCopyWith(OnSelectImage value, $Res Function(OnSelectImage) _then) = _$OnSelectImageCopyWithImpl;
@useResult
$Res call({
 String imagePath
});




}
/// @nodoc
class _$OnSelectImageCopyWithImpl<$Res>
    implements $OnSelectImageCopyWith<$Res> {
  _$OnSelectImageCopyWithImpl(this._self, this._then);

  final OnSelectImage _self;
  final $Res Function(OnSelectImage) _then;

/// Create a copy of PostEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? imagePath = null,}) {
  return _then(OnSelectImage(
imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class OnCaptionChanged implements PostEvent {
  const OnCaptionChanged({required this.caption});
  

 final  String caption;

/// Create a copy of PostEvent
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
  return 'PostEvent.onCaptionChanged(caption: $caption)';
}


}

/// @nodoc
abstract mixin class $OnCaptionChangedCopyWith<$Res> implements $PostEventCopyWith<$Res> {
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

/// Create a copy of PostEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? caption = null,}) {
  return _then(OnCaptionChanged(
caption: null == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class OnCategoryChanged implements PostEvent {
  const OnCategoryChanged({required this.category});
  

 final  String category;

/// Create a copy of PostEvent
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
  return 'PostEvent.onCategoryChanged(category: $category)';
}


}

/// @nodoc
abstract mixin class $OnCategoryChangedCopyWith<$Res> implements $PostEventCopyWith<$Res> {
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

/// Create a copy of PostEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? category = null,}) {
  return _then(OnCategoryChanged(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class OnSubmitPost implements PostEvent {
  const OnSubmitPost();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnSubmitPost);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PostEvent.onSubmitPost()';
}


}




/// @nodoc
mixin _$PostState {

 CommonScreenState get status; String get imagePath; String get caption; String? get category; String? get errorMessage;
/// Create a copy of PostState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostStateCopyWith<PostState> get copyWith => _$PostStateCopyWithImpl<PostState>(this as PostState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostState&&(identical(other.status, status) || other.status == status)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.caption, caption) || other.caption == caption)&&(identical(other.category, category) || other.category == category)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,imagePath,caption,category,errorMessage);

@override
String toString() {
  return 'PostState(status: $status, imagePath: $imagePath, caption: $caption, category: $category, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $PostStateCopyWith<$Res>  {
  factory $PostStateCopyWith(PostState value, $Res Function(PostState) _then) = _$PostStateCopyWithImpl;
@useResult
$Res call({
 CommonScreenState status, String imagePath, String caption, String? category, String? errorMessage
});




}
/// @nodoc
class _$PostStateCopyWithImpl<$Res>
    implements $PostStateCopyWith<$Res> {
  _$PostStateCopyWithImpl(this._self, this._then);

  final PostState _self;
  final $Res Function(PostState) _then;

/// Create a copy of PostState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? imagePath = null,Object? caption = null,Object? category = freezed,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CommonScreenState,imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,caption: null == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PostState].
extension PostStatePatterns on PostState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PostState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PostState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PostState value)  $default,){
final _that = this;
switch (_that) {
case _PostState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PostState value)?  $default,){
final _that = this;
switch (_that) {
case _PostState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CommonScreenState status,  String imagePath,  String caption,  String? category,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PostState() when $default != null:
return $default(_that.status,_that.imagePath,_that.caption,_that.category,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CommonScreenState status,  String imagePath,  String caption,  String? category,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _PostState():
return $default(_that.status,_that.imagePath,_that.caption,_that.category,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CommonScreenState status,  String imagePath,  String caption,  String? category,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _PostState() when $default != null:
return $default(_that.status,_that.imagePath,_that.caption,_that.category,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _PostState implements PostState {
   _PostState({required this.status, required this.imagePath, required this.caption, this.category, this.errorMessage});
  

@override final  CommonScreenState status;
@override final  String imagePath;
@override final  String caption;
@override final  String? category;
@override final  String? errorMessage;

/// Create a copy of PostState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostStateCopyWith<_PostState> get copyWith => __$PostStateCopyWithImpl<_PostState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostState&&(identical(other.status, status) || other.status == status)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.caption, caption) || other.caption == caption)&&(identical(other.category, category) || other.category == category)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,imagePath,caption,category,errorMessage);

@override
String toString() {
  return 'PostState(status: $status, imagePath: $imagePath, caption: $caption, category: $category, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$PostStateCopyWith<$Res> implements $PostStateCopyWith<$Res> {
  factory _$PostStateCopyWith(_PostState value, $Res Function(_PostState) _then) = __$PostStateCopyWithImpl;
@override @useResult
$Res call({
 CommonScreenState status, String imagePath, String caption, String? category, String? errorMessage
});




}
/// @nodoc
class __$PostStateCopyWithImpl<$Res>
    implements _$PostStateCopyWith<$Res> {
  __$PostStateCopyWithImpl(this._self, this._then);

  final _PostState _self;
  final $Res Function(_PostState) _then;

/// Create a copy of PostState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? imagePath = null,Object? caption = null,Object? category = freezed,Object? errorMessage = freezed,}) {
  return _then(_PostState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CommonScreenState,imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,caption: null == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
