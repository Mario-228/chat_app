import 'package:customer_service_realtime_chat/core/util/app_router/app_router.dart';
import 'package:customer_service_realtime_chat/features/chat_feature/data/repo/chat_repo_implementation.dart';
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
          await ChatRepoImplementation().closeChatRoom(chatId: chatId);

          if (context.mounted) {
            GoRouter.of(context).pushReplacement(AppRouter.kTicketFormView);
          }
        },
        icon: const Icon(Icons.send));
  }
}
