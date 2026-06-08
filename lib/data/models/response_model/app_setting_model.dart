class AppSettingModel {
  AppSettingModel({
    this.isDisplayPopupInAndroid,
    this.isDisplayPopupInIos,
    this.storeLink,
  });

  bool? isDisplayPopupInAndroid;
  bool? isDisplayPopupInIos;
  String? storeLink;

  factory AppSettingModel.fromJson(final Map<String, dynamic> json) {
    return AppSettingModel(
      isDisplayPopupInAndroid: json['is_display_popup_in_android'] as bool?,
      isDisplayPopupInIos: json['is_display_popup_in_ios'] as bool?,
      storeLink: json['store_link'] as String?,
    );
  }
}
