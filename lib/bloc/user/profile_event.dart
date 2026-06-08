part of 'profile_bloc.dart';

@freezed
abstract class ProfileEvent
    with _$ProfileEvent {
  const factory
  ProfileEvent.getUserProfile() =
  OnGetUserProfile;

  const factory
  ProfileEvent.onTapLogout() =
  OnTapLogout;

  const factory
  ProfileEvent.callLogoutApi() =
  CallLogoutApi;

  const factory
  ProfileEvent.onTapChangeLanguage() =
  OnTapChangeLanguage;

  const factory
  ProfileEvent.onTapEditProfilePhoto() =
  OnTapEditProfilePhoto;

  const factory
  ProfileEvent.onSelectProfilePhoto({
    required String imagePath,
  }) = OnSelectProfilePhoto;
  
  const factory
  ProfileEvent.uploadProfileImage({
    required String imagePath,
  }) = UploadProfileImage;
}
