import 'package:customer_service_realtime_chat/core/widgets/custom_material_button.dart';
import 'package:customer_service_realtime_chat/features/submit_ticket_feature/presentation/view_model/ticket_form_cubit/ticket_form_cubit.dart';
import 'package:flutter/material.dart';

class TicketFormViewConsumer extends StatelessWidget {
  const TicketFormViewConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomMaterialButton(
        text: "sumbit ticket",
        onPressed: () {
          if (TicketFormCubit.get(context).formKey.currentState!.validate()) {
            //still not implemented function
            TicketFormCubit.get(context).submitTicket();
          }
        });
  }
}
