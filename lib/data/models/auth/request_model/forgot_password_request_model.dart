class ForgotPasswordRequestModel {
  final String email;

  ForgotPasswordRequestModel({
    required this.email,
  });

  /// Convert Object to JSON
  Map<String, dynamic> toJson() {
    return {
      'email': email,
    };
  }

  /// Create Object from JSON
  factory ForgotPasswordRequestModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return ForgotPasswordRequestModel(
      email: json['email'] ?? '',
    );
  }

  /// CopyWith Method
  ForgotPasswordRequestModel copyWith({
    String? email,
  }) {
    return ForgotPasswordRequestModel(
      email: email ?? this.email,
    );
  }

  @override
  String toString() {
    return 'ForgotPasswordRequestModel(email: $email)';
  }
}
