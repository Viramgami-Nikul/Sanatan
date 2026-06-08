// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEvent()';
}


}

/// @nodoc
class $ProfileEventCopyWith<$Res>  {
$ProfileEventCopyWith(ProfileEvent _, $Res Function(ProfileEvent) __);
}


/// Adds pattern-matching-related methods to [ProfileEvent].
extension ProfileEventPatterns on ProfileEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( OnGetUserProfile value)?  getUserProfile,TResult Function( OnTapLogout value)?  onTapLogout,TResult Function( CallLogoutApi value)?  callLogoutApi,TResult Function( OnTapChangeLanguage value)?  onTapChangeLanguage,TResult Function( OnTapEditProfilePhoto value)?  onTapEditProfilePhoto,TResult Function( OnSelectProfilePhoto value)?  onSelectProfilePhoto,TResult Function( UploadProfileImage value)?  uploadProfileImage,required TResult orElse(),}){
final _that = this;
switch (_that) {
case OnGetUserProfile() when getUserProfile != null:
return getUserProfile(_that);case OnTapLogout() when onTapLogout != null:
return onTapLogout(_that);case CallLogoutApi() when callLogoutApi != null:
return callLogoutApi(_that);case OnTapChangeLanguage() when onTapChangeLanguage != null:
return onTapChangeLanguage(_that);case OnTapEditProfilePhoto() when onTapEditProfilePhoto != null:
return onTapEditProfilePhoto(_that);case OnSelectProfilePhoto() when onSelectProfilePhoto != null:
return onSelectProfilePhoto(_that);case UploadProfileImage() when uploadProfileImage != null:
return uploadProfileImage(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( OnGetUserProfile value)  getUserProfile,required TResult Function( OnTapLogout value)  onTapLogout,required TResult Function( CallLogoutApi value)  callLogoutApi,required TResult Function( OnTapChangeLanguage value)  onTapChangeLanguage,required TResult Function( OnTapEditProfilePhoto value)  onTapEditProfilePhoto,required TResult Function( OnSelectProfilePhoto value)  onSelectProfilePhoto,required TResult Function( UploadProfileImage value)  uploadProfileImage,}){
final _that = this;
switch (_that) {
case OnGetUserProfile():
return getUserProfile(_that);case OnTapLogout():
return onTapLogout(_that);case CallLogoutApi():
return callLogoutApi(_that);case OnTapChangeLanguage():
return onTapChangeLanguage(_that);case OnTapEditProfilePhoto():
return onTapEditProfilePhoto(_that);case OnSelectProfilePhoto():
return onSelectProfilePhoto(_that);case UploadProfileImage():
return uploadProfileImage(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( OnGetUserProfile value)?  getUserProfile,TResult? Function( OnTapLogout value)?  onTapLogout,TResult? Function( CallLogoutApi value)?  callLogoutApi,TResult? Function( OnTapChangeLanguage value)?  onTapChangeLanguage,TResult? Function( OnTapEditProfilePhoto value)?  onTapEditProfilePhoto,TResult? Function( OnSelectProfilePhoto value)?  onSelectProfilePhoto,TResult? Function( UploadProfileImage value)?  uploadProfileImage,}){
final _that = this;
switch (_that) {
case OnGetUserProfile() when getUserProfile != null:
return getUserProfile(_that);case OnTapLogout() when onTapLogout != null:
return onTapLogout(_that);case CallLogoutApi() when callLogoutApi != null:
return callLogoutApi(_that);case OnTapChangeLanguage() when onTapChangeLanguage != null:
return onTapChangeLanguage(_that);case OnTapEditProfilePhoto() when onTapEditProfilePhoto != null:
return onTapEditProfilePhoto(_that);case OnSelectProfilePhoto() when onSelectProfilePhoto != null:
return onSelectProfilePhoto(_that);case UploadProfileImage() when uploadProfileImage != null:
return uploadProfileImage(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  getUserProfile,TResult Function()?  onTapLogout,TResult Function()?  callLogoutApi,TResult Function()?  onTapChangeLanguage,TResult Function()?  onTapEditProfilePhoto,TResult Function( String imagePath)?  onSelectProfilePhoto,TResult Function( String imagePath)?  uploadProfileImage,required TResult orElse(),}) {final _that = this;
switch (_that) {
case OnGetUserProfile() when getUserProfile != null:
return getUserProfile();case OnTapLogout() when onTapLogout != null:
return onTapLogout();case CallLogoutApi() when callLogoutApi != null:
return callLogoutApi();case OnTapChangeLanguage() when onTapChangeLanguage != null:
return onTapChangeLanguage();case OnTapEditProfilePhoto() when onTapEditProfilePhoto != null:
return onTapEditProfilePhoto();case OnSelectProfilePhoto() when onSelectProfilePhoto != null:
return onSelectProfilePhoto(_that.imagePath);case UploadProfileImage() when uploadProfileImage != null:
return uploadProfileImage(_that.imagePath);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  getUserProfile,required TResult Function()  onTapLogout,required TResult Function()  callLogoutApi,required TResult Function()  onTapChangeLanguage,required TResult Function()  onTapEditProfilePhoto,required TResult Function( String imagePath)  onSelectProfilePhoto,required TResult Function( String imagePath)  uploadProfileImage,}) {final _that = this;
switch (_that) {
case OnGetUserProfile():
return getUserProfile();case OnTapLogout():
return onTapLogout();case CallLogoutApi():
return callLogoutApi();case OnTapChangeLanguage():
return onTapChangeLanguage();case OnTapEditProfilePhoto():
return onTapEditProfilePhoto();case OnSelectProfilePhoto():
return onSelectProfilePhoto(_that.imagePath);case UploadProfileImage():
return uploadProfileImage(_that.imagePath);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  getUserProfile,TResult? Function()?  onTapLogout,TResult? Function()?  callLogoutApi,TResult? Function()?  onTapChangeLanguage,TResult? Function()?  onTapEditProfilePhoto,TResult? Function( String imagePath)?  onSelectProfilePhoto,TResult? Function( String imagePath)?  uploadProfileImage,}) {final _that = this;
switch (_that) {
case OnGetUserProfile() when getUserProfile != null:
return getUserProfile();case OnTapLogout() when onTapLogout != null:
return onTapLogout();case CallLogoutApi() when callLogoutApi != null:
return callLogoutApi();case OnTapChangeLanguage() when onTapChangeLanguage != null:
return onTapChangeLanguage();case OnTapEditProfilePhoto() when onTapEditProfilePhoto != null:
return onTapEditProfilePhoto();case OnSelectProfilePhoto() when onSelectProfilePhoto != null:
return onSelectProfilePhoto(_that.imagePath);case UploadProfileImage() when uploadProfileImage != null:
return uploadProfileImage(_that.imagePath);case _:
  return null;

}
}

}

/// @nodoc


class OnGetUserProfile implements ProfileEvent {
  const OnGetUserProfile();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnGetUserProfile);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEvent.getUserProfile()';
}


}




