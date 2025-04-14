import 'package:customer_service_realtime_chat/core/util/app_fonts/app_fonts.dart';
import 'package:customer_service_realtime_chat/core/util/app_router/app_router.dart';
import 'package:customer_service_realtime_chat/features/login_view_feature/presentation/views/widgets/login_button_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginButtonAndForgetPasswordSection extends StatelessWidget {
  const LoginButtonAndForgetPasswordSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: LoginButtonBlocConsumer(),
        ),
        SizedBox(width: 20.0),
        Expanded(
          child: TextButton(
            child: Text("Forgot Password", style: AppFonts.textStyleMostBold18),
            onPressed: () async =>
                await GoRouter.of(context).push(AppRouter.kforgetPasswordView),
          ),
        ),
      ],
    );
  }
}
