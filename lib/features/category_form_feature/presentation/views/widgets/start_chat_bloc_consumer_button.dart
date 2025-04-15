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
  Widget build(BuildContext context) {
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