/// @nodoc


class OnTapLogout implements ProfileEvent {
  const OnTapLogout();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnTapLogout);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEvent.onTapLogout()';
}


}




/// @nodoc


class CallLogoutApi implements ProfileEvent {
  const CallLogoutApi();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CallLogoutApi);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEvent.callLogoutApi()';
}


}




/// @nodoc


class OnTapChangeLanguage implements ProfileEvent {
  const OnTapChangeLanguage();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnTapChangeLanguage);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEvent.onTapChangeLanguage()';
}


}




/// @nodoc


class OnTapEditProfilePhoto implements ProfileEvent {
  const OnTapEditProfilePhoto();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnTapEditProfilePhoto);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEvent.onTapEditProfilePhoto()';
}


}




/// @nodoc


class OnSelectProfilePhoto implements ProfileEvent {
  const OnSelectProfilePhoto({required this.imagePath});
  

 final  String imagePath;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnSelectProfilePhotoCopyWith<OnSelectProfilePhoto> get copyWith => _$OnSelectProfilePhotoCopyWithImpl<OnSelectProfilePhoto>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnSelectProfilePhoto&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath));
}


@override
int get hashCode => Object.hash(runtimeType,imagePath);

@override
String toString() {
  return 'ProfileEvent.onSelectProfilePhoto(imagePath: $imagePath)';
}


}

/// @nodoc
abstract mixin class $OnSelectProfilePhotoCopyWith<$Res> implements $ProfileEventCopyWith<$Res> {
  factory $OnSelectProfilePhotoCopyWith(OnSelectProfilePhoto value, $Res Function(OnSelectProfilePhoto) _then) = _$OnSelectProfilePhotoCopyWithImpl;
@useResult
$Res call({
 String imagePath
});




}
/// @nodoc
class _$OnSelectProfilePhotoCopyWithImpl<$Res>
    implements $OnSelectProfilePhotoCopyWith<$Res> {
  _$OnSelectProfilePhotoCopyWithImpl(this._self, this._then);

  final OnSelectProfilePhoto _self;
  final $Res Function(OnSelectProfilePhoto) _then;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? imagePath = null,}) {
  return _then(OnSelectProfilePhoto(
imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UploadProfileImage implements ProfileEvent {
  const UploadProfileImage({required this.imagePath});
  

 final  String imagePath;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UploadProfileImageCopyWith<UploadProfileImage> get copyWith => _$UploadProfileImageCopyWithImpl<UploadProfileImage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UploadProfileImage&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath));
}


@override
int get hashCode => Object.hash(runtimeType,imagePath);

@override
String toString() {
  return 'ProfileEvent.uploadProfileImage(imagePath: $imagePath)';
}


}

