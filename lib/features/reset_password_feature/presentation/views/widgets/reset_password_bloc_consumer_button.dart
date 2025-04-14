import 'package:customer_service_realtime_chat/core/util/functions/show_snack_bar.dart';
import 'package:customer_service_realtime_chat/core/widgets/custom_loading_widget.dart';
import 'package:customer_service_realtime_chat/core/widgets/custom_material_button.dart';
import 'package:customer_service_realtime_chat/features/reset_password_feature/presentation/view_model/reset_password_cubit/reset_password_cubit.dart';
import 'package:customer_service_realtime_chat/features/reset_password_feature/presentation/view_model/reset_password_cubit/reset_password_cubit_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordBlocConsumerButton extends StatelessWidget {
  const ResetPasswordBlocConsumerButton({
    super.key,
    required this.email,
  });
  final String email;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordCubitStates>(
      listener: (context, state) async {
        if (state is ResetPasswordSuccessState) {
          showSnackBar(context, message: 'Password Reset succesfully');
          await GoRouter.of(context).push('/');
        } else if (state is ResetPasswordErrorState) {
          showSnackBar(context, message: state.messageError.errorMessage);
        }
      },
      builder: (context, state) {
        if (state is ResetPasswordLoadingState) {
          return const CustomLoadingWidget();
        } else {
          return CustomMaterialButton(
            text: "Reset",
            onPressed: () async {
              if (ResetPasswordCubit.get(context).otp.isEmpty ||
                  ResetPasswordCubit.get(context).otp.length < 6) {
                showSnackBar(context, message: 'Please Enter OTP');
                return;
              }
              if (ResetPasswordCubit.get(context)
                  .formKey
                  .currentState!
                  .validate()) {
                await ResetPasswordCubit.get(context)
                    .resetPasswordFunction(email: "");
              }
              //could not extract as widet, de to the OTP value needing to be checked
            },
          );
        }
      },
    );
  }
}
