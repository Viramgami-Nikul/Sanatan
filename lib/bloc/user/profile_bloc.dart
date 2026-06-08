import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:intl_phone_field/countries.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:santvani_app/bloc/tab_navigation_cubit.dart';

import 'package:santvani_app/data/api/either.dart';

import 'package:santvani_app/data/errors/failure.dart';

import 'package:santvani_app/data/models/others/profile_options_model.dart';

import 'package:santvani_app/data/models/response_model/auth/user_data_model.dart';

import 'package:santvani_app/data/repository/auth_repo.dart';

import 'package:santvani_app/data/repository/user_repo.dart';

import 'package:santvani_app/routes/routes_name.dart';

import 'package:santvani_app/theme/app_colors.dart';

import 'package:santvani_app/utils/app_enums.dart';

import 'package:santvani_app/utils/constants.dart';

part 'profile_bloc.freezed.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UserRepo userRepo;

  final AuthRepo authRepo;


  String selectedImage = '';

  final List<Country> arrCountries = [...countries];

  ProfileBloc(this.authRepo, {required this.userRepo})
    : super(ProfileState.initial()) {
    on<OnGetUserProfile>((
      final OnGetUserProfile event,
      final Emitter<ProfileState> emit,
    ) async {
      final UserDataModel? localUser = sharedPreferenceHelper.user;
      if (localUser != null) {
        emit(state.copyWith(status: CommonScreenState.success, userData: localUser));
      } else {
        emit(state.copyWith(status: CommonScreenState.loading, userData: null));
      }

      final Either<Failure, UserDataModel> result = await userRepo
          .getUserProfileApi();

      result.fold(
        (final Failure error) {
          debugPrint('error message ${error.message}');
          if (state.userData == null) {
            emit(
              state.copyWith(
                status: CommonScreenState.error,
                userData: null,
                errorMessage: error.message,
              ),
            );
          }
        },
        (final UserDataModel user) {
          user.authToken = sharedPreferenceHelper.user?.authToken;
          sharedPreferenceHelper.saveUser(user);
          emit(
            state.copyWith(status: CommonScreenState.success, userData: user),
          );
        },
      );
    });

    on<OnTapLogout>((
      final OnTapLogout event,
      final Emitter<ProfileState> emit,
    ) async {
      emit(state.copyWith(showLogoutSheet: true));

      await Future<dynamic>.delayed(const Duration(milliseconds: 200));

      emit(state.copyWith(showLogoutSheet: false));
    });

    on<CallLogoutApi>((
      final CallLogoutApi event,
      final Emitter<ProfileState> emit,
    ) async {
      emit(state.copyWith(status: CommonScreenState.loading));

      final Map<String, dynamic> params = <String, dynamic>{
        'authToken': sharedPreferenceHelper.user?.authToken,

        'userRegistrationId': sharedPreferenceHelper.user?.userRegistrationId,
      };

      final Either<Failure, int?> result = await authRepo.apiLogout(
        requestParams: params,
      );

      result.fold(
        (final Failure error) {
          debugPrint('error message ${error.message}');

          emit(
            state.copyWith(
              status: CommonScreenState.error,

              errorMessage: error.message,
            ),
          );
        },

        (final int? statusCode) async {
          sharedPreferenceHelper.clear();

          emit(
            state.copyWith(
              status: CommonScreenState.success,

              navigateToLogin: true,
            ),
          );
        },
      );
    });

    on<OnTapEditProfilePhoto>((
      final OnTapEditProfilePhoto event,
      final Emitter<ProfileState> emit,
    ) async {
      emit(state.copyWith(showProfilePhotoEditSheet: true));

      await Future<dynamic>.delayed(const Duration(milliseconds: 200));

      emit(state.copyWith(showProfilePhotoEditSheet: false));
    });

    on<OnSelectProfilePhoto>((
      final OnSelectProfilePhoto event,
      final Emitter<ProfileState> emit,
    ) async {
      emit(state.copyWith(selectedImage: event.imagePath));

      add(UploadProfileImage(imagePath: event.imagePath));
    });

    on<UploadProfileImage>((
      final UploadProfileImage event,
      final Emitter<ProfileState> emit,
    ) async {
      try {
        debugPrint('=== UPLOAD PROFILE IMAGE STARTED ===');
        emit(state.copyWith(status: CommonScreenState.loading));

        final User? user = FirebaseAuth.instance.currentUser;
        debugPrint('Firebase User: ${user?.uid}');

        if (user == null) {
          emit(
            state.copyWith(
              status: CommonScreenState.error,
              errorMessage: 'User is not logged in',
            ),
          );
          return;
        }

        final File imageFile = File(event.imagePath);
        debugPrint('Image file path: ${event.imagePath}');
        debugPrint('Image file exists: ${imageFile.existsSync()}');

        final String fileName =
            'profile_images/${user.uid}_${DateTime.now().millisecondsSinceEpoch}.jpg';
        debugPrint('Uploading to: $fileName');

        final Reference storageRef = FirebaseStorage.instance.ref().child(fileName);
        debugPrint('Storage ref path: ${storageRef.fullPath}');

        final UploadTask uploadTask = storageRef.putFile(imageFile);
        debugPrint('Upload task started');

        final TaskSnapshot snapshot = await uploadTask.whenComplete(() {});
        debugPrint('Upload task completed');

        final String downloadUrl = await snapshot.ref.getDownloadURL();
        debugPrint('Download URL: $downloadUrl');

        debugPrint('Updating Firestore user document');
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .update({
              'profile_image': downloadUrl,
              'photoUrl': downloadUrl,
              'updated_at': FieldValue.serverTimestamp(),
              'updatedAt': FieldValue.serverTimestamp(),
            });
        debugPrint('Firestore document updated');

        debugPrint('Fetching updated user profile');
        final Either<Failure, UserDataModel> result = await userRepo
            .getUserProfileApi();

        result.fold(
          (final Failure error) {
            debugPrint('Error fetching user profile: ${error.message}');
            emit(
              state.copyWith(
                status: CommonScreenState.error,
                errorMessage: error.message,
              ),
            );
          },
          (final UserDataModel userData) {
            debugPrint('User profile fetched, profile image: ${userData.profileImage}');
            userData.authToken = sharedPreferenceHelper.user?.authToken;
            sharedPreferenceHelper.saveUser(userData);
            emit(
              state.copyWith(
                status: CommonScreenState.success,
                userData: userData,
              ),
            );
          },
        );
        debugPrint('=== UPLOAD PROFILE IMAGE COMPLETED ===');
      } catch (e, stacktrace) {
        debugPrint('Error uploading profile image: $e');
        debugPrint('Stacktrace: $stacktrace');
        emit(
          state.copyWith(
            status: CommonScreenState.error,
            errorMessage: 'Failed to upload profile image',
          ),
        );
      }
    });

    on<OnTapChangeLanguage>((
      final OnTapChangeLanguage event,
      final Emitter<ProfileState> emit,
    ) async {
      emit(state.copyWith(showLanguageSheet: true));

      await Future<dynamic>.delayed(const Duration(milliseconds: 200));

      emit(state.copyWith(showLanguageSheet: false));
    });
  }

  Future<void> navigateToLoginScreen(final BuildContext context) async {
    await Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(
      RouteName.loginScreen,

      (final Route route) => false,
    );
  }

  List<ProfileOptionsModel> get arrProfileOptions => <ProfileOptionsModel>[
    ProfileOptionsModel(
      icon: Icon(Icons.person, color: AppColors.color4478D1),

      option: ProfileOption.myProfile,

      onTap: (final BuildContext context) {
        navigateToProfileDetails(context);
      },
    ),

    ProfileOptionsModel(
      icon: Icon(Icons.location_city_rounded, color: AppColors.color4478D1),

      option: ProfileOption.addressDetails,

      onTap: (final BuildContext context) {
        navigateToAddressDetails(context);
      },
    ),

    ProfileOptionsModel(
      icon: Icon(Icons.language_rounded, color: AppColors.color4478D1),

      option: ProfileOption.changeLanguage,

      onTap: (final BuildContext context) {
        context.read<ProfileBloc>().add(OnTapChangeLanguage());
      },
    ),

    ProfileOptionsModel(
      icon: Icon(Icons.folder_copy_rounded, color: AppColors.color4478D1),

      option: ProfileOption.myEvidence,

      onTap: (final BuildContext context) {
        navigateToMyEvidence(context);
      },
    ),

    ProfileOptionsModel(
      icon: Icon(Icons.logout_rounded, color: AppColors.colorError500),

      option: ProfileOption.logout,

      onTap: (final BuildContext context) {
        context.read<ProfileBloc>().add(OnTapLogout());
      },
    ),
  ];

  void navigateToProfileDetails(final BuildContext context) {
    Navigator.pushNamed(
      context,
      RouteName.profileDetailsScreen,
    ).then((final _) {
      add(const OnGetUserProfile());
    });
  }

  void navigateToAddressDetails(final BuildContext context) {
    Navigator.pushNamed(
      context,
      RouteName.addressDetailsScreen,
    );
  }

  void navigateToMyEvidence(final BuildContext context) {
    Navigator.pushNamed(
      context,
      RouteName.myEvidenceScreen,
    );
  }
}
