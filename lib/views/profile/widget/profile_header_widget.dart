import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:santvani_app/bloc/user/profile_bloc.dart';

import 'package:santvani_app/gen/assets.gen.dart';

import 'package:santvani_app/helper/extension/localization_extension.dart';

import 'package:santvani_app/helper/extension/string_ext.dart';

import 'package:santvani_app/theme/app_colors.dart';

import 'package:santvani_app/theme/font_styles.dart';

import 'package:santvani_app/utils/utils.dart';
import 'package:santvani_app/utils/app_enums.dart';

import 'package:santvani_app/views/profile/widget/profile_image_widget.dart';

class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({super.key});

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (
          final BuildContext context,
          final ProfileState state,
          ) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            /// Profile Image
            Align(
              alignment: Alignment.center,
              child: ProfileImageWidget(
                imageUrl:
                (state.status == CommonScreenState.loading && (state.selectedImage?.isNotNullAndEmpty() ?? false))
                    ? state.selectedImage ?? ''
                    : state.userData?.userProfileImageUrl ??
                    '',
                canEdit: true,
                onTapCamera: () {
                  context.read<ProfileBloc>().add(
                    OnTapEditProfilePhoto(),
                  );
                },
              ),
            ),

            16.h,

            /// User Name
            Text(
              (state.userData?.fullName ?? 'Guest User'.tr(context))
                  .capitalize(),
              textAlign: TextAlign.center,
              style: dMSansW700.copyWith(
                fontSize: 24,
                color: AppColors.white,
              ),
            ),

            8.h,

            /// Email
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Assets.svg.icEmail.svg(
                  height: 18,
                  width: 18,
                  colorFilter: ColorFilter.mode(
                    AppColors.white,
                    BlendMode.srcIn,
                  ),
                ),

                8.w,

                Flexible(
                  child: Text(
                    state.userData?.emailId ??
                        'example@gmail.com',
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: dMSansW400.copyWith(
                      fontSize: 14,
                      color: AppColors.white.withOpacity(0.90),
                    ),
                  ),
                ),
              ],
            ),

            6.h,

            /// Mobile Number
            if ((state.userData?.mobileNumber ?? '')
                .isNotEmpty)
              Row(
                mainAxisAlignment:
                MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.phone,
                    color: AppColors.white,
                    size: 16,
                  ),

                  6.w,

                  Text(
                    state.userData?.mobileNumber ??
                        '',
                    style: dMSansW400.copyWith(
                      fontSize: 13,
                      color: AppColors.white
                          .withOpacity(0.85),
                    ),
                  ),
                ],
              ),
          ],
        );
      },
    );
  }
}
