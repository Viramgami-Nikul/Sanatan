// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatEvent()';
}


}

/// @nodoc
class $ChatEventCopyWith<$Res>  {
$ChatEventCopyWith(ChatEvent _, $Res Function(ChatEvent) __);
}


/// Adds pattern-matching-related methods to [ChatEvent].
extension ChatEventPatterns on ChatEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadFollowedUsers value)?  loadFollowedUsers,TResult Function( OpenChat value)?  openChat,TResult Function( SendMessage value)?  sendMessage,TResult Function( UpdateMessages value)?  updateMessages,TResult Function( ClearActiveChat value)?  clearActiveChat,TResult Function( SendPhoto value)?  sendPhoto,TResult Function( ClearChatMessages value)?  clearChatMessages,TResult Function( ToggleBlockUser value)?  toggleBlockUser,TResult Function( ChangeTheme value)?  changeTheme,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadFollowedUsers() when loadFollowedUsers != null:
return loadFollowedUsers(_that);case OpenChat() when openChat != null:
return openChat(_that);case SendMessage() when sendMessage != null:
return sendMessage(_that);case UpdateMessages() when updateMessages != null:
return updateMessages(_that);case ClearActiveChat() when clearActiveChat != null:
return clearActiveChat(_that);case SendPhoto() when sendPhoto != null:
return sendPhoto(_that);case ClearChatMessages() when clearChatMessages != null:
return clearChatMessages(_that);case ToggleBlockUser() when toggleBlockUser != null:
return toggleBlockUser(_that);case ChangeTheme() when changeTheme != null:
return changeTheme(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadFollowedUsers value)  loadFollowedUsers,required TResult Function( OpenChat value)  openChat,required TResult Function( SendMessage value)  sendMessage,required TResult Function( UpdateMessages value)  updateMessages,required TResult Function( ClearActiveChat value)  clearActiveChat,required TResult Function( SendPhoto value)  sendPhoto,required TResult Function( ClearChatMessages value)  clearChatMessages,required TResult Function( ToggleBlockUser value)  toggleBlockUser,required TResult Function( ChangeTheme value)  changeTheme,}){
final _that = this;
switch (_that) {
case LoadFollowedUsers():
return loadFollowedUsers(_that);case OpenChat():
return openChat(_that);case SendMessage():
return sendMessage(_that);case UpdateMessages():
return updateMessages(_that);case ClearActiveChat():
return clearActiveChat(_that);case SendPhoto():
return sendPhoto(_that);case ClearChatMessages():
return clearChatMessages(_that);case ToggleBlockUser():
return toggleBlockUser(_that);case ChangeTheme():
return changeTheme(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadFollowedUsers value)?  loadFollowedUsers,TResult? Function( OpenChat value)?  openChat,TResult? Function( SendMessage value)?  sendMessage,TResult? Function( UpdateMessages value)?  updateMessages,TResult? Function( ClearActiveChat value)?  clearActiveChat,TResult? Function( SendPhoto value)?  sendPhoto,TResult? Function( ClearChatMessages value)?  clearChatMessages,TResult? Function( ToggleBlockUser value)?  toggleBlockUser,TResult? Function( ChangeTheme value)?  changeTheme,}){
final _that = this;
switch (_that) {
case LoadFollowedUsers() when loadFollowedUsers != null:
return loadFollowedUsers(_that);case OpenChat() when openChat != null:
return openChat(_that);case SendMessage() when sendMessage != null:
return sendMessage(_that);case UpdateMessages() when updateMessages != null:
return updateMessages(_that);case ClearActiveChat() when clearActiveChat != null:
return clearActiveChat(_that);case SendPhoto() when sendPhoto != null:
return sendPhoto(_that);case ClearChatMessages() when clearChatMessages != null:
return clearChatMessages(_that);case ToggleBlockUser() when toggleBlockUser != null:
return toggleBlockUser(_that);case ChangeTheme() when changeTheme != null:
return changeTheme(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadFollowedUsers,TResult Function( UserDataModel targetUser)?  openChat,TResult Function( String messageText,  String? imageUrl,  String? postId)?  sendMessage,TResult Function( List<MessageModel> messages)?  updateMessages,TResult Function()?  clearActiveChat,TResult Function( String localFilePath)?  sendPhoto,TResult Function()?  clearChatMessages,TResult Function( String targetUid,  bool block)?  toggleBlockUser,TResult Function( int themeIndex)?  changeTheme,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadFollowedUsers() when loadFollowedUsers != null:
return loadFollowedUsers();case OpenChat() when openChat != null:
return openChat(_that.targetUser);case SendMessage() when sendMessage != null:
return sendMessage(_that.messageText,_that.imageUrl,_that.postId);case UpdateMessages() when updateMessages != null:
return updateMessages(_that.messages);case ClearActiveChat() when clearActiveChat != null:
return clearActiveChat();case SendPhoto() when sendPhoto != null:
return sendPhoto(_that.localFilePath);case ClearChatMessages() when clearChatMessages != null:
return clearChatMessages();case ToggleBlockUser() when toggleBlockUser != null:
return toggleBlockUser(_that.targetUid,_that.block);case ChangeTheme() when changeTheme != null:
return changeTheme(_that.themeIndex);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadFollowedUsers,required TResult Function( UserDataModel targetUser)  openChat,required TResult Function( String messageText,  String? imageUrl,  String? postId)  sendMessage,required TResult Function( List<MessageModel> messages)  updateMessages,required TResult Function()  clearActiveChat,required TResult Function( String localFilePath)  sendPhoto,required TResult Function()  clearChatMessages,required TResult Function( String targetUid,  bool block)  toggleBlockUser,required TResult Function( int themeIndex)  changeTheme,}) {final _that = this;
switch (_that) {
case LoadFollowedUsers():
return loadFollowedUsers();case OpenChat():
return openChat(_that.targetUser);case SendMessage():
return sendMessage(_that.messageText,_that.imageUrl,_that.postId);case UpdateMessages():
return updateMessages(_that.messages);case ClearActiveChat():
return clearActiveChat();case SendPhoto():
return sendPhoto(_that.localFilePath);case ClearChatMessages():
return clearChatMessages();case ToggleBlockUser():
return toggleBlockUser(_that.targetUid,_that.block);case ChangeTheme():
return changeTheme(_that.themeIndex);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadFollowedUsers,TResult? Function( UserDataModel targetUser)?  openChat,TResult? Function( String messageText,  String? imageUrl,  String? postId)?  sendMessage,TResult? Function( List<MessageModel> messages)?  updateMessages,TResult? Function()?  clearActiveChat,TResult? Function( String localFilePath)?  sendPhoto,TResult? Function()?  clearChatMessages,TResult? Function( String targetUid,  bool block)?  toggleBlockUser,TResult? Function( int themeIndex)?  changeTheme,}) {final _that = this;
switch (_that) {
case LoadFollowedUsers() when loadFollowedUsers != null:
return loadFollowedUsers();case OpenChat() when openChat != null:
return openChat(_that.targetUser);case SendMessage() when sendMessage != null:
return sendMessage(_that.messageText,_that.imageUrl,_that.postId);case UpdateMessages() when updateMessages != null:
return updateMessages(_that.messages);case ClearActiveChat() when clearActiveChat != null:
return clearActiveChat();case SendPhoto() when sendPhoto != null:
return sendPhoto(_that.localFilePath);case ClearChatMessages() when clearChatMessages != null:
return clearChatMessages();case ToggleBlockUser() when toggleBlockUser != null:
return toggleBlockUser(_that.targetUid,_that.block);case ChangeTheme() when changeTheme != null:
return changeTheme(_that.themeIndex);case _:
  return null;

}
}

}

