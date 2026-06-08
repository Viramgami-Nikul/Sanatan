class UserDataModel {
  final int? userRegistrationId;
  final String? emailId;
  final String fullName;
  String? authToken;
  final String? mobileNumber;
  final String? profileImage;

  // Premium Instagram-style fields
  final String? uid;
  final String? username;
  final String? bio;
  final String? photoUrl;
  final int? followersCount;
  final int? followingCount;
  final int? postsCount;
  final bool? isVerified;

  String? get userProfileImageUrl => photoUrl ?? profileImage;

  UserDataModel({
    this.userRegistrationId,
    this.emailId,
    required this.fullName,
    this.authToken,
    this.mobileNumber,
    this.profileImage,
    this.uid,
    this.username,
    this.bio,
    this.photoUrl,
    this.followersCount,
    this.followingCount,
    this.postsCount,
    this.isVerified,
  });

  Map<String, dynamic> toJson() {
    return {
      'user_registration_id': userRegistrationId,
      'email_id': emailId,
      'full_name': fullName,
      'auth_token': authToken,
      'mobile_number': mobileNumber,
      'profile_image': profileImage,
      'uid': uid,
      'username': username,
      'bio': bio,
      'photoUrl': photoUrl,
      'followersCount': followersCount,
      'followingCount': followingCount,
      'postsCount': postsCount,
      'isVerified': isVerified,
    };
  }

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      userRegistrationId: json['user_registration_id'] as int?,
      emailId: json['email_id'] as String?,
      fullName: json['full_name'] as String,
      authToken: json['auth_token'] as String?,
      mobileNumber: json['mobile_number'] as String?,
      profileImage: json['profile_image'] as String?,
      uid: json['uid'] as String?,
      username: json['username'] as String?,
      bio: json['bio'] as String?,
      photoUrl: json['photoUrl'] as String?,
      followersCount: json['followersCount'] as int?,
      followingCount: json['followingCount'] as int?,
      postsCount: json['postsCount'] as int?,
      isVerified: json['isVerified'] as bool?,
    );
  }
}
