class EmergencyContactModel {
  EmergencyContactModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.relation,
    this.fcmToken,
  });

  final String id;
  final String name;
  final String phone;
  final String relation;
  final String? fcmToken;

  factory EmergencyContactModel.fromJson(final Map<String, dynamic> json) {
    return EmergencyContactModel(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      phone: json['phone']?.toString() ?? '',
      relation: json['relation']?.toString() ?? '',
      fcmToken: json['fcm_token']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'phone': phone,
      'relation': relation,
      'fcm_token': fcmToken,
    };
  }
}
