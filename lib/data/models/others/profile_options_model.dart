import 'package:flutter/material.dart';

import 'package:santvani_app/utils/app_enums.dart';

class ProfileOptionsModel {
  ProfileOptionsModel({
    required this.icon,
    required this.option,
    required this.onTap,
  });

  final Widget icon;
  final ProfileOption option;
  final void Function(BuildContext context) onTap;
}
