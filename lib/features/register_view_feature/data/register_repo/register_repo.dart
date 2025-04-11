import 'package:customer_service_realtime_chat/core/errors/errors.dart';
import 'package:customer_service_realtime_chat/features/register_view_feature/data/models/register_input_model.dart';
import 'package:dartz/dartz.dart';

abstract class RegisterRepo {
  Future<Either<Errors, void>> registerUser(
      {required RegisterInputModel registerInputModel});
}
