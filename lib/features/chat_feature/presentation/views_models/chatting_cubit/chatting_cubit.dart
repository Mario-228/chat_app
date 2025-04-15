import 'dart:developer';

import 'package:customer_service_realtime_chat/core/util/cache_helper/cache_helper.dart';
import 'package:customer_service_realtime_chat/features/chat_feature/data/models/message_model.dart';
import 'package:customer_service_realtime_chat/features/chat_feature/data/repo/chat_repo_implementation.dart';
import 'package:customer_service_realtime_chat/features/chat_feature/presentation/views_models/chatting_cubit/chatting_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChattingCubit extends Cubit<ChattingStates> {
  ChattingCubit() : super(ChattingInitial());

  static ChattingCubit get(BuildContext context) => BlocProvider.of(context);
  late int chatId;
  Future<void> sendMessage(String message) async {
    emit(SendingMessageLoadingState());
    var model = MessageModel(
        displayName: CacheHelper.getLoginData().displayName,
        chatId: chatId,
        content: message);
    log(model.toJson().toString());
    var response = await ChatRepoImplementation().sendMessage(model: model);
    response.fold(
      (onError) =>
          emit(SendingMessageErrorState(messageError: onError.errorMessage)),
      (onSuccess) => emit(SendingMessageSuccessState()),
    );
  }
}
