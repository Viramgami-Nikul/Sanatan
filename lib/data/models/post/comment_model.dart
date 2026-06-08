class CommentModel {
  final String commentId;
  final String postId;
  final String userId;
  final String username;
  final String userAvatarUrl;
  final String commentText;
  final dynamic createdAt;

  CommentModel({
    required this.commentId,
    required this.postId,
    required this.userId,
    required this.username,
    required this.userAvatarUrl,
    required this.commentText,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'commentId': commentId,
      'postId': postId,
      'userId': userId,
      'username': username,
      'userAvatarUrl': userAvatarUrl,
      'commentText': commentText,
      'createdAt': createdAt,
    };
  }

  factory CommentModel.fromJson(final Map<String, dynamic> json) {
    return CommentModel(
      commentId: json['commentId'] as String? ?? '',
      postId: json['postId'] as String? ?? '',
      userId: json['userId'] as String? ?? '',
      username: json['username'] as String? ?? '',
      userAvatarUrl: json['userAvatarUrl'] as String? ?? '',
      commentText: json['commentText'] as String? ?? '',
      createdAt: json['createdAt'],
    );
  }
}
