abstract class ChattingStates {}

class ChattingInitial extends ChattingStates {}

class SendingMessageLoadingState extends ChattingStates {}

class SendingMessageSuccessState extends ChattingStates {}

class SendingMessageErrorState extends ChattingStates {
  final String messageError;

  SendingMessageErrorState({required this.messageError});
}
