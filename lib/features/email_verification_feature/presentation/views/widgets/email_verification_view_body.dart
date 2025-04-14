import 'dart:developer';

import 'package:customer_service_realtime_chat/core/util/app_fonts/app_fonts.dart';
import 'package:customer_service_realtime_chat/features/email_verification_feature/presentation/views/widgets/email_verification_otp_field.dart';
import 'package:customer_service_realtime_chat/features/email_verification_feature/presentation/views/widgets/send_email_verification_bloc_consumer.dart';
import 'package:customer_service_realtime_chat/features/email_verification_feature/presentation/views_models/verification_cubit/verification_cubit.dart';
import 'package:flutter/material.dart';

class EmailVerificationViewBody extends StatelessWidget {
  const EmailVerificationViewBody({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    log(email);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        width: double.infinity,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: VerificationCubit.get(context).formKey,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Email Verification",
                      style: AppFonts.textStyleBold36,
                    ),
                    SizedBox(height: 20.0),
                    EmailVerificationOTPField(email: email),
                    SizedBox(height: 20.0),
                    SendEmailVerificationBlocConsumer(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
