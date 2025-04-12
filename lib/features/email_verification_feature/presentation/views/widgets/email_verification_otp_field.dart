import 'dart:developer';
import 'package:customer_service_realtime_chat/core/util/app_fonts/app_fonts.dart';
import 'package:customer_service_realtime_chat/features/email_verification_feature/presentation/views/widgets/resend_email_verification_bloc_consumer.dart';
import 'package:customer_service_realtime_chat/features/email_verification_feature/presentation/views_models/verification_cubit/verification_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class EmailVerificationOTPField extends StatelessWidget {
  const EmailVerificationOTPField({super.key, required this.email});
  final String email;
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
              VerificationCubit.get(context).otp = value;
            },
            onSubmit: (String verificationCode) {
              VerificationCubit.get(context).otp = verificationCode;
              log(verificationCode);
            },
          ),
          ResendEmailVerificationBlocConsumer(email: email)
        ],
      ),
    );
  }
}
