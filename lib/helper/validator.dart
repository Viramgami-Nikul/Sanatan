import 'package:santvani_app/helper/extension/string_ext.dart';
import 'package:santvani_app/helper/regex_helper.dart';
import 'package:santvani_app/utils/app_enums.dart';
import 'package:intl_phone_field/phone_number.dart';

mixin Validator {
  // ---------------------------------------------------------------------------
  // Email Validation
  // ---------------------------------------------------------------------------

  String? validateEmail(final String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppMessages.emailRequired.message;
    }

    if (!RegexHelper.regexEmail.hasMatch(value.trim())) {
      return AppMessages.invalidEmail.message;
    }

    return null;
  }

  // ---------------------------------------------------------------------------
  // Password Validation
  // ---------------------------------------------------------------------------

  String? validatePassword(final String? value) {
    if (!value.isNotNullAndEmpty()) {
      return AppMessages.passwordRequired.message;
    }

    if ((value?.length ?? 0) < 6) {
      return AppMessages.passwordLength.message;
    }

    if (!RegexHelper.regexPassword.hasMatch(value ?? '')) {
      return AppMessages.invalidPassword.message;
    }

    return null;
  }

  // ---------------------------------------------------------------------------
  // Confirm Password Validation
  // ---------------------------------------------------------------------------

  String? validateConfirmPassword(
      final String? value,
      final String password,
      ) {
    if (value == null || value.trim().isEmpty) {
      return AppMessages.confirmPasswordRequired.message;
    }

    if (value != password) {
      return AppMessages.confirmPasswordNotMatch.message;
    }

    return null;
  }

  // ---------------------------------------------------------------------------
  // Mobile Number Validation
  // ---------------------------------------------------------------------------

  String? validateMobileNumber(
      final PhoneNumber? value,
      ) {
    if (value == null) {
      return AppMessages.mobileNumberRequired.message;
    }

    if (value.number.trim().isEmpty) {
      return AppMessages.mobileNumberRequired.message;
    }

    try {
      final bool isValid = value.isValidNumber();

      if (!isValid) {
        return AppMessages.invalidMobile.message;
      }
    } catch (e) {
      return AppMessages.invalidMobile.message;
    }

    return null;
  }

  // ---------------------------------------------------------------------------
  // Empty Field Validation
  // ---------------------------------------------------------------------------

  String? validateRequiredField(
      final String? value,
      final String fieldName,
      ) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }

    return null;
  }
}
