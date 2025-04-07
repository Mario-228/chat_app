import 'package:customer_service_realtime_chat/core/util/app_fonts/app_fonts.dart';
import 'package:customer_service_realtime_chat/core/widgets/custom_appbar.dart';
import 'package:customer_service_realtime_chat/core/widgets/custom_material_button.dart';
import 'package:customer_service_realtime_chat/features/ticket_form_feature/presentation/views/widgets/primary_introcuction_text.dart';
import 'package:customer_service_realtime_chat/features/ticket_form_feature/presentation/views/widgets/secoundary_introcuction_text.dart';
import 'package:customer_service_realtime_chat/features/ticket_form_feature/presentation/views/widgets/ticket_form_radio_button_list_view.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

class TicketFormView extends StatefulWidget {
  const TicketFormView({super.key});

  @override
  State<TicketFormView> createState() => _TicketFormViewState();
}

class _TicketFormViewState extends State<TicketFormView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: ""),
      body: Column(
        children: [
          PrimaryIntrocuctionText(),
          SecoundaryIntrocuctionText(),
          TicketFormRadioButtonListView(),
          CustomMaterialButton(
            text: "start chat",
            onPressed: () {
              print("please navigate to the Chat screen route");
            },
          )
        ],
      ),
    );
  }
}
