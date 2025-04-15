abstract class CreateChatRoomStates {}

class CreateChatRoomInitial extends CreateChatRoomStates {}

class CreateChatRoomLoading extends CreateChatRoomStates {}

class CreateChatRoomSuccess extends CreateChatRoomStates {
  final int chatId;
  CreateChatRoomSuccess({required this.chatId});
}

class CreateChatRoomError extends CreateChatRoomStates {
  final String error;
  CreateChatRoomError({required this.error});
}
