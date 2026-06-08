class MessageModel {
  final String messageId;
  final String senderId;
  final String receiverId;
  final String message;
  final String? imageUrl;
  final String? postId;
  final int timestamp;
  final bool isRead;

  MessageModel({
    required this.messageId,
    required this.senderId,
    required this.receiverId,
    required this.message,
    this.imageUrl,
    this.postId,
    required this.timestamp,
    required this.isRead,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'messageId': messageId,
      'senderId': senderId,
      'receiverId': receiverId,
      'message': message,
      'imageUrl': imageUrl,
      'postId': postId,
      'timestamp': timestamp,
      'isRead': isRead,
    };
  }

  factory MessageModel.fromJson(final Map<String, dynamic> json) {
    return MessageModel(
      messageId: json['messageId'] as String? ?? '',
      senderId: json['senderId'] as String? ?? '',
      receiverId: json['receiverId'] as String? ?? '',
      message: json['message'] as String? ?? '',
      imageUrl: json['imageUrl'] as String?,
      postId: json['postId'] as String?,
      timestamp: json['timestamp'] as int? ?? 0,
      isRead: json['isRead'] as bool? ?? false,
    );
  }
}
