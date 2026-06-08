import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:santvani_app/utils/utils.dart';
import 'package:santvani_app/bloc/privacy_policy/privacy_policy_bloc.dart';
import 'package:santvani_app/components/common_app_bar.dart';
import 'package:santvani_app/helper/extension/widget_ext.dart';
import 'package:santvani_app/theme/app_colors.dart';
import 'package:santvani_app/theme/font_styles.dart';
import 'package:santvani_app/theme/status_bar_config.dart';
import 'package:santvani_app/utils/app_enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    final Map<String, dynamic>? arguments =
    ModalRoute.of(context)?.settings.arguments
    as Map<String, dynamic>?;

    return BlocProvider<PrivacyPolicyBloc>(
      create:
          (final BuildContext context) =>
      PrivacyPolicyBloc()
        ..add(
          PrivacyPolicyEvent.initial(
            url: arguments?['policy'].url ?? '',
          ),
        ),
      child: BlocBuilder<PrivacyPolicyBloc, PrivacyPolicyState>(
        builder: (final BuildContext context, final PrivacyPolicyState state) {
          return Stack(
            children: <Widget>[
              SafeArea(
                child: AnnotatedRegion<SystemUiOverlayStyle>(
                  value: darkStatusBarTransparent,
                  child: Scaffold(
                    backgroundColor: AppColors.white,

                    /// APP BAR
                    appBar: PreferredSize(
                      preferredSize: const Size.fromHeight(70),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: AppColors.black.withValues(alpha: 0.05),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: SafeArea(
                          child: Row(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  height: 42,
                                  width: 42,
                                  decoration: BoxDecoration(
                                    color: AppColors.colorPrimary500
                                        .withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Icon(
                                    Icons.arrow_back_ios_new_rounded,
                                    color: AppColors.colorPrimary500,
                                    size: 20,
                                  ),
                                ),
                              ),

                              14.w,

                              Expanded(
                                child: Text(
                                  arguments?['policy'].title ?? '',
                                  style: dMSansW700.copyWith(
                                    fontSize: 20,
                                    color: AppColors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    /// BODY
                    body:
                    arguments?['policy'].url != null &&
                        arguments?['policy'].url != ''
                        ? Container(
                      margin: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: AppColors.black.withValues(
                              alpha: 0.05,
                            ),
                            blurRadius: 10,
                            spreadRadius: 2,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: WebViewWidget(
                          controller: state.controller,
                        ),
                      ),
                    )
                        : Center(
                      child: Text(
                        'No Content Available',
                        style: dMSansW500.copyWith(
                          fontSize: 16,
                          color: AppColors.baseColorWhite45,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              /// LOADER
              if (state.status == CommonScreenState.loading)
                Utils.loaderBrier(),

              if (state.status == CommonScreenState.loading)
                Utils.loaderWid(),
            ],
          );
        },
      ),
    );
  }
}
