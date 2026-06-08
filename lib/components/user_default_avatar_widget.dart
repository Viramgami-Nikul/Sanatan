import 'package:flutter/material.dart';
import 'package:santvani_app/theme/app_colors.dart';

class UserDefaultAvatar extends StatelessWidget {
  const UserDefaultAvatar({
    super.key,
    this.border,
    this.size,
    this.borderRadius,
  });

  final BoxBorder? border;
  final double? size;
  final double? borderRadius;

  @override
  Widget build(final BuildContext context) {
    return Container(
      width: size ?? 56,
      height: size ?? 56,
      decoration: BoxDecoration(
        border:
        border ??
            Border.all(
              color: AppColors.white.withValues(alpha: 0.5),
            ),
        borderRadius: BorderRadius.circular(
          borderRadius ?? 28,
        ),
      ),
      child: UserDefaultIcon(
        size: (size ?? 56) - 5,
      ),
    );
  }
}

class UserDefaultIcon extends StatelessWidget {
  const UserDefaultIcon({
    super.key,
    this.size,
  });

  final double? size;

  @override
  Widget build(final BuildContext context) {
    return Center(
      child: Icon(
        Icons.person,
        color: AppColors.white.withValues(alpha: 0.5),
        size: size,
      ),
    );
  }
}
