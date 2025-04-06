import 'package:customer_service_realtime_chat/core/util/app_fonts/app_fonts.dart';
import 'package:customer_service_realtime_chat/core/util/app_router/app_router.dart';
import 'package:customer_service_realtime_chat/core/widgets/custom_material_button.dart';
import 'package:customer_service_realtime_chat/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
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
                      "Forget Password",
                      style: AppFonts.textStyleBold36,
                    ),
                    SizedBox(height: 20.0),
                    CustomTextFormField(
                      type: TextInputType.emailAddress,
                      labelText: "Email Address",
                      controller: emailController,
                      validator: "Enter your email address",
                    ),
                    SizedBox(height: 40.0),
                    CustomMaterialButton(
                      text: "Send",
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          await GoRouter.of(context)
                              .push(AppRouter.kResetPasswordView);
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
