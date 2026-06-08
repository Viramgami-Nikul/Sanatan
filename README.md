# flutter-project-strcture

### To Generate Assets and freezed class

- flutter pub run build_runner build --delete-conflicting-outputs
- dart run build_runner build --delete-conflicting-outputs

### Changes instructions

1. Change App Name
2. App Icon
3. Splash Screen
4. Change Package Name
5. Theme Colors
6. Theme Fonts
7. Theme Text Styles
8. Google service file (for Android and iOS)
9. keystore.properties (Android)
10. Generate new jks file(Android)

#remove cache file

- flutter pub cache clean

**Add this in flavor configuration**
Flavor staging -> --flavor staging --dart-define=FLAVOR=staging
Flavor prod -> --flavor prod --dart-define=FLAVOR=prod

**To update debug config to prod (iOS)**
flutter build ios --config-only --release --flavor prod --dart-define=FLAVOR=prod

**To update debug config to prod (Android)**
flutter build apk --release --flavor staging --dart-define=FLAVOR=staging
AIzaSyBN-vGiSRHamEFcSDWZYkh3rWxlMkUUQsA

152.58.35.248