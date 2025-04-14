import 'package:customer_service_realtime_chat/core/errors/errors.dart';
import 'package:customer_service_realtime_chat/core/util/api_services/api_services.dart';
import 'package:customer_service_realtime_chat/core/util/api_services/base_url.dart';
import 'package:customer_service_realtime_chat/features/reset_password_feature/data/models/reset_password_model.dart';
import 'package:customer_service_realtime_chat/features/reset_password_feature/data/reset_password_repo/reset_password_endpoint.dart';
import 'package:customer_service_realtime_chat/features/reset_password_feature/data/reset_password_repo/reset_password_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ResetPasswordRepoImplementaion extends ResetPasswordRepo {
  @override
  Future<Either<Errors, void>> resetPasswordByCode(
      {required ResetPasswordModel model}) async {
    try {
      await ApiService(BaseUrl.api)
          .postData(ResetPasswordEndpoint.resetPassword, model.toJson());
      return right(null);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerError.fromDioError(e));
      }
      return left(ServerError(errorMessage: e.toString()));
    }
  }
}
