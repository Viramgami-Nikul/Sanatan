class SaveModel {
  final String saveId;
  final String userId;
  final String postId;
  final dynamic createdAt;

  SaveModel({
    required this.saveId,
    required this.userId,
    required this.postId,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'saveId': saveId,
      'userId': userId,
      'postId': postId,
      'createdAt': createdAt,
    };
  }

  factory SaveModel.fromJson(final Map<String, dynamic> json) {
    return SaveModel(
      saveId: json['saveId'] as String? ?? '',
      userId: json['userId'] as String? ?? '',
      postId: json['postId'] as String? ?? '',
      createdAt: json['createdAt'],
    );
  }
}
