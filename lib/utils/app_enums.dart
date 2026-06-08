enum AppButtonType {
  primary,
  secondary,
  thirdB,
}

/// =====================================================
/// TextField Types
/// =====================================================

enum TextFieldTypes {
  text,
  email,
  password,
  number,
  multiline,
  phone,
}

/// =====================================================
/// SnackBar Types
/// =====================================================

enum SnackBarType {
  success,
  error,
  info,
  warning,
}

/// =====================================================
/// Common App Messages
/// =====================================================

enum AppMessages {
  somethingWentWrong('Something Went Wrong..!'),

  // Auth
  firstNameRequired('First Name is Required'),
  lastNameRequired('Last Name is Required'),
  emailRequired('Email is Required'),
  passwordRequired('Password is Required'),
  confirmPasswordRequired('Confirm Password is Required'),
  confirmPasswordNotMatch('Confirm Password does not match'),

  // Validation
  invalidEmail('Please enter a valid email address.'),
  invalidPassword('Please enter a valid password.'),
  passwordLength('Password must be at least 6 characters'),
  mobileNumberRequired('Mobile Number is Required'),
  invalidMobile('Invalid Mobile Number'),

  // Success
  registrationSuccess('User registered successfully.'),
  loginSuccess('Login Successfully'),
  profileUpdated('Profile Updated Successfully'),

  // Network
  networkError(
    'No internet connection. Please check your internet connection.',
  ),

  // Security
  securityQuestionRequired('Security Question required.'),
  securityAnswerRequired('Security Answer required.'),

  // Permission
  permissionDenied('Permission Denied'),
  cameraPermissionRequired('Camera permission required'),
  galleryPermissionRequired('Gallery permission required'),

  // Logout
  logoutSuccess('Logout Successfully');

  const AppMessages(this.message);

  final String message;
}

/// =====================================================
/// Supported Languages
/// =====================================================

enum SupportedLangCode {
  english('en', 'US', 'English', 'US'),
  gujarati('gu', 'IN', 'Gujarati', 'IN');

  const SupportedLangCode(
      this.langCode,
      this.countryCode,
      this.name,
      this.flag,
      );

  final String langCode;
  final String countryCode;
  final String name;
  final String flag;
}

/// =====================================================
/// Common Screen State
/// =====================================================

enum CommonScreenState {
  initial,
  loading,
  loaded,
  success,
  error,
}

/// =====================================================
/// Social Login State
/// =====================================================

enum SocialMediaLoginState {
  initial,
  google,
  facebook,
  apple,
  success,
  error,
}

/// =====================================================
/// App Flavor
/// =====================================================

enum Flavor {
  staging,
  prod,
}

/// =====================================================
/// CMS Pages
/// =====================================================

enum CMSPage {
  terms(
    'Terms and Conditions',
    'https://masterlysolutions.com/terms-and-conditions/',
  ),

  policy(
    'Privacy Policy',
    'https://masterlysolutions.com/terms-and-conditions/',
  );

  const CMSPage(this.title, this.url);

  final String title;
  final String url;
}

/// =====================================================
/// Profile Options
/// =====================================================

enum ProfileOption {
  myProfile('My Profile'),
  myEvidence('My Evidence'),
  addressDetails('Address Details'),
  changeLanguage('Change Language'),
  logout('Log Out');

  const ProfileOption(this.title);

  final String title;
}

/// =====================================================
/// Image Picker Type
/// =====================================================

enum PhotoPickerType {
  camera,
  photos,
}

/// =====================================================
/// API Request Type
/// =====================================================

enum ApiRequestType {
  get,
  post,
  put,
  delete,
  patch,
}

/// =====================================================
/// Notification Type
/// =====================================================

enum NotificationType {
  general,
  order,
  message,
  promotion,
}

/// =====================================================
/// Gender Type
/// =====================================================

enum GenderType {
  male,
  female,
  other,
}
