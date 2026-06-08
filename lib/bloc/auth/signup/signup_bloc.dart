import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:intl_phone_field/countries.dart';

import 'package:santvani_app/data/repository/auth_repo.dart';
import 'package:santvani_app/data/api/either.dart';
import 'package:santvani_app/data/errors/failure.dart';

import 'package:santvani_app/utils/app_enums.dart';

part 'signup_bloc.freezed.dart';

part 'signup_event.dart';

part 'signup_state.dart';

class SignUpBloc
    extends Bloc<SignUpEvent, SignUpState> {
  final AuthRepo authRepo;

  final FocusNode fNameFocus =
  FocusNode();

  final FocusNode lNameFocus =
  FocusNode();

  final FocusNode emailFocus =
  FocusNode();

  final FocusNode mobileFocus =
  FocusNode();

  final FocusNode addressFocus =
  FocusNode();

  final GlobalKey<FormState>
  signUpFormKey =
  GlobalKey<FormState>();

  SignUpBloc({
    required this.authRepo,
  }) : super(SignUpState.initial()) {
    on<OnChangeCountry>(
          (
          final OnChangeCountry event,
          final Emitter<SignUpState>
          emit,
          ) {
        emit(
          state.copyWith(
            countryCode:
            event
                .selectedCountry
                .dialCode,
          ),
        );

        emit(
          state.copyWith(
            countryISOCode:
            event
                .selectedCountry
                .code,
          ),
        );
      },
    );

    on<OnChangeFirstName>(
          (
          final OnChangeFirstName
          event,
          final Emitter<SignUpState>
          emit,
          ) {
        emit(
          state.copyWith(
            firstName:
            event.fName,
          ),
        );
      },
    );

    on<OnChangeLastName>(
          (
          final OnChangeLastName
          event,
          final Emitter<SignUpState>
          emit,
          ) {
        emit(
          state.copyWith(
            lastName:
            event.lName,
          ),
        );
      },
    );

    on<OnChangeEmail>(
          (
          final OnChangeEmail event,
          final Emitter<SignUpState>
          emit,
          ) {
        emit(
          state.copyWith(
            email: event.email,
          ),
        );
      },
    );

    on<OnChangeMobileNumber>(
          (
          final OnChangeMobileNumber
          event,
          final Emitter<SignUpState>
          emit,
          ) {
        emit(
          state.copyWith(
            mobileNumber:
            event.mobileNumber,
          ),
        );
      },
    );

    on<OnChangeAddress>(
          (
          final OnChangeAddress
          event,
          final Emitter<SignUpState>
          emit,
          ) {
        emit(
          state.copyWith(
            address:
            event.address,
          ),
        );
      },
    );

    on<OnSelectBirthDate>(
          (
          final OnSelectBirthDate
          event,
          final Emitter<SignUpState>
          emit,
          ) {
        emit(
          state.copyWith(
            birthDate:
            event.birthDate,
          ),
        );
      },
    );

    on<OnSelectGender>(
          (
          final OnSelectGender event,
          final Emitter<SignUpState>
          emit,
          ) {
        emit(
          state.copyWith(
            genderId:
            event.genderId,
          ),
        );
      },
    );

    on<OnSelectCountry>(
          (
          final OnSelectCountry
          event,
          final Emitter<SignUpState>
          emit,
          ) {
        emit(
          state.copyWith(
            countryId:
            event.countryId,
          ),
        );
      },
    );

    on<OnSelectUserType>(
          (
          final OnSelectUserType
          event,
          final Emitter<SignUpState>
          emit,
          ) {
        emit(
          state.copyWith(
            userType:
            event.userType,
          ),
        );
      },
    );

    on<OnSelectServiceCategory>(
          (
          final OnSelectServiceCategory
          event,
          final Emitter<SignUpState>
          emit,
          ) {
        emit(
          state.copyWith(
            serviceCategoryId:
            event
                .serviceCategoryId,
          ),
        );
      },
    );

    on<OnSelectDistributor>(
      (final OnSelectDistributor event, final Emitter<SignUpState> emit) {
        emit(
          state.copyWith(
            selectedDistributorId: event.id,
            selectedDistributorName: event.name,
          ),
        );
      },
    );

    on<OnLoadDistributors>(
      (final OnLoadDistributors event, final Emitter<SignUpState> emit) async {
        final Either<Failure, List<Map<String, dynamic>>> result =
            await authRepo.getDistributors();
        result.fold(
          (final Failure failure) {
            emit(
              state.copyWith(
                errorMessage: failure.message,
              ),
            );
          },
          (final List<Map<String, dynamic>> distributors) {
            emit(
              state.copyWith(
                distributorList: distributors,
              ),
            );
          },
        );
      },
    );

    on<OnLoadDistributorsSuccess>(
      (final OnLoadDistributorsSuccess event, final Emitter<SignUpState> emit) {
        emit(
          state.copyWith(
            distributorList: event.distributors,
          ),
        );
      },
    );

    on<OnLoadDistributorsError>(
      (final OnLoadDistributorsError event, final Emitter<SignUpState> emit) {
        emit(
          state.copyWith(
            errorMessage: event.message,
          ),
        );
      },
    );
    add(const OnLoadDistributors());
  }

  @override
  Future<void> close() {
    fNameFocus.dispose();

    lNameFocus.dispose();

    emailFocus.dispose();

    mobileFocus.dispose();

    addressFocus.dispose();

    return super.close();
  }
}
