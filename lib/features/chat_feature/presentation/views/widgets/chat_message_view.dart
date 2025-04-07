import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:customer_service_realtime_chat/core/util/app_fonts/app_fonts.dart';
import 'package:flutter/material.dart';

class ChatMessageView extends StatelessWidget {
  const ChatMessageView({super.key, required this.index});
  final int index;
  //the index is for displaying the message from left or right

  @override
  Widget build(BuildContext context) {
    bool isSender = index % 2 == 0;
    return BubbleSpecialThree(
      text: "PlaceHolderData $index",
      tail: true,
      isSender: isSender,
      color: isSender
          ? Color.fromARGB(100, 63, 135, 255)
          : Color.fromARGB(100, 246, 246, 246),
      textStyle: AppFonts.textStyleBold19,
    );
  }
}
