class ShareModel {
  final String shareId;
  final String postId;
  final String userId;
  final dynamic createdAt;

  ShareModel({
    required this.shareId,
    required this.postId,
    required this.userId,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'shareId': shareId,
      'postId': postId,
      'userId': userId,
      'createdAt': createdAt,
    };
  }

  factory ShareModel.fromJson(final Map<String, dynamic> json) {
    return ShareModel(
      shareId: json['shareId'] as String? ?? '',
      postId: json['postId'] as String? ?? '',
      userId: json['userId'] as String? ?? '',
      createdAt: json['createdAt'],
    );
  }
}
