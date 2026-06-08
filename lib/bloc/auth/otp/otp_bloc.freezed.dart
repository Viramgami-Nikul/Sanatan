// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'otp_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OtpEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OtpEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OtpEvent()';
}


}

/// @nodoc
class $OtpEventCopyWith<$Res>  {
$OtpEventCopyWith(OtpEvent _, $Res Function(OtpEvent) __);
}


/// Adds pattern-matching-related methods to [OtpEvent].
extension OtpEventPatterns on OtpEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( OnChangeEmailOrPhone value)?  onChangeEmailOrPhone,TResult Function( OnChangeOtp value)?  onChangeOtp,TResult Function( SendOtpEvent value)?  sendOtp,TResult Function( VerifyOtpEvent value)?  verifyOtp,required TResult orElse(),}){
final _that = this;
switch (_that) {
case OnChangeEmailOrPhone() when onChangeEmailOrPhone != null:
return onChangeEmailOrPhone(_that);case OnChangeOtp() when onChangeOtp != null:
return onChangeOtp(_that);case SendOtpEvent() when sendOtp != null:
return sendOtp(_that);case VerifyOtpEvent() when verifyOtp != null:
return verifyOtp(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( OnChangeEmailOrPhone value)  onChangeEmailOrPhone,required TResult Function( OnChangeOtp value)  onChangeOtp,required TResult Function( SendOtpEvent value)  sendOtp,required TResult Function( VerifyOtpEvent value)  verifyOtp,}){
final _that = this;
switch (_that) {
case OnChangeEmailOrPhone():
return onChangeEmailOrPhone(_that);case OnChangeOtp():
return onChangeOtp(_that);case SendOtpEvent():
return sendOtp(_that);case VerifyOtpEvent():
return verifyOtp(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( OnChangeEmailOrPhone value)?  onChangeEmailOrPhone,TResult? Function( OnChangeOtp value)?  onChangeOtp,TResult? Function( SendOtpEvent value)?  sendOtp,TResult? Function( VerifyOtpEvent value)?  verifyOtp,}){
final _that = this;
switch (_that) {
case OnChangeEmailOrPhone() when onChangeEmailOrPhone != null:
return onChangeEmailOrPhone(_that);case OnChangeOtp() when onChangeOtp != null:
return onChangeOtp(_that);case SendOtpEvent() when sendOtp != null:
return sendOtp(_that);case VerifyOtpEvent() when verifyOtp != null:
return verifyOtp(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String emailOrPhone)?  onChangeEmailOrPhone,TResult Function( String otp)?  onChangeOtp,TResult Function( BuildContext context)?  sendOtp,TResult Function( BuildContext context)?  verifyOtp,required TResult orElse(),}) {final _that = this;
switch (_that) {
case OnChangeEmailOrPhone() when onChangeEmailOrPhone != null:
return onChangeEmailOrPhone(_that.emailOrPhone);case OnChangeOtp() when onChangeOtp != null:
return onChangeOtp(_that.otp);case SendOtpEvent() when sendOtp != null:
return sendOtp(_that.context);case VerifyOtpEvent() when verifyOtp != null:
return verifyOtp(_that.context);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String emailOrPhone)  onChangeEmailOrPhone,required TResult Function( String otp)  onChangeOtp,required TResult Function( BuildContext context)  sendOtp,required TResult Function( BuildContext context)  verifyOtp,}) {final _that = this;
switch (_that) {
case OnChangeEmailOrPhone():
return onChangeEmailOrPhone(_that.emailOrPhone);case OnChangeOtp():
return onChangeOtp(_that.otp);case SendOtpEvent():
return sendOtp(_that.context);case VerifyOtpEvent():
return verifyOtp(_that.context);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String emailOrPhone)?  onChangeEmailOrPhone,TResult? Function( String otp)?  onChangeOtp,TResult? Function( BuildContext context)?  sendOtp,TResult? Function( BuildContext context)?  verifyOtp,}) {final _that = this;
switch (_that) {
case OnChangeEmailOrPhone() when onChangeEmailOrPhone != null:
return onChangeEmailOrPhone(_that.emailOrPhone);case OnChangeOtp() when onChangeOtp != null:
return onChangeOtp(_that.otp);case SendOtpEvent() when sendOtp != null:
return sendOtp(_that.context);case VerifyOtpEvent() when verifyOtp != null:
return verifyOtp(_that.context);case _:
  return null;

}
}

}

