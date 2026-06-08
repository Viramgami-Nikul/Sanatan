import 'package:flutter/material.dart';

import 'package:santvani_app/routes/routes_name.dart';

import 'package:santvani_app/views/auth/forgot_password/forgot_password_page.dart';
import 'package:santvani_app/views/auth/login/login_page.dart';
import 'package:santvani_app/views/auth/otp/otp_page.dart';
import 'package:santvani_app/views/auth/signup/sign_up_detail_page.dart';
import 'package:santvani_app/views/auth/signup/signup_page.dart';


import 'package:santvani_app/views/privacy_policy/privacy_policy_page.dart';
import 'package:santvani_app/views/profile/address_details_screen.dart';
import 'package:santvani_app/views/profile/profile_details_screen.dart';
import 'package:santvani_app/views/profile/profile_screen.dart';
import 'package:santvani_app/views/splash/splash_screen.dart';
import 'package:santvani_app/views/tab_navigation/tab_navigation_view.dart';
import 'package:santvani_app/views/post/post_screen.dart';
import 'package:santvani_app/views/chat/chat_screen.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> getRoutes() {
    return <String, WidgetBuilder>{
      // ----------------------------------------------------------------------
      // Auth Routes
      // ----------------------------------------------------------------------
      RouteName.splashScreen: (final BuildContext context) =>
          const SplashScreen(),

      RouteName.loginScreen: (final BuildContext context) => LoginScreen(),

      RouteName.registrationScreen: (final BuildContext context) =>
          SignUpScreen(),

      RouteName.forgotPasswordScreen: (final BuildContext context) =>
          ForgotPasswordScreen(),

      RouteName.otpScreen: (final BuildContext context) => OtpScreen(),

      RouteName.signUpDetailScreen: (final BuildContext context) =>
          SignUpDetailScreen(),

      // ----------------------------------------------------------------------
      // Main Routes
      // ----------------------------------------------------------------------


      RouteName.profileScreen: (final BuildContext context) => ProfileScreen(),

      RouteName.profileDetailsScreen: (final BuildContext context) =>
          ProfileDetailsScreen(),

      RouteName.addressDetailsScreen: (final BuildContext context) =>
          AddressDetailsScreen(),

      RouteName.postScreen: (final BuildContext context) =>
          const PostScreen(),

      RouteName.chatScreen: (final BuildContext context) =>
          const ChatScreen(),



      RouteName.tabNavigationView: (final BuildContext context) =>
          TabNavigationView(),

      // ----------------------------------------------------------------------
      // Common Routes
      // ----------------------------------------------------------------------
      RouteName.privacyPolicyScreen: (final BuildContext context) =>
          PrivacyPolicyScreen(),
    };
  }
}
