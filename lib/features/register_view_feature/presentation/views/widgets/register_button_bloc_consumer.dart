import 'package:customer_service_realtime_chat/core/util/app_router/app_router.dart';
import 'package:customer_service_realtime_chat/core/util/functions/show_snack_bar.dart';
import 'package:customer_service_realtime_chat/core/widgets/custom_loading_widget.dart';
import 'package:customer_service_realtime_chat/core/widgets/custom_material_button.dart';
import 'package:customer_service_realtime_chat/features/register_view_feature/data/models/register_input_model.dart';
import 'package:customer_service_realtime_chat/features/register_view_feature/presentation/views_models/register_cubit/register_cubit.dart';
import 'package:customer_service_realtime_chat/features/register_view_feature/presentation/views_models/register_cubit/register_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterButtonBlocConsumer extends StatelessWidget {
  const RegisterButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) async {
        if (state is RegisterSuccess) {
          await onRegisterSuccess(context);
        } else if (state is RegisterError) {
          showSnackBar(context, message: state.message);
        }
      },
      builder: (context, states) {
        if (states is RegisterLoading) {
          return CustomLoadingWidget();
        } else {
          return CustomMaterialButton(
            text: "Register",
            onPressed: () {
              if (RegisterCubit.get(context).formKey.currentState!.validate()) {
                var registerInputModel = RegisterInputModel(
                  name: RegisterCubit.get(context).nameController.text,
                  email: RegisterCubit.get(context).emailController.text,
                  password: RegisterCubit.get(context).passwordController.text,
                );
                RegisterCubit.get(context).register(
                  registerInputModel,
                );
                print(registerInputModel.toJson());
              }
            },
          );
        }
      },
    );
  }

  Future<void> onRegisterSuccess(BuildContext context) async {
    showSnackBar(context, message: "Register Success");
    await GoRouter.of(context).pushReplacement(AppRouter.kCategoryFormView);
  }
}
