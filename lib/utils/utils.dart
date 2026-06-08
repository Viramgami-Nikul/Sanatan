import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:santvani_app/components/permission_dialog.dart';
import 'package:santvani_app/data/models/response_model/device_info_model.dart';
import 'package:santvani_app/helper/extension/localization_extension.dart';
import 'package:santvani_app/theme/app_colors.dart';
import 'package:santvani_app/utils/app_enums.dart';
import 'package:santvani_app/utils/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class Utils {
  Utils._();

  static OutlineInputBorder inputBorder(final Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color, width: 1),
      borderRadius: BorderRadius.circular(12),
    );
  }

  static BoxDecoration borderBox({
    final Color? color,
    final Color? borderColor,
    final double? radius,
  }) {
    return BoxDecoration(
      color: color ?? AppColors.white,
      border: Border.all(
        color: borderColor ?? AppColors.baseColorWhite85,
      ),
      borderRadius: BorderRadius.circular(radius ?? 12),
    );
  }

  static String parseDateToFormat(
      final String date,
      final String format,
      ) {
    final DateTime dateTime = DateTime.parse(date);
    return DateFormat(format).format(dateTime);
  }

  static String formatDate(
      final DateTime date,
      final String format,
      ) {
    if (date == DateTime.parse('0001-01-01T00:00:00')) {
      return '';
    }

    return DateFormat(format).format(date);
  }

  static Future<PackageInfo> getPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();

    debugPrint('Package Name : ${info.packageName}');
    debugPrint('Version : ${info.version}');
    debugPrint('Build Number : ${info.buildNumber}');

    return info;
  }

  static Widget loaderBarrier() {
    return Opacity(
      opacity: 0.4,
      child: ModalBarrier(
        dismissible: false,
        color: Colors.black,
      ),
    );
  }

  static Widget loaderWidget() {
    return Center(
      child:
      Platform.isIOS
          ? CupertinoActivityIndicator(
        radius: 16,
        color: AppColors.colorPrimary500,
      )
          : CircularProgressIndicator(
        color: AppColors.colorPrimary500,
      ),
    );
  }

  static Widget loaderBrier() => loaderBarrier();

  static Widget loaderWid() => loaderWidget();

  static Future<DeviceInfoModel> getDeviceInfo() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

    Map<String, String?> data = <String, String?>{};

    if (Platform.isAndroid) {
      final AndroidDeviceInfo build =
      await deviceInfoPlugin.androidInfo;

      data = <String, String?>{
        'user_device_id': build.id,
        'user_device_name': build.brand,
        'device_id': build.device,
        'app_name': '${build.brand} ${build.model}',
        'device_type': 'android',
        'device_type_id': 'android-${build.id}',
      };
    } else if (Platform.isIOS) {
      final IosDeviceInfo build =
      await deviceInfoPlugin.iosInfo;

      data = <String, String?>{
        'user_device_id': build.identifierForVendor,
        'user_device_name': build.model,
        'device_id': build.identifierForVendor,
        'app_name': build.name,
        'device_type': 'ios',
        'device_type_id':
        'ios-${build.identifierForVendor}',
      };
    }

    return DeviceInfoModel.fromJson(data);
  }

  static Future<PermissionStatus> checkPhotosPermission(
      final BuildContext context,
      ) async {
    late Permission permission;

    if (Platform.isAndroid) {
      final AndroidDeviceInfo androidInfo =
      await DeviceInfoPlugin().androidInfo;

      if (androidInfo.version.sdkInt >= 33) {
        permission = Permission.photos;
      } else {
        permission = Permission.storage;
      }
    } else {
      permission = Permission.photos;
    }

    PermissionStatus status = await permission.status;

    if (status.isDenied) {
      status = await permission.request();
    }

    if (status.isPermanentlyDenied) {
      await showDialog<void>(
        context: context,
        builder:
            (final BuildContext context) => PermissionDialog(
          message:
          '${AppConstants.appName} ${'does not have access to your photos. To enable access, tap Settings and allow Photos permission.'.tr(context)}',
        ),
      );
    }

    return status;
  }

  static Future<PermissionStatus> checkCameraPermission(
      final BuildContext context,
      ) async {
    PermissionStatus status = await Permission.camera.status;

    if (status.isDenied) {
      status = await Permission.camera.request();
    }

    if (status.isPermanentlyDenied) {
      await showDialog<void>(
        context: context,
        builder:
            (final BuildContext context) => PermissionDialog(
          message:
          '${AppConstants.appName} ${'does not have access to your camera. To enable access, tap Settings and allow Camera permission.'.tr(context)}',
        ),
      );
    }

    return status;
  }

  static Future<XFile?> pickImage(
      final PhotoPickerType photoPickerType,
      ) async {
    try {
      final ImagePicker picker = ImagePicker();
      return picker.pickImage(
        source: photoPickerType == PhotoPickerType.camera
            ? ImageSource.camera
            : ImageSource.gallery,
      );
    } catch (e) {
      debugPrint('Image Picker Error : $e');
      return null;
    }
  }
}


extension EmptySpace on num {
  SizedBox get h => SizedBox(height: toDouble());

  SizedBox get w => SizedBox(width: toDouble());

  SizedBox get paddingTop => SizedBox(height: toDouble());

  SizedBox get paddingLeft => SizedBox(width: toDouble());
}
