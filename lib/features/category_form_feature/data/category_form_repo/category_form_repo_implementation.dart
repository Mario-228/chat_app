import 'package:customer_service_realtime_chat/core/errors/errors.dart';
import 'package:customer_service_realtime_chat/core/util/api_services/api_services.dart';
import 'package:customer_service_realtime_chat/core/util/api_services/base_url.dart';
import 'package:customer_service_realtime_chat/features/category_form_feature/data/category_form_repo/category_end_points.dart';
import 'package:customer_service_realtime_chat/features/category_form_feature/data/category_form_repo/category_form_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CategoryFormRepoImplementation implements CategoryFormRepo {
  @override
  Future<Either<Errors, void>> logOut({required String token}) async {
    try {
      await ApiService(BaseUrl.api).signOut(CategoryEndPoints.logout, token);
      return right(null);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerError.fromDioError(e));
      }
      return left(
        ServerError(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