/// @nodoc


class LoadFollowedUsers implements ChatEvent {
  const LoadFollowedUsers();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadFollowedUsers);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatEvent.loadFollowedUsers()';
}


}




/// @nodoc


class OpenChat implements ChatEvent {
  const OpenChat({required this.targetUser});
  

 final  UserDataModel targetUser;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OpenChatCopyWith<OpenChat> get copyWith => _$OpenChatCopyWithImpl<OpenChat>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OpenChat&&(identical(other.targetUser, targetUser) || other.targetUser == targetUser));
}


@override
int get hashCode => Object.hash(runtimeType,targetUser);

@override
String toString() {
  return 'ChatEvent.openChat(targetUser: $targetUser)';
}


}

/// @nodoc
abstract mixin class $OpenChatCopyWith<$Res> implements $ChatEventCopyWith<$Res> {
  factory $OpenChatCopyWith(OpenChat value, $Res Function(OpenChat) _then) = _$OpenChatCopyWithImpl;
@useResult
$Res call({
 UserDataModel targetUser
});




}
/// @nodoc
class _$OpenChatCopyWithImpl<$Res>
    implements $OpenChatCopyWith<$Res> {
  _$OpenChatCopyWithImpl(this._self, this._then);

  final OpenChat _self;
  final $Res Function(OpenChat) _then;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? targetUser = null,}) {
  return _then(OpenChat(
targetUser: null == targetUser ? _self.targetUser : targetUser // ignore: cast_nullable_to_non_nullable
as UserDataModel,
  ));
}


}

