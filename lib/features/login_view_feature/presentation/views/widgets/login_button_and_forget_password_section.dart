import 'package:customer_service_realtime_chat/core/util/app_fonts/app_fonts.dart';
import 'package:customer_service_realtime_chat/core/util/app_router/app_router.dart';
import 'package:customer_service_realtime_chat/core/util/functions/show_snack_bar.dart';
import 'package:customer_service_realtime_chat/core/widgets/custom_loading_widget.dart';
import 'package:customer_service_realtime_chat/core/widgets/custom_material_button.dart';
import 'package:customer_service_realtime_chat/features/login_view_feature/data/models/login_input_model.dart';
import 'package:customer_service_realtime_chat/features/login_view_feature/presentation/views_models/login_cubit/login_cubit.dart';
import 'package:customer_service_realtime_chat/features/login_view_feature/presentation/views_models/login_cubit/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginButtonAndForgetPasswordSection extends StatelessWidget {
  const LoginButtonAndForgetPasswordSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: LoginButtonBlocConsumer(),
        ),
        SizedBox(width: 20.0),
        Expanded(
          child: TextButton(
            child: Text("Forgot Password", style: AppFonts.textStyleMostBold18),
            onPressed: () async =>
                await GoRouter.of(context).push(AppRouter.kforgetPasswordView),
          ),
        ),
      ],
    );
  }
}

class LoginButtonBlocConsumer extends StatelessWidget {
  const LoginButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is LoginError) {
          showSnackBar(context, message: state.errorMessage);
        }
        if (state is LoginSuccess) {
          onLoginSuccess(context);
        }
      },
      builder: (context, state) {
        if (state is LoginLoading) {
          return const CustomLoadingWidget();
        } else {
          return CustomMaterialButton(
            text: "Log in",
            onPressed: () async {
              if (LoginCubit.get(context).formKey.currentState!.validate()) {
                FocusScope.of(context).unfocus();
                var loginInputModel = LoginInputModel(
                  email: LoginCubit.get(context).emailController.text,
                  password: LoginCubit.get(context).passwordController.text,
                );
                await LoginCubit.get(context).login(loginInputModel);
                if (context.mounted) {
                  clearLoginForm(context);
                }
              }
            },
          );
        }
      },
    );
  }

  void onLoginSuccess(BuildContext context) {
    showSnackBar(context, message: "Login Successfully");
    GoRouter.of(context).pushReplacement(AppRouter.kCategoryFormView);
  }

  void clearLoginForm(BuildContext context) {
    LoginCubit.get(context).emailController.clear();
    LoginCubit.get(context).passwordController.clear();
  }
}
