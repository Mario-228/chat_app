import 'package:chat_bubbles/message_bars/message_bar.dart';
import 'package:customer_service_realtime_chat/core/util/app_fonts/app_fonts.dart';
import 'package:customer_service_realtime_chat/features/chat_feature/presentation/views_models/chatting_cubit/chatting_cubit.dart';
import 'package:customer_service_realtime_chat/features/chat_feature/presentation/views_models/chatting_cubit/chatting_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatViewMessageBar extends StatelessWidget {
  const ChatViewMessageBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChattingCubit, ChattingStates>(
      builder: (context, state) {
        return MessageBar(
          messageBarColor: Colors.transparent,
          onSend: (message) async =>
              await ChattingCubit.get(context).sendMessage(message),
          messageBarHintStyle: AppFonts.textStyleBold19,
          messageBarHintText: "type a message...",
        );
      },
    );
  }
}
