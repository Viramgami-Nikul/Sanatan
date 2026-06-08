class UserProfileModel {
  final int id;
  final String fullName;
  final String email;
  final String mobile;
  final String address;
  final String profileImage;

  UserProfileModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.mobile,
    required this.address,
    required this.profileImage,
  });

  factory UserProfileModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return UserProfileModel(
      id: json['id'] ?? 0,
      fullName: json['full_name'] ?? '',
      email: json['email'] ?? '',
      mobile: json['mobile'] ?? '',
      address: json['address'] ?? '',
      profileImage: json['profile_image'] ?? '',
    );
  }
}
