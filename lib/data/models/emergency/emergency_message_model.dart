class EmergencyMessageModel {
  static const String imagePrefix = 'chat_image::';
  static const String voicePrefix = 'chat_voice::';
  static const String locationPrefix = 'chat_location::';

  EmergencyMessageModel({
    required this.id,
    required this.alertId,
    required this.senderId,
    required this.message,
    required this.createdAt,
    this.readAt,
  });

  final String id;
  final String alertId;
  final String senderId;
  final String message;
  final DateTime createdAt;
  final DateTime? readAt;

  bool get isImage => message.startsWith(imagePrefix);
  bool get isVoice => message.startsWith(voicePrefix);
  bool get isLocation => message.startsWith(locationPrefix);
  bool get isEmergency => _emergencyPattern.hasMatch(message);

  String get imageUrl => isImage ? message.substring(imagePrefix.length) : '';
  String get voiceUrl => isVoice ? message.substring(voicePrefix.length) : '';
  List<double> get locationLatLng {
    if (!isLocation) return <double>[];
    final List<String> parts = message.substring(locationPrefix.length).split(',');
    if (parts.length != 2) return <double>[];
    return <double>[
      double.tryParse(parts.first) ?? 0,
      double.tryParse(parts.last) ?? 0,
    ];
  }

  String get displayMessage {
    if (isImage) return 'Photo';
    if (isVoice) return 'Voice note';
    if (isLocation) return 'Live location';
    return message;
  }

  static String imageMessage(final String imageUrl) {
    return '$imagePrefix$imageUrl';
  }

  static String voiceMessage(final String voiceUrl) {
    return '$voicePrefix$voiceUrl';
  }

  static String locationMessage(final double latitude, final double longitude) {
    return '$locationPrefix$latitude,$longitude';
  }

  static String displayText(final String message) {
    if (message.startsWith(imagePrefix)) return 'Photo';
    if (message.startsWith(voicePrefix)) return 'Voice note';
    if (message.startsWith(locationPrefix)) return 'Live location';
    return message;
  }

  static final RegExp _emergencyPattern = RegExp(
    r'\b(sos|help|urgent|danger|emergency|unsafe|attack|accident)\b',
    caseSensitive: false,
  );

  factory EmergencyMessageModel.fromJson(final Map<String, dynamic> json) {
    return EmergencyMessageModel(
      id: json['id']?.toString() ?? '',
      alertId: json['alert_id']?.toString() ?? '',
      senderId: json['sender_id']?.toString() ?? '',
      message: json['message']?.toString() ?? '',
      createdAt: DateTime.tryParse(json['created_at']?.toString() ?? '') ??
          DateTime.now(),
      readAt: DateTime.tryParse(json['read_at']?.toString() ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'alert_id': alertId,
      'sender_id': senderId,
      'message': message,
      'created_at': createdAt.toIso8601String(),
      'read_at': readAt?.toIso8601String(),
    };
  }
}
