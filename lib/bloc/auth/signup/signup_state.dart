part of 'signup_bloc.dart';

@freezed
abstract class SignUpState
    with _$SignUpState {
  factory SignUpState({
    required String firstName,

    required String lastName,

    required String email,

    required String
    countryISOCode,

    required String countryCode,

    required String
    mobileNumber,

    required String? birthDate,

    required int? genderId,

    required int? countryId,

    required String address,

    required String userType,

    required List<Map<String, dynamic>>
    distributorList,

    required String?
    selectedDistributorId,

    required String?
    selectedDistributorName,

    required int?
    serviceCategoryId,

    required CommonScreenState
    status,

    required List<dynamic>
    genderList,

    required List<dynamic>
    countryList,

    required List<dynamic>
    serviceCategoryList,

    String? errorMessage,
  }) = _SignUpState;

  factory SignUpState.initial() =>
      SignUpState(
        firstName: '',

        lastName: '',

        email: '',

        countryISOCode: 'IN',

        countryCode: '+91',

        mobileNumber: '',

        status:
        CommonScreenState
            .initial,

        address: '',

        birthDate: null,

        countryId: null,

        genderId: null,

        userType: 'Distributor',

        distributorList: const <Map<String, dynamic>>[],

        selectedDistributorId: null,

        selectedDistributorName: null,

        serviceCategoryId: null,

        errorMessage: null,

        genderList: <dynamic>[
          <String, dynamic>{
            'id': 0,
            'value': 'Male',
          },

          <String, dynamic>{
            'id': 1,
            'value': 'Female',
          },

          <String, dynamic>{
            'id': 2,
            'value': 'Other',
          },
        ],

        countryList: <dynamic>[
          <String, dynamic>{
            'id': 0,
            'value': 'India',
          },

          <String, dynamic>{
            'id': 1,
            'value': 'USA',
          },

          <String, dynamic>{
            'id': 2,
            'value': 'Canada',
          },

          <String, dynamic>{
            'id': 3,
            'value': 'Australia',
          },

          <String, dynamic>{
            'id': 4,
            'value': 'United Kingdom',
          },
        ],

        serviceCategoryList: <dynamic>[
          <String, dynamic>{
            'id': 0,
            'value': 'Electrician',
          },

          <String, dynamic>{
            'id': 1,
            'value': 'Plumber',
          },

          <String, dynamic>{
            'id': 2,
            'value': 'Cleaner',
          },

          <String, dynamic>{
            'id': 3,
            'value': 'AC Repair',
          },

          <String, dynamic>{
            'id': 4,
            'value': 'Painter',
          },

          <String, dynamic>{
            'id': 5,
            'value': 'Carpenter',
          },

          <String, dynamic>{
            'id': 6,
            'value': 'Home Shifting',
          },
        ],
      );
}