/// @nodoc


class SendMessage implements ChatEvent {
  const SendMessage({required this.messageText, this.imageUrl, this.postId});
  

 final  String messageText;
 final  String? imageUrl;
 final  String? postId;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SendMessageCopyWith<SendMessage> get copyWith => _$SendMessageCopyWithImpl<SendMessage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendMessage&&(identical(other.messageText, messageText) || other.messageText == messageText)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.postId, postId) || other.postId == postId));
}


@override
int get hashCode => Object.hash(runtimeType,messageText,imageUrl,postId);

@override
String toString() {
  return 'ChatEvent.sendMessage(messageText: $messageText, imageUrl: $imageUrl, postId: $postId)';
}


}

/// @nodoc
abstract mixin class $SendMessageCopyWith<$Res> implements $ChatEventCopyWith<$Res> {
  factory $SendMessageCopyWith(SendMessage value, $Res Function(SendMessage) _then) = _$SendMessageCopyWithImpl;
@useResult
$Res call({
 String messageText, String? imageUrl, String? postId
});




}
/// @nodoc
class _$SendMessageCopyWithImpl<$Res>
    implements $SendMessageCopyWith<$Res> {
  _$SendMessageCopyWithImpl(this._self, this._then);

  final SendMessage _self;
  final $Res Function(SendMessage) _then;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? messageText = null,Object? imageUrl = freezed,Object? postId = freezed,}) {
  return _then(SendMessage(
messageText: null == messageText ? _self.messageText : messageText // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,postId: freezed == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class UpdateMessages implements ChatEvent {
  const UpdateMessages({required final  List<MessageModel> messages}): _messages = messages;
  

 final  List<MessageModel> _messages;
 List<MessageModel> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}


/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateMessagesCopyWith<UpdateMessages> get copyWith => _$UpdateMessagesCopyWithImpl<UpdateMessages>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateMessages&&const DeepCollectionEquality().equals(other._messages, _messages));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_messages));

@override
String toString() {
  return 'ChatEvent.updateMessages(messages: $messages)';
}


}

