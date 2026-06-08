class LoginRequestModel {
  final String? emailId;
  final String? userPassword;
  final String? appVersion;
  final String? deviceToken;
  final String? deviceType;
  final String? deviceId;
  final String? deviceName;

  LoginRequestModel({
    this.emailId,
    this.userPassword,
    this.appVersion,
    this.deviceToken,
    this.deviceType,
    this.deviceId,
    this.deviceName,
  });

  Map<String, dynamic> toJson() {
    return {
      'email_id': emailId,
      'user_password': userPassword,
      'app_version': appVersion,
      'device_token': deviceToken,
      'device_type': deviceType,
      'device_id': deviceId,
      'device_name': deviceName,
    };
  }
}
