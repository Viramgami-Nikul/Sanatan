// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setting_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SettingEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SettingEvent()';
}


}

/// @nodoc
class $SettingEventCopyWith<$Res>  {
$SettingEventCopyWith(SettingEvent _, $Res Function(SettingEvent) __);
}


/// Adds pattern-matching-related methods to [SettingEvent].
extension SettingEventPatterns on SettingEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( OnLoadSettings value)?  onLoadSettings,TResult Function( OnToggleNotifications value)?  onToggleNotifications,TResult Function( OnToggleDarkMode value)?  onToggleDarkMode,TResult Function( OnChangeLanguage value)?  onChangeLanguage,TResult Function( OnUpdateFollowerRequests value)?  onUpdateFollowerRequests,TResult Function( OnUpdateAcceptedFollowRequests value)?  onUpdateAcceptedFollowRequests,TResult Function( OnUpdateAccountSuggestions value)?  onUpdateAccountSuggestions,TResult Function( OnUpdateMentionsInBio value)?  onUpdateMentionsInBio,required TResult orElse(),}){
final _that = this;
switch (_that) {
case OnLoadSettings() when onLoadSettings != null:
return onLoadSettings(_that);case OnToggleNotifications() when onToggleNotifications != null:
return onToggleNotifications(_that);case OnToggleDarkMode() when onToggleDarkMode != null:
return onToggleDarkMode(_that);case OnChangeLanguage() when onChangeLanguage != null:
return onChangeLanguage(_that);case OnUpdateFollowerRequests() when onUpdateFollowerRequests != null:
return onUpdateFollowerRequests(_that);case OnUpdateAcceptedFollowRequests() when onUpdateAcceptedFollowRequests != null:
return onUpdateAcceptedFollowRequests(_that);case OnUpdateAccountSuggestions() when onUpdateAccountSuggestions != null:
return onUpdateAccountSuggestions(_that);case OnUpdateMentionsInBio() when onUpdateMentionsInBio != null:
return onUpdateMentionsInBio(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( OnLoadSettings value)  onLoadSettings,required TResult Function( OnToggleNotifications value)  onToggleNotifications,required TResult Function( OnToggleDarkMode value)  onToggleDarkMode,required TResult Function( OnChangeLanguage value)  onChangeLanguage,required TResult Function( OnUpdateFollowerRequests value)  onUpdateFollowerRequests,required TResult Function( OnUpdateAcceptedFollowRequests value)  onUpdateAcceptedFollowRequests,required TResult Function( OnUpdateAccountSuggestions value)  onUpdateAccountSuggestions,required TResult Function( OnUpdateMentionsInBio value)  onUpdateMentionsInBio,}){
final _that = this;
switch (_that) {
case OnLoadSettings():
return onLoadSettings(_that);case OnToggleNotifications():
return onToggleNotifications(_that);case OnToggleDarkMode():
return onToggleDarkMode(_that);case OnChangeLanguage():
return onChangeLanguage(_that);case OnUpdateFollowerRequests():
return onUpdateFollowerRequests(_that);case OnUpdateAcceptedFollowRequests():
return onUpdateAcceptedFollowRequests(_that);case OnUpdateAccountSuggestions():
return onUpdateAccountSuggestions(_that);case OnUpdateMentionsInBio():
return onUpdateMentionsInBio(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( OnLoadSettings value)?  onLoadSettings,TResult? Function( OnToggleNotifications value)?  onToggleNotifications,TResult? Function( OnToggleDarkMode value)?  onToggleDarkMode,TResult? Function( OnChangeLanguage value)?  onChangeLanguage,TResult? Function( OnUpdateFollowerRequests value)?  onUpdateFollowerRequests,TResult? Function( OnUpdateAcceptedFollowRequests value)?  onUpdateAcceptedFollowRequests,TResult? Function( OnUpdateAccountSuggestions value)?  onUpdateAccountSuggestions,TResult? Function( OnUpdateMentionsInBio value)?  onUpdateMentionsInBio,}){
final _that = this;
switch (_that) {
case OnLoadSettings() when onLoadSettings != null:
return onLoadSettings(_that);case OnToggleNotifications() when onToggleNotifications != null:
return onToggleNotifications(_that);case OnToggleDarkMode() when onToggleDarkMode != null:
return onToggleDarkMode(_that);case OnChangeLanguage() when onChangeLanguage != null:
return onChangeLanguage(_that);case OnUpdateFollowerRequests() when onUpdateFollowerRequests != null:
return onUpdateFollowerRequests(_that);case OnUpdateAcceptedFollowRequests() when onUpdateAcceptedFollowRequests != null:
return onUpdateAcceptedFollowRequests(_that);case OnUpdateAccountSuggestions() when onUpdateAccountSuggestions != null:
return onUpdateAccountSuggestions(_that);case OnUpdateMentionsInBio() when onUpdateMentionsInBio != null:
return onUpdateMentionsInBio(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String userId)?  onLoadSettings,TResult Function( bool isEnabled)?  onToggleNotifications,TResult Function( bool isEnabled)?  onToggleDarkMode,TResult Function( String language)?  onChangeLanguage,TResult Function( String value)?  onUpdateFollowerRequests,TResult Function( String value)?  onUpdateAcceptedFollowRequests,TResult Function( String value)?  onUpdateAccountSuggestions,TResult Function( String value)?  onUpdateMentionsInBio,required TResult orElse(),}) {final _that = this;
switch (_that) {
case OnLoadSettings() when onLoadSettings != null:
return onLoadSettings(_that.userId);case OnToggleNotifications() when onToggleNotifications != null:
return onToggleNotifications(_that.isEnabled);case OnToggleDarkMode() when onToggleDarkMode != null:
return onToggleDarkMode(_that.isEnabled);case OnChangeLanguage() when onChangeLanguage != null:
return onChangeLanguage(_that.language);case OnUpdateFollowerRequests() when onUpdateFollowerRequests != null:
return onUpdateFollowerRequests(_that.value);case OnUpdateAcceptedFollowRequests() when onUpdateAcceptedFollowRequests != null:
return onUpdateAcceptedFollowRequests(_that.value);case OnUpdateAccountSuggestions() when onUpdateAccountSuggestions != null:
return onUpdateAccountSuggestions(_that.value);case OnUpdateMentionsInBio() when onUpdateMentionsInBio != null:
return onUpdateMentionsInBio(_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String userId)  onLoadSettings,required TResult Function( bool isEnabled)  onToggleNotifications,required TResult Function( bool isEnabled)  onToggleDarkMode,required TResult Function( String language)  onChangeLanguage,required TResult Function( String value)  onUpdateFollowerRequests,required TResult Function( String value)  onUpdateAcceptedFollowRequests,required TResult Function( String value)  onUpdateAccountSuggestions,required TResult Function( String value)  onUpdateMentionsInBio,}) {final _that = this;
switch (_that) {
case OnLoadSettings():
return onLoadSettings(_that.userId);case OnToggleNotifications():
return onToggleNotifications(_that.isEnabled);case OnToggleDarkMode():
return onToggleDarkMode(_that.isEnabled);case OnChangeLanguage():
return onChangeLanguage(_that.language);case OnUpdateFollowerRequests():
return onUpdateFollowerRequests(_that.value);case OnUpdateAcceptedFollowRequests():
return onUpdateAcceptedFollowRequests(_that.value);case OnUpdateAccountSuggestions():
return onUpdateAccountSuggestions(_that.value);case OnUpdateMentionsInBio():
return onUpdateMentionsInBio(_that.value);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String userId)?  onLoadSettings,TResult? Function( bool isEnabled)?  onToggleNotifications,TResult? Function( bool isEnabled)?  onToggleDarkMode,TResult? Function( String language)?  onChangeLanguage,TResult? Function( String value)?  onUpdateFollowerRequests,TResult? Function( String value)?  onUpdateAcceptedFollowRequests,TResult? Function( String value)?  onUpdateAccountSuggestions,TResult? Function( String value)?  onUpdateMentionsInBio,}) {final _that = this;
switch (_that) {
case OnLoadSettings() when onLoadSettings != null:
return onLoadSettings(_that.userId);case OnToggleNotifications() when onToggleNotifications != null:
return onToggleNotifications(_that.isEnabled);case OnToggleDarkMode() when onToggleDarkMode != null:
return onToggleDarkMode(_that.isEnabled);case OnChangeLanguage() when onChangeLanguage != null:
return onChangeLanguage(_that.language);case OnUpdateFollowerRequests() when onUpdateFollowerRequests != null:
return onUpdateFollowerRequests(_that.value);case OnUpdateAcceptedFollowRequests() when onUpdateAcceptedFollowRequests != null:
return onUpdateAcceptedFollowRequests(_that.value);case OnUpdateAccountSuggestions() when onUpdateAccountSuggestions != null:
return onUpdateAccountSuggestions(_that.value);case OnUpdateMentionsInBio() when onUpdateMentionsInBio != null:
return onUpdateMentionsInBio(_that.value);case _:
  return null;

}
}

}

