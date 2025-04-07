import 'dart:ffi';

import 'package:customer_service_realtime_chat/features/chat_feature/presentation/views/widgets/chat_message_view.dart';
import 'package:flutter/material.dart';

class ChatViewBody extends StatefulWidget {
  const ChatViewBody({super.key});

  @override
  State<ChatViewBody> createState() => _ChatViewBodyState();
}

class _ChatViewBodyState extends State<ChatViewBody> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => ChatMessageView(),
        separatorBuilder: (context, index) => SizedBox(height: 10),
        itemCount: 5);
  }
}
