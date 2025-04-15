import 'package:customer_service_realtime_chat/core/errors/errors.dart';
import 'package:customer_service_realtime_chat/features/login_view_feature/data/models/login_input_model.dart';
import 'package:customer_service_realtime_chat/features/login_view_feature/data/models/login_output_model.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepo {
  Future<Either<Errors, LoginOutputModel>> loginUser(
      {required LoginInputModel loginInputModel});
}
