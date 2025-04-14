import 'package:customer_service_realtime_chat/core/widgets/custom_appbar.dart';
import 'package:customer_service_realtime_chat/features/chat_feature/presentation/views/widgets/chat_view_body.dart';
import 'package:customer_service_realtime_chat/features/chat_feature/presentation/views/widgets/ticket_router_action_button.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Chat ",
        actions: [
          TicketRouterActionButton(),
        ],
      ),
      body: ChatViewBody(),
    );
  }
}
