class SignupRequestModel {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? mobile;
  final String? password;
  final String? address;
  final String? gender;
  final String? birthDate;
  final String? contactNo;
  final String? countryCodeISO2;
  final String? emailId;
  final String? isdCode;
  final String? county;
  final String? dateOfBirth;

  SignupRequestModel({
    this.firstName,
    this.lastName,
    this.email,
    this.mobile,
    this.password,
    this.address,
    this.gender,
    this.birthDate,
    this.contactNo,
    this.countryCodeISO2,
    this.emailId,
    this.isdCode,
    this.county,
    this.dateOfBirth,
  });

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'mobile': mobile,
      'password': password,
      'address': address,
      'gender': gender,
      'birth_date': birthDate,
    };
  }
}
