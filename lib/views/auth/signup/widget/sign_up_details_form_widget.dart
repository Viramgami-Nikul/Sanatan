import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:santvani_app/bloc/auth/sign_up_details/signu_up_details_bloc.dart';
import 'package:santvani_app/components/common_dropdown_widget.dart';
import 'package:santvani_app/components/common_rich_text_widget.dart';
import 'package:santvani_app/components/common_text_field_widget.dart';
import 'package:santvani_app/helper/extension/localization_extension.dart';
import 'package:santvani_app/helper/extension/navigator_ext.dart';
import 'package:santvani_app/helper/validator.dart';
import 'package:santvani_app/routes/routes_name.dart';
import 'package:santvani_app/theme/app_colors.dart';
import 'package:santvani_app/theme/font_styles.dart';
import 'package:santvani_app/utils/app_enums.dart';
import 'package:santvani_app/utils/app_strings.dart';
import 'package:santvani_app/utils/utils.dart';

class SignUpDetailsFormWidget extends StatelessWidget
    with Validator {
  const SignUpDetailsFormWidget({super.key});

  @override
  Widget build(final BuildContext buildContext) {
    return BlocBuilder<
        SignUpDetailsBloc,
        SignUpDetailsState
    >(
      builder: (
          final BuildContext context,
          final SignUpDetailsState state,
          ) {
        final SignUpDetailsBloc bloc =
        context.read<SignUpDetailsBloc>();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AppTextField(
              key: const Key('signup_password_field'),
              type: TextFieldTypes.password,
              title: AppStrings.password,
              initialValue: state.password,
              strHeaderTitle:
              AppStrings.password.tr(buildContext),
              textInputAction: TextInputAction.next,
              focusNode: bloc.passwordFocus,
              nextFocusNode: bloc.cPasswordFocus,
              onChange: (final String value) {
                bloc.add(
                  OnChangePassword(password: value),
                );
              },
            ),

            20.h,

            AppTextField(
              key: const Key(
                'signup_confirm_password_field',
              ),
              type: TextFieldTypes.password,
              title: AppStrings.confirmPassword,
              initialValue: state.confirmPassword,
              strHeaderTitle:
              AppStrings.confirmPassword.tr(
                buildContext,
              ),
              focusNode: bloc.cPasswordFocus,
              nextFocusNode: bloc.answerFocus,
              textInputAction: TextInputAction.next,
              validator: (final String? value) {
                return validateConfirmPassword(
                  value,
                  state.password,
                );
              },
              onChange: (final String value) {
                bloc.add(
                  OnChangeConfirmPassword(
                    confirmPassword: value,
                  ),
                );
              },
            ),

            20.h,

            CommonDropdownWidget(
              key: const Key(
                'security_question_field',
              ),
              placeholder:
              'Please Select Question'.tr(context),
              listData: state.questionList,
              title: 'Security Question'.tr(context),
              selectedVal: state.securityQuestionId,
              height: 55,
              onValueChanged: (final dynamic value) {
                bloc.add(
                  OnSelectQuestion(
                    questionId: value,
                  ),
                );
              },
            ),

            20.h,

            AppTextField(
              key: const Key('security_answer_field'),
              type: TextFieldTypes.text,
              title: 'Security Answer',
              initialValue: state.securityAnswer,
              strHeaderTitle:
              'Security Answer'.tr(buildContext),
              focusNode: bloc.answerFocus,
              textInputAction: TextInputAction.done,
              onChange: (final String value) {
                bloc.add(
                  OnChangeAnswer(answer: value),
                );
              },
            ),

            24.h,

            _CommonAgreementWidget(
              value: state.checkPrivacyPolicy,
              text: 'privacy policy',
              onChanged: (final bool? value) {
                bloc.add(
                  OnCheckPrivacyPolicy(
                    checkPrivacyPolicy:
                    value ?? false,
                  ),
                );
              },
              onTap: () {
                context.pushNamed(
                  RouteName.privacyPolicyScreen,
                  arguments: <String, CMSPage>{
                    'policy': CMSPage.policy,
                  },
                );
              },
            ),

            10.h,

            _CommonAgreementWidget(
              value:
              state.checkTermsAndCondition ??
                  false,
              text: 'terms and conditions',
              onChanged: (final bool? value) {
                bloc.add(
                  OnCheckTermsAndCondition(),
                );
              },
              onTap: () {
                context.pushNamed(
                  RouteName.privacyPolicyScreen,
                  arguments: <String, CMSPage>{
                    'policy': CMSPage.terms,
                  },
                );
              },
            ),
          ],
        );
      },
    );
  }
}

class _CommonAgreementWidget
    extends StatelessWidget {
  const _CommonAgreementWidget({
    required this.value,
    required this.text,
    required this.onChanged,
    required this.onTap,
  });

  final bool value;
  final String text;
  final ValueChanged<bool?> onChanged;
  final VoidCallback onTap;

  @override
  Widget build(final BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Transform.scale(
          scale: 1.05,
          child: Checkbox(
            value: value,
            activeColor:
            AppColors.colorPrimary500,
            shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(4),
            ),
            onChanged: onChanged,
          ),
        ),

        Expanded(
          child: GestureDetector(
            onTap: onTap,
            child: Padding(
              padding:
              const EdgeInsets.only(top: 14),
              child: RichText(
                text: TextSpan(
                  text:
                  '${AppStrings.iReadAndAgreeTo.tr(context)} ',
                  style: dMSansW400.copyWith(
                    fontSize: 13,
                    color:
                    AppColors.baseColorWhite45,
                  ),
                  children: <InlineSpan>[
                    TextSpan(
                      text: text.tr(context),
                      style:
                      dMSansW600.copyWith(
                        fontSize: 13,
                        color: AppColors
                            .colorPrimary500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
