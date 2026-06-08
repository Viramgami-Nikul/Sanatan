import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import 'package:santvani_app/data/api/either.dart';
import 'package:santvani_app/data/errors/failure.dart';
import 'package:santvani_app/data/models/chat/message_model.dart';
import 'package:santvani_app/data/models/response_model/auth/user_data_model.dart';
import 'package:santvani_app/data/repository/chat_repo.dart';
import 'package:santvani_app/utils/app_enums.dart';

part 'chat_bloc.freezed.dart';
part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatRepo chatRepo;
  StreamSubscription<List<MessageModel>>? _messagesSubscription;

  ChatBloc({required this.chatRepo}) : super(ChatState.initial()) {
    chatRepo.updateUserPresence();
    on<LoadFollowedUsers>((final LoadFollowedUsers event, final Emitter<ChatState> emit) async {
      emit(state.copyWith(status: CommonScreenState.loading));
      final Either<Failure, List<UserDataModel>> result = await chatRepo.getFollowedUsers();
      result.fold(
        (final Failure failure) => emit(state.copyWith(
          status: CommonScreenState.error,
          errorMessage: failure.message,
        )),
        (final List<UserDataModel> users) => emit(state.copyWith(
          status: CommonScreenState.success,
          followedUsers: users,
        )),
      );
    });

    on<OpenChat>((final OpenChat event, final Emitter<ChatState> emit) async {
      final User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) return;
      final String myUid = currentUser.uid;
      final String targetUid = event.targetUser.uid ?? '';
      if (targetUid.isEmpty) return;

      // Cancel any existing messages stream subscription
      await _messagesSubscription?.cancel();

      // Create deterministic chatRoomId (sorted alphabetically)
      final List<String> ids = <String>[myUid, targetUid]..sort();
      final String chatRoomId = ids.join('_');

      emit(state.copyWith(
        status: CommonScreenState.loading,
        activeUser: event.targetUser,
        chatRoomId: chatRoomId,
        messages: <MessageModel>[],
      ));

      // Subscribe to messages stream
      _messagesSubscription = chatRepo.getMessages(chatRoomId).listen(
        (final List<MessageModel> messages) {
          add(ChatEvent.updateMessages(messages: messages));
        },
        onError: (final Object error) {
          debugPrint('Error listening to messages: $error');
        },
      );
    });

    on<SendMessage>((final SendMessage event, final Emitter<ChatState> emit) async {
      final User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null || state.chatRoomId == null || state.activeUser == null) return;
      final String myUid = currentUser.uid;
      final String targetUid = state.activeUser!.uid ?? '';
      final String chatRoomId = state.chatRoomId!;

      if (event.messageText.trim().isEmpty && event.imageUrl == null) return;

      final MessageModel message = MessageModel(
        messageId: const Uuid().v4(),
        senderId: myUid,
        receiverId: targetUid,
        message: event.messageText.trim(),
        imageUrl: event.imageUrl,
        postId: event.postId,
        timestamp: DateTime.now().millisecondsSinceEpoch,
        isRead: false,
      );

      await chatRepo.sendMessage(chatRoomId: chatRoomId, message: message);
    });

    on<UpdateMessages>((final UpdateMessages event, final Emitter<ChatState> emit) {
      emit(state.copyWith(
        status: CommonScreenState.success,
        messages: event.messages,
      ));
    });

    on<ClearActiveChat>((final ClearActiveChat event, final Emitter<ChatState> emit) async {
      await _messagesSubscription?.cancel();
      _messagesSubscription = null;
      emit(state.copyWith(
        activeUser: null,
        chatRoomId: null,
        messages: <MessageModel>[],
      ));
    });

    on<SendPhoto>((final SendPhoto event, final Emitter<ChatState> emit) async {
      final User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null || state.chatRoomId == null || state.activeUser == null) return;
      final String myUid = currentUser.uid;
      final String targetUid = state.activeUser!.uid ?? '';
      final String chatRoomId = state.chatRoomId!;

      final Either<Failure, String> uploadResult = await chatRepo.uploadChatImage(
        chatRoomId: chatRoomId,
        localFilePath: event.localFilePath,
      );

      await uploadResult.fold(
        (final Failure failure) async {
          emit(state.copyWith(
            status: CommonScreenState.error,
            errorMessage: 'Failed to upload photo: ${failure.message}',
          ));
        },
        (final String imageUrl) async {
          final MessageModel message = MessageModel(
            messageId: const Uuid().v4(),
            senderId: myUid,
            receiverId: targetUid,
            message: 'Sent a photo',
            imageUrl: imageUrl,
            timestamp: DateTime.now().millisecondsSinceEpoch,
            isRead: false,
          );

          await chatRepo.sendMessage(chatRoomId: chatRoomId, message: message);
        },
      );
    });

    on<ClearChatMessages>((final ClearChatMessages event, final Emitter<ChatState> emit) async {
      if (state.chatRoomId == null) return;
      await chatRepo.clearChat(state.chatRoomId!);
    });

    on<ToggleBlockUser>((final ToggleBlockUser event, final Emitter<ChatState> emit) async {
      if (event.block) {
        await chatRepo.blockUser(event.targetUid);
      } else {
        await chatRepo.unblockUser(event.targetUid);
      }
    });

    on<ChangeTheme>((final ChangeTheme event, final Emitter<ChatState> emit) {
      emit(state.copyWith(themeIndex: event.themeIndex));
    });
  }

  @override
  Future<void> close() async {
    await _messagesSubscription?.cancel();
    return super.close();
  }
}
