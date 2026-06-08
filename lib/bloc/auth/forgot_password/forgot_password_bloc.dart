import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:santvani_app/data/api/either.dart';

import 'package:santvani_app/data/errors/failure.dart';

import 'package:santvani_app/data/repository/auth_repo.dart';

import 'package:santvani_app/helper/regex_helper.dart';

import 'package:santvani_app/utils/app_enums.dart';

part 'forgot_password_bloc.freezed.dart';

part 'forgot_password_event.dart';

part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final AuthRepo authRepo;

  final GlobalKey<FormState> forgotPasswordFormKey =
  GlobalKey<FormState>();

  ForgotPasswordBloc({required this.authRepo})
    : super(ForgotPasswordState.initial()) {
    on<OnTapSubmit>((
      final OnTapSubmit event,
      final Emitter<ForgotPasswordState> emit,
    ) async {
      if ((state.email ?? '').isEmpty) {
        emit(
          state.copyWith(
            status: CommonScreenState.error,

            errorMessage: 'Please enter email',
          ),
        );
      } else if (!RegexHelper.regexEmail.hasMatch(state.email ?? '')) {
        emit(
          state.copyWith(
            status: CommonScreenState.error,

            errorMessage: 'Please enter valid email',
          ),
        );
      } else {
        emit(state.copyWith(status: CommonScreenState.loading));

        final Either<Failure, int?> result = await authRepo.apiForgotPassword(
          email: state.email ?? '',
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

          (final int? statusCode) {
            emit(
              state.copyWith(
                status: statusCode == 200
                    ? CommonScreenState.success
                    : CommonScreenState.error,

                errorMessage: statusCode == 200 ? null : 'Something went wrong',
              ),
            );
          },
        );
      }
    });

    on<OnChangeEmail>((
      final OnChangeEmail event,
      final Emitter<ForgotPasswordState> emit,
    ) {
      emit(state.copyWith(email: event.email));
    });
  }
}
