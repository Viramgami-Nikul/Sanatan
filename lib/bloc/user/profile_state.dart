part of 'profile_bloc.dart';

@freezed
abstract class ProfileState
    with _$ProfileState {
  factory ProfileState({
    required CommonScreenState
    status,

    required bool
    showLogoutSheet,

    required bool
    showProfilePhotoEditSheet,

    UserDataModel?
    userData,

    bool? navigateToLogin,

    bool? showLanguageSheet,

    String? selectedImage,

    String? errorMessage,
  }) = _ProfileState;

  factory ProfileState
      .initial() {
    return ProfileState(
      status:
      CommonScreenState
          .loading,

      showLogoutSheet:
      false,

      showProfilePhotoEditSheet:
      false,

      userData: null,

      navigateToLogin:
      false,

      showLanguageSheet:
      false,

      selectedImage:
      null,

      errorMessage:
      null,
    );
  }
}
