class AuthUserModel {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String mobile;
  final String profileImage;

  AuthUserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobile,
    required this.profileImage,
  });

  String get fullName => '$firstName $lastName';

  factory AuthUserModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return AuthUserModel(
      id: json['id'] ?? 0,
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      email: json['email'] ?? '',
      mobile: json['mobile'] ?? '',
      profileImage: json['profile_image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'mobile': mobile,
      'profile_image': profileImage,
    };
  }
}
