import 'package:customer_service_realtime_chat/core/util/app_fonts/app_fonts.dart';
import 'package:customer_service_realtime_chat/core/util/functions/show_snack_bar.dart';
import 'package:customer_service_realtime_chat/core/widgets/custom_loading_widget.dart';
import 'package:customer_service_realtime_chat/core/widgets/custom_material_button.dart';
import 'package:customer_service_realtime_chat/features/forget_password_feature/presentation/view_moddels/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:customer_service_realtime_chat/features/reset_password_feature/presentation/view_model/reset_password_cubit/reset_password_cubit.dart';
import 'package:customer_service_realtime_chat/features/reset_password_feature/presentation/view_model/reset_password_cubit/reset_password_cubit_states.dart';
import 'package:customer_service_realtime_chat/features/reset_password_feature/presentation/views/widgets/reset_password_text_form_fields_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordViewBody extends StatelessWidget {
  const ResetPasswordViewBody({super.key});
  static String otp = '';
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
                    BlocConsumer<ResetPasswordCubit, ResetPasswordCubitStates>(
                      listener: (context, state) async {
                        if (state is ResetPasswordStateSuccess) {
                          if (ResetPasswordCubit.get(context)
                              .formKey
                              .currentState!
                              .validate()) {
                            showSnackBar(context,
                                message: 'Password Reset succesfully');
                            await GoRouter.of(context).push('/');
                          }
                        }
                        if (state is ResetPasswordStateError) {
                          showSnackBar(context,
                              message: state.messaereError.toString());
                        }
                      },
                      builder: (context, state) {
                        if (state is ResetPasswordStateLoading) {
                          return const CustomLoadingWidget();
                        } else {
                          return CustomMaterialButton(
                            text: "Reset",
                            onPressed: () async {
                              if (otp.isEmpty || otp.length < 6) {
                                showSnackBar(context,
                                    message: 'Please Enter OTP');
                                return;
                              }
                              if (ResetPasswordCubit.get(context)
                                  .formKey
                                  .currentState!
                                  .validate()) {
                                await ResetPasswordCubit.get(context)
                                    .resetPasswordFunction(
                                        email: ForgotPasswordCubit.get(context)
                                            .forgotPasswordEmailController
                                            .text);
                              }
                              //could not extract as widet, de to the OTP value needing to be checked 
                            },
                          );
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
