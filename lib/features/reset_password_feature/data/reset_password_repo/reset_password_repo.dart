import 'package:customer_service_realtime_chat/core/errors/errors.dart';
import 'package:customer_service_realtime_chat/features/reset_password_feature/data/models/reset_password_model.dart';
import 'package:dartz/dartz.dart';

abstract class ResetPasswordRepo {
  Future<Either<Errors, void>> resetPasswordByCode(
      {required ResetPasswordModel model});
}
