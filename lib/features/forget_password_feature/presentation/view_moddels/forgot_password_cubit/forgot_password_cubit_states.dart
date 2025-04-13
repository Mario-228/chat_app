import 'package:customer_service_realtime_chat/core/errors/errors.dart';

abstract class ForgotPasswordCubitStates {}

class ForgotPasswordCubitInitial extends ForgotPasswordCubitStates {}

class ForgotPasswordCubitAwaiting extends ForgotPasswordCubitStates {}

class ForgotPasswordCubitSuccess extends ForgotPasswordCubitStates {}

class ForgotPasswordCubitError extends ForgotPasswordCubitStates {
  final Errors error;
  ForgotPasswordCubitError({required this.error});
}
