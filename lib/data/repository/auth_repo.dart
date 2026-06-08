
import '../api/either.dart';
import '../errors/failure.dart';
import '../models/auth/request_model/forgot_password_request_model.dart';
import '../models/request_model/login_request_model.dart';
import '../models/auth/request_model/otp_request_model.dart';
import '../models/request_model/signup_request_model.dart';
import '../models/response_model/auth/user_data_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserDataModel>> apiLogin({
    required LoginRequestModel requestParams,
  });

  Future<Either<Failure, bool>> apiSignup({
    required SignupRequest requestParams,
  });

  Future<Either<Failure, int?>> apiSignUp({
    required SignupRequest requestParams,
  });

  Future<Either<Failure, List<Map<String, dynamic>>>> getDistributors();

  Future<bool> forgotPassword(
      ForgotPasswordRequestModel request,
      );

  Future<Either<Failure, int?>> apiForgotPassword({
    required String email,
  });

  Future<bool> verifyOtp(
      OtpRequestModel request,
      );

  Future<Either<Failure, String>> sendLoginOtp({
    required OtpRequestModel requestParams,
  });

  Future<Either<Failure, UserDataModel>> verifyLoginOtp({
    required OtpRequestModel requestParams,
    required String verificationId,
  });

  Future<void> logout();

  Future<Either<Failure, int?>> apiLogout({
    required Map<String, dynamic> requestParams,
  });
}
