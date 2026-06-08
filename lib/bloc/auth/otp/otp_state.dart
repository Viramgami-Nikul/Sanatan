part of 'otp_bloc.dart';

@freezed
abstract class OtpState with _$OtpState {
  factory OtpState({
    required CommonScreenState status,
    required String emailOrPhone,
    required String otp,
    required String verificationId,
    required bool isOtpSent,
    UserDataModel? user,
    String? errorMessage,
  }) = _OtpState;

  factory OtpState.initial() {
    return OtpState(
      status: CommonScreenState.initial,
      emailOrPhone: '',
      otp: '',
      verificationId: '',
      isOtpSent: false,
      user: null,
      errorMessage: null,
    );
  }
}
