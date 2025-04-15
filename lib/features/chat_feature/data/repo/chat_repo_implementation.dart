import 'package:customer_service_realtime_chat/core/errors/errors.dart';
import 'package:customer_service_realtime_chat/core/util/api_services/api_services.dart';
import 'package:customer_service_realtime_chat/core/util/api_services/base_url.dart';
import 'package:customer_service_realtime_chat/core/util/cache_helper/cache_helper.dart';
import 'package:customer_service_realtime_chat/features/chat_feature/data/models/message_model.dart';
import 'package:customer_service_realtime_chat/features/chat_feature/data/repo/chat_end_points.dart';
import 'package:customer_service_realtime_chat/features/chat_feature/data/repo/chat_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ChatRepoImplementation implements ChatRepo {
  @override
  Future<Either<Errors, void>> sendMessage(
      {required MessageModel model}) async {
    try {
      await ApiService(BaseUrl.api).postMessage(
          ChatEndPoints.sendMessage, model, CacheHelper.getLoginData().token);
      return right(null);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerError.fromDioError(e));
      }
      return left(ServerError(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Errors, String>> closeChatRoom({required int chatId}) async {
    try {
      var response = await ApiService(BaseUrl.api).putWithToken(
          ChatEndPoints.closeChatRoom,
          chatId,
          CacheHelper.getLoginData().token);
      return right(response["message"]);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerError.fromDioError(e));
      }
      return left(ServerError(errorMessage: e.toString()));
    }
  }
}
