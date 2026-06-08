class FakeCallModel {
  const FakeCallModel({
    required this.callerName,
    required this.callerNumber,
    required this.callerRelation,
    required this.delaySeconds,
    required this.ringSeconds,
    required this.voiceLines,
    this.callerImageUrl,
  });

  final String callerName;
  final String callerNumber;
  final String callerRelation;
  final int delaySeconds;
  final int ringSeconds;
  final List<String> voiceLines;
  final String? callerImageUrl;

  factory FakeCallModel.defaultCall() {
    return const FakeCallModel(
      callerName: 'Mom',
      callerNumber: '+91 98765 43210',
      callerRelation: 'Family',
      delaySeconds: 3,
      ringSeconds: 45,
      voiceLines: <String>[
        'Where are you right now?',
        'I am waiting nearby. Come outside.',
        'Stay on the call until you reach a safe place.',
      ],
    );
  }

  FakeCallModel copyWith({
    String? callerName,
    String? callerNumber,
    String? callerRelation,
    int? delaySeconds,
    int? ringSeconds,
    List<String>? voiceLines,
    String? callerImageUrl,
  }) {
    return FakeCallModel(
      callerName: callerName ?? this.callerName,
      callerNumber: callerNumber ?? this.callerNumber,
      callerRelation: callerRelation ?? this.callerRelation,
      delaySeconds: delaySeconds ?? this.delaySeconds,
      ringSeconds: ringSeconds ?? this.ringSeconds,
      voiceLines: voiceLines ?? this.voiceLines,
      callerImageUrl: callerImageUrl ?? this.callerImageUrl,
    );
  }

  factory FakeCallModel.fromJson(final Map<String, dynamic> json) {
    return FakeCallModel(
      callerName: json['caller_name']?.toString() ?? 'Mom',
      callerNumber: json['caller_number']?.toString() ?? '+91 98765 43210',
      callerRelation: json['caller_relation']?.toString() ?? 'Family',
      delaySeconds: int.tryParse(json['delay_seconds']?.toString() ?? '') ?? 3,
      ringSeconds: int.tryParse(json['ring_seconds']?.toString() ?? '') ?? 45,
      callerImageUrl: json['caller_image_url']?.toString(),
      voiceLines:
          (json['voice_lines'] as List<dynamic>?)
              ?.map((final dynamic item) => item.toString())
              .toList() ??
          FakeCallModel.defaultCall().voiceLines,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'caller_name': callerName,
      'caller_number': callerNumber,
      'caller_relation': callerRelation,
      'delay_seconds': delaySeconds,
      'ring_seconds': ringSeconds,
      'caller_image_url': callerImageUrl,
      'voice_lines': voiceLines,
    };
  }
}
