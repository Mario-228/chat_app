import 'package:customer_service_realtime_chat/features/login_view_feature/data/models/login_output_model.dart';

abstract class LoginStates {}

class LoginInitial extends LoginStates {}

class LoginLoading extends LoginStates {}

class LoginSuccess extends LoginStates {
  final LoginOutputModel model;
  LoginSuccess({required this.model});
}

class LoginError extends LoginStates {
  final String errorMessage;
  LoginError({required this.errorMessage});
}
