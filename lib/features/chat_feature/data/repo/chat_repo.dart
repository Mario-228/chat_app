import 'package:customer_service_realtime_chat/core/errors/errors.dart';
import 'package:customer_service_realtime_chat/features/chat_feature/data/models/message_model.dart';
import 'package:dartz/dartz.dart';

abstract class ChatRepo {
  Future<Either<Errors, void>> sendMessage({required MessageModel model});
  Future<Either<Errors, String>> closeChatRoom({required int chatId});
}
