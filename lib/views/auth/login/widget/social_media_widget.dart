import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:santvani_app/components/common_button_widget.dart';
import 'package:santvani_app/utils/utils.dart';
import 'package:santvani_app/bloc/auth/social_media/social_media_bloc.dart';
import 'package:santvani_app/gen/assets.gen.dart';
import 'package:santvani_app/theme/app_colors.dart';
import 'package:santvani_app/theme/font_styles.dart';
import 'package:santvani_app/utils/app_enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialMediaWidget extends StatelessWidget {
  const SocialMediaWidget({super.key});

  @override
  Widget build(final BuildContext buildContext) {
    return BlocProvider<SocialMediaBloc>(
      create: (final BuildContext context) => SocialMediaBloc(),
      child: BlocBuilder<SocialMediaBloc, SocialMediaState>(
        builder: (final BuildContext context, final SocialMediaState state) {
          final SocialMediaBloc bloc = context.read<SocialMediaBloc>();

          return Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      color: AppColors.baseColorWhite85,
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      'Or Continue With',
                      style: dMSansW400.copyWith(
                        fontSize: 13,
                        color: AppColors.baseColorWhite45,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: AppColors.baseColorWhite85,
                      thickness: 1,
                    ),
                  ),
                ],
              ),

              24.h,

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: AppButton(
                      key: const Key('sign_up_with_google'),
                      bgColor: AppColors.white,
                      borderColor: AppColors.baseColorWhite85,
                      title: 'Google',
                      width: double.maxFinite,
                      height: 55,
                      isLoading:
                      state.status == CommonScreenState.initial &&
                          state.socialMediaStatus ==
                              SocialMediaLoginState.google,
                      icon: Assets.svg.icGoogle.svg(
                        width: 22,
                        height: 22,
                      ),
                      titleStyle: dMSansW600.copyWith(
                        color: AppColors.black,
                        fontSize: 15,
                      ),
                      loadingIndicatorColor:
                      AppColors.colorPrimary500,
                      onPressed: () async {
                        bloc.add(
                          SignUpWithGoogleEvent(context: context),
                        );
                      },
                      type: AppButtonType.primary,
                    ),
                  ),

                  if (Platform.isIOS) ...[
                    14.w,

                    Expanded(
                      child: AppButton(
                        bgColor: AppColors.black,
                        title: 'Apple',
                        width: double.maxFinite,
                        height: 55,
                        isLoading:
                        state.status == CommonScreenState.initial &&
                            state.socialMediaStatus ==
                                SocialMediaLoginState.apple,
                        icon: Assets.svg.icApple.svg(
                          width: 22,
                          height: 22,
                        ),
                        titleColor: AppColors.white,
                        loadingIndicatorColor:
                        AppColors.white,
                        onPressed: () {
                          bloc.add(
                            SignUpWithAppleEvent(context: context),
                          );
                        },
                        type: AppButtonType.primary,
                      ),
                    ),
                  ],
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
