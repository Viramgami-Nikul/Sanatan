import 'package:flutter/material.dart';

class ProfileOptionModel {
  final String title;

  final IconData icon;

  final VoidCallback? onTap;

  ProfileOptionModel({
    required this.title,
    required this.icon,
    this.onTap,
  });

  factory ProfileOptionModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return ProfileOptionModel(
      title: json['title'] ?? '',
      icon: Icons.person,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
    };
  }

  ProfileOptionModel copyWith({
    String? title,
    IconData? icon,
    VoidCallback? onTap,
  }) {
    return ProfileOptionModel(
      title: title ?? this.title,
      icon: icon ?? this.icon,
      onTap: onTap ?? this.onTap,
    );
  }
}
