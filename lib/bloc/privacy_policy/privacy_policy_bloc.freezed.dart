// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'privacy_policy_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PrivacyPolicyEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrivacyPolicyEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PrivacyPolicyEvent()';
}


}

/// @nodoc
class $PrivacyPolicyEventCopyWith<$Res>  {
$PrivacyPolicyEventCopyWith(PrivacyPolicyEvent _, $Res Function(PrivacyPolicyEvent) __);
}


/// Adds pattern-matching-related methods to [PrivacyPolicyEvent].
extension PrivacyPolicyEventPatterns on PrivacyPolicyEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( Initial value)?  initial,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case Initial() when initial != null:
return initial(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( Initial value)  initial,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case Initial():
return initial(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( Initial value)?  initial,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case Initial() when initial != null:
return initial(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( String url)?  initial,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case Initial() when initial != null:
return initial(_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( String url)  initial,}) {final _that = this;
switch (_that) {
case _Started():
return started();case Initial():
return initial(_that.url);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( String url)?  initial,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case Initial() when initial != null:
return initial(_that.url);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements PrivacyPolicyEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PrivacyPolicyEvent.started()';
}


}




/// @nodoc


class Initial implements PrivacyPolicyEvent {
  const Initial({required this.url});
  

 final  String url;

/// Create a copy of PrivacyPolicyEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InitialCopyWith<Initial> get copyWith => _$InitialCopyWithImpl<Initial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial&&(identical(other.url, url) || other.url == url));
}


@override
int get hashCode => Object.hash(runtimeType,url);

@override
String toString() {
  return 'PrivacyPolicyEvent.initial(url: $url)';
}


}

/// @nodoc
abstract mixin class $InitialCopyWith<$Res> implements $PrivacyPolicyEventCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) _then) = _$InitialCopyWithImpl;
@useResult
$Res call({
 String url
});




}
/// @nodoc
class _$InitialCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(this._self, this._then);

  final Initial _self;
  final $Res Function(Initial) _then;

/// Create a copy of PrivacyPolicyEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? url = null,}) {
  return _then(Initial(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$PrivacyPolicyState {

 CommonScreenState get status; WebViewController get controller; String? get errorMessage;
/// Create a copy of PrivacyPolicyState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrivacyPolicyStateCopyWith<PrivacyPolicyState> get copyWith => _$PrivacyPolicyStateCopyWithImpl<PrivacyPolicyState>(this as PrivacyPolicyState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrivacyPolicyState&&(identical(other.status, status) || other.status == status)&&(identical(other.controller, controller) || other.controller == controller)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,controller,errorMessage);

@override
String toString() {
  return 'PrivacyPolicyState(status: $status, controller: $controller, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $PrivacyPolicyStateCopyWith<$Res>  {
  factory $PrivacyPolicyStateCopyWith(PrivacyPolicyState value, $Res Function(PrivacyPolicyState) _then) = _$PrivacyPolicyStateCopyWithImpl;
@useResult
$Res call({
 CommonScreenState status, WebViewController controller, String? errorMessage
});




}
/// @nodoc
class _$PrivacyPolicyStateCopyWithImpl<$Res>
    implements $PrivacyPolicyStateCopyWith<$Res> {
  _$PrivacyPolicyStateCopyWithImpl(this._self, this._then);

  final PrivacyPolicyState _self;
  final $Res Function(PrivacyPolicyState) _then;

/// Create a copy of PrivacyPolicyState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? controller = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CommonScreenState,controller: null == controller ? _self.controller : controller // ignore: cast_nullable_to_non_nullable
as WebViewController,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PrivacyPolicyState].
extension PrivacyPolicyStatePatterns on PrivacyPolicyState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PrivacyPolicyState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PrivacyPolicyState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PrivacyPolicyState value)  $default,){
final _that = this;
switch (_that) {
case _PrivacyPolicyState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PrivacyPolicyState value)?  $default,){
final _that = this;
switch (_that) {
case _PrivacyPolicyState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CommonScreenState status,  WebViewController controller,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PrivacyPolicyState() when $default != null:
return $default(_that.status,_that.controller,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CommonScreenState status,  WebViewController controller,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _PrivacyPolicyState():
return $default(_that.status,_that.controller,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CommonScreenState status,  WebViewController controller,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _PrivacyPolicyState() when $default != null:
return $default(_that.status,_that.controller,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _PrivacyPolicyState implements PrivacyPolicyState {
   _PrivacyPolicyState({required this.status, required this.controller, this.errorMessage});
  

@override final  CommonScreenState status;
@override final  WebViewController controller;
@override final  String? errorMessage;

/// Create a copy of PrivacyPolicyState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrivacyPolicyStateCopyWith<_PrivacyPolicyState> get copyWith => __$PrivacyPolicyStateCopyWithImpl<_PrivacyPolicyState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrivacyPolicyState&&(identical(other.status, status) || other.status == status)&&(identical(other.controller, controller) || other.controller == controller)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,controller,errorMessage);

@override
String toString() {
  return 'PrivacyPolicyState(status: $status, controller: $controller, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$PrivacyPolicyStateCopyWith<$Res> implements $PrivacyPolicyStateCopyWith<$Res> {
  factory _$PrivacyPolicyStateCopyWith(_PrivacyPolicyState value, $Res Function(_PrivacyPolicyState) _then) = __$PrivacyPolicyStateCopyWithImpl;
@override @useResult
$Res call({
 CommonScreenState status, WebViewController controller, String? errorMessage
});




}
/// @nodoc
class __$PrivacyPolicyStateCopyWithImpl<$Res>
    implements _$PrivacyPolicyStateCopyWith<$Res> {
  __$PrivacyPolicyStateCopyWithImpl(this._self, this._then);

  final _PrivacyPolicyState _self;
  final $Res Function(_PrivacyPolicyState) _then;

/// Create a copy of PrivacyPolicyState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? controller = null,Object? errorMessage = freezed,}) {
  return _then(_PrivacyPolicyState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CommonScreenState,controller: null == controller ? _self.controller : controller // ignore: cast_nullable_to_non_nullable
as WebViewController,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
