import 'package:customer_service_realtime_chat/core/util/functions/show_snack_bar.dart';
import 'package:customer_service_realtime_chat/core/widgets/custom_loading_widget.dart';
import 'package:customer_service_realtime_chat/core/widgets/custom_material_button.dart';
import 'package:customer_service_realtime_chat/features/category_form_feature/presentation/views_models/logout_cubit/logout_cubit.dart';
import 'package:customer_service_realtime_chat/features/category_form_feature/presentation/views_models/logout_cubit/logout_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LogoutBlocConsumerButton extends StatelessWidget {
  const LogoutBlocConsumerButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogoutCubit, LogoutStates>(
      listener: (context, state) async {
        if (state is LogoutError) {
          showSnackBar(context, message: state.error);
        } else if (state is LogoutSuccess) {
          await GoRouter.of(context).pushReplacement('/');
        }
      },
      builder: (context, state) {
        if (state is LogoutLoading) {
          return CustomLoadingWidget();
        } else {
          return CustomMaterialButton(
            text: "Logout",
            onPressed: () async {
              await LogoutCubit.get(context).logOut(token: "");
            },
          );
        }
      },
    );
  }
}
