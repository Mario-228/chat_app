import 'package:customer_service_realtime_chat/core/util/app_fonts/app_fonts.dart';
import 'package:customer_service_realtime_chat/core/widgets/custom_appbar.dart';
import 'package:customer_service_realtime_chat/core/widgets/custom_material_button.dart';
import 'package:customer_service_realtime_chat/core/widgets/custom_text_form_field.dart';
import 'package:customer_service_realtime_chat/features/submit_ticket_feature/presentation/view/widgets/ticket_form_Fields.dart';
import 'package:customer_service_realtime_chat/features/submit_ticket_feature/presentation/view/widgets/ticket_form_scrooldown_button.dart';
import 'package:customer_service_realtime_chat/features/submit_ticket_feature/presentation/view_model/ticket_form_cubit/ticket_form_cubit.dart';
import 'package:customer_service_realtime_chat/features/submit_ticket_feature/presentation/view_model/ticket_form_cubit/ticket_form_cubit_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
