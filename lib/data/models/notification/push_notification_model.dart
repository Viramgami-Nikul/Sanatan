class PushNotificationModel {
  final String title;

  final String body;

  final Map<String, dynamic>? data;

  final String? imageUrl;

  final String? clickAction;

  PushNotificationModel({
    required this.title,
    required this.body,
    this.data,
    this.imageUrl,
    this.clickAction,
  });

  factory PushNotificationModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return PushNotificationModel(
      title: json['title'] ?? '',

      body: json['body'] ?? '',

      data:
      json['data'] != null
          ? Map<String, dynamic>.from(
        json['data'],
      )
          : null,

      imageUrl: json['image_url'],

      clickAction: json['click_action'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'body': body,
      'data': data,
      'image_url': imageUrl,
      'click_action': clickAction,
    };
  }
}
