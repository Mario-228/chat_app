import 'package:customer_service_realtime_chat/core/errors/errors.dart';
import 'package:customer_service_realtime_chat/core/util/api_services/api_services.dart';
import 'package:customer_service_realtime_chat/core/util/api_services/base_url.dart';
import 'package:customer_service_realtime_chat/features/forget_password_feature/data/forgot_password_repo/forgot_passowrd_end_point.dart';
import 'package:customer_service_realtime_chat/features/forget_password_feature/data/forgot_password_repo/forgot_password_repo.dart';
import 'package:customer_service_realtime_chat/features/forget_password_feature/data/models/forgot_passord_recived_moddel.dart';
import 'package:customer_service_realtime_chat/features/forget_password_feature/data/models/forgot_password_moddel.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class FotgotPasswordRepoImplementaion implements ForgotPasswordRepo {
  @override
  Future<Either<Errors, ForgotPasswordRecivedModdel>> SendForgetPasswordRequest(
      {required String email}) async {
    try {
      var response = await ApiService(BaseUrl.api).postData(
          ForgotPasswordEndPoint.sendForgotPassowrdRequest,
          ForgotPasswordModdel(email: email).toJson());
      return right(ForgotPasswordRecivedModdel.fromJson(response));
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerError.fromDioError(e));
      }
      return left(ServerError(errorMessage: e.toString()));
    }
  }
}
