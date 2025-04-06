import 'package:customer_service_realtime_chat/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class RegisterTextFormFieldsSection extends StatelessWidget {
  const RegisterTextFormFieldsSection({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          type: TextInputType.name,
          labelText: "Name",
          controller: nameController,
          validator: "Please enter your name",
        ),
        SizedBox(height: 20.0),
        CustomTextFormField(
          type: TextInputType.emailAddress,
          labelText: "email",
          controller: emailController,
          validator: "Please enter your email",
        ),
        SizedBox(height: 20.0),
        CustomTextFormField(
          type: TextInputType.name,
          labelText: "Password",
          controller: passwordController,
          validator: "Please enter your Password",
          isPassword: true,
        ),
      ],
    );
  }
}
