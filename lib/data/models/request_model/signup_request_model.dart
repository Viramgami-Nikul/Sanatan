class SignupRequest {
  final String? firstName;
  final String? lastName;
  final String? emailId;
  final String? contactNo;
  final String? isdCode;
  final String? userPassword;
  final String? countryCodeISO2;
  final String? createdByDeviceName;
  final String? createdByDeviceTypeId;
  final String? dateOfBirth;
  final String? gender;
  final String? county;
  final String? address;
  final String? securityQuestion;
  final String? securityAnswer;
  bool? termsAndConditions;
  bool? privacyPolicy;
  final String? userType;
  final String? distributorId;
  final String? distributorName;

  SignupRequest({
    this.firstName,
    this.lastName,
    this.emailId,
    this.contactNo,
    this.isdCode,
    this.userPassword,
    this.countryCodeISO2,
    this.createdByDeviceName,
    this.createdByDeviceTypeId,
    this.dateOfBirth,
    this.gender,
    this.county,
    this.address,
    this.securityQuestion,
    this.securityAnswer,
    this.termsAndConditions,
    this.privacyPolicy,
    this.userType,
    this.distributorId,
    this.distributorName,
  });

  SignupRequest copyWith({
    final String? firstName,
    final String? lastName,
    final String? emailId,
    final String? contactNo,
    final String? isdCode,
    final String? userPassword,
    final String? countryCodeIso2,
    final String? createdByDeviceName,
    final String? createdByDeviceTypeId,
    final String? dateOfBirth,
    final String? gender,
    final String? county,
    final String? address,
    final String? securityQuestion,
    final String? securityAnswer,
    final bool? termsAndConditions,
    final bool? privacyPolicy,
    final String? userType,
    final String? distributorId,
    final String? distributorName,
  }) =>
      SignupRequest(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        emailId: emailId ?? this.emailId,
        contactNo: contactNo ?? this.contactNo,
        isdCode: isdCode ?? this.isdCode,
        userPassword: userPassword ?? this.userPassword,
        countryCodeISO2: countryCodeIso2 ?? countryCodeISO2,
        createdByDeviceName: createdByDeviceName ?? this.createdByDeviceName,
        createdByDeviceTypeId:
        createdByDeviceTypeId ?? this.createdByDeviceTypeId,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        gender: gender ?? this.gender,
        county: county ?? this.county,
        address: address ?? this.address,
        securityQuestion: securityQuestion ?? this.securityQuestion,
        securityAnswer: securityAnswer ?? this.securityAnswer,
        termsAndConditions: termsAndConditions ?? this.termsAndConditions,
        privacyPolicy: privacyPolicy ?? this.privacyPolicy,
        userType: userType ?? this.userType,
        distributorId: distributorId ?? this.distributorId,
        distributorName: distributorName ?? this.distributorName,
      );

  factory SignupRequest.fromJson(final Map<String, dynamic> json) =>
      SignupRequest(
        firstName: json["firstName"],
        lastName: json["lastName"],
        emailId: json["emailId"],
        contactNo: json["contactNo"],
        isdCode: json["isdCode"],
        userPassword: json["userPassword"],
        countryCodeISO2: json["countryCodeISO2"],
        createdByDeviceName: json["createdByDeviceName"],
        createdByDeviceTypeId: json["createdByDeviceTypeId"],
        dateOfBirth: json["dateOfBirth"],
        gender: json["gender"],
        county: json["county"],
        address: json["address"],
        securityQuestion: json["securityQuestion"],
        securityAnswer: json["securityAnswer"],
        termsAndConditions: json["termsAndConditions"],
        privacyPolicy: json["privacyPolicy"],
        userType: json["userType"],
        distributorId: json["distributorId"],
        distributorName: json["distributorName"],
      );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "emailId": emailId,
    "contactNo": contactNo,
    "isdCode": isdCode,
    "userPassword": userPassword,
    "countryCodeISO2": countryCodeISO2,
    "createdByDeviceName": createdByDeviceName,
    "createdByDeviceTypeId": createdByDeviceTypeId,
    "dateOfBirth": dateOfBirth,
    "gender": gender,
    "county": county,
    "address": address,
    'securityQuestion': securityQuestion,
    'securityAnswer': securityAnswer,
    "termsAndConditions": termsAndConditions,
    "privacyPolicy": privacyPolicy,
    "userType": userType,
    "distributorId": distributorId,
    "distributorName": distributorName,
  };
}

