import 'dart:ffi';

import 'package:chat_bubbles/message_bars/message_bar.dart';
import 'package:customer_service_realtime_chat/features/chat_feature/presentation/views/widgets/chat_message_view.dart';
import 'package:customer_service_realtime_chat/features/chat_feature/presentation/views/widgets/chat_view_message_bar.dart';
import 'package:flutter/material.dart';

class ChatViewBody extends StatefulWidget {
  const ChatViewBody({super.key});

  @override
  State<ChatViewBody> createState() => _ChatViewBodyState();
}

class _ChatViewBodyState extends State<ChatViewBody> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.separated(
            itemBuilder: (context, index) => ChatMessageView(
                  index: index,
                ),
            separatorBuilder: (context, index) => SizedBox(height: 10),
            itemCount: 5),
        MessageBar(
          onSend: (_) {},
          actions: [ChatViewMessageBar()],
        )
      ],
    );
  }
}
