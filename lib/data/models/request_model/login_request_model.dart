import 'package:equatable/equatable.dart';

class LoginRequestModel extends Equatable {
  String? emailId;
  String? userPassword;
  String? appVersion;
  String? deviceToken;
  String? deviceType;
  String? deviceId;
  String? deviceName;

  LoginRequestModel({
    required this.emailId,
    required this.userPassword,
    required this.appVersion,
    required this.deviceToken,
    required this.deviceType,
    required this.deviceId,
    required this.deviceName,
  });

  LoginRequestModel.empty()
      : this(
    emailId: '_empty.emailId',
    userPassword: '_empty.userPassword',
    appVersion: '_empty.appVersion',
    deviceToken: '_empty.deviceToken',
    deviceType: '_empty.deviceType',
    deviceId: '_empty.deviceId',
    deviceName: '_empty.deviceName',
  );

  LoginRequestModel.fromJson(final Map<String, dynamic> json) {
    emailId = json['emailId'];
    userPassword = json['userPassword'];
    appVersion = json['appVersion'];
    deviceToken = json['deviceToken'];
    deviceType = json['deviceType'];
    deviceId = json['deviceId'];
    deviceName = json['deviceName'];
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'emailId': emailId,
      'userPassword': userPassword,
      'appVersion': appVersion,
      'deviceToken': deviceToken,
      'deviceType': deviceType,
      'deviceId': deviceId,
      'deviceName': deviceName,
    };
  }

  @override
  String toString() {
    return toJson().toString();
  }

  @override
  // TODO: implement props
  List<Object?> get props => [emailId];
}
