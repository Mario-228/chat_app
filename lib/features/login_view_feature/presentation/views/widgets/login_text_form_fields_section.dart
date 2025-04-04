import 'package:customer_service_realtime_chat/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginTextFormFieldsSection extends StatelessWidget {
  const LoginTextFormFieldsSection({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          type: TextInputType.emailAddress,
          labelText: "Email Address",
          controller: emailController,
          validator: "Please enter your email",
        ),
        SizedBox(height: 40.0),
        CustomTextFormField(
          type: TextInputType.emailAddress,
          labelText: "Password",
          controller: passwordController,
          isPassword: true,
          validator: "Please enter your password",
        ),
      ],
    );
  }
}
