import 'package:customer_service_realtime_chat/core/errors/errors.dart';
import 'package:customer_service_realtime_chat/core/util/api_services/api_services.dart';
import 'package:customer_service_realtime_chat/core/util/api_services/base_url.dart';
import 'package:customer_service_realtime_chat/core/util/cache_helper/cache_helper.dart';
import 'package:customer_service_realtime_chat/features/submit_ticket_feature/data/model/tocket_form_model.dart';
import 'package:customer_service_realtime_chat/features/submit_ticket_feature/data/repo/submit_ticket_repo.dart';
import 'package:customer_service_realtime_chat/features/submit_ticket_feature/data/repo/submit_ticket_repo_endpoint.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SubmitTicketRepoExecution extends SubmitTicketRepo {
  @override
  Future<Either<Errors, void>> submitTicket(
      {required TicketFormModel tocketFormModel}) async {
    try {
      await ApiService(BaseUrl.api).postWithToken(
          SubmitTicketRepoEndpoint.endPoint,
          tocketFormModel.toJson(),
          CacheHelper.getLoginData().token);
      print(CacheHelper.getLoginData().token);
      return right(null);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerError.fromDioError(e));
      }
      return left(ServerError(errorMessage: e.toString()));
    }
  }
}
