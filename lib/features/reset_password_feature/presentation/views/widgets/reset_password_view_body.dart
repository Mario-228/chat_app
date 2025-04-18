import 'package:customer_service_realtime_chat/core/util/app_fonts/app_fonts.dart';
import 'package:customer_service_realtime_chat/features/reset_password_feature/presentation/view_model/reset_password_cubit/reset_password_cubit.dart';
import 'package:customer_service_realtime_chat/features/reset_password_feature/presentation/views/widgets/reset_password_bloc_consumer_button.dart';
import 'package:customer_service_realtime_chat/features/reset_password_feature/presentation/views/widgets/reset_password_text_form_fields_section.dart';
import 'package:flutter/material.dart';

class ResetPasswordViewBody extends StatelessWidget {
  const ResetPasswordViewBody({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        width: double.infinity,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: ResetPasswordCubit.get(context).formKey,
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
                        passwordController:
                            ResetPasswordCubit.get(context).passwordController),
                    SizedBox(height: 20.0),
                    ResetPasswordBlocConsumerButton(email: email),
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
