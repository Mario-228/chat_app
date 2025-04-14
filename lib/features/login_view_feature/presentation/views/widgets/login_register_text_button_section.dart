import 'package:customer_service_realtime_chat/core/util/app_fonts/app_fonts.dart';
import 'package:customer_service_realtime_chat/core/util/app_router/app_router.dart';
import 'package:customer_service_realtime_chat/core/util/supabase_chatting_service/supabase_chatting_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginRegisterTextButtonSection extends StatelessWidget {
  const LoginRegisterTextButtonSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Don't have an account?",
          style: AppFonts.textStyleMostBold18,
        ),
        TextButton(
            child: Text("Register", style: AppFonts.textStyleMostBold18),
            onPressed: () {
              SupabaseChattingService.createChannelChattingRoom("Messages");
              SupabaseChattingService.getChannels("Messages", "Id");
            }
            //await GoRouter.of(context).push(AppRouter.kRegisterView),
            ),
      ],
    );
  }
}
