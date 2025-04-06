import 'package:customer_service_realtime_chat/core/widgets/custom_appbar.dart';
import 'package:customer_service_realtime_chat/features/register_view_feature/presentation/views/widgets/register_view_body.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbar(title: ""),
      body: RegisterViewBody(),
    );
  }
}
