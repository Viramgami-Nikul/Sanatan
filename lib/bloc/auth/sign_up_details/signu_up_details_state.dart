part of 'signu_up_details_bloc.dart';

@freezed
abstract class SignUpDetailsState
    with _$SignUpDetailsState {
  factory SignUpDetailsState({
    required String password,

    required String
    confirmPassword,

    required int?
    securityQuestionId,

    required String
    securityAnswer,

    required bool
    checkPrivacyPolicy,

    required bool
    checkTermsAndCondition,

    required CommonScreenState
    status,

    required List<dynamic>
    questionList,

    String? errorMessage,
  }) = _SignUpDetailsState;

  factory SignUpDetailsState.initial() =>
      SignUpDetailsState(
        password: '',

        confirmPassword: '',

        status:
        CommonScreenState
            .initial,

        checkPrivacyPolicy:
        false,

        checkTermsAndCondition:
        false,

        securityAnswer: '',

        securityQuestionId:
        null,

        errorMessage: null,

        questionList: <dynamic>[
          <String, dynamic>{
            'id': 0,
            'value':
            'What was your school name?',
          },

          <String, dynamic>{
            'id': 1,
            'value':
            'What was your college name?',
          },

          <String, dynamic>{
            'id': 2,
            'value':
            'What is your favorite color?',
          },

          <String, dynamic>{
            'id': 3,
            'value':
            'What was your first pet’s name?',
          },

          <String, dynamic>{
            'id': 4,
            'value':
            'What city were you born in?',
          },
        ],
      );
}
