import 'dart:developer';
import 'package:customer_service_realtime_chat/core/widgets/custom_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/util/app_router/app_router.dart';
import '../../../../../core/util/functions/show_snack_bar.dart';
import '../../../../../core/widgets/custom_material_button.dart';
import '../../views_models/create_chat_room_cubit/create_chat_room_cubit.dart';
import '../../views_models/create_chat_room_cubit/create_chat_room_states.dart';

class StartChatBlocConsumerButton extends StatelessWidget {
  const StartChatBlocConsumerButton({
    super.key,
  });

  @override
/*************  ✨ Windsurf Command ⭐  *************/
  /// A widget that listens to the [CreateChatRoomCubit] and handles all the cases of the [CreateChatRoomStates].
  ///
  /// If the state is [CreateChatRoomError], it will show a snackbar with the error message.
  ///
  /// If the state is [CreateChatRoomSuccess], it will push replacement to [AppRouter.kchatView] with the chat id as extra.
  ///
  /// If the state is [CreateChatRoomLoading], it will display a [CustomLoadingWidget].
  ///
  /// If the state is not one of the above, it will display a [CustomMaterialButton] with the text "start chat".
  /// When the button is pressed, it will call [CreateChatRoomCubit.createChatRoom] and return the result.
/*******  e65cd959-c114-48f2-9a79-b593079df490  *******/  Widget build(BuildContext context) {
    return BlocConsumer<CreateChatRoomCubit, CreateChatRoomStates>(
      listener: (context, state) {
        if (state is CreateChatRoomError) {
          showSnackBar(context, message: state.error);
        } else if (state is CreateChatRoomSuccess) {
          log(state.chatId.toString());
          GoRouter.of(context)
              .pushReplacement(AppRouter.kchatView, extra: state.chatId);
        }
      },
      builder: (context, state) {
        if (state is CreateChatRoomLoading) {
          return const CustomLoadingWidget();
        } else {
          return CustomMaterialButton(
            text: "start chat",
            onPressed: () async {
              await CreateChatRoomCubit.get(context).createChatRoom();
            },
          );
        }
      },
    );
  }
}
