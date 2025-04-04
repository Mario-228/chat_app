import 'package:customer_service_realtime_chat/core/util/app_fonts/app_fonts.dart';
import 'package:customer_service_realtime_chat/features/login_view_feature/presentation/views/widgets/login_button_and_forget_password_section.dart';
import 'package:customer_service_realtime_chat/features/login_view_feature/presentation/views/widgets/login_register_text_button_section.dart';
import 'package:customer_service_realtime_chat/features/login_view_feature/presentation/views/widgets/login_text_form_fields_section.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Log in",
                      style: AppFonts.textStyleBold36,
                    ),
                    SizedBox(height: 20.0),
                    LoginTextFormFieldsSection(
                        emailController: emailController,
                        passwordController: passwordController),
                    SizedBox(height: 40.0),
                    LoginButtonAndForgetPasswordSection(formKey: formKey),
                    SizedBox(height: 40.0),
                    LoginRegisterTextButtonSection()
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
