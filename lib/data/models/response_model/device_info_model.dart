class DeviceInfoModel {
  String? userDeviceId;
  String? userDeviceName;
  String? deviceId;
  String? appName;
  String? deviceType;
  String? deviceTypeID;

  DeviceInfoModel(
      {this.userDeviceId,
        this.userDeviceName,
        this.deviceId,
        this.appName,
        this.deviceType,
        this.deviceTypeID});

  DeviceInfoModel.fromJson(final Map<String, dynamic> json) {
    userDeviceId = json['user_device_id'];
    userDeviceName = json['user_device_name'];
    deviceId = json['device_id'] ?? '';
    appName = json['app_name'] ?? '';
    deviceType = json['device_type'] ?? '';
    deviceTypeID = json['device_type_id'] ?? '';
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'user_device_id': userDeviceId,
      'user_device_name': userDeviceName,
      'device_id': deviceId,
      'app_name': appName,
      'device_type': deviceType,
      'device_type_id': deviceTypeID,
    };
  }
}
