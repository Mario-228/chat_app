import 'package:customer_service_realtime_chat/core/util/app_router/app_router.dart';
import 'package:customer_service_realtime_chat/core/util/functions/show_snack_bar.dart';
import 'package:customer_service_realtime_chat/core/widgets/custom_material_button.dart';
import 'package:customer_service_realtime_chat/features/email_verification_feature/presentation/views_models/verification_cubit/verification_cubit.dart';
import 'package:customer_service_realtime_chat/features/email_verification_feature/presentation/views_models/verification_cubit/verification_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SendEmailVerificationBlocConsumer extends StatelessWidget {
  const SendEmailVerificationBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerificationCubit, VerificationStates>(
      listener: (context, state) async {
        if (state is VerificationError) {
          showSnackBar(context, message: state.error);
        } else if (state is VerificationSuccess) {
          showSnackBar(context, message: "Email Verification Success");
          await GoRouter.of(context)
              .pushReplacement(AppRouter.kCategoryFormView);
        }
      },
      builder: (context, state) {
        if (state is VerificationLoading) {
          return const CircularProgressIndicator();
        } else {
          return CustomMaterialButton(
            text: "Send OTP",
            onPressed: () async {
              if (VerificationCubit.get(context).otp.isEmpty ||
                  VerificationCubit.get(context).otp.length < 6) {
                showSnackBar(context, message: 'Please Enter OTP');
                return;
              }
              if (VerificationCubit.get(context)
                  .formKey
                  .currentState!
                  .validate()) {
                await VerificationCubit.get(context).verifyVerification(
                    otp: VerificationCubit.get(context).otp);
                if (context.mounted) {
                  await GoRouter.of(context)
                      .pushReplacement(AppRouter.kCategoryFormView);
                }
              }
            },
          );
        }
      },
    );
  }
}
