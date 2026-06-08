class NotificationModel {
  final int id;

  final String title;

  final String message;

  final String type;

  final bool isRead;

  final String createdAt;

  NotificationModel({
    required this.id,
    required this.title,
    required this.message,
    required this.type,
    required this.isRead,
    required this.createdAt,
  });

  factory NotificationModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return NotificationModel(
      id: json['id'] ?? 0,

      title: json['title'] ?? '',

      message: json['message'] ?? '',

      type: json['type'] ?? '',

      isRead: json['is_read'] ?? false,

      createdAt: json['created_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'message': message,
      'type': type,
      'is_read': isRead,
      'created_at': createdAt,
    };
  }
}
