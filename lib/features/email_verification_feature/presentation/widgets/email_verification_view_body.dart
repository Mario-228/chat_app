import 'package:customer_service_realtime_chat/core/util/app_fonts/app_fonts.dart';
import 'package:customer_service_realtime_chat/core/util/functions/show_snack_bar.dart';
import 'package:customer_service_realtime_chat/core/widgets/custom_material_button.dart';
import 'package:customer_service_realtime_chat/features/email_verification_feature/presentation/widgets/email_verification_otp_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EmailVerificationViewBody extends StatelessWidget {
  const EmailVerificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        width: double.infinity,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
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
                    EmailVerificationOTPField(),
                    SizedBox(height: 20.0),
                    CustomMaterialButton(
                      text: "Send OTP",
                      onPressed: () async {
                        if (EmailVerificationOTPField.otp.isEmpty ||
                            EmailVerificationOTPField.otp.length < 6) {
                          showSnackBar(context, message: 'Please Enter OTP');
                          return;
                        }
                        if (formKey.currentState!.validate()) {
                          await GoRouter.of(context).push('/');
                        }
                      },
                    ),
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
