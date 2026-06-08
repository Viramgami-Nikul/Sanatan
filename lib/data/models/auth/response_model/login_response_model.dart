import '../../auth_user_model.dart';

class LoginResponseModel {
  final bool success;
  final String message;
  final String token;
  final AuthUserModel? user;

  LoginResponseModel({
    required this.success,
    required this.message,
    required this.token,
    this.user,
  });

  factory LoginResponseModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return LoginResponseModel(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      token: json['token'] ?? '',
      user: json['user'] != null
          ? AuthUserModel.fromJson(json['user'])
          : null,
    );
  }
}
