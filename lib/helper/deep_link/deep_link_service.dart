import 'dart:async';
import 'package:app_links/app_links.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:santvani_app/app/my_app.dart';
import 'package:santvani_app/data/models/response_model/auth/user_data_model.dart';
import 'package:santvani_app/views/search/user_profile_detail_screen.dart';

class DeepLinkService {
  DeepLinkService._privateConstructor();
  static final DeepLinkService instance = DeepLinkService._privateConstructor();

  final AppLinks _appLinks = AppLinks();
  StreamSubscription<Uri>? _linkSubscription;

  void init() {
    // Handle cold start deep links (when app is closed)
    _appLinks.getInitialLink().then((final Uri? uri) {
      if (uri != null) {
        _handleDeepLink(uri);
      }
    }).catchError((final Object e) {
      debugPrint('Error getting initial deep link: $e');
    });

    // Handle warm start deep links (when app is already running)
    _linkSubscription = _appLinks.uriLinkStream.listen(
      (final Uri uri) {
        _handleDeepLink(uri);
      },
      onError: (final Object err) {
        debugPrint('Error listening to deep links: $err');
      },
    );
  }

  void dispose() {
    _linkSubscription?.cancel();
  }

  Future<void> _handleDeepLink(final Uri uri) async {
    debugPrint('Received deep link: $uri');
    // Expected path: /profile or scheme: santvani and host: profile
    final bool isProfilePath = uri.path.contains('/profile') || (uri.scheme == 'santvani' && uri.host == 'profile');
    if (!isProfilePath) return;

    final String? uid = uri.queryParameters['uid'];
    if (uid == null || uid.isEmpty) return;

    debugPrint('Redirecting to user profile: $uid');
    
    final NavigatorState? navigator = navigatorKey.currentState;
    if (navigator == null) return;

    try {
      final DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .get();
      
      if (!doc.exists) {
        debugPrint('User document does not exist for deep link UID: $uid');
        return;
      }

      final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      final UserDataModel userModel = UserDataModel(
        userRegistrationId: data['user_registration_id'] ?? 1,
        fullName: data['full_name'] ?? data['name'] ?? 'User',
        emailId: data['email_id'] ?? data['email'] ?? '',
        mobileNumber: data['mobile_number'] ?? data['phoneNumber'] ?? '',
        profileImage: data['profile_image'] ?? data['photoUrl'] ?? '',
        authToken: '',
        uid: uid,
        username: data['username'] ?? '',
        bio: data['bio'] ?? '',
        photoUrl: data['photoUrl'] ?? data['profile_image'] ?? '',
        followersCount: data['followersCount'] ?? 0,
        followingCount: data['followingCount'] ?? 0,
        postsCount: data['postsCount'] ?? 0,
        isVerified: data['isVerified'] ?? false,
      );

      // Navigate to the user profile details screen
      navigator.push(
        MaterialPageRoute<void>(
          builder: (final BuildContext context) => UserProfileDetailScreen(user: userModel),
        ),
      );
    } catch (e) {
      debugPrint('Error resolving deep link user details: $e');
    }
  }
}
