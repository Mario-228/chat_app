import 'package:customer_service_realtime_chat/core/widgets/custom_appbar.dart';
import 'package:customer_service_realtime_chat/features/email_verification_feature/presentation/views/widgets/email_verification_view_body.dart';
import 'package:flutter/material.dart';

class EmailVerificationView extends StatelessWidget {
  const EmailVerificationView({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: ""),
      body: EmailVerificationViewBody(email: email),
    );
  }
}
