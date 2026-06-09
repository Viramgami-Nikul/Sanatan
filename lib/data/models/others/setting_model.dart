class SettingModel {
  final String userId;
  final bool isNotificationsEnabled;
  final bool isDarkMode;
  final String language;
  final dynamic updatedAt;

  SettingModel({
    required this.userId,
    this.isNotificationsEnabled = true,
    this.isDarkMode = false,
    this.language = 'en',
    this.updatedAt,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'userId': userId,
      'isNotificationsEnabled': isNotificationsEnabled,
      'isDarkMode': isDarkMode,
      'language': language,
      'updatedAt': updatedAt,
    };
  }

  factory SettingModel.fromJson(final Map<String, dynamic> json) {
    return SettingModel(
      userId: json['userId'] as String? ?? '',
      isNotificationsEnabled: json['isNotificationsEnabled'] as bool? ?? true,
      isDarkMode: json['isDarkMode'] as bool? ?? false,
      language: json['language'] as String? ?? 'en',
      updatedAt: json['updatedAt'],
    );
  }

  SettingModel copyWith({
    String? userId,
    bool? isNotificationsEnabled,
    bool? isDarkMode,
    String? language,
    dynamic updatedAt,
  }) {
    return SettingModel(
      userId: userId ?? this.userId,
      isNotificationsEnabled: isNotificationsEnabled ?? this.isNotificationsEnabled,
      isDarkMode: isDarkMode ?? this.isDarkMode,
      language: language ?? this.language,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
