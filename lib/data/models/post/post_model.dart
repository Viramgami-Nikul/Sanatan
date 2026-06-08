class PostModel {
  final String postId;
  final String uid;
  final String imageUrl;
  final String caption;
  final int likesCount;
  final int commentsCount;
  final dynamic createdAt;
  final String? category;

  PostModel({
    required this.postId,
    required this.uid,
    required this.imageUrl,
    required this.caption,
    required this.likesCount,
    required this.commentsCount,
    required this.createdAt,
    this.category,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'postId': postId,
      'uid': uid,
      'imageUrl': imageUrl,
      'caption': caption,
      'likesCount': likesCount,
      'commentsCount': commentsCount,
      'createdAt': createdAt,
      'category': category,
    };
  }

  factory PostModel.fromJson(final Map<String, dynamic> json) {
    return PostModel(
      postId: json['postId'] as String? ?? '',
      uid: json['uid'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      caption: json['caption'] as String? ?? '',
      likesCount: json['likesCount'] as int? ?? 0,
      commentsCount: json['commentsCount'] as int? ?? 0,
      createdAt: json['createdAt'],
      category: json['category'] as String?,
    );
  }
}
