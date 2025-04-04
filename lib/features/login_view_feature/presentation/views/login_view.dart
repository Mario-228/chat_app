import 'package:customer_service_realtime_chat/features/login_view_feature/presentation/views/widgets/login_view_body.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const LoginViewBody(),
    );
  }
}
