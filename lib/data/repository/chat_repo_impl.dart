import 'dart:io';
import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:santvani_app/data/api/either.dart';
import 'package:santvani_app/data/errors/failure.dart';
import 'package:santvani_app/data/models/chat/message_model.dart';
import 'package:santvani_app/data/models/response_model/auth/user_data_model.dart';
import 'package:santvani_app/data/repository/chat_repo.dart';

const String FCM_SERVER_KEY = '';

class ChatRepoImpl implements ChatRepo {
  @override
  Future<Either<Failure, List<UserDataModel>>> getFollowedUsers() async {
    try {
      final User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        return const Left(ApiFailure(message: 'User not logged in'));
      }
      final String myUid = currentUser.uid;

      // 1. Get UIDs of all users whom the current user follows
      final QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
          .collection('userFollowing')
          .where('userid', isEqualTo: myUid)
          .get();

      final List<String> followedUids = snapshot.docs
          .map((final QueryDocumentSnapshot<Map<String, dynamic>> doc) {
            final Map<String, dynamic> data = doc.data();
            return (data['followingUid'] ?? data['userFollowing'] ?? '') as String;
          })
          .where((final String id) => id.isNotEmpty)
          .toList();

      if (followedUids.isEmpty) {
        return const Right(<UserDataModel>[]);
      }

      // 2. Fetch full UserDataModel details for each followed UID
      final List<UserDataModel> followedUsers = <UserDataModel>[];
      for (final String uid in followedUids) {
        final DocumentSnapshot<Map<String, dynamic>> userDoc =
            await FirebaseFirestore.instance.collection('users').doc(uid).get();

        if (userDoc.exists) {
          final Map<String, dynamic> data = userDoc.data() ?? <String, dynamic>{};
          followedUsers.add(
            UserDataModel(
              userRegistrationId: data['user_registration_id'] as int?,
              fullName: (data['full_name'] ?? data['name'] ?? 'Viramgami Nikul') as String,
              emailId: data['email_id'] as String?,
              mobileNumber: data['mobile_number'] as String?,
              profileImage: (data['profile_image'] ?? data['photoUrl'] ?? '') as String,
              authToken: '',
              uid: data['uid'] as String? ?? userDoc.id,
              username: data['username'] as String?,
              bio: data['bio'] as String?,
              photoUrl: (data['photoUrl'] ?? data['profile_image'] ?? '') as String,
              followersCount: data['followersCount'] as int?,
              followingCount: data['followingCount'] as int?,
              postsCount: data['postsCount'] as int?,
              isVerified: data['isVerified'] as bool?,
            ),
          );
        }
      }

      return Right(followedUsers);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Stream<List<MessageModel>> getMessages(final String chatRoomId) {
    return FirebaseDatabase.instance
        .ref('chats/$chatRoomId/messages')
        .orderByChild('timestamp')
        .onValue
        .map((final DatabaseEvent event) {
          final dynamic rawData = event.snapshot.value;
          if (rawData == null) {
            return <MessageModel>[];
          }

          final List<MessageModel> messagesList = <MessageModel>[];
          if (rawData is Map) {
            final Map<dynamic, dynamic> data = rawData;
            data.forEach((final dynamic key, final dynamic value) {
              if (value is Map) {
                final Map<String, dynamic> valMap = Map<String, dynamic>.from(value);
                messagesList.add(MessageModel.fromJson(valMap));
              }
            });
          }

          // Sort messages in ascending order by timestamp
          messagesList.sort((final MessageModel a, final MessageModel b) => a.timestamp.compareTo(b.timestamp));
          return messagesList;
        });
  }

  @override
  Future<Either<Failure, void>> sendMessage({
    required final String chatRoomId,
    required final MessageModel message,
  }) async {
    try {
      final DatabaseReference msgRef = FirebaseDatabase.instance
          .ref('chats/$chatRoomId/messages')
          .child(message.messageId);

      await msgRef.set(message.toJson());

      // Update the last message node in the chat room for real-time history listing
      await FirebaseDatabase.instance
          .ref('chats/$chatRoomId/lastMessage')
          .set(<String, dynamic>{
            'message': message.message,
            'timestamp': message.timestamp,
            'senderId': message.senderId,
          });

      // Try sending a real-time push notification via FCM
      try {
        final DocumentSnapshot<Map<String, dynamic>> recipientDoc =
            await FirebaseFirestore.instance.collection('users').doc(message.receiverId).get();
        final String? recipientToken = recipientDoc.data()?['fcm_token'];

        if (recipientToken != null && recipientToken.isNotEmpty) {
          final DocumentSnapshot<Map<String, dynamic>> senderDoc =
              await FirebaseFirestore.instance.collection('users').doc(message.senderId).get();
          final String senderName = (senderDoc.data()?['full_name'] ?? senderDoc.data()?['name'] ?? 'New Message') as String;

          _sendFCMNotification(
            recipientToken: recipientToken,
            senderName: senderName,
            messageText: message.imageUrl != null ? '📷 Photo' : message.message,
          );
        }
      } catch (ex) {
        debugPrint('Error fetching recipient token for push: $ex');
      }

      return const Right<Failure, void>(null);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  void updateUserPresence() {
    final String myUid = FirebaseAuth.instance.currentUser?.uid ?? '';
    if (myUid.isEmpty) return;

    final DatabaseReference presenceRef = FirebaseDatabase.instance.ref('status/$myUid');
    presenceRef.set(<String, dynamic>{
      'state': 'online',
      'last_changed': ServerValue.timestamp,
    });

    presenceRef.onDisconnect().set(<String, dynamic>{
      'state': 'offline',
      'last_changed': ServerValue.timestamp,
    });
  }

  @override
  Stream<bool> getUserPresence(final String targetUid) {
    return FirebaseDatabase.instance
        .ref('status/$targetUid/state')
        .onValue
        .map((final DatabaseEvent event) => event.snapshot.value == 'online');
  }

  @override
  Future<Either<Failure, String>> uploadChatImage({
    required final String chatRoomId,
    required final String localFilePath,
  }) async {
    try {
      final File file = File(localFilePath);
      final String fileName = 'chats/$chatRoomId/${DateTime.now().millisecondsSinceEpoch}.jpg';
      final Reference storageRef = FirebaseStorage.instance.ref().child(fileName);
      
      final UploadTask uploadTask = storageRef.putFile(file);
      final TaskSnapshot snapshot = await uploadTask.whenComplete(() {});
      final String downloadUrl = await snapshot.ref.getDownloadURL();
      return Right(downloadUrl);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> clearChat(final String chatRoomId) async {
    try {
      await FirebaseDatabase.instance.ref('chats/$chatRoomId').remove();
      return const Right<Failure, void>(null);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> blockUser(final String targetUid) async {
    try {
      final String myUid = FirebaseAuth.instance.currentUser?.uid ?? '';
      if (myUid.isEmpty) return const Left(ApiFailure(message: 'User not logged in'));
      await FirebaseDatabase.instance.ref('blocks/$myUid/$targetUid').set(true);
      return const Right<Failure, void>(null);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> unblockUser(final String targetUid) async {
    try {
      final String myUid = FirebaseAuth.instance.currentUser?.uid ?? '';
      if (myUid.isEmpty) return const Left(ApiFailure(message: 'User not logged in'));
      await FirebaseDatabase.instance.ref('blocks/$myUid/$targetUid').remove();
      return const Right<Failure, void>(null);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Stream<bool> isUserBlocked(final String targetUid) {
    final String myUid = FirebaseAuth.instance.currentUser?.uid ?? '';
    if (myUid.isEmpty) return Stream<bool>.value(false);
    return FirebaseDatabase.instance
        .ref('blocks/$myUid/$targetUid')
        .onValue
        .map((final DatabaseEvent event) => event.snapshot.exists);
  }

  Future<void> _sendFCMNotification({
    required final String recipientToken,
    required final String senderName,
    required final String messageText,
  }) async {
    try {
      if (FCM_SERVER_KEY.isEmpty) {
        debugPrint('FCM Server Key is empty. Push notification skipped.');
        return;
      }
      final Dio dio = Dio();
      const String fcmUrl = 'https://fcm.googleapis.com/fcm/send';

      await dio.post<dynamic>(
        fcmUrl,
        options: Options(
          headers: <String, dynamic>{
            'Content-Type': 'application/json',
            'Authorization': 'key=$FCM_SERVER_KEY',
          },
        ),
        data: <String, dynamic>{
          'to': recipientToken,
          'priority': 'high',
          'notification': <String, dynamic>{
            'title': senderName,
            'body': messageText,
            'sound': 'default',
            'click_action': 'FLUTTER_NOTIFICATION_CLICK',
          },
          'data': <String, dynamic>{
            'type': 'chat',
            'senderId': FirebaseAuth.instance.currentUser?.uid ?? '',
          },
        },
      );
      debugPrint('Chat push notification sent successfully to token: $recipientToken');
    } catch (e) {
      debugPrint('Error delivering client-side FCM notification: $e');
    }
  }
}
