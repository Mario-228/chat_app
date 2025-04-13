import 'package:customer_service_realtime_chat/core/errors/errors.dart';
import 'package:customer_service_realtime_chat/features/forget_password_feature/data/models/forgot_passord_recived_moddel.dart';
import 'package:dartz/dartz.dart';

abstract class ForgotPasswordRepo {
  Future<Either<Errors, ForgotPasswordRecivedModdel>> SendForgetPasswordRequest(
      {required String email});
}
