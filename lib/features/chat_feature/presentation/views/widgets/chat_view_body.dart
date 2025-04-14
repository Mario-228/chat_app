import 'package:customer_service_realtime_chat/core/util/supabase_chatting_service/supabase_chatting_service.dart';
import 'package:customer_service_realtime_chat/core/widgets/custom_loading_widget.dart';
import 'package:customer_service_realtime_chat/features/chat_feature/presentation/views/widgets/chat_message_view.dart';
import 'package:customer_service_realtime_chat/features/chat_feature/presentation/views/widgets/chat_view_message_bar.dart';
import 'package:flutter/material.dart';

class ChatViewBody extends StatefulWidget {
  const ChatViewBody({super.key});

  @override
  State<ChatViewBody> createState() => _ChatViewBodyState();
}

class _ChatViewBodyState extends State<ChatViewBody> {
  final stream = SupabaseChattingService.messagesStream("Messages", "Id");
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        buildStreamMessages(),
        ChatViewMessageBar(),
      ],
    ));
  }

  StreamBuilder<List<Map<String, dynamic>>> buildStreamMessages() {
    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Expanded(
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                reverse: true,
                itemBuilder: (context, index) => ChatMessageView(
                    text: snapshot.data![index]["Content"] ?? ""),
                separatorBuilder: (context, index) => SizedBox(height: 10),
                itemCount: snapshot.data!.length),
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          return const CustomLoadingWidget();
        }
      },
    );
  }
}
