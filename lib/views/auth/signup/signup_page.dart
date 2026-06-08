import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:santvani_app/bloc/auth/signup/signup_bloc.dart';
import 'package:santvani_app/components/common_app_bar.dart';
import 'package:santvani_app/components/common_snack_bar.dart';
import 'package:santvani_app/data/repository/auth_repo.dart';
import 'package:santvani_app/helper/extension/widget_ext.dart';
import 'package:santvani_app/theme/status_bar_config.dart';
import 'package:santvani_app/utils/app_enums.dart';
import 'package:santvani_app/utils/app_strings.dart';
import 'package:santvani_app/views/auth/signup/widget/signup_form_widget.dart';
import 'package:santvani_app/views/auth/signup/widget/signup_header_widget.dart';
import 'package:santvani_app/views/auth/signup/widget/signup_next_button_widget.dart';

import '../../../helper/extension/localization_extension.dart';
import '../../../helper/extension/navigator_ext.dart';
import '../../../utils/utils.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(final BuildContext buildContext) {
    return BlocProvider<SignUpBloc>(
      create: (final BuildContext context) => SignUpBloc(
        authRepo: context.read<AuthRepo>(),
      ),
      child: BlocConsumer<SignUpBloc, SignUpState>(
        listener: (
          final BuildContext context,
          final SignUpState state,
        ) {
          if (state.status == CommonScreenState.success) {
            showSuccessSnackBar(
              AppMessages.registrationSuccess.message,
            );
            context.pop();
          }

          if (state.status == CommonScreenState.error) {
            showErrorSnackBar(
              state.errorMessage ??
                  AppStrings.somethingWentWrong.tr(context),
            );
          }
        },
        builder: (
          final BuildContext context,
          final SignUpState state,
        ) {
          final SignUpBloc bloc = context.read<SignUpBloc>();

          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: darkStatusBarTransparent,
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppbarWithBackIconAndTitle(),
              body: SafeArea(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: SingleChildScrollView(
                        child: Form(
                          key: bloc.signUpFormKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              const SignUpHeaderWidget(),
                              30.h,
                              const SignUpFormWidget(),
                            ],
                          ).paddingAll(20),
                        ),
                      ),
                    ),

                    20.h,

                    const SignUpNextButtonWidget(),

                    20.h,
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
