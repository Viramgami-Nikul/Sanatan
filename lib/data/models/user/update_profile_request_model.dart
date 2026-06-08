class UpdateProfileRequestModel {
  final String firstName;
  final String lastName;
  final String email;
  final String mobileNumber;
  final String address;
  final String? profileImage;
  final String? birthDate;
  final String? gender;
  final String? country;

  UpdateProfileRequestModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobileNumber,
    required this.address,
    this.profileImage,
    this.birthDate,
    this.gender,
    this.country,
  });

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'mobile_number': mobileNumber,
      'address': address,
      'profile_image': profileImage,
      'birth_date': birthDate,
      'gender': gender,
      'country': country,
    };
  }

  factory UpdateProfileRequestModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return UpdateProfileRequestModel(
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      email: json['email'] ?? '',
      mobileNumber: json['mobile_number'] ?? '',
      address: json['address'] ?? '',
      profileImage: json['profile_image'],
      birthDate: json['birth_date'],
      gender: json['gender'],
      country: json['country'],
    );
  }

  UpdateProfileRequestModel copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? mobileNumber,
    String? address,
    String? profileImage,
    String? birthDate,
    String? gender,
    String? country,
  }) {
    return UpdateProfileRequestModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      mobileNumber:
      mobileNumber ?? this.mobileNumber,
      address: address ?? this.address,
      profileImage:
      profileImage ?? this.profileImage,
      birthDate: birthDate ?? this.birthDate,
      gender: gender ?? this.gender,
      country: country ?? this.country,
    );
  }
}
