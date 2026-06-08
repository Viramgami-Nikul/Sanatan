import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:santvani_app/data/api/either.dart';
import 'package:santvani_app/data/errors/failure.dart';
import 'package:santvani_app/data/models/auth/request_model/otp_request_model.dart';
import 'package:santvani_app/data/models/response_model/auth/user_data_model.dart';
import 'package:santvani_app/data/repository/auth_repo.dart';
import 'package:santvani_app/utils/app_enums.dart';
import 'package:santvani_app/helper/pref_helper/shared_pref_helper.dart';

part 'otp_bloc.freezed.dart';
part 'otp_event.dart';
part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  OtpBloc({required this.authRepo}) : super(OtpState.initial()) {
    on<OnChangeEmailOrPhone>((
      final OnChangeEmailOrPhone event,
      final Emitter<OtpState> emit,
    ) {
      emit(state.copyWith(emailOrPhone: event.emailOrPhone));
    });

    on<OnChangeOtp>((
      final OnChangeOtp event,
      final Emitter<OtpState> emit,
    ) {
      emit(state.copyWith(otp: event.otp));
    });

    on<SendOtpEvent>((
      final SendOtpEvent event,
      final Emitter<OtpState> emit,
    ) async {
      emit(
        state.copyWith(
          status: CommonScreenState.loading,
          errorMessage: '',
        ),
      );

      final Either<Failure, String> result = await authRepo.sendLoginOtp(
        requestParams: OtpRequestModel(
          emailOrPhone: state.emailOrPhone.trim(),
        ),
      );

      result.fold(
        (final Failure error) {
          emit(
            state.copyWith(
              status: CommonScreenState.error,
              errorMessage: error.message,
            ),
          );
        },
        (final String verificationId) {
          final UserDataModel? loggedInUser = SharedPreferenceHelper().user;
          emit(
            state.copyWith(
              status: CommonScreenState.success,
              verificationId: verificationId,
              isOtpSent: verificationId.isNotEmpty,
              user: loggedInUser,
            ),
          );
        },
      );
    });

    on<VerifyOtpEvent>((
      final VerifyOtpEvent event,
      final Emitter<OtpState> emit,
    ) async {
      emit(
        state.copyWith(
          status: CommonScreenState.loading,
          errorMessage: '',
        ),
      );

      final Either<Failure, UserDataModel> result =
          await authRepo.verifyLoginOtp(
        requestParams: OtpRequestModel(
          emailOrPhone: state.emailOrPhone.trim(),
          otp: state.otp.trim(),
        ),
        verificationId: state.verificationId,
      );

      result.fold(
        (final Failure error) {
          emit(
            state.copyWith(
              status: CommonScreenState.error,
              errorMessage: error.message,
            ),
          );
        },
        (final UserDataModel user) {
          emit(
            state.copyWith(
              status: CommonScreenState.success,
              user: user,
            ),
          );
        },
      );
    });
  }

  final AuthRepo authRepo;
}
