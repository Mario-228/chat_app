import 'package:customer_service_realtime_chat/core/widgets/custom_text_form_field.dart';
import 'package:customer_service_realtime_chat/features/reset_password_feature/presentation/views/widgets/reset_password_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class ResetPasswordTextFormFieldsSection extends StatelessWidget {
  const ResetPasswordTextFormFieldsSection({
    super.key,
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: OtpTextField(
            numberOfFields: 6,
            keyboardType: TextInputType.number,
            filled: true,
            showFieldAsBox: true,
            onCodeChanged: (value) {
              ResetPasswordViewBody.otp = value;
            },
            onSubmit: (String verificationCode) {
              print(verificationCode);
              ResetPasswordViewBody.otp = verificationCode;
            },
          ),
        ),
        SizedBox(height: 20.0),
        CustomTextFormField(
          type: TextInputType.visiblePassword,
          labelText: "Password",
          controller: passwordController,
          validator: "Please enter your password",
          isPassword: true,
        ),
      ],
    );
  }
}
