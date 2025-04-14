import 'package:customer_service_realtime_chat/core/util/app_fonts/app_fonts.dart';
import 'package:customer_service_realtime_chat/core/widgets/custom_text_form_field.dart';
import 'package:customer_service_realtime_chat/features/forget_password_feature/presentation/view_moddels/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:customer_service_realtime_chat/features/forget_password_feature/presentation/views/widgets/forget_passowrd_bloc_consumer_button.dart';
import 'package:flutter/material.dart';


class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    // GlobalKey<FormState> formKey = GlobalKey<FormState>();
    // TextEditingController emailController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        width: double.infinity,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: ForgotPasswordCubit.get(context).formkey,
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
                      controller: ForgotPasswordCubit.get(context)
                          .forgotPasswordEmailController,
                      validator: "Enter your email address",
                    ),
                    SizedBox(height: 40.0),
                    ForgetPassowrdBlocConsumerButton(),
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
