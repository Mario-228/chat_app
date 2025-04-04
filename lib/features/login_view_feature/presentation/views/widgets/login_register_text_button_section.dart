import 'package:customer_service_realtime_chat/core/util/app_fonts/app_fonts.dart';
import 'package:flutter/material.dart';

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
          onPressed: () {},
        ),
      ],
    );
  }
}
