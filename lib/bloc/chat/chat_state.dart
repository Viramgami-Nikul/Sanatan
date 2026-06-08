part of 'chat_bloc.dart';

@freezed
abstract class ChatState with _$ChatState {
  factory ChatState({
    required CommonScreenState status,
    required List<UserDataModel> followedUsers,
    required UserDataModel? activeUser,
    required List<MessageModel> messages,
    required int themeIndex,
    String? chatRoomId,
    String? errorMessage,
  }) = _ChatState;

  factory ChatState.initial() {
    return ChatState(
      status: CommonScreenState.initial,
      followedUsers: <UserDataModel>[],
      activeUser: null,
      messages: <MessageModel>[],
      themeIndex: 0,
      chatRoomId: null,
      errorMessage: null,
    );
  }
}
