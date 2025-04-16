import 'package:customer_service_realtime_chat/core/util/app_router/app_router.dart';
import 'package:customer_service_realtime_chat/core/util/functions/show_snack_bar.dart';
import 'package:customer_service_realtime_chat/features/chat_feature/data/repo/chat_repo_implementation.dart';
import 'package:customer_service_realtime_chat/features/chat_feature/presentation/views_models/chatting_cubit/chatting_cubit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TicketRouterActionButton extends StatelessWidget {
  const TicketRouterActionButton({
    super.key,
    required this.chatId,
  });
  final int chatId;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        await ChattingCubit.get(context).sendMessage(
            "This session has reached a conclushion,\nIf you need any futher assistance, feel free to start a new caht and we will be glad to help, \n Kind regards, \n Support Team");
        var response =
            await ChatRepoImplementation().closeChatRoom(chatId: chatId);
        response.fold(
          (onLeft) {
            showSnackBar(context, message: onLeft.errorMessage);
          },
          (onSuccess) {
            showSnackBar(context, message: onSuccess);
            if (context.mounted) {
              GoRouter.of(context)
                  .pushReplacement(AppRouter.kTicketFormView, extra: chatId);
            }
          },
        );
      },
      icon: const Icon(Icons.send),
    );
  }
}
