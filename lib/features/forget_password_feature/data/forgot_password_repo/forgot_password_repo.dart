import 'package:customer_service_realtime_chat/core/errors/errors.dart';
import 'package:dartz/dartz.dart';

abstract class ForgotPasswordRepo {
  Future<Either<Errors, void>> sendForgetPasswordRequest(
      {required String email});
}
