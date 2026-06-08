import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';

import 'package:santvani_app/components/user_default_avatar_widget.dart';

import 'package:santvani_app/helper/extension/string_ext.dart';

import 'package:santvani_app/theme/app_colors.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({
    super.key,
    required this.imageUrl,
    required this.canEdit,
    this.onTapCamera,
  });

  final String imageUrl;
  final bool canEdit;
  final VoidCallback? onTapCamera;

  @override
  Widget build(final BuildContext context) {
    return GestureDetector(
      onTap: canEdit ? onTapCamera : null,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: <Widget>[
          /// Profile Image
          imageUrl.isNotNullAndEmpty()
              ? imageUrl.isNetworkUrl()
              ? _networkImage()
              : _localImage()
              : _placeholder(),

          /// Edit Button
          if (canEdit)
            Positioned(
              bottom: 2,
              right: 2,
              child: Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.colorPrimary500,
                    width: 1.5,
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: AppColors.black.withOpacity(0.15),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.camera_alt_rounded,
                  color: AppColors.color4478D1,
                  size: 18,
                ),
              ),
            ),
        ],
      ),
    );
  }

  /// Network Image
  Widget _networkImage() {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (
          final BuildContext context,
          final ImageProvider<Object> imageProvider,
          ) {
        return _imageContainer(
          child: Image(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        );
      },
      placeholder: (
          final BuildContext context,
          final String url,
          ) {
        return _placeholder();
      },
      errorWidget: (
          final BuildContext context,
          final String url,
          final Object error,
          ) {
        return _placeholder();
      },
    );
  }

  /// Local File Image
  Widget _localImage() {
    return _imageContainer(
      child: Image.file(
        File(imageUrl),
        fit: BoxFit.cover,
      ),
    );
  }

  /// Common Image Container
  Widget _imageContainer({
    required Widget child,
  }) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.white,
          width: 3,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: AppColors.black.withOpacity(0.10),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipOval(
        child: child,
      ),
    );
  }

  /// Placeholder Avatar
  Widget _placeholder() {
    return UserDefaultAvatar(
      size: 100,
      borderRadius: 50,
      border: Border.all(
        color: AppColors.white,
        width: 3,
      ),
    );
  }
}
