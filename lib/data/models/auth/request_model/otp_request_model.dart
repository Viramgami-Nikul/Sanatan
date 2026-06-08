class OtpRequestModel {
  final String emailOrPhone;

  final String? countryCode;

  final String? otp;

  OtpRequestModel({
    required this.emailOrPhone,
    this.countryCode,
    this.otp,
  });

  /// Convert Object to JSON
  Map<String, dynamic> toJson() {
    return {
      'email_or_phone': emailOrPhone,
      'country_code': countryCode,
      'otp': otp,
    };
  }

  /// Create Object from JSON
  factory OtpRequestModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return OtpRequestModel(
      emailOrPhone:
      json['email_or_phone'] ?? '',

      countryCode:
      json['country_code'],

      otp:
      json['otp'],
    );
  }

  /// CopyWith Method
  OtpRequestModel copyWith({
    String? emailOrPhone,
    String? countryCode,
    String? otp,
  }) {
    return OtpRequestModel(
      emailOrPhone:
      emailOrPhone ??
          this.emailOrPhone,

      countryCode:
      countryCode ??
          this.countryCode,

      otp:
      otp ??
          this.otp,
    );
  }

  @override
  String toString() {
    return '''
OtpRequestModel(
  emailOrPhone: $emailOrPhone,
  countryCode: $countryCode,
  otp: $otp
)
''';
  }
}
