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
    return SafeArea(
        child: Column(
      children: [
        Expanded(
          child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              reverse: true,
              itemBuilder: (context, index) => ChatMessageView(
                    index: 50 - index,
                  ),
              separatorBuilder: (context, index) => SizedBox(height: 10),
              itemCount: 50),
        ),
        ChatViewMessageBar(),
      ],
    ));
  }
}
