import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:santvani_app/helper/pref_helper/shared_pref_helper.dart';

import '../api/either.dart';
import '../errors/failure.dart';
import '../models/response_model/auth/user_data_model.dart';
import '../models/user/update_profile_request_model.dart';
import '../models/user/user_model.dart';

import 'user_repo.dart';

class UserRepoImpl implements UserRepo {
  @override
  Future<UserModel> getProfile() async {
    await Future.delayed(
      const Duration(seconds: 1),
    );

    return UserModel(
      id: 1,
      fullName: 'Nikul Viramgami',
      email: 'nikul@gmail.com',
      mobile: '9999999999',
      profileImage: '',
    );
  }

  @override
  Future<UserModel> updateProfile(
      UpdateProfileRequestModel request,
      ) async {
    await Future.delayed(
      const Duration(seconds: 1),
    );

    return UserModel(
      id: 1,
      fullName: '${request.firstName} ${request.lastName}',
      email: request.email,
      mobile: request.mobileNumber,
      profileImage: request.profileImage ?? '',
    );
  }

  @override
  Future<Either<Failure, UserDataModel>> getUserProfileApi() async {
    try {
      final User? user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        return const Left(ApiFailure(message: 'User is not logged in'));
      }

      final DocumentSnapshot<Map<String, dynamic>> doc =
          await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
      final Map<String, dynamic>? data = doc.data();

      return Right(
        UserDataModel(
          userRegistrationId: data?['user_registration_id'] ?? 1,
          fullName: data?['full_name'] ?? data?['name'] ?? user.displayName ?? 'Nikul Prajapati',
          emailId: data?['email_id'] ?? user.email,
          mobileNumber: data?['mobile_number'] ?? user.phoneNumber,
          profileImage: data?['profile_image'] ?? user.photoURL,
          authToken: await user.getIdToken(),
          uid: data?['uid'] ?? user.uid,
          username: data?['username'] ?? 'nikul_prajapati',
          bio: data?['bio'] ?? 'Jay Ma Chamunda 🙏',
          photoUrl: data?['photoUrl'] ?? data?['profile_image'] ?? '',
          followersCount: data?['followersCount'] ?? 0,
          followingCount: data?['followingCount'] ?? 0,
          postsCount: data?['postsCount'] ?? 0,
          isVerified: data?['isVerified'] ?? false,
        ),
      );
    } catch (e) {
      return const Left(ApiFailure(message: 'Unable to load profile'));
    }
  }

  @override
  Future<Either<Failure, bool>> checkIsFollowing(final String targetUid) async {
    try {
      final User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        return const Right(false);
      }
      final DocumentSnapshot<Map<String, dynamic>> doc = await FirebaseFirestore.instance
          .collection('userFollowing')
          .doc('${currentUser.uid}_$targetUid')
          .get();
      return Right(doc.exists);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> followUser(final String targetUid) async {
    try {
      final User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        return const Left(ApiFailure(message: 'User not logged in'));
      }
      final String myUid = currentUser.uid;

      if (myUid == targetUid) {
        return const Left(ApiFailure(message: 'You cannot follow yourself'));
      }

      final DocumentReference myDocRef = FirebaseFirestore.instance.collection('users').doc(myUid);
      final DocumentReference targetDocRef = FirebaseFirestore.instance.collection('users').doc(targetUid);
      
      // Top-level collection references
      final DocumentReference followingTopRef = FirebaseFirestore.instance.collection('userFollowing').doc('${myUid}_$targetUid');
      final DocumentReference followersTopRef = FirebaseFirestore.instance.collection('userFollowers').doc('${targetUid}_$myUid');

      // Legacy subcollection references for backwards compatibility
      final DocumentReference legacyFollowingRef = myDocRef.collection('following').doc(targetUid);
      final DocumentReference legacyFollowersRef = targetDocRef.collection('followers').doc(myUid);

      await FirebaseFirestore.instance.runTransaction((final Transaction transaction) async {
        final DocumentSnapshot mySnapshot = await transaction.get(myDocRef);
        final DocumentSnapshot targetSnapshot = await transaction.get(targetDocRef);
        final DocumentSnapshot followingSnapshot = await transaction.get(followingTopRef);

        if (!followingSnapshot.exists) {
          final int currentFollowing = mySnapshot.exists ? (mySnapshot.get('followingCount') ?? 0) : 0;
          final int currentFollowers = targetSnapshot.exists ? (targetSnapshot.get('followersCount') ?? 0) : 0;

          // Write to top-level following collection (with userFollowing spelling)
          transaction.set(followingTopRef, <String, dynamic>{
            'userid': myUid,
            'userFollwing': targetUid,
            'userFollowing': targetUid,
            'followingUid': targetUid,
            'followedAt': FieldValue.serverTimestamp(),
          });

          // Write to top-level followers collection
          transaction.set(followersTopRef, <String, dynamic>{
            'userid': targetUid,
            'followerUid': myUid,
            'userFollower': myUid,
            'followerAt': FieldValue.serverTimestamp(),
          });

          // Legacy subcollection writes
          transaction.set(legacyFollowingRef, <String, dynamic>{'followedAt': FieldValue.serverTimestamp()});
          transaction.set(legacyFollowersRef, <String, dynamic>{'followerAt': FieldValue.serverTimestamp()});

          transaction.update(myDocRef, <String, dynamic>{'followingCount': currentFollowing + 1});
          transaction.update(targetDocRef, <String, dynamic>{'followersCount': currentFollowers + 1});
        }
      });

      return const Right<Failure, void>(null);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> unfollowUser(final String targetUid) async {
    try {
      final User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        return const Left(ApiFailure(message: 'User not logged in'));
      }
      final String myUid = currentUser.uid;

      final DocumentReference myDocRef = FirebaseFirestore.instance.collection('users').doc(myUid);
      final DocumentReference targetDocRef = FirebaseFirestore.instance.collection('users').doc(targetUid);
      
      // Top-level collection references
      final DocumentReference followingTopRef = FirebaseFirestore.instance.collection('userFollowing').doc('${myUid}_$targetUid');
      final DocumentReference followersTopRef = FirebaseFirestore.instance.collection('userFollowers').doc('${targetUid}_$myUid');

      // Legacy subcollection references for backwards compatibility
      final DocumentReference legacyFollowingRef = myDocRef.collection('following').doc(targetUid);
      final DocumentReference legacyFollowersRef = targetDocRef.collection('followers').doc(myUid);

      await FirebaseFirestore.instance.runTransaction((final Transaction transaction) async {
        final DocumentSnapshot mySnapshot = await transaction.get(myDocRef);
        final DocumentSnapshot targetSnapshot = await transaction.get(targetDocRef);
        final DocumentSnapshot followingSnapshot = await transaction.get(followingTopRef);

        if (followingSnapshot.exists) {
          final int currentFollowing = mySnapshot.exists ? (mySnapshot.get('followingCount') ?? 0) : 0;
          final int currentFollowers = targetSnapshot.exists ? (targetSnapshot.get('followersCount') ?? 0) : 0;

          // Delete from top-level collections
          transaction.delete(followingTopRef);
          transaction.delete(followersTopRef);

          // Legacy subcollection deletes
          transaction.delete(legacyFollowingRef);
          transaction.delete(legacyFollowersRef);

          transaction.update(myDocRef, <String, dynamic>{'followingCount': (currentFollowing - 1).clamp(0, 9999999)});
          transaction.update(targetDocRef, <String, dynamic>{'followersCount': (currentFollowers - 1).clamp(0, 9999999)});
        }
      });

      return const Right<Failure, void>(null);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserDataModel>> updateProfileApi({
    required String fullName,
    required String username,
    required String bio,
  }) async {
    try {
      final User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        return const Left(ApiFailure(message: 'User is not logged in'));
      }

      final String uid = currentUser.uid;
      final DocumentReference<Map<String, dynamic>> docRef =
          FirebaseFirestore.instance.collection('users').doc(uid);

      await docRef.update(<String, dynamic>{
        'full_name': fullName,
        'name': fullName,
        'username': username.toLowerCase().trim(),
        'bio': bio,
      });

      // Load updated data to return
      final DocumentSnapshot<Map<String, dynamic>> updatedDoc = await docRef.get();
      final Map<String, dynamic>? data = updatedDoc.data();

      final UserDataModel updatedUser = UserDataModel(
        userRegistrationId: data?['user_registration_id'] ?? 1,
        fullName: data?['full_name'] ?? data?['name'] ?? fullName,
        emailId: data?['email_id'] ?? currentUser.email,
        mobileNumber: data?['mobile_number'] ?? currentUser.phoneNumber,
        profileImage: data?['profile_image'] ?? currentUser.photoURL,
        authToken: await currentUser.getIdToken(),
        uid: data?['uid'] ?? uid,
        username: data?['username'] ?? username,
        bio: data?['bio'] ?? bio,
        photoUrl: data?['photoUrl'] ?? data?['profile_image'] ?? '',
        followersCount: data?['followersCount'] ?? 0,
        followingCount: data?['followingCount'] ?? 0,
        postsCount: data?['postsCount'] ?? 0,
        isVerified: data?['isVerified'] ?? false,
      );

      // Save to shared preference
      await SharedPreferenceHelper().saveUser(updatedUser);

      return Right(updatedUser);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }
}
