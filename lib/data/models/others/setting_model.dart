class SettingModel {
  final String userId;
  final bool isNotificationsEnabled;
  final bool isDarkMode;
  final String language;
  final String followerRequests;
  final String acceptedFollowRequests;
  final String accountSuggestions;
  final String mentionsInBio;
  final dynamic updatedAt;

  SettingModel({
    required this.userId,
    this.isNotificationsEnabled = true,
    this.isDarkMode = false,
    this.language = 'en',
    this.followerRequests = 'On',
    this.acceptedFollowRequests = 'On',
    this.accountSuggestions = 'On',
    this.mentionsInBio = 'From everyone',
    this.updatedAt,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'userId': userId,
      'isNotificationsEnabled': isNotificationsEnabled,
      'isDarkMode': isDarkMode,
      'language': language,
      'followerRequests': followerRequests,
      'acceptedFollowRequests': acceptedFollowRequests,
      'accountSuggestions': accountSuggestions,
      'mentionsInBio': mentionsInBio,
      'updatedAt': updatedAt,
    };
  }

  factory SettingModel.fromJson(final Map<String, dynamic> json) {
    return SettingModel(
      userId: json['userId'] as String? ?? '',
      isNotificationsEnabled: json['isNotificationsEnabled'] as bool? ?? true,
      isDarkMode: json['isDarkMode'] as bool? ?? false,
      language: json['language'] as String? ?? 'en',
      followerRequests: json['followerRequests'] as String? ?? 'On',
      acceptedFollowRequests: json['acceptedFollowRequests'] as String? ?? 'On',
      accountSuggestions: json['accountSuggestions'] as String? ?? 'On',
      mentionsInBio: json['mentionsInBio'] as String? ?? 'From everyone',
      updatedAt: json['updatedAt'],
    );
  }

  SettingModel copyWith({
    String? userId,
    bool? isNotificationsEnabled,
    bool? isDarkMode,
    String? language,
    String? followerRequests,
    String? acceptedFollowRequests,
    String? accountSuggestions,
    String? mentionsInBio,
    dynamic updatedAt,
  }) {
    return SettingModel(
      userId: userId ?? this.userId,
      isNotificationsEnabled: isNotificationsEnabled ?? this.isNotificationsEnabled,
      isDarkMode: isDarkMode ?? this.isDarkMode,
      language: language ?? this.language,
      followerRequests: followerRequests ?? this.followerRequests,
      acceptedFollowRequests: acceptedFollowRequests ?? this.acceptedFollowRequests,
      accountSuggestions: accountSuggestions ?? this.accountSuggestions,
      mentionsInBio: mentionsInBio ?? this.mentionsInBio,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
