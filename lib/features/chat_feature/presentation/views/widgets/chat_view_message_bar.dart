import 'package:chat_bubbles/message_bars/message_bar.dart';
import 'package:customer_service_realtime_chat/core/util/app_fonts/app_fonts.dart';
import 'package:flutter/material.dart';

class ChatViewMessageBar extends StatelessWidget {
  const ChatViewMessageBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MessageBar(
      messageBarColor: Colors.transparent,
      onSend: (_) {},
      messageBarHintStyle: AppFonts.textStyleBold19,
      messageBarHintText: "type a message...",
    );
  }
}