/// @nodoc


class OnChangeEmailOrPhone implements OtpEvent {
  const OnChangeEmailOrPhone({required this.emailOrPhone});
  

 final  String emailOrPhone;

/// Create a copy of OtpEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnChangeEmailOrPhoneCopyWith<OnChangeEmailOrPhone> get copyWith => _$OnChangeEmailOrPhoneCopyWithImpl<OnChangeEmailOrPhone>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnChangeEmailOrPhone&&(identical(other.emailOrPhone, emailOrPhone) || other.emailOrPhone == emailOrPhone));
}


@override
int get hashCode => Object.hash(runtimeType,emailOrPhone);

@override
String toString() {
  return 'OtpEvent.onChangeEmailOrPhone(emailOrPhone: $emailOrPhone)';
}


}

/// @nodoc
abstract mixin class $OnChangeEmailOrPhoneCopyWith<$Res> implements $OtpEventCopyWith<$Res> {
  factory $OnChangeEmailOrPhoneCopyWith(OnChangeEmailOrPhone value, $Res Function(OnChangeEmailOrPhone) _then) = _$OnChangeEmailOrPhoneCopyWithImpl;
@useResult
$Res call({
 String emailOrPhone
});




}
/// @nodoc
class _$OnChangeEmailOrPhoneCopyWithImpl<$Res>
    implements $OnChangeEmailOrPhoneCopyWith<$Res> {
  _$OnChangeEmailOrPhoneCopyWithImpl(this._self, this._then);

  final OnChangeEmailOrPhone _self;
  final $Res Function(OnChangeEmailOrPhone) _then;

/// Create a copy of OtpEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? emailOrPhone = null,}) {
  return _then(OnChangeEmailOrPhone(
emailOrPhone: null == emailOrPhone ? _self.emailOrPhone : emailOrPhone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class OnChangeOtp implements OtpEvent {
  const OnChangeOtp({required this.otp});
  

 final  String otp;

/// Create a copy of OtpEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnChangeOtpCopyWith<OnChangeOtp> get copyWith => _$OnChangeOtpCopyWithImpl<OnChangeOtp>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnChangeOtp&&(identical(other.otp, otp) || other.otp == otp));
}


@override
int get hashCode => Object.hash(runtimeType,otp);

@override
String toString() {
  return 'OtpEvent.onChangeOtp(otp: $otp)';
}


}

/// @nodoc
abstract mixin class $OnChangeOtpCopyWith<$Res> implements $OtpEventCopyWith<$Res> {
  factory $OnChangeOtpCopyWith(OnChangeOtp value, $Res Function(OnChangeOtp) _then) = _$OnChangeOtpCopyWithImpl;
@useResult
$Res call({
 String otp
});




}
/// @nodoc
class _$OnChangeOtpCopyWithImpl<$Res>
    implements $OnChangeOtpCopyWith<$Res> {
  _$OnChangeOtpCopyWithImpl(this._self, this._then);

  final OnChangeOtp _self;
  final $Res Function(OnChangeOtp) _then;

/// Create a copy of OtpEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? otp = null,}) {
  return _then(OnChangeOtp(
otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SendOtpEvent implements OtpEvent {
  const SendOtpEvent({required this.context});
  

 final  BuildContext context;

/// Create a copy of OtpEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SendOtpEventCopyWith<SendOtpEvent> get copyWith => _$SendOtpEventCopyWithImpl<SendOtpEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendOtpEvent&&(identical(other.context, context) || other.context == context));
}


@override
int get hashCode => Object.hash(runtimeType,context);

@override
String toString() {
  return 'OtpEvent.sendOtp(context: $context)';
}


}

/// @nodoc
abstract mixin class $SendOtpEventCopyWith<$Res> implements $OtpEventCopyWith<$Res> {
  factory $SendOtpEventCopyWith(SendOtpEvent value, $Res Function(SendOtpEvent) _then) = _$SendOtpEventCopyWithImpl;
@useResult
$Res call({
 BuildContext context
});




}
/// @nodoc
class _$SendOtpEventCopyWithImpl<$Res>
    implements $SendOtpEventCopyWith<$Res> {
  _$SendOtpEventCopyWithImpl(this._self, this._then);

  final SendOtpEvent _self;
  final $Res Function(SendOtpEvent) _then;

/// Create a copy of OtpEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? context = null,}) {
  return _then(SendOtpEvent(
context: null == context ? _self.context : context // ignore: cast_nullable_to_non_nullable
as BuildContext,
  ));
}


}

/// @nodoc


class VerifyOtpEvent implements OtpEvent {
  const VerifyOtpEvent({required this.context});
  

 final  BuildContext context;

/// Create a copy of OtpEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyOtpEventCopyWith<VerifyOtpEvent> get copyWith => _$VerifyOtpEventCopyWithImpl<VerifyOtpEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyOtpEvent&&(identical(other.context, context) || other.context == context));
}


@override
int get hashCode => Object.hash(runtimeType,context);

@override
String toString() {
  return 'OtpEvent.verifyOtp(context: $context)';
}


}

/// @nodoc
abstract mixin class $VerifyOtpEventCopyWith<$Res> implements $OtpEventCopyWith<$Res> {
  factory $VerifyOtpEventCopyWith(VerifyOtpEvent value, $Res Function(VerifyOtpEvent) _then) = _$VerifyOtpEventCopyWithImpl;
@useResult
$Res call({
 BuildContext context
});




}
/// @nodoc
class _$VerifyOtpEventCopyWithImpl<$Res>
    implements $VerifyOtpEventCopyWith<$Res> {
  _$VerifyOtpEventCopyWithImpl(this._self, this._then);

  final VerifyOtpEvent _self;
  final $Res Function(VerifyOtpEvent) _then;

/// Create a copy of OtpEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? context = null,}) {
  return _then(VerifyOtpEvent(
context: null == context ? _self.context : context // ignore: cast_nullable_to_non_nullable
as BuildContext,
  ));
}


}

/// @nodoc
mixin _$OtpState {

 CommonScreenState get status; String get emailOrPhone; String get otp; String get verificationId; bool get isOtpSent; UserDataModel? get user; String? get errorMessage;
/// Create a copy of OtpState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OtpStateCopyWith<OtpState> get copyWith => _$OtpStateCopyWithImpl<OtpState>(this as OtpState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OtpState&&(identical(other.status, status) || other.status == status)&&(identical(other.emailOrPhone, emailOrPhone) || other.emailOrPhone == emailOrPhone)&&(identical(other.otp, otp) || other.otp == otp)&&(identical(other.verificationId, verificationId) || other.verificationId == verificationId)&&(identical(other.isOtpSent, isOtpSent) || other.isOtpSent == isOtpSent)&&(identical(other.user, user) || other.user == user)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,emailOrPhone,otp,verificationId,isOtpSent,user,errorMessage);

@override
String toString() {
  return 'OtpState(status: $status, emailOrPhone: $emailOrPhone, otp: $otp, verificationId: $verificationId, isOtpSent: $isOtpSent, user: $user, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $OtpStateCopyWith<$Res>  {
  factory $OtpStateCopyWith(OtpState value, $Res Function(OtpState) _then) = _$OtpStateCopyWithImpl;
@useResult
$Res call({
 CommonScreenState status, String emailOrPhone, String otp, String verificationId, bool isOtpSent, UserDataModel? user, String? errorMessage
});




}
/// @nodoc
class _$OtpStateCopyWithImpl<$Res>
    implements $OtpStateCopyWith<$Res> {
  _$OtpStateCopyWithImpl(this._self, this._then);

  final OtpState _self;
  final $Res Function(OtpState) _then;

/// Create a copy of OtpState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? emailOrPhone = null,Object? otp = null,Object? verificationId = null,Object? isOtpSent = null,Object? user = freezed,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CommonScreenState,emailOrPhone: null == emailOrPhone ? _self.emailOrPhone : emailOrPhone // ignore: cast_nullable_to_non_nullable
as String,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,verificationId: null == verificationId ? _self.verificationId : verificationId // ignore: cast_nullable_to_non_nullable
as String,isOtpSent: null == isOtpSent ? _self.isOtpSent : isOtpSent // ignore: cast_nullable_to_non_nullable
as bool,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserDataModel?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OtpState].
extension OtpStatePatterns on OtpState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OtpState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OtpState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OtpState value)  $default,){
final _that = this;
switch (_that) {
case _OtpState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OtpState value)?  $default,){
final _that = this;
switch (_that) {
case _OtpState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CommonScreenState status,  String emailOrPhone,  String otp,  String verificationId,  bool isOtpSent,  UserDataModel? user,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OtpState() when $default != null:
return $default(_that.status,_that.emailOrPhone,_that.otp,_that.verificationId,_that.isOtpSent,_that.user,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CommonScreenState status,  String emailOrPhone,  String otp,  String verificationId,  bool isOtpSent,  UserDataModel? user,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _OtpState():
return $default(_that.status,_that.emailOrPhone,_that.otp,_that.verificationId,_that.isOtpSent,_that.user,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CommonScreenState status,  String emailOrPhone,  String otp,  String verificationId,  bool isOtpSent,  UserDataModel? user,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _OtpState() when $default != null:
return $default(_that.status,_that.emailOrPhone,_that.otp,_that.verificationId,_that.isOtpSent,_that.user,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _OtpState implements OtpState {
   _OtpState({required this.status, required this.emailOrPhone, required this.otp, required this.verificationId, required this.isOtpSent, this.user, this.errorMessage});
  

@override final  CommonScreenState status;
@override final  String emailOrPhone;
@override final  String otp;
@override final  String verificationId;
@override final  bool isOtpSent;
@override final  UserDataModel? user;
@override final  String? errorMessage;

/// Create a copy of OtpState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OtpStateCopyWith<_OtpState> get copyWith => __$OtpStateCopyWithImpl<_OtpState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OtpState&&(identical(other.status, status) || other.status == status)&&(identical(other.emailOrPhone, emailOrPhone) || other.emailOrPhone == emailOrPhone)&&(identical(other.otp, otp) || other.otp == otp)&&(identical(other.verificationId, verificationId) || other.verificationId == verificationId)&&(identical(other.isOtpSent, isOtpSent) || other.isOtpSent == isOtpSent)&&(identical(other.user, user) || other.user == user)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,emailOrPhone,otp,verificationId,isOtpSent,user,errorMessage);

@override
String toString() {
  return 'OtpState(status: $status, emailOrPhone: $emailOrPhone, otp: $otp, verificationId: $verificationId, isOtpSent: $isOtpSent, user: $user, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$OtpStateCopyWith<$Res> implements $OtpStateCopyWith<$Res> {
  factory _$OtpStateCopyWith(_OtpState value, $Res Function(_OtpState) _then) = __$OtpStateCopyWithImpl;
@override @useResult
$Res call({
 CommonScreenState status, String emailOrPhone, String otp, String verificationId, bool isOtpSent, UserDataModel? user, String? errorMessage
});




}
/// @nodoc
class __$OtpStateCopyWithImpl<$Res>
    implements _$OtpStateCopyWith<$Res> {
  __$OtpStateCopyWithImpl(this._self, this._then);

  final _OtpState _self;
  final $Res Function(_OtpState) _then;

/// Create a copy of OtpState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? emailOrPhone = null,Object? otp = null,Object? verificationId = null,Object? isOtpSent = null,Object? user = freezed,Object? errorMessage = freezed,}) {
  return _then(_OtpState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CommonScreenState,emailOrPhone: null == emailOrPhone ? _self.emailOrPhone : emailOrPhone // ignore: cast_nullable_to_non_nullable
as String,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,verificationId: null == verificationId ? _self.verificationId : verificationId // ignore: cast_nullable_to_non_nullable
as String,isOtpSent: null == isOtpSent ? _self.isOtpSent : isOtpSent // ignore: cast_nullable_to_non_nullable
as bool,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserDataModel?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
