import 'package:customer_service_realtime_chat/core/util/app_router/app_router.dart';
import 'package:customer_service_realtime_chat/core/util/functions/show_snack_bar.dart';
import 'package:customer_service_realtime_chat/core/widgets/custom_loading_widget.dart';
import 'package:customer_service_realtime_chat/core/widgets/custom_material_button.dart';
import 'package:customer_service_realtime_chat/features/forget_password_feature/presentation/view_moddels/forgot_password_cubit/forgot_password_cubit.dart'
    show ForgotPasswordCubit;
import 'package:customer_service_realtime_chat/features/forget_password_feature/presentation/view_moddels/forgot_password_cubit/forgot_password_cubit_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ForgetPassowrdBlocConsumerButton extends StatelessWidget {
  const ForgetPassowrdBlocConsumerButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordCubitStates>(
        listener: (context, state) {
      if (state is ForgotPasswordCubitError) {
        showSnackBar(context, message: state.error.errorMessage);
      } else if (state is ForgotPasswordCubitSuccess) {
        showSnackBar(context, message: "reqeust sent, please check your mail");
        GoRouter.of(context).pushReplacement(AppRouter.kResetPasswordView,
            extra: ForgotPasswordCubit.get(context)
                .forgotPasswordEmailController
                .text);
      }
    }, builder: (context, state) {
      if (state is ForgotPasswordCubitLoading) {
        return const CustomLoadingWidget();
      } else {
        return CustomMaterialButton(
          text: "Send",
          onPressed: () async {
            if (ForgotPasswordCubit.get(context)
                .formkey
                .currentState!
                .validate()) {
              ForgotPasswordCubit.get(context).forgetPasswodFunction();
            }
          },
        );
      }
    });
  }
}
