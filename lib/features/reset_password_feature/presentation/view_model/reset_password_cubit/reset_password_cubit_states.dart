import 'package:customer_service_realtime_chat/core/errors/errors.dart';

abstract class ResetPasswordCubitStates {}

class ResetPasswordInitialState extends ResetPasswordCubitStates {}

class ResetPasswordLoadingState extends ResetPasswordCubitStates {}

class ResetPasswordSuccessState extends ResetPasswordCubitStates {}

class ResetPasswordErrorState extends ResetPasswordCubitStates {
  final Errors messageError;

  ResetPasswordErrorState({required this.messageError});
}
