import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:customer_service_realtime_chat/core/util/app_fonts/app_fonts.dart';
import 'package:flutter/material.dart';

class ChatMessageView extends StatelessWidget {
  const ChatMessageView({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return BubbleSpecialThree(
      text: text,
      tail: true,
      isSender: false,
      color: Color.fromARGB(100, 246, 246, 246),
      // ? Color.fromARGB(100, 63, 135, 255)
      // : ,
      textStyle: AppFonts.textStyleBold19,
    );
  }
}