/// @nodoc
abstract mixin class $UpdateMessagesCopyWith<$Res> implements $ChatEventCopyWith<$Res> {
  factory $UpdateMessagesCopyWith(UpdateMessages value, $Res Function(UpdateMessages) _then) = _$UpdateMessagesCopyWithImpl;
@useResult
$Res call({
 List<MessageModel> messages
});




}
/// @nodoc
class _$UpdateMessagesCopyWithImpl<$Res>
    implements $UpdateMessagesCopyWith<$Res> {
  _$UpdateMessagesCopyWithImpl(this._self, this._then);

  final UpdateMessages _self;
  final $Res Function(UpdateMessages) _then;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? messages = null,}) {
  return _then(UpdateMessages(
messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<MessageModel>,
  ));
}


}

/// @nodoc


class ClearActiveChat implements ChatEvent {
  const ClearActiveChat();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearActiveChat);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatEvent.clearActiveChat()';
}


}




/// @nodoc


class SendPhoto implements ChatEvent {
  const SendPhoto({required this.localFilePath});
  

 final  String localFilePath;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SendPhotoCopyWith<SendPhoto> get copyWith => _$SendPhotoCopyWithImpl<SendPhoto>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendPhoto&&(identical(other.localFilePath, localFilePath) || other.localFilePath == localFilePath));
}


@override
int get hashCode => Object.hash(runtimeType,localFilePath);

@override
String toString() {
  return 'ChatEvent.sendPhoto(localFilePath: $localFilePath)';
}


}

/// @nodoc
abstract mixin class $SendPhotoCopyWith<$Res> implements $ChatEventCopyWith<$Res> {
  factory $SendPhotoCopyWith(SendPhoto value, $Res Function(SendPhoto) _then) = _$SendPhotoCopyWithImpl;
@useResult
$Res call({
 String localFilePath
});




}
/// @nodoc
class _$SendPhotoCopyWithImpl<$Res>
    implements $SendPhotoCopyWith<$Res> {
  _$SendPhotoCopyWithImpl(this._self, this._then);

  final SendPhoto _self;
  final $Res Function(SendPhoto) _then;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? localFilePath = null,}) {
  return _then(SendPhoto(
localFilePath: null == localFilePath ? _self.localFilePath : localFilePath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ClearChatMessages implements ChatEvent {
  const ClearChatMessages();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearChatMessages);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatEvent.clearChatMessages()';
}


}




/// @nodoc


class ToggleBlockUser implements ChatEvent {
  const ToggleBlockUser({required this.targetUid, required this.block});
  

 final  String targetUid;
 final  bool block;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToggleBlockUserCopyWith<ToggleBlockUser> get copyWith => _$ToggleBlockUserCopyWithImpl<ToggleBlockUser>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToggleBlockUser&&(identical(other.targetUid, targetUid) || other.targetUid == targetUid)&&(identical(other.block, block) || other.block == block));
}


@override
int get hashCode => Object.hash(runtimeType,targetUid,block);

@override
String toString() {
  return 'ChatEvent.toggleBlockUser(targetUid: $targetUid, block: $block)';
}


}

/// @nodoc
abstract mixin class $ToggleBlockUserCopyWith<$Res> implements $ChatEventCopyWith<$Res> {
  factory $ToggleBlockUserCopyWith(ToggleBlockUser value, $Res Function(ToggleBlockUser) _then) = _$ToggleBlockUserCopyWithImpl;
@useResult
$Res call({
 String targetUid, bool block
});




}
/// @nodoc
class _$ToggleBlockUserCopyWithImpl<$Res>
    implements $ToggleBlockUserCopyWith<$Res> {
  _$ToggleBlockUserCopyWithImpl(this._self, this._then);

  final ToggleBlockUser _self;
  final $Res Function(ToggleBlockUser) _then;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? targetUid = null,Object? block = null,}) {
  return _then(ToggleBlockUser(
targetUid: null == targetUid ? _self.targetUid : targetUid // ignore: cast_nullable_to_non_nullable
as String,block: null == block ? _self.block : block // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class ChangeTheme implements ChatEvent {
  const ChangeTheme({required this.themeIndex});
  

 final  int themeIndex;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangeThemeCopyWith<ChangeTheme> get copyWith => _$ChangeThemeCopyWithImpl<ChangeTheme>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangeTheme&&(identical(other.themeIndex, themeIndex) || other.themeIndex == themeIndex));
}


@override
int get hashCode => Object.hash(runtimeType,themeIndex);

@override
String toString() {
  return 'ChatEvent.changeTheme(themeIndex: $themeIndex)';
}


}

