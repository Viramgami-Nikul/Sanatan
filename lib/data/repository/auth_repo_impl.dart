import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:santvani_app/app/my_app.dart';
import 'package:santvani_app/helper/pref_helper/shared_pref_helper.dart';
import 'package:santvani_app/views/tab_navigation/tab_navigation_view.dart';

import '../api/either.dart';
import '../errors/failure.dart';
import '../models/auth/request_model/forgot_password_request_model.dart';
import '../models/request_model/login_request_model.dart';
import '../models/auth/request_model/otp_request_model.dart';
import '../models/request_model/signup_request_model.dart';
import '../models/response_model/auth/user_data_model.dart';

import 'auth_repo.dart';

class AuthRepoImp implements AuthRepo {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseDatabase _database = FirebaseDatabase.instanceFor(
    app: Firebase.app(),
    databaseURL: 'https://emergency-sos-e8284-default-rtdb.firebaseio.com/',
  );

  @override
  Future<Either<Failure, UserDataModel>> apiLogin({
    required LoginRequestModel requestParams,
  }) async {
    try {
      debugPrint('=== API LOGIN CALLED ===');
      debugPrint('Email: ${requestParams.emailId}');
      debugPrint('Password: ${requestParams.userPassword}');
      
      if (requestParams.emailId == null || requestParams.userPassword == null) {
        debugPrint('Email or password is null');
        return const Left(ApiFailure(message: 'Email and password are required'));
      }

      debugPrint('Signing in with Firebase Auth');
      final UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: requestParams.emailId!,
        password: requestParams.userPassword!,
      );
      debugPrint('Firebase Auth sign in successful: ${userCredential.user?.uid}');

      final User? user = userCredential.user;
      if (user == null) {
        debugPrint('User is null');
        return const Left(ApiFailure(message: 'Login failed'));
      }

      debugPrint('Fetching user data from Firestore');
      final DocumentSnapshot userDoc = await _firestore.collection('users').doc(user.uid).get();
      final Map<String, dynamic>? userData = userDoc.data() as Map<String, dynamic>?;
      debugPrint('Firestore user data: $userData');
      
      final String fullName = (userData?['full_name'] as String?) ??
          user.displayName ??
          user.email?.split('@').first ??
          'User';

      final UserDataModel userModel = UserDataModel(
        userRegistrationId: userData?['user_registration_id'] ?? user.uid.hashCode.abs(),
        emailId: user.email,
        fullName: fullName,
        authToken: await user.getIdToken(false).timeout(
          const Duration(seconds: 10),
          onTimeout: () => '',
        ),
        mobileNumber: userData?['mobile_number'] ?? user.phoneNumber,
        profileImage: userData?['profile_image'] ?? user.photoURL,
      );

      // Fire-and-forget: Firestore write can be blocked by App Check enforcement.
      // The user is already authenticated — this update is non-critical.
      if ((userModel.mobileNumber ?? '').isNotEmpty) {
        unawaited(
          _firestore.collection('users').doc(user.uid).set(
            <String, dynamic>{
              'sanitized_mobile_number': _sanitizePhone(userModel.mobileNumber),
              'e164_mobile_number': _formatPhoneForAuth(
                userModel.mobileNumber ?? '',
                userData?['country_code']?.toString() ?? '+91',
              ),
              'updated_at': FieldValue.serverTimestamp(),
            },
            SetOptions(merge: true),
          ).catchError((final Object e) {
            debugPrint('Phone index update skipped: $e');
          }),
        );
      }
      // Fire-and-forget: Realtime DB write can be blocked by App Check
      // without affecting the login result.
      unawaited(_savePhoneUserIndex(
        uid: user.uid,
        name: userModel.fullName,
        phone: userModel.mobileNumber,
      ));

      debugPrint('Login successful, returning user model');
      return Right(userModel);
    } on FirebaseAuthException catch (e) {
      debugPrint('Firebase Auth Exception: ${e.code} - ${e.message}');
      return Left(ApiFailure(message: e.message ?? 'Login failed'));
    } catch (e, stacktrace) {
      debugPrint('General Exception: $e');
      debugPrint('Stacktrace: $stacktrace');
      return const Left(ApiFailure(message: 'An error occurred during login'));
    }
  }

  @override
  Future<Either<Failure, bool>> apiSignup({
    required SignupRequest requestParams,
  }) async {
    try {
      debugPrint('=== API SIGNUP CALLED ===');
      debugPrint('Email: ${requestParams.emailId}');
      debugPrint('Password: ${requestParams.userPassword}');
      debugPrint('First Name: ${requestParams.firstName}');
      debugPrint('Last Name: ${requestParams.lastName}');
      
      final String email = requestParams.emailId ?? '';
      final String password = requestParams.userPassword ?? 'password123';
      
      if (email.isEmpty) {
        debugPrint('Email is empty');
        return const Left(ApiFailure(message: 'Email is required'));
      }

      if (password.length < 6) {
        debugPrint('Password too short: ${password.length}');
        return const Left(ApiFailure(message: 'Password must be at least 6 characters'));
      }

      debugPrint('Creating user with Firebase Auth');
      final UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      debugPrint('Firebase Auth user created: ${userCredential.user?.uid}');

      final User? user = userCredential.user;
      if (user == null) {
        debugPrint('User is null');
        return const Left(ApiFailure(message: 'Signup failed'));
      }

      final String firstName = requestParams.firstName ?? '';
      final String lastName = requestParams.lastName ?? '';
      final String fullName = firstName.isNotEmpty && lastName.isNotEmpty 
          ? '$firstName $lastName'.trim()
          : 'User';

      final String rawUsername = '${firstName.trim().toLowerCase().replaceAll(' ', '')}_${lastName.trim().toLowerCase().replaceAll(' ', '')}';
      final String generatedUsername = rawUsername.isNotEmpty ? rawUsername : 'user_${user.uid.substring(0, 5)}';

      debugPrint('Updating display name');
      // Non-critical — fire-and-forget
      unawaited(user.updateDisplayName(fullName).catchError((_) {}));

      debugPrint('Saving user to Firestore');
      final String e164Phone = _formatPhoneForAuth(
        requestParams.contactNo ?? '',
        requestParams.countryCodeISO2,
      );
      await _firestore.collection('users').doc(user.uid).set({
        'uid': user.uid,
        'username': generatedUsername,
        'name': fullName,
        'email': email,
        'phoneNumber': e164Phone,
        'bio': '',
        'gender': requestParams.gender,
        'birthDate': requestParams.dateOfBirth,
        'country': requestParams.county,
        'address': requestParams.address,
        'photoUrl': '',
        'followersCount': 0,
        'followingCount': 0,
        'postsCount': 0,
        'isVerified': false,
        'privacyPolicyAccepted': requestParams.privacyPolicy ?? false,
        'termsAccepted': requestParams.termsAndConditions ?? false,
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      }).timeout(
        const Duration(seconds: 20),
        onTimeout: () {
          debugPrint('Firestore write timed out — App Check may be blocking writes.');
          throw Exception('Registration data save timed out. Please try again.');
        },
      );
      debugPrint('User saved to Firestore');

      // Fire-and-forget: Realtime DB write can be blocked by App Check
      // without affecting the signup result.
      unawaited(_savePhoneUserIndex(
        uid: user.uid,
        name: fullName,
        phone: requestParams.contactNo,
      ));

      return const Right(true);
    } on FirebaseAuthException catch (e) {
      debugPrint('Firebase Auth Exception: ${e.code} - ${e.message}');
      return Left(ApiFailure(message: e.message ?? 'Signup failed'));
    } catch (e, stacktrace) {
      debugPrint('General Exception: $e');
      debugPrint('Stacktrace: $stacktrace');
      return const Left(ApiFailure(message: 'An error occurred during signup'));
    }
  }

  @override
  Future<bool> forgotPassword(
      ForgotPasswordRequestModel request,
      ) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: request.email);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> verifyOtp(
      OtpRequestModel request,
      ) async {
    await Future.delayed(
      const Duration(seconds: 1),
    );
    return true;
  }

  @override
  Future<Either<Failure, String>> sendLoginOtp({
    required OtpRequestModel requestParams,
  }) async {
    try {
      final String phoneNumber = _formatPhoneForAuth(
        requestParams.emailOrPhone,
        requestParams.countryCode ?? '+91',
      );
      final Completer<Either<Failure, String>> completer =
          Completer<Either<Failure, String>>();

      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (final PhoneAuthCredential credential) async {
          try {
            debugPrint('=== VERIFICATION COMPLETED (AUTO-RETRIEVAL) ===');
            final UserCredential userCredential =
                await _firebaseAuth.signInWithCredential(credential);
            final DocumentSnapshot<Map<String, dynamic>>? userDoc =
                await _getRegisteredUserDocByPhone(phoneNumber);
            if (userDoc != null && userDoc.exists) {
              await _syncPhoneAuthProfileDoc(userDoc, userCredential.user);
              final UserDataModel userModel = await _userModelFromDoc(
                userDoc,
                userCredential.user,
              );
              await _saveLoggedInUser(userModel);

              // Automatically navigate to the dashboard using global navigatorKey
              // ONLY if the bloc/UI is already waiting (completer is completed)
              if (completer.isCompleted) {
                debugPrint('Auto-navigation to dashboard triggered.');
                navigatorKey.currentState?.pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (final BuildContext context) => const TabNavigationView(),
                  ),
                  (final Route<dynamic> route) => false,
                );
              }
            } else {
              debugPrint('User profile not found for auto-retrieved credential');
            }
          } catch (e, stack) {
            debugPrint('Error during auto-retrieval login: $e');
            debugPrint('$stack');
          }
          if (!completer.isCompleted) {
            completer.complete(const Right(''));
          }
        },
        verificationFailed: (final FirebaseAuthException e) {
          if (!completer.isCompleted) {
            completer.complete(
              Left(ApiFailure(message: e.message ?? 'Unable to send OTP')),
            );
          }
        },
        codeSent: (
          final String verificationId,
          final int? resendToken,
        ) {
          if (!completer.isCompleted) {
            completer.complete(Right(verificationId));
          }
        },
        codeAutoRetrievalTimeout: (final String verificationId) {
          if (!completer.isCompleted) {
            completer.complete(Right(verificationId));
          }
        },
      );

      return completer.future;
    } catch (e) {
      return Left(ApiFailure(message: 'Unable to send OTP: $e'));
    }
  }

  @override
  Future<Either<Failure, UserDataModel>> verifyLoginOtp({
    required OtpRequestModel requestParams,
    required String verificationId,
  }) async {
    try {
      final String otp = requestParams.otp ?? '';
      if (otp.isEmpty) {
        return const Left(ApiFailure(message: 'Please enter OTP'));
      }

      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      );
      final UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);
      final DocumentSnapshot<Map<String, dynamic>>? userDoc =
          await _getRegisteredUserDocByPhone(requestParams.emailOrPhone);

      if (userDoc == null || !userDoc.exists) {
        return const Left(ApiFailure(message: 'User profile not found'));
      }

      await _syncPhoneAuthProfileDoc(userDoc, userCredential.user);
      final UserDataModel userModel = await _userModelFromDoc(
        userDoc,
        userCredential.user,
      );
      await _saveLoggedInUser(userModel);
      return Right(userModel);
    } on FirebaseAuthException catch (e) {
      return Left(ApiFailure(message: e.message ?? 'OTP verification failed'));
    } catch (e) {
      return const Left(ApiFailure(message: 'OTP verification failed'));
    }
  }

  @override
  Future<Either<Failure, int?>> apiSignUp({
    required SignupRequest requestParams,
  }) async {
    final Either<Failure, bool> result =
        await apiSignup(requestParams: requestParams);
    return result.fold(
      (final Failure failure) => Left<Failure, int?>(failure),
      (final bool success) => Right<Failure, int?>(success ? 201 : 400),
    );
  }

  @override
  Future<Either<Failure, int?>> apiForgotPassword({
    required String email,
  }) async {
    try {
      debugPrint('=== API FORGOT PASSWORD CALLED ===');
      debugPrint('Email: $email');
      
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      
      debugPrint('Password reset email sent successfully!');
      return const Right(200);
    } on FirebaseAuthException catch (e) {
      debugPrint('Firebase Auth Exception: ${e.code} - ${e.message}');
      return Left(ApiFailure(message: e.message ?? 'Forgot password failed'));
    } catch (e, stacktrace) {
      debugPrint('General Exception: $e');
      debugPrint('Stacktrace: $stacktrace');
      return const Left(ApiFailure(message: 'Forgot password failed'));
    }
  }

  @override
  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }

  Future<void> _savePhoneUserIndex({
    required String uid,
    required String name,
    required String? phone,
  }) async {
    final String sanitizedPhone = _sanitizePhone(phone);
    if (sanitizedPhone.isEmpty) {
      return;
    }

    try {
      // FCM token fetch can fail when App Check is not configured
      String fcmToken = '';
      try {
        fcmToken = await FirebaseMessaging.instance
            .getToken()
            .timeout(const Duration(seconds: 5)) ?? '';
      } catch (_) {
        debugPrint('FCM token fetch skipped (App Check or timeout)');
      }

      await _database.ref('phone_users/$sanitizedPhone').set(
        <String, dynamic>{
          'uid': uid,
          'name': name,
          'phone': phone,
          'sanitized_phone': sanitizedPhone,
          'fcm_token': fcmToken,
          'updated_at': ServerValue.timestamp,
        },
      );
    } catch (e) {
      // Non-critical: Realtime DB write failure (e.g., App Check 403)
      // does not affect auth flow.
      debugPrint('_savePhoneUserIndex skipped: $e');
    }
  }

  String _sanitizePhone(final String? phone) {
    return (phone ?? '').replaceAll(RegExp(r'[^0-9]'), '');
  }

  String _formatPhoneForAuth(final String phone, final String? countryCode) {
    final String trimmedPhone = phone.trim();
    if (trimmedPhone.startsWith('+')) {
      return trimmedPhone;
    }

    final String sanitizedPhone = _sanitizePhone(trimmedPhone);
    final String sanitizedCountryCode = _sanitizePhone(countryCode);
    if (sanitizedCountryCode.isEmpty ||
        sanitizedPhone.startsWith(sanitizedCountryCode)) {
      return '+$sanitizedPhone';
    }

    return '+$sanitizedCountryCode$sanitizedPhone';
  }

  Future<DocumentSnapshot<Map<String, dynamic>>?> _getRegisteredUserDocByPhone(
    final String phone,
  ) async {
    final String sanitizedPhone = _sanitizePhone(phone);
    if (sanitizedPhone.isEmpty) {
      return null;
    }

    final String? authPhone = _firebaseAuth.currentUser?.phoneNumber;
    if (authPhone != null && authPhone.trim().isNotEmpty) {
      try {
        final QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
            .collection('users')
            .where('e164_mobile_number', isEqualTo: authPhone)
            .limit(1)
            .get()
            .timeout(const Duration(seconds: 5));
        if (snapshot.docs.isNotEmpty) {
          return snapshot.docs.first;
        }
      } catch (_) {}

      try {
        final QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
            .collection('users')
            .where('phoneNumber', isEqualTo: authPhone)
            .limit(1)
            .get()
            .timeout(const Duration(seconds: 5));
        if (snapshot.docs.isNotEmpty) {
          return snapshot.docs.first;
        }
      } catch (_) {}
    }

    try {
      final DataSnapshot phoneUserSnapshot =
          await _database.ref('phone_users/$sanitizedPhone').get()
          .timeout(const Duration(seconds: 5));
      final Object? value = phoneUserSnapshot.value;
      if (value is Map && value['uid'] != null) {
        return _firestore.collection('users').doc(value['uid'].toString()).get()
            .timeout(const Duration(seconds: 5));
      }
    } catch (_) {}

    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
          .collection('users')
          .where('sanitized_mobile_number', isEqualTo: sanitizedPhone)
          .limit(1)
          .get()
          .timeout(const Duration(seconds: 5));
      if (snapshot.docs.isNotEmpty) {
        return snapshot.docs.first;
      }

      snapshot = await _firestore
          .collection('users')
          .where('mobile_number', isEqualTo: phone)
          .limit(1)
          .get()
          .timeout(const Duration(seconds: 5));
      if (snapshot.docs.isNotEmpty) {
        return snapshot.docs.first;
      }

      snapshot = await _firestore
          .collection('users')
          .where('phoneNumber', isEqualTo: phone)
          .limit(1)
          .get()
          .timeout(const Duration(seconds: 5));
      if (snapshot.docs.isNotEmpty) {
        return snapshot.docs.first;
      }

      final String formattedPhone = _formatPhoneForAuth(phone, '+91');
      snapshot = await _firestore
          .collection('users')
          .where('phoneNumber', isEqualTo: formattedPhone)
          .limit(1)
          .get()
          .timeout(const Duration(seconds: 5));
      if (snapshot.docs.isNotEmpty) {
        return snapshot.docs.first;
      }
    } catch (_) {
      return null;
    }

    return null;
  }

  Future<UserDataModel> _userModelFromDoc(
    final DocumentSnapshot<Map<String, dynamic>> doc,
    final User? authUser,
  ) async {
    final Map<String, dynamic>? userData = doc.data();
    return UserDataModel(
      userRegistrationId:
          userData?['user_registration_id'] ?? doc.id.hashCode.abs(),
      emailId: userData?['email_id'] ?? userData?['email'] ?? authUser?.email,
      fullName: userData?['full_name'] ??
          userData?['name'] ??
          authUser?.displayName ??
          authUser?.phoneNumber ??
          'User',
      authToken: await authUser?.getIdToken(false).timeout(
        const Duration(seconds: 10),
        onTimeout: () => '',
      ),
      mobileNumber: userData?['mobile_number'] ?? userData?['phoneNumber'] ?? authUser?.phoneNumber,
      profileImage: userData?['profile_image'] ?? authUser?.photoURL,
    );
  }

  Future<void> _syncPhoneAuthProfileDoc(
    final DocumentSnapshot<Map<String, dynamic>> sourceDoc,
    final User? authUser,
  ) async {
    final String? authUid = authUser?.uid;
    final Map<String, dynamic>? data = sourceDoc.data();
    if (authUid == null || data == null || authUid == sourceDoc.id) {
      return;
    }

    // Fire-and-forget: blocked by App Check on Firestore writes
    unawaited(
      _firestore.collection('users').doc(authUid).set(
        <String, dynamic>{
          ...data,
          'uid': authUid,
          'email_auth_uid': sourceDoc.id,
          'phone_auth_uid': authUid,
          'updated_at': FieldValue.serverTimestamp(),
        },
        SetOptions(merge: true),
      ).catchError((final Object e) {
        debugPrint('_syncPhoneAuthProfileDoc skipped: $e');
      }),
    );
  }

  Future<void> _saveLoggedInUser(final UserDataModel user) async {
    await SharedPreferenceHelper().saveIsLoggedIn(true);
    await SharedPreferenceHelper().saveUser(user);
    await FirebaseCrashlytics.instance.setUserIdentifier(user.emailId ?? '');
    await FirebaseCrashlytics.instance.setCustomKey('user_name', user.fullName);
    await FirebaseCrashlytics.instance.setCustomKey(
      'registration_id',
      user.userRegistrationId ?? 'Not Found',
    );
  }

  @override
  Future<Either<Failure, List<Map<String, dynamic>>>> getDistributors() async {
    try {
      debugPrint('=== FETCHING DISTRIBUTORS FROM FIRESTORE ===');
      final QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
          .collection('users')
          .where('user_type', isEqualTo: 'Distributor')
          .get()
          .timeout(const Duration(seconds: 15));

      final List<Map<String, dynamic>> distributors = snapshot.docs.map((final QueryDocumentSnapshot<Map<String, dynamic>> doc) {
        final Map<String, dynamic> data = doc.data();
        return <String, dynamic>{
          'id': doc.id,
          'name': data['full_name'] ?? data['fullName'] ?? 'Unknown Distributor',
        };
      }).toList();

      final QuerySnapshot<Map<String, dynamic>> snapshot2 = await _firestore
          .collection('users')
          .where('userType', isEqualTo: 'Distributor')
          .get()
          .timeout(const Duration(seconds: 15));

      for (final QueryDocumentSnapshot<Map<String, dynamic>> doc in snapshot2.docs) {
        if (!distributors.any((final Map<String, dynamic> d) => d['id'] == doc.id)) {
          final Map<String, dynamic> data = doc.data();
          distributors.add(<String, dynamic>{
            'id': doc.id,
            'name': data['full_name'] ?? data['fullName'] ?? 'Unknown Distributor',
          });
        }
      }

      debugPrint('Fetched ${distributors.length} distributors.');
      return Right(distributors);
    } catch (e) {
      debugPrint('Error fetching distributors: $e');
      return Left(ApiFailure(message: 'Failed to fetch distributors: $e'));
    }
  }

  @override
  Future<Either<Failure, int?>> apiLogout({
    required Map<String, dynamic> requestParams,
  }) async {
    try {
      await logout();
      return const Right(200);
    } catch (e) {
      return const Left(ApiFailure(message: 'Logout failed'));
    }
  }
}