/// @nodoc
abstract mixin class $UploadProfileImageCopyWith<$Res> implements $ProfileEventCopyWith<$Res> {
  factory $UploadProfileImageCopyWith(UploadProfileImage value, $Res Function(UploadProfileImage) _then) = _$UploadProfileImageCopyWithImpl;
@useResult
$Res call({
 String imagePath
});




}
/// @nodoc
class _$UploadProfileImageCopyWithImpl<$Res>
    implements $UploadProfileImageCopyWith<$Res> {
  _$UploadProfileImageCopyWithImpl(this._self, this._then);

  final UploadProfileImage _self;
  final $Res Function(UploadProfileImage) _then;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? imagePath = null,}) {
  return _then(UploadProfileImage(
imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ProfileState {

 CommonScreenState get status; bool get showLogoutSheet; bool get showProfilePhotoEditSheet; UserDataModel? get userData; bool? get navigateToLogin; bool? get showLanguageSheet; String? get selectedImage; String? get errorMessage;
/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileStateCopyWith<ProfileState> get copyWith => _$ProfileStateCopyWithImpl<ProfileState>(this as ProfileState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileState&&(identical(other.status, status) || other.status == status)&&(identical(other.showLogoutSheet, showLogoutSheet) || other.showLogoutSheet == showLogoutSheet)&&(identical(other.showProfilePhotoEditSheet, showProfilePhotoEditSheet) || other.showProfilePhotoEditSheet == showProfilePhotoEditSheet)&&(identical(other.userData, userData) || other.userData == userData)&&(identical(other.navigateToLogin, navigateToLogin) || other.navigateToLogin == navigateToLogin)&&(identical(other.showLanguageSheet, showLanguageSheet) || other.showLanguageSheet == showLanguageSheet)&&(identical(other.selectedImage, selectedImage) || other.selectedImage == selectedImage)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,showLogoutSheet,showProfilePhotoEditSheet,userData,navigateToLogin,showLanguageSheet,selectedImage,errorMessage);

@override
String toString() {
  return 'ProfileState(status: $status, showLogoutSheet: $showLogoutSheet, showProfilePhotoEditSheet: $showProfilePhotoEditSheet, userData: $userData, navigateToLogin: $navigateToLogin, showLanguageSheet: $showLanguageSheet, selectedImage: $selectedImage, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ProfileStateCopyWith<$Res>  {
  factory $ProfileStateCopyWith(ProfileState value, $Res Function(ProfileState) _then) = _$ProfileStateCopyWithImpl;
@useResult
$Res call({
 CommonScreenState status, bool showLogoutSheet, bool showProfilePhotoEditSheet, UserDataModel? userData, bool? navigateToLogin, bool? showLanguageSheet, String? selectedImage, String? errorMessage
});




}
/// @nodoc
class _$ProfileStateCopyWithImpl<$Res>
    implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._self, this._then);

  final ProfileState _self;
  final $Res Function(ProfileState) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? showLogoutSheet = null,Object? showProfilePhotoEditSheet = null,Object? userData = freezed,Object? navigateToLogin = freezed,Object? showLanguageSheet = freezed,Object? selectedImage = freezed,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CommonScreenState,showLogoutSheet: null == showLogoutSheet ? _self.showLogoutSheet : showLogoutSheet // ignore: cast_nullable_to_non_nullable
as bool,showProfilePhotoEditSheet: null == showProfilePhotoEditSheet ? _self.showProfilePhotoEditSheet : showProfilePhotoEditSheet // ignore: cast_nullable_to_non_nullable
as bool,userData: freezed == userData ? _self.userData : userData // ignore: cast_nullable_to_non_nullable
as UserDataModel?,navigateToLogin: freezed == navigateToLogin ? _self.navigateToLogin : navigateToLogin // ignore: cast_nullable_to_non_nullable
as bool?,showLanguageSheet: freezed == showLanguageSheet ? _self.showLanguageSheet : showLanguageSheet // ignore: cast_nullable_to_non_nullable
as bool?,selectedImage: freezed == selectedImage ? _self.selectedImage : selectedImage // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileState].
extension ProfileStatePatterns on ProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileState value)  $default,){
final _that = this;
switch (_that) {
case _ProfileState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileState value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CommonScreenState status,  bool showLogoutSheet,  bool showProfilePhotoEditSheet,  UserDataModel? userData,  bool? navigateToLogin,  bool? showLanguageSheet,  String? selectedImage,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileState() when $default != null:
return $default(_that.status,_that.showLogoutSheet,_that.showProfilePhotoEditSheet,_that.userData,_that.navigateToLogin,_that.showLanguageSheet,_that.selectedImage,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CommonScreenState status,  bool showLogoutSheet,  bool showProfilePhotoEditSheet,  UserDataModel? userData,  bool? navigateToLogin,  bool? showLanguageSheet,  String? selectedImage,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _ProfileState():
return $default(_that.status,_that.showLogoutSheet,_that.showProfilePhotoEditSheet,_that.userData,_that.navigateToLogin,_that.showLanguageSheet,_that.selectedImage,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CommonScreenState status,  bool showLogoutSheet,  bool showProfilePhotoEditSheet,  UserDataModel? userData,  bool? navigateToLogin,  bool? showLanguageSheet,  String? selectedImage,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _ProfileState() when $default != null:
return $default(_that.status,_that.showLogoutSheet,_that.showProfilePhotoEditSheet,_that.userData,_that.navigateToLogin,_that.showLanguageSheet,_that.selectedImage,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _ProfileState implements ProfileState {
   _ProfileState({required this.status, required this.showLogoutSheet, required this.showProfilePhotoEditSheet, this.userData, this.navigateToLogin, this.showLanguageSheet, this.selectedImage, this.errorMessage});
  

@override final  CommonScreenState status;
@override final  bool showLogoutSheet;
@override final  bool showProfilePhotoEditSheet;
@override final  UserDataModel? userData;
@override final  bool? navigateToLogin;
@override final  bool? showLanguageSheet;
@override final  String? selectedImage;
@override final  String? errorMessage;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileStateCopyWith<_ProfileState> get copyWith => __$ProfileStateCopyWithImpl<_ProfileState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileState&&(identical(other.status, status) || other.status == status)&&(identical(other.showLogoutSheet, showLogoutSheet) || other.showLogoutSheet == showLogoutSheet)&&(identical(other.showProfilePhotoEditSheet, showProfilePhotoEditSheet) || other.showProfilePhotoEditSheet == showProfilePhotoEditSheet)&&(identical(other.userData, userData) || other.userData == userData)&&(identical(other.navigateToLogin, navigateToLogin) || other.navigateToLogin == navigateToLogin)&&(identical(other.showLanguageSheet, showLanguageSheet) || other.showLanguageSheet == showLanguageSheet)&&(identical(other.selectedImage, selectedImage) || other.selectedImage == selectedImage)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,showLogoutSheet,showProfilePhotoEditSheet,userData,navigateToLogin,showLanguageSheet,selectedImage,errorMessage);

@override
String toString() {
  return 'ProfileState(status: $status, showLogoutSheet: $showLogoutSheet, showProfilePhotoEditSheet: $showProfilePhotoEditSheet, userData: $userData, navigateToLogin: $navigateToLogin, showLanguageSheet: $showLanguageSheet, selectedImage: $selectedImage, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$ProfileStateCopyWith<$Res> implements $ProfileStateCopyWith<$Res> {
  factory _$ProfileStateCopyWith(_ProfileState value, $Res Function(_ProfileState) _then) = __$ProfileStateCopyWithImpl;
@override @useResult
$Res call({
 CommonScreenState status, bool showLogoutSheet, bool showProfilePhotoEditSheet, UserDataModel? userData, bool? navigateToLogin, bool? showLanguageSheet, String? selectedImage, String? errorMessage
});




}
/// @nodoc
class __$ProfileStateCopyWithImpl<$Res>
    implements _$ProfileStateCopyWith<$Res> {
  __$ProfileStateCopyWithImpl(this._self, this._then);

  final _ProfileState _self;
  final $Res Function(_ProfileState) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? showLogoutSheet = null,Object? showProfilePhotoEditSheet = null,Object? userData = freezed,Object? navigateToLogin = freezed,Object? showLanguageSheet = freezed,Object? selectedImage = freezed,Object? errorMessage = freezed,}) {
  return _then(_ProfileState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CommonScreenState,showLogoutSheet: null == showLogoutSheet ? _self.showLogoutSheet : showLogoutSheet // ignore: cast_nullable_to_non_nullable
as bool,showProfilePhotoEditSheet: null == showProfilePhotoEditSheet ? _self.showProfilePhotoEditSheet : showProfilePhotoEditSheet // ignore: cast_nullable_to_non_nullable
as bool,userData: freezed == userData ? _self.userData : userData // ignore: cast_nullable_to_non_nullable
as UserDataModel?,navigateToLogin: freezed == navigateToLogin ? _self.navigateToLogin : navigateToLogin // ignore: cast_nullable_to_non_nullable
as bool?,showLanguageSheet: freezed == showLanguageSheet ? _self.showLanguageSheet : showLanguageSheet // ignore: cast_nullable_to_non_nullable
as bool?,selectedImage: freezed == selectedImage ? _self.selectedImage : selectedImage // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