/// @nodoc
abstract mixin class $ChangeThemeCopyWith<$Res> implements $ChatEventCopyWith<$Res> {
  factory $ChangeThemeCopyWith(ChangeTheme value, $Res Function(ChangeTheme) _then) = _$ChangeThemeCopyWithImpl;
@useResult
$Res call({
 int themeIndex
});




}
/// @nodoc
class _$ChangeThemeCopyWithImpl<$Res>
    implements $ChangeThemeCopyWith<$Res> {
  _$ChangeThemeCopyWithImpl(this._self, this._then);

  final ChangeTheme _self;
  final $Res Function(ChangeTheme) _then;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? themeIndex = null,}) {
  return _then(ChangeTheme(
themeIndex: null == themeIndex ? _self.themeIndex : themeIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$ChatState {

 CommonScreenState get status; List<UserDataModel> get followedUsers; UserDataModel? get activeUser; List<MessageModel> get messages; int get themeIndex; String? get chatRoomId; String? get errorMessage;
/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatStateCopyWith<ChatState> get copyWith => _$ChatStateCopyWithImpl<ChatState>(this as ChatState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.followedUsers, followedUsers)&&(identical(other.activeUser, activeUser) || other.activeUser == activeUser)&&const DeepCollectionEquality().equals(other.messages, messages)&&(identical(other.themeIndex, themeIndex) || other.themeIndex == themeIndex)&&(identical(other.chatRoomId, chatRoomId) || other.chatRoomId == chatRoomId)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(followedUsers),activeUser,const DeepCollectionEquality().hash(messages),themeIndex,chatRoomId,errorMessage);

@override
String toString() {
  return 'ChatState(status: $status, followedUsers: $followedUsers, activeUser: $activeUser, messages: $messages, themeIndex: $themeIndex, chatRoomId: $chatRoomId, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ChatStateCopyWith<$Res>  {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) _then) = _$ChatStateCopyWithImpl;
@useResult
$Res call({
 CommonScreenState status, List<UserDataModel> followedUsers, UserDataModel? activeUser, List<MessageModel> messages, int themeIndex, String? chatRoomId, String? errorMessage
});




}
/// @nodoc
class _$ChatStateCopyWithImpl<$Res>
    implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._self, this._then);

  final ChatState _self;
  final $Res Function(ChatState) _then;

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? followedUsers = null,Object? activeUser = freezed,Object? messages = null,Object? themeIndex = null,Object? chatRoomId = freezed,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CommonScreenState,followedUsers: null == followedUsers ? _self.followedUsers : followedUsers // ignore: cast_nullable_to_non_nullable
as List<UserDataModel>,activeUser: freezed == activeUser ? _self.activeUser : activeUser // ignore: cast_nullable_to_non_nullable
as UserDataModel?,messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<MessageModel>,themeIndex: null == themeIndex ? _self.themeIndex : themeIndex // ignore: cast_nullable_to_non_nullable
as int,chatRoomId: freezed == chatRoomId ? _self.chatRoomId : chatRoomId // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatState].
extension ChatStatePatterns on ChatState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatState value)  $default,){
final _that = this;
switch (_that) {
case _ChatState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatState value)?  $default,){
final _that = this;
switch (_that) {
case _ChatState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CommonScreenState status,  List<UserDataModel> followedUsers,  UserDataModel? activeUser,  List<MessageModel> messages,  int themeIndex,  String? chatRoomId,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatState() when $default != null:
return $default(_that.status,_that.followedUsers,_that.activeUser,_that.messages,_that.themeIndex,_that.chatRoomId,_that.errorMessage);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CommonScreenState status,  List<UserDataModel> followedUsers,  UserDataModel? activeUser,  List<MessageModel> messages,  int themeIndex,  String? chatRoomId,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _ChatState():
return $default(_that.status,_that.followedUsers,_that.activeUser,_that.messages,_that.themeIndex,_that.chatRoomId,_that.errorMessage);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CommonScreenState status,  List<UserDataModel> followedUsers,  UserDataModel? activeUser,  List<MessageModel> messages,  int themeIndex,  String? chatRoomId,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _ChatState() when $default != null:
return $default(_that.status,_that.followedUsers,_that.activeUser,_that.messages,_that.themeIndex,_that.chatRoomId,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _ChatState implements ChatState {
   _ChatState({required this.status, required final  List<UserDataModel> followedUsers, required this.activeUser, required final  List<MessageModel> messages, required this.themeIndex, this.chatRoomId, this.errorMessage}): _followedUsers = followedUsers,_messages = messages;
  

@override final  CommonScreenState status;
 final  List<UserDataModel> _followedUsers;
@override List<UserDataModel> get followedUsers {
  if (_followedUsers is EqualUnmodifiableListView) return _followedUsers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_followedUsers);
}

@override final  UserDataModel? activeUser;
 final  List<MessageModel> _messages;
@override List<MessageModel> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}

@override final  int themeIndex;
@override final  String? chatRoomId;
@override final  String? errorMessage;

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatStateCopyWith<_ChatState> get copyWith => __$ChatStateCopyWithImpl<_ChatState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._followedUsers, _followedUsers)&&(identical(other.activeUser, activeUser) || other.activeUser == activeUser)&&const DeepCollectionEquality().equals(other._messages, _messages)&&(identical(other.themeIndex, themeIndex) || other.themeIndex == themeIndex)&&(identical(other.chatRoomId, chatRoomId) || other.chatRoomId == chatRoomId)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_followedUsers),activeUser,const DeepCollectionEquality().hash(_messages),themeIndex,chatRoomId,errorMessage);

