class EmergencyAlertModel {
  EmergencyAlertModel({
    required this.id,
    required this.userId,
    required this.type,
    required this.latitude,
    required this.longitude,
    required this.status,
    required this.createdAt,
  });

  final String id;
  final String userId;
  final String type;
  final double latitude;
  final double longitude;
  final String status;
  final DateTime createdAt;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'user_id': userId,
      'type': type,
      'latitude': latitude,
      'longitude': longitude,
      'status': status,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
