part of 'chat_bloc.dart';

@freezed
abstract class ChatEvent with _$ChatEvent {
  const factory ChatEvent.loadFollowedUsers() = LoadFollowedUsers;

  const factory ChatEvent.openChat({
    required UserDataModel targetUser,
  }) = OpenChat;

  const factory ChatEvent.sendMessage({
    required String messageText,
    String? imageUrl,
    String? postId,
  }) = SendMessage;

  const factory ChatEvent.updateMessages({
    required List<MessageModel> messages,
  }) = UpdateMessages;

  const factory ChatEvent.clearActiveChat() = ClearActiveChat;

  const factory ChatEvent.sendPhoto({
    required String localFilePath,
  }) = SendPhoto;

  const factory ChatEvent.clearChatMessages() = ClearChatMessages;

  const factory ChatEvent.toggleBlockUser({
    required String targetUid,
    required bool block,
  }) = ToggleBlockUser;

  const factory ChatEvent.changeTheme({
    required int themeIndex,
  }) = ChangeTheme;
}
