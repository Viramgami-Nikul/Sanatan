import 'package:bloc/bloc.dart';

import 'package:flutter/cupertino.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:santvani_app/utils/utils.dart';

import 'package:santvani_app/data/api/either.dart';

import 'package:santvani_app/data/errors/failure.dart';

import 'package:santvani_app/data/models/request_model/signup_request_model.dart';

import 'package:santvani_app/data/models/response_model/device_info_model.dart';

import 'package:santvani_app/data/repository/auth_repo.dart';

import 'package:santvani_app/utils/app_enums.dart';

part 'signu_up_details_bloc.freezed.dart';

part 'signu_up_details_event.dart';

part 'signu_up_details_state.dart';

class SignUpDetailsBloc
    extends Bloc<
        SignUpDetailsEvent,
        SignUpDetailsState
    > {
  final FocusNode passwordFocus =
  FocusNode();

  final FocusNode cPasswordFocus =
  FocusNode();

  final FocusNode answerFocus =
  FocusNode();

  final GlobalKey<FormState>
  signUpFormKey =
  GlobalKey<FormState>();

  final AuthRepo authRepo;

  SignupRequest signupRequest =
  SignupRequest();

  SignUpDetailsBloc({
    required this.authRepo,
  }) : super(
    SignUpDetailsState.initial(),
  ) {
    on<InitialEvent>(
          (
          final InitialEvent event,
          final Emitter<
              SignUpDetailsState
          >
          emit,
          ) {
        signupRequest =
            event.signupRequest;
      },
    );

    on<OnChangePassword>(
          (
          final OnChangePassword event,
          final Emitter<
              SignUpDetailsState
          >
          emit,
          ) {
        emit(
          state.copyWith(
            password:
            event.password,
          ),
        );
      },
    );

    on<OnChangeConfirmPassword>(
          (
          final OnChangeConfirmPassword
          event,
          final Emitter<
              SignUpDetailsState
          >
          emit,
          ) {
        emit(
          state.copyWith(
            confirmPassword:
            event.confirmPassword,
          ),
        );
      },
    );

    on<OnSelectQuestion>(
          (
          final OnSelectQuestion
          event,
          final Emitter<
              SignUpDetailsState
          >
          emit,
          ) async {
        emit(
          state.copyWith(
            securityQuestionId:
            event.questionId,
          ),
        );
      },
    );

    on<OnChangeAnswer>(
          (
          final OnChangeAnswer event,
          final Emitter<
              SignUpDetailsState
          >
          emit,
          ) async {
        emit(
          state.copyWith(
            securityAnswer:
            event.answer,
          ),
        );
      },
    );

    on<OnCheckPrivacyPolicy>(
          (
          final OnCheckPrivacyPolicy
          event,
          final Emitter<
              SignUpDetailsState
          >
          emit,
          ) async {
        emit(
          state.copyWith(
            checkPrivacyPolicy:
            event
                .checkPrivacyPolicy,
          ),
        );
      },
    );

    on<OnCheckTermsAndCondition>(
          (
          final OnCheckTermsAndCondition
          event,
          final Emitter<
              SignUpDetailsState
          >
          emit,
          ) async {
        emit(
          state.copyWith(
            checkTermsAndCondition:
            !state
                .checkTermsAndCondition,
          ),
        );
      },
    );

    on<OnTapSubmit>(
          (
          final OnTapSubmit event,
          final Emitter<
              SignUpDetailsState
          >
          emit,
          ) async {
        await callSignUpApi(
          emit,
        );
      },
    );
  }

  Future<void> callSignUpApi(
      final Emitter<
          SignUpDetailsState
      >
      emit,
      ) async {
    debugPrint('=== callSignUpApi CALLED ===');
    emit(
      state.copyWith(
        status:
        CommonScreenState
            .loading,
      ),
    );

    debugPrint('Getting device info');
    final DeviceInfoModel
    deviceData =
    await Utils.getDeviceInfo();

    debugPrint('Building updated signup request');
    final SignupRequest
    updatedSignupRequest =
    signupRequest.copyWith(
      userPassword:
      state.password,

      securityQuestion:
      state.questionList[state
          .securityQuestionId ??
          0]['value'],

      securityAnswer:
      state.securityAnswer,

      privacyPolicy:
      state
          .checkPrivacyPolicy,

      termsAndConditions:
      state
          .checkTermsAndCondition,

      createdByDeviceName:
      deviceData
          .userDeviceName,

      createdByDeviceTypeId:
      deviceData.deviceTypeID,
    );

    final SignupRequest request =
        updatedSignupRequest;

    debugPrint(
      'signupRequest => $request',
    );

    debugPrint('Calling authRepo.apiSignUp');
    final Either<
        Failure,
        int?
    >
    result =
    await authRepo.apiSignUp(
      requestParams: request,
    );

    result.fold(
          (
          final Failure error,
          ) {
        debugPrint('API Signup failed: ${error.message}');
        emit(
          state.copyWith(
            status:
            CommonScreenState
                .error,

            errorMessage:
            error.message,
          ),
        );
      },

          (
          final int? statusCode,
          ) {
        debugPrint('API Signup success: statusCode=$statusCode');
        if (statusCode == 200 ||
            statusCode == 201) {
          emit(
            state.copyWith(
              status:
              CommonScreenState
                  .success,
            ),
          );
        } else {
          emit(
            state.copyWith(
              status:
              CommonScreenState
                  .error,

              errorMessage:
              'Registration Failed',
            ),
          );
        }
      },
    );
  }

  @override
  Future<void> close() {
    passwordFocus.dispose();

    cPasswordFocus.dispose();

    answerFocus.dispose();

    return super.close();
  }
}
