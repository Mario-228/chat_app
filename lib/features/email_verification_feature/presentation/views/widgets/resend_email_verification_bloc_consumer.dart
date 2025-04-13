import 'package:customer_service_realtime_chat/core/util/functions/show_snack_bar.dart';
import 'package:customer_service_realtime_chat/features/email_verification_feature/presentation/views_models/verification_cubit/verification_cubit.dart';
import 'package:customer_service_realtime_chat/features/email_verification_feature/presentation/views_models/verification_cubit/verification_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResendEmailVerificationBlocConsumer extends StatelessWidget {
  const ResendEmailVerificationBlocConsumer({
    super.key,
    required this.email,
  });

  final String email;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerificationCubit, VerificationStates>(
      listener: (context, state) {
        if (state is ReSendVerificationError) {
          showSnackBar(context, message: state.error);
        }
        if (state is ReSendVerificationSuccess) {
          showSnackBar(context,
              message: "OTP Resend Successfully Check Your Mail");
        }
      },
      builder: (context, state) {
        if (state is ReSendVerificationLoading) {
          return const CircularProgressIndicator();
        } else {
          return IconButton(
            onPressed: () {
              VerificationCubit.get(context).resendVerification(email: email);
            },
            icon: const Icon(Icons.refresh),
          );
        }
      },
    );
  }
}
