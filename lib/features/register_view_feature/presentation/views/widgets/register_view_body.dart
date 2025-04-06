import 'package:customer_service_realtime_chat/core/util/app_fonts/app_fonts.dart';
import 'package:customer_service_realtime_chat/core/widgets/custom_material_button.dart';
import 'package:customer_service_realtime_chat/features/register_view_feature/presentation/views/widgets/register_text_form_fields_section.dart';
import 'package:flutter/material.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController nameController = TextEditingController();
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
                      "Register",
                      style: AppFonts.textStyleBold36,
                    ),
                    SizedBox(height: 20.0),
                    RegisterTextFormFieldsSection(
                        nameController: nameController,
                        emailController: emailController,
                        passwordController: passwordController),
                    SizedBox(height: 40.0),
                    CustomMaterialButton(
                        text: "Register",
                        onPressed: () {
                          if (formKey.currentState!.validate()) {}
                        })
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
