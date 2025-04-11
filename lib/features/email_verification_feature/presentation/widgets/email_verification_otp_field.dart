import 'dart:developer';

import 'package:customer_service_realtime_chat/core/util/app_fonts/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class EmailVerificationOTPField extends StatelessWidget {
  const EmailVerificationOTPField({super.key});
  static String otp = "";

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        children: [
          OtpTextField(
            textStyle:
                AppFonts.textStyleSemiBold20.copyWith(color: Colors.black),
            numberOfFields: 6,
            keyboardType: TextInputType.number,
            filled: true,
            showFieldAsBox: true,
            onCodeChanged: (value) {
              otp = value;
            },
            onSubmit: (String verificationCode) {
              otp = verificationCode;
              log(verificationCode);
            },
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.refresh))
        ],
      ),
    );
  }
}
