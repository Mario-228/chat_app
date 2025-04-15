import 'package:customer_service_realtime_chat/core/util/cache_helper/cache_helper.dart';
import 'package:customer_service_realtime_chat/features/category_form_feature/data/category_form_repo/category_form_repo_implementation.dart';
import 'package:customer_service_realtime_chat/features/category_form_feature/presentation/views_models/create_chat_room_cubit/create_chat_room_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateChatRoomCubit extends Cubit<CreateChatRoomStates> {
  CreateChatRoomCubit() : super(CreateChatRoomInitial());

  static CreateChatRoomCubit get(BuildContext context) =>
      BlocProvider.of(context);
  int categoryId = 1;
  Future<void> createChatRoom() async {
    emit(CreateChatRoomLoading());
    var loginData = CacheHelper.getLoginData();
    var response = await CategoryFormRepoImplementation()
        .createChatRoom(token: loginData.token, categoryId: categoryId);
    response.fold(
      (onLeft) => emit(CreateChatRoomError(error: onLeft.errorMessage)),
      (onSuccess) => emit(CreateChatRoomSuccess(chatId: onSuccess)),
    );
  }
}
