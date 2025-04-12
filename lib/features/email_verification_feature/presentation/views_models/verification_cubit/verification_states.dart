abstract class VerificationStates {}

class VerificationInitial extends VerificationStates {}

class SendVerificationLoading extends VerificationStates {}

class SendVerificationSuccess extends VerificationStates {}

class SendVerificationError extends VerificationStates {
  final String error;
  SendVerificationError({required this.error});
}

class ReSendVerificationLoading extends VerificationStates {}

class ReSendVerificationSuccess extends VerificationStates {}

class ReSendVerificationError extends VerificationStates {
  final String error;
  ReSendVerificationError({required this.error});
}

class VerificationLoading extends VerificationStates {}

class VerificationSuccess extends VerificationStates {}

class VerificationError extends VerificationStates {
  final String error;
  VerificationError({required this.error});
}
