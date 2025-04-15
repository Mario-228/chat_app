import 'package:customer_service_realtime_chat/core/errors/errors.dart';
import 'package:customer_service_realtime_chat/core/util/api_services/api_services.dart';
import 'package:customer_service_realtime_chat/core/util/api_services/base_url.dart';
import 'package:customer_service_realtime_chat/features/login_view_feature/data/login_repo/login_end_points.dart';
import 'package:customer_service_realtime_chat/features/login_view_feature/data/login_repo/login_repo.dart';
import 'package:customer_service_realtime_chat/features/login_view_feature/data/models/login_input_model.dart';
import 'package:customer_service_realtime_chat/features/login_view_feature/data/models/login_output_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class LoginRepoImplementation implements LoginRepo {
  @override
  Future<Either<Errors, LoginOutputModel>> loginUser(
      {required LoginInputModel loginInputModel}) async {
    try {
      var response = await ApiService(BaseUrl.api)
          .postData(LoginEndPoints.login, loginInputModel.toJson());
      return Right(LoginOutputModel.fromJson(response));
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerError.fromDioError(e));
      }
      return left(ServerError(errorMessage: e.toString()));
    }
  }
}
