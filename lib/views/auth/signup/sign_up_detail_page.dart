import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:santvani_app/components/common_button_widget.dart';
import 'package:santvani_app/components/common_app_bar.dart';
import 'package:santvani_app/components/common_snack_bar.dart';

import 'package:santvani_app/routes/routes_name.dart';

import 'package:santvani_app/utils/app_strings.dart';
import 'package:santvani_app/utils/utils.dart';
import 'package:santvani_app/utils/app_enums.dart';

import 'package:santvani_app/theme/status_bar_config.dart';

import 'package:santvani_app/helper/extension/localization_extension.dart';
import 'package:santvani_app/helper/extension/navigator_ext.dart';
import 'package:santvani_app/helper/extension/widget_ext.dart';

import 'package:santvani_app/bloc/auth/sign_up_details/signu_up_details_bloc.dart';

import 'package:santvani_app/data/models/request_model/signup_request_model.dart';

import 'package:santvani_app/data/repository/auth_repo.dart';

import 'package:santvani_app/views/auth/signup/widget/sign_up_details_form_widget.dart';

import 'package:santvani_app/views/auth/signup/widget/signup_header_widget.dart';

class SignUpDetailScreen extends StatelessWidget {
  const SignUpDetailScreen({
    super.key,
  });

  @override
  Widget build(final BuildContext buildContext) {
    final Object? arguments =
        ModalRoute.of(buildContext)?.settings.arguments;

    return BlocProvider<SignUpDetailsBloc>(
      create:
          (final BuildContext context) =>
      SignUpDetailsBloc(
        authRepo: context.read<AuthRepo>(),
      )..add(
        InitialEvent(
          signupRequest:
          arguments != null
              ? arguments as SignupRequest
              : SignupRequest(),
        ),
      ),

      child: BlocListener<
          SignUpDetailsBloc,
          SignUpDetailsState
      >(
        listener: (
            final BuildContext context,
            final SignUpDetailsState state,
            ) {
          if (state.status ==
              CommonScreenState.success) {
            showSuccessSnackBar(
              AppMessages.registrationSuccess.message,
            );

            Navigator.pushNamedAndRemoveUntil(
              context,
              RouteName.loginScreen,
              (final Route<dynamic> route) => false,
            );
          }

          if (state.status ==
              CommonScreenState.error) {
            showErrorSnackBar(
              state.errorMessage ??
                  AppStrings.somethingWentWrong.tr(
                    context,
                  ),
            );
          }
        },

        child: BlocBuilder<
            SignUpDetailsBloc,
            SignUpDetailsState
        >(
          builder: (
              final BuildContext context,
              final SignUpDetailsState state,
              ) {
            final SignUpDetailsBloc bloc =
            context.read<SignUpDetailsBloc>();

            return Stack(
              children: <Widget>[
                AnnotatedRegion<SystemUiOverlayStyle>(
                  value: darkStatusBarTransparent,

                  child: Scaffold(
                    appBar:
                    AppbarWithBackIconAndTitle(),

                    body: SafeArea(
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: SingleChildScrollView(
                              child: Form(
                                key: bloc.signUpFormKey,

                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment
                                      .center,

                                  crossAxisAlignment:
                                  CrossAxisAlignment
                                      .center,

                                  children: <Widget>[
                                    const SignUpHeaderWidget(),

                                    30.h,

                                    const SignUpDetailsFormWidget(),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          20.h,

                          AppButton(
                            key: const Key('submit'),

                            title:
                            AppStrings.submit.tr(
                              buildContext,
                            ),

                            width: double.maxFinite,

                            isLoading:
                            state.status ==
                                CommonScreenState
                                    .loading,

                            icon: null,

                            onPressed: () {
                              FocusScope.of(
                                context,
                              ).unfocus();

                              if (bloc
                                  .signUpFormKey
                                  .currentState
                                  ?.validate() ==
                                  true) {
                                bloc.add(
                                  OnTapSubmit(),
                                );
                              }
                            },

                            type:
                            AppButtonType.primary,
                          ).paddingSymmetric(
                            horizontal: 20,
                          ),

                          20.h,
                        ],
                      ).paddingAll(20),
                    ),
                  ),
                ),

                if (state.status ==
                    CommonScreenState.loading)
                  Utils.loaderBrier(),

                if (state.status ==
                    CommonScreenState.loading)
                  Utils.loaderWid(),
              ],
            );
          },
        ),
      ),
    );
  }
}
