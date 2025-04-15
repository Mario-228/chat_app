import 'package:customer_service_realtime_chat/core/widgets/custom_appbar.dart';
import 'package:customer_service_realtime_chat/features/submit_ticket_feature/presentation/view/widgets/ticket_form_Fields.dart';
import 'package:flutter/material.dart';

class TicketFormView extends StatelessWidget {
  const TicketFormView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar(title: "Ticket Submit"),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TicketSubmitFormFields(),
        ));
  }
}
