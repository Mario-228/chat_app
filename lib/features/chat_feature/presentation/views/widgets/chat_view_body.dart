import 'package:customer_service_realtime_chat/core/util/cache_helper/cache_helper.dart';
import 'package:customer_service_realtime_chat/core/util/supabase_chatting_service/supabase_chatting_service.dart';
import 'package:customer_service_realtime_chat/core/widgets/custom_loading_widget.dart';
import 'package:customer_service_realtime_chat/features/chat_feature/presentation/views/widgets/chat_message_view.dart';
import 'package:customer_service_realtime_chat/features/chat_feature/presentation/views/widgets/chat_view_message_bar.dart';
import 'package:customer_service_realtime_chat/features/chat_feature/presentation/views_models/chatting_cubit/chatting_cubit.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChatViewBody extends StatefulWidget {
  const ChatViewBody({super.key, required this.chatId});
  final int chatId;
  @override
  State<ChatViewBody> createState() => _ChatViewBodyState();
}

class _ChatViewBodyState extends State<ChatViewBody> {
  late SupabaseStreamBuilder stream;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ChattingCubit.get(context).chatId = widget.chatId;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(CacheHelper.getLoginData().role);

    stream = SupabaseChattingService.messagesStream(
      "Messages",
      "ChatId",
      widget.chatId,
    );
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
          var messagesLength = snapshot.data!.length;
          return Expanded(
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                reverse: true,
                itemBuilder: (context, index) {
                  var dataFromSupabase =
                      snapshot.data![messagesLength - index - 1];
                  return ChatMessageView(
                      isSender: dataFromSupabase["SenderId"] ==
                          CacheHelper.getLoginData().id,
                      text: dataFromSupabase["Content"] ?? "");
                },
                separatorBuilder: (context, index) => SizedBox(height: 10),
                itemCount: messagesLength),
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
