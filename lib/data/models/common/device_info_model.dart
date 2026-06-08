class DeviceInfoModel {
  final String? userDeviceId;

  final String? userDeviceName;

  final String? deviceId;

  final String? appName;

  final String? deviceType;

  final String? deviceTypeId;

  DeviceInfoModel({
    this.userDeviceId,
    this.userDeviceName,
    this.deviceId,
    this.appName,
    this.deviceType,
    this.deviceTypeId,
  });

  factory DeviceInfoModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return DeviceInfoModel(
      userDeviceId:
      json['user_device_id'],

      userDeviceName:
      json['user_device_name'],

      deviceId:
      json['device_id'],

      appName:
      json['app_name'],

      deviceType:
      json['device_type'],

      deviceTypeId:
      json['device_type_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_device_id': userDeviceId,
      'user_device_name': userDeviceName,
      'device_id': deviceId,
      'app_name': appName,
      'device_type': deviceType,
      'device_type_id': deviceTypeId,
    };
  }
}
