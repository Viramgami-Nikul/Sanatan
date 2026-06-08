class SosTriggerModel {
  SosTriggerModel({
    required this.source,
    required this.triggeredAt,
    this.isEnabled = true,
  });

  final String source;
  final DateTime triggeredAt;
  final bool isEnabled;

  factory SosTriggerModel.fromJson(final Map<String, dynamic> json) {
    final Object? rawTriggeredAt = json['triggered_at'];
    return SosTriggerModel(
      source: json['source']?.toString() ?? 'unknown',
      triggeredAt: _dateTimeFromValue(rawTriggeredAt),
      isEnabled: json['is_enabled'] != false,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'source': source,
      'triggered_at': triggeredAt.toIso8601String(),
      'is_enabled': isEnabled,
    };
  }

  static DateTime _dateTimeFromValue(final Object? value) {
    if (value is int) {
      return DateTime.fromMillisecondsSinceEpoch(value);
    }
    if (value is double) {
      return DateTime.fromMillisecondsSinceEpoch(value.toInt());
    }
    if (value is String) {
      return DateTime.tryParse(value) ?? DateTime.now();
    }
    return DateTime.now();
  }
}
