import 'package:customer_service_realtime_chat/core/util/app_fonts/app_fonts.dart';
import 'package:customer_service_realtime_chat/core/util/functions/show_snack_bar.dart';
import 'package:customer_service_realtime_chat/core/widgets/custom_material_button.dart';
import 'package:customer_service_realtime_chat/features/reset_password_feature/presentation/views/widgets/reset_password_text_form_fields_section.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordViewBody extends StatelessWidget {
  const ResetPasswordViewBody({super.key});
  static String otp = '';
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController passwordController = TextEditingController();
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
                      "Reset Password",
                      style: AppFonts.textStyleBold36,
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      "Enter the code we Sent to your email and set a new password",
                      textAlign: TextAlign.center,
                      style: AppFonts.textStyleRegular16,
                    ),
                    SizedBox(height: 20.0),
                    ResetPasswordTextFormFieldsSection(
                        passwordController: passwordController),
                    SizedBox(height: 20.0),
                    CustomMaterialButton(
                      text: "Reset",
                      onPressed: () async {
                        if (otp.isEmpty || otp.length < 6) {
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
