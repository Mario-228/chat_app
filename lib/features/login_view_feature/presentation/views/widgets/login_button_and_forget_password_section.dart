import 'dart:async';

import 'package:customer_service_realtime_chat/core/util/app_fonts/app_fonts.dart';
import 'package:customer_service_realtime_chat/core/util/app_router/app_router.dart';
import 'package:customer_service_realtime_chat/core/widgets/custom_material_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginButtonAndForgetPasswordSection extends StatelessWidget {
  const LoginButtonAndForgetPasswordSection({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomMaterialButton(
            text: "Log in",
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                FocusScope.of(context).unfocus();

                Timer(Duration(milliseconds: 70), () async {
                  await GoRouter.of(context).push(AppRouter.kCategoryFormView);
                });
              }
            },
          ),
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
