import 'package:customer_service_realtime_chat/core/util/app_fonts/app_fonts.dart';
import 'package:customer_service_realtime_chat/features/register_view_feature/presentation/views/widgets/register_button_bloc_consumer.dart';
import 'package:customer_service_realtime_chat/features/register_view_feature/presentation/views/widgets/register_text_form_fields_section.dart';
import 'package:customer_service_realtime_chat/features/register_view_feature/presentation/views_models/register_cubit/register_cubit.dart';
import 'package:flutter/material.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

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
              key: RegisterCubit.get(context).formKey,
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
                        nameController:
                            RegisterCubit.get(context).nameController,
                        emailController:
                            RegisterCubit.get(context).emailController,
                        passwordController:
                            RegisterCubit.get(context).passwordController),
                    SizedBox(height: 40.0),
                    RegisterButtonBlocConsumer()
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
