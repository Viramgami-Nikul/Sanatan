part of 'otp_bloc.dart';

@freezed
abstract class OtpEvent with _$OtpEvent {
  const factory OtpEvent.onChangeEmailOrPhone({
    required String emailOrPhone,
  }) = OnChangeEmailOrPhone;

  const factory OtpEvent.onChangeOtp({
    required String otp,
  }) = OnChangeOtp;

  const factory OtpEvent.sendOtp({
    required BuildContext context,
  }) = SendOtpEvent;

  const factory OtpEvent.verifyOtp({
    required BuildContext context,
  }) = VerifyOtpEvent;
}
