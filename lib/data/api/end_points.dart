class AppEndPoints {

  /// Firebase Realtime Database Base URL
  static String baseUrl =
      'https://emergency-sos-e8284-default-rtdb.firebaseio.com/';

  // ----------------------------------------------------------------
  // Authentication
  // Firebase Authentication handled directly using FirebaseAuth
  // ----------------------------------------------------------------

  static String login =
      'auth/userLogin';

  static String registration =
      'auth/userRegistration';

  static String logout =
      'auth/logout';

  // ----------------------------------------------------------------
  // Firestore Collections
  // ----------------------------------------------------------------

  static String users =
      'users';

  static String emergencyRequests =
      'emergency_requests';

  static String chats =
      'chats';

  static String messages =
      'messages';

  static String notifications =
      'notifications';

  static String emergencyContacts =
      'emergency_contacts';

  // ----------------------------------------------------------------
  // Firebase Realtime Database Nodes
  // ----------------------------------------------------------------

  static String liveLocations =
      'live_locations';

  static String activeEmergencies =
      'active_emergencies';

  static String onlineUsers =
      'online_users';

  // ----------------------------------------------------------------
  // FCM
  // ----------------------------------------------------------------

  static String saveFcmToken =
      'save_fcm_token';

  // ----------------------------------------------------------------
  // User Profile
  // ----------------------------------------------------------------

  static String getUserProfile =
      'get_user_profile';

  static String updateUserProfile =
      'update_user_profile';

  // ----------------------------------------------------------------
  // SOS
  // ----------------------------------------------------------------

  static String sendSosAlert =
      'send_sos_alert';

  static String cancelSosAlert =
      'cancel_sos_alert';

  // ----------------------------------------------------------------
  // Chat
  // ----------------------------------------------------------------

  static String sendMessage =
      'send_message';

  static String getMessages =
      'get_messages';
}
