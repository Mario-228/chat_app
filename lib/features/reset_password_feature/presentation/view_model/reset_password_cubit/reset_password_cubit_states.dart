import 'package:customer_service_realtime_chat/core/errors/errors.dart';

abstract class ResetPasswordCubitStates {}

class ResetPasswordCubitInitial extends ResetPasswordCubitStates {}

class ResetPasswordStateLoading extends ResetPasswordCubitStates {}

class ResetPasswordStateSuccess extends ResetPasswordCubitStates {}

class ResetPasswordStateError extends ResetPasswordCubitStates {
  final Errors messaereError;

  ResetPasswordStateError({required this.messaereError});
}
