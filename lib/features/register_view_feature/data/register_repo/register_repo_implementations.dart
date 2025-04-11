import 'package:customer_service_realtime_chat/core/errors/errors.dart';
import 'package:customer_service_realtime_chat/core/util/api_services/api_services.dart';
import 'package:customer_service_realtime_chat/core/util/api_services/base_url.dart';
import 'package:customer_service_realtime_chat/features/register_view_feature/data/models/register_input_model.dart';
import 'package:customer_service_realtime_chat/features/register_view_feature/data/register_repo/register_end_points.dart';
import 'package:customer_service_realtime_chat/features/register_view_feature/data/register_repo/register_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class RegisterRepoImplementations implements RegisterRepo {
  @override
  Future<Either<Errors, void>> registerUser(
      {required RegisterInputModel registerInputModel}) async {
    try {
      await ApiService(BaseUrl.api)
          .postData(RegisterEndPoints.register, registerInputModel.toJson());
      return right(null);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerError.fromDioError(e));
      }
      return left(ServerError(errorMessage: e.toString()));
    }
  }
}
