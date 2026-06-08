import 'package:santvani_app/data/api/either.dart';
import 'package:santvani_app/data/errors/failure.dart';
import 'package:santvani_app/data/models/chat/message_model.dart';
import 'package:santvani_app/data/models/response_model/auth/user_data_model.dart';

abstract class ChatRepo {
  Future<Either<Failure, List<UserDataModel>>> getFollowedUsers();
  Stream<List<MessageModel>> getMessages(final String chatRoomId);
  Future<Either<Failure, void>> sendMessage({
    required final String chatRoomId,
    required final MessageModel message,
  });
  void updateUserPresence();
  Stream<bool> getUserPresence(final String targetUid);
  Future<Either<Failure, String>> uploadChatImage({
    required final String chatRoomId,
    required final String localFilePath,
  });
  Future<Either<Failure, void>> clearChat(final String chatRoomId);
  Future<Either<Failure, void>> blockUser(final String targetUid);
  Future<Either<Failure, void>> unblockUser(final String targetUid);
  Stream<bool> isUserBlocked(final String targetUid);
}
