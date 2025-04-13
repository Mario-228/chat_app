abstract class LogoutStates {}

class LogoutInitial extends LogoutStates {}

class LogoutLoading extends LogoutStates {}

class LogoutSuccess extends LogoutStates {}

class LogoutError extends LogoutStates {
  final String error;
  LogoutError({required this.error});
}
