part of 'signup_bloc.dart';

@freezed
abstract class SignUpEvent
    with _$SignUpEvent {
  const factory
  SignUpEvent.onChangeCountry({
    required Country
    selectedCountry,
  }) = OnChangeCountry;

  const factory
  SignUpEvent.onChangeFirstName({
    required String fName,
  }) = OnChangeFirstName;

  const factory
  SignUpEvent.onChangeLastName({
    required String lName,
  }) = OnChangeLastName;

  const factory
  SignUpEvent.onChangeEmail({
    required String email,
  }) = OnChangeEmail;

  const factory
  SignUpEvent.onChangeMobileNumber({
    required String
    mobileNumber,
  }) = OnChangeMobileNumber;

  const factory
  SignUpEvent.onSelectBirthDate({
    required String birthDate,
  }) = OnSelectBirthDate;

  const factory
  SignUpEvent.onSelectGender({
    required int genderId,
  }) = OnSelectGender;

  const factory
  SignUpEvent.onChangeAddress({
    required String address,
  }) = OnChangeAddress;

  const factory
  SignUpEvent.onSelectCountry({
    required int countryId,
  }) = OnSelectCountry;

  const factory
  SignUpEvent.onSelectUserType({
    required String userType,
  }) = OnSelectUserType;

  const factory
  SignUpEvent.onSelectDistributor({
    required String? id,
    required String? name,
  }) = OnSelectDistributor;

  const factory
  SignUpEvent.onLoadDistributors() = OnLoadDistributors;

  const factory
  SignUpEvent.onLoadDistributorsSuccess({
    required List<Map<String, dynamic>> distributors,
  }) = OnLoadDistributorsSuccess;

  const factory
  SignUpEvent.onLoadDistributorsError({
    required String message,
  }) = OnLoadDistributorsError;

  const factory
  SignUpEvent.onSelectServiceCategory({
    required int
    serviceCategoryId,
  }) = OnSelectServiceCategory;
}
