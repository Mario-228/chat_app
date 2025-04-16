import 'package:customer_service_realtime_chat/core/util/app_router/app_router.dart';
import 'package:customer_service_realtime_chat/core/util/functions/show_snack_bar.dart';
import 'package:customer_service_realtime_chat/core/widgets/custom_loading_widget.dart';
import 'package:customer_service_realtime_chat/core/widgets/custom_material_button.dart';
import 'package:customer_service_realtime_chat/features/submit_ticket_feature/presentation/view_model/ticket_form_cubit/ticket_form_cubit.dart';
import 'package:customer_service_realtime_chat/features/submit_ticket_feature/presentation/view_model/ticket_form_cubit/ticket_form_cubit_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class TicketFormViewConsumer extends StatelessWidget {
  const TicketFormViewConsumer({super.key, required this.chatId});
  final int chatId;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TicketFormCubit, TicketFormCubitStates>(
      listener: (context, state) {
        if (state is TicketFormError) {
          showSnackBar(context, message: state.error);
        } else if (state is TicketFormSuccess) {
          showSnackBar(context, message: "ticket submited successfully");
          GoRouter.of(context).push(AppRouter.kCategoryFormView);
        }
      },
      builder: (context, state) {
        if (state is TicketFormLoading) {
          return const CustomLoadingWidget();
        } else {
          return CustomMaterialButton(
              text: "sumbit ticket",
              onPressed: () {
                if (TicketFormCubit.get(context)
                    .formKey
                    .currentState!
                    .validate()) {
                  //PLACEHOLDER INT DATA
                  //TODO: REPLACE WITH REAL DATA
                  //FIXME:REPLACE WITH REAL DATA
                  TicketFormCubit.get(context).submitTicket(chatId);
                }
              });
        }
      },
    );
  }
}