/// @nodoc


class OnLoadSettings implements SettingEvent {
  const OnLoadSettings({required this.userId});
  

 final  String userId;

/// Create a copy of SettingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnLoadSettingsCopyWith<OnLoadSettings> get copyWith => _$OnLoadSettingsCopyWithImpl<OnLoadSettings>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnLoadSettings&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,userId);

@override
String toString() {
  return 'SettingEvent.onLoadSettings(userId: $userId)';
}


}

/// @nodoc
abstract mixin class $OnLoadSettingsCopyWith<$Res> implements $SettingEventCopyWith<$Res> {
  factory $OnLoadSettingsCopyWith(OnLoadSettings value, $Res Function(OnLoadSettings) _then) = _$OnLoadSettingsCopyWithImpl;
@useResult
$Res call({
 String userId
});




}
/// @nodoc
class _$OnLoadSettingsCopyWithImpl<$Res>
    implements $OnLoadSettingsCopyWith<$Res> {
  _$OnLoadSettingsCopyWithImpl(this._self, this._then);

  final OnLoadSettings _self;
  final $Res Function(OnLoadSettings) _then;

/// Create a copy of SettingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userId = null,}) {
  return _then(OnLoadSettings(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class OnToggleNotifications implements SettingEvent {
  const OnToggleNotifications({required this.isEnabled});
  

 final  bool isEnabled;

/// Create a copy of SettingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnToggleNotificationsCopyWith<OnToggleNotifications> get copyWith => _$OnToggleNotificationsCopyWithImpl<OnToggleNotifications>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnToggleNotifications&&(identical(other.isEnabled, isEnabled) || other.isEnabled == isEnabled));
}


@override
int get hashCode => Object.hash(runtimeType,isEnabled);

@override
String toString() {
  return 'SettingEvent.onToggleNotifications(isEnabled: $isEnabled)';
}


}

/// @nodoc
abstract mixin class $OnToggleNotificationsCopyWith<$Res> implements $SettingEventCopyWith<$Res> {
  factory $OnToggleNotificationsCopyWith(OnToggleNotifications value, $Res Function(OnToggleNotifications) _then) = _$OnToggleNotificationsCopyWithImpl;
@useResult
$Res call({
 bool isEnabled
});




}
/// @nodoc
class _$OnToggleNotificationsCopyWithImpl<$Res>
    implements $OnToggleNotificationsCopyWith<$Res> {
  _$OnToggleNotificationsCopyWithImpl(this._self, this._then);

  final OnToggleNotifications _self;
  final $Res Function(OnToggleNotifications) _then;

/// Create a copy of SettingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isEnabled = null,}) {
  return _then(OnToggleNotifications(
isEnabled: null == isEnabled ? _self.isEnabled : isEnabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class OnToggleDarkMode implements SettingEvent {
  const OnToggleDarkMode({required this.isEnabled});
  

 final  bool isEnabled;

/// Create a copy of SettingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnToggleDarkModeCopyWith<OnToggleDarkMode> get copyWith => _$OnToggleDarkModeCopyWithImpl<OnToggleDarkMode>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnToggleDarkMode&&(identical(other.isEnabled, isEnabled) || other.isEnabled == isEnabled));
}


@override
int get hashCode => Object.hash(runtimeType,isEnabled);

@override
String toString() {
  return 'SettingEvent.onToggleDarkMode(isEnabled: $isEnabled)';
}


}

/// @nodoc
abstract mixin class $OnToggleDarkModeCopyWith<$Res> implements $SettingEventCopyWith<$Res> {
  factory $OnToggleDarkModeCopyWith(OnToggleDarkMode value, $Res Function(OnToggleDarkMode) _then) = _$OnToggleDarkModeCopyWithImpl;
@useResult
$Res call({
 bool isEnabled
});




}
/// @nodoc
class _$OnToggleDarkModeCopyWithImpl<$Res>
    implements $OnToggleDarkModeCopyWith<$Res> {
  _$OnToggleDarkModeCopyWithImpl(this._self, this._then);

  final OnToggleDarkMode _self;
  final $Res Function(OnToggleDarkMode) _then;

/// Create a copy of SettingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isEnabled = null,}) {
  return _then(OnToggleDarkMode(
isEnabled: null == isEnabled ? _self.isEnabled : isEnabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class OnChangeLanguage implements SettingEvent {
  const OnChangeLanguage({required this.language});
  

 final  String language;

/// Create a copy of SettingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnChangeLanguageCopyWith<OnChangeLanguage> get copyWith => _$OnChangeLanguageCopyWithImpl<OnChangeLanguage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnChangeLanguage&&(identical(other.language, language) || other.language == language));
}


@override
int get hashCode => Object.hash(runtimeType,language);

@override
String toString() {
  return 'SettingEvent.onChangeLanguage(language: $language)';
}


}

/// @nodoc
abstract mixin class $OnChangeLanguageCopyWith<$Res> implements $SettingEventCopyWith<$Res> {
  factory $OnChangeLanguageCopyWith(OnChangeLanguage value, $Res Function(OnChangeLanguage) _then) = _$OnChangeLanguageCopyWithImpl;
@useResult
$Res call({
 String language
});




}
/// @nodoc
class _$OnChangeLanguageCopyWithImpl<$Res>
    implements $OnChangeLanguageCopyWith<$Res> {
  _$OnChangeLanguageCopyWithImpl(this._self, this._then);

  final OnChangeLanguage _self;
  final $Res Function(OnChangeLanguage) _then;

/// Create a copy of SettingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? language = null,}) {
  return _then(OnChangeLanguage(
language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class OnUpdateFollowerRequests implements SettingEvent {
  const OnUpdateFollowerRequests({required this.value});
  

 final  String value;

/// Create a copy of SettingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnUpdateFollowerRequestsCopyWith<OnUpdateFollowerRequests> get copyWith => _$OnUpdateFollowerRequestsCopyWithImpl<OnUpdateFollowerRequests>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnUpdateFollowerRequests&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'SettingEvent.onUpdateFollowerRequests(value: $value)';
}


}

/// @nodoc
abstract mixin class $OnUpdateFollowerRequestsCopyWith<$Res> implements $SettingEventCopyWith<$Res> {
  factory $OnUpdateFollowerRequestsCopyWith(OnUpdateFollowerRequests value, $Res Function(OnUpdateFollowerRequests) _then) = _$OnUpdateFollowerRequestsCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$OnUpdateFollowerRequestsCopyWithImpl<$Res>
    implements $OnUpdateFollowerRequestsCopyWith<$Res> {
  _$OnUpdateFollowerRequestsCopyWithImpl(this._self, this._then);

  final OnUpdateFollowerRequests _self;
  final $Res Function(OnUpdateFollowerRequests) _then;

/// Create a copy of SettingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(OnUpdateFollowerRequests(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class OnUpdateAcceptedFollowRequests implements SettingEvent {
  const OnUpdateAcceptedFollowRequests({required this.value});
  

 final  String value;

/// Create a copy of SettingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnUpdateAcceptedFollowRequestsCopyWith<OnUpdateAcceptedFollowRequests> get copyWith => _$OnUpdateAcceptedFollowRequestsCopyWithImpl<OnUpdateAcceptedFollowRequests>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnUpdateAcceptedFollowRequests&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'SettingEvent.onUpdateAcceptedFollowRequests(value: $value)';
}


}

/// @nodoc
abstract mixin class $OnUpdateAcceptedFollowRequestsCopyWith<$Res> implements $SettingEventCopyWith<$Res> {
  factory $OnUpdateAcceptedFollowRequestsCopyWith(OnUpdateAcceptedFollowRequests value, $Res Function(OnUpdateAcceptedFollowRequests) _then) = _$OnUpdateAcceptedFollowRequestsCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$OnUpdateAcceptedFollowRequestsCopyWithImpl<$Res>
    implements $OnUpdateAcceptedFollowRequestsCopyWith<$Res> {
  _$OnUpdateAcceptedFollowRequestsCopyWithImpl(this._self, this._then);

  final OnUpdateAcceptedFollowRequests _self;
  final $Res Function(OnUpdateAcceptedFollowRequests) _then;

/// Create a copy of SettingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(OnUpdateAcceptedFollowRequests(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class OnUpdateAccountSuggestions implements SettingEvent {
  const OnUpdateAccountSuggestions({required this.value});
  

 final  String value;

/// Create a copy of SettingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnUpdateAccountSuggestionsCopyWith<OnUpdateAccountSuggestions> get copyWith => _$OnUpdateAccountSuggestionsCopyWithImpl<OnUpdateAccountSuggestions>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnUpdateAccountSuggestions&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'SettingEvent.onUpdateAccountSuggestions(value: $value)';
}


}

/// @nodoc
abstract mixin class $OnUpdateAccountSuggestionsCopyWith<$Res> implements $SettingEventCopyWith<$Res> {
  factory $OnUpdateAccountSuggestionsCopyWith(OnUpdateAccountSuggestions value, $Res Function(OnUpdateAccountSuggestions) _then) = _$OnUpdateAccountSuggestionsCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$OnUpdateAccountSuggestionsCopyWithImpl<$Res>
    implements $OnUpdateAccountSuggestionsCopyWith<$Res> {
  _$OnUpdateAccountSuggestionsCopyWithImpl(this._self, this._then);

  final OnUpdateAccountSuggestions _self;
  final $Res Function(OnUpdateAccountSuggestions) _then;

/// Create a copy of SettingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(OnUpdateAccountSuggestions(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class OnUpdateMentionsInBio implements SettingEvent {
  const OnUpdateMentionsInBio({required this.value});
  

 final  String value;

/// Create a copy of SettingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnUpdateMentionsInBioCopyWith<OnUpdateMentionsInBio> get copyWith => _$OnUpdateMentionsInBioCopyWithImpl<OnUpdateMentionsInBio>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnUpdateMentionsInBio&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'SettingEvent.onUpdateMentionsInBio(value: $value)';
}


}

/// @nodoc
abstract mixin class $OnUpdateMentionsInBioCopyWith<$Res> implements $SettingEventCopyWith<$Res> {
  factory $OnUpdateMentionsInBioCopyWith(OnUpdateMentionsInBio value, $Res Function(OnUpdateMentionsInBio) _then) = _$OnUpdateMentionsInBioCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$OnUpdateMentionsInBioCopyWithImpl<$Res>
    implements $OnUpdateMentionsInBioCopyWith<$Res> {
  _$OnUpdateMentionsInBioCopyWithImpl(this._self, this._then);

  final OnUpdateMentionsInBio _self;
  final $Res Function(OnUpdateMentionsInBio) _then;

/// Create a copy of SettingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(OnUpdateMentionsInBio(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$SettingState {

 CommonScreenState get status; SettingModel? get settings; String? get errorMessage;
/// Create a copy of SettingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettingStateCopyWith<SettingState> get copyWith => _$SettingStateCopyWithImpl<SettingState>(this as SettingState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingState&&(identical(other.status, status) || other.status == status)&&(identical(other.settings, settings) || other.settings == settings)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,settings,errorMessage);

@override
String toString() {
  return 'SettingState(status: $status, settings: $settings, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $SettingStateCopyWith<$Res>  {
  factory $SettingStateCopyWith(SettingState value, $Res Function(SettingState) _then) = _$SettingStateCopyWithImpl;
@useResult
$Res call({
 CommonScreenState status, SettingModel? settings, String? errorMessage
});




}
/// @nodoc
class _$SettingStateCopyWithImpl<$Res>
    implements $SettingStateCopyWith<$Res> {
  _$SettingStateCopyWithImpl(this._self, this._then);

  final SettingState _self;
  final $Res Function(SettingState) _then;

/// Create a copy of SettingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? settings = freezed,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CommonScreenState,settings: freezed == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as SettingModel?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SettingState].
extension SettingStatePatterns on SettingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SettingState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SettingState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SettingState value)  $default,){
final _that = this;
switch (_that) {
case _SettingState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SettingState value)?  $default,){
final _that = this;
switch (_that) {
case _SettingState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CommonScreenState status,  SettingModel? settings,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SettingState() when $default != null:
return $default(_that.status,_that.settings,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CommonScreenState status,  SettingModel? settings,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _SettingState():
return $default(_that.status,_that.settings,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CommonScreenState status,  SettingModel? settings,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _SettingState() when $default != null:
return $default(_that.status,_that.settings,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _SettingState implements SettingState {
   _SettingState({required this.status, required this.settings, this.errorMessage});
  

@override final  CommonScreenState status;
@override final  SettingModel? settings;
@override final  String? errorMessage;

/// Create a copy of SettingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SettingStateCopyWith<_SettingState> get copyWith => __$SettingStateCopyWithImpl<_SettingState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SettingState&&(identical(other.status, status) || other.status == status)&&(identical(other.settings, settings) || other.settings == settings)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,settings,errorMessage);

@override
String toString() {
  return 'SettingState(status: $status, settings: $settings, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$SettingStateCopyWith<$Res> implements $SettingStateCopyWith<$Res> {
  factory _$SettingStateCopyWith(_SettingState value, $Res Function(_SettingState) _then) = __$SettingStateCopyWithImpl;
@override @useResult
$Res call({
 CommonScreenState status, SettingModel? settings, String? errorMessage
});




}
/// @nodoc
class __$SettingStateCopyWithImpl<$Res>
    implements _$SettingStateCopyWith<$Res> {
  __$SettingStateCopyWithImpl(this._self, this._then);

  final _SettingState _self;
  final $Res Function(_SettingState) _then;

/// Create a copy of SettingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? settings = freezed,Object? errorMessage = freezed,}) {
  return _then(_SettingState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CommonScreenState,settings: freezed == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as SettingModel?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
