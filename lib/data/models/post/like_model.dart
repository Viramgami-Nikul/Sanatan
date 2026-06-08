class LikeModel {
  final String likeId;
  final String userId;
  final String postId;
  final dynamic createdAt;

  LikeModel({
    required this.likeId,
    required this.userId,
    required this.postId,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'likeId': likeId,
      'userId': userId,
      'postId': postId,
      'createdAt': createdAt,
    };
  }

  factory LikeModel.fromJson(final Map<String, dynamic> json) {
    return LikeModel(
      likeId: json['likeId'] as String? ?? '',
      userId: json['userId'] as String? ?? '',
      postId: json['postId'] as String? ?? '',
      createdAt: json['createdAt'],
    );
  }
}