@override
String toString() {
  return 'ChatState(status: $status, followedUsers: $followedUsers, activeUser: $activeUser, messages: $messages, themeIndex: $themeIndex, chatRoomId: $chatRoomId, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$ChatStateCopyWith<$Res> implements $ChatStateCopyWith<$Res> {
  factory _$ChatStateCopyWith(_ChatState value, $Res Function(_ChatState) _then) = __$ChatStateCopyWithImpl;
@override @useResult
$Res call({
 CommonScreenState status, List<UserDataModel> followedUsers, UserDataModel? activeUser, List<MessageModel> messages, int themeIndex, String? chatRoomId, String? errorMessage
});




}
/// @nodoc
class __$ChatStateCopyWithImpl<$Res>
    implements _$ChatStateCopyWith<$Res> {
  __$ChatStateCopyWithImpl(this._self, this._then);

  final _ChatState _self;
  final $Res Function(_ChatState) _then;

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? followedUsers = null,Object? activeUser = freezed,Object? messages = null,Object? themeIndex = null,Object? chatRoomId = freezed,Object? errorMessage = freezed,}) {
  return _then(_ChatState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CommonScreenState,followedUsers: null == followedUsers ? _self._followedUsers : followedUsers // ignore: cast_nullable_to_non_nullable
as List<UserDataModel>,activeUser: freezed == activeUser ? _self.activeUser : activeUser // ignore: cast_nullable_to_non_nullable
as UserDataModel?,messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<MessageModel>,themeIndex: null == themeIndex ? _self.themeIndex : themeIndex // ignore: cast_nullable_to_non_nullable
as int,chatRoomId: freezed == chatRoomId ? _self.chatRoomId : chatRoomId // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
