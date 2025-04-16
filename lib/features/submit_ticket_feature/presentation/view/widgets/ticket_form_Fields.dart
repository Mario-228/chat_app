import 'package:customer_service_realtime_chat/core/util/app_fonts/app_fonts.dart';
import 'package:customer_service_realtime_chat/core/widgets/custom_text_form_field.dart';
import 'package:customer_service_realtime_chat/features/submit_ticket_feature/presentation/view/widgets/ticket_form_scrooldown_button.dart';
import 'package:customer_service_realtime_chat/features/submit_ticket_feature/presentation/view/widgets/ticket_form_view_consumer.dart';
import 'package:customer_service_realtime_chat/features/submit_ticket_feature/presentation/view_model/ticket_form_cubit/ticket_form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class TicketSubmitFormFields extends StatelessWidget {
  const TicketSubmitFormFields({super.key, required this.chatID});

  final int chatID;
  @override
  Widget build(BuildContext context) {
    TicketFormCubit.get(context).chatTicketIdController.text = Uuid().v1();
    return Form(
      key: TicketFormCubit.get(context).formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            CustomTextFormField(
              isEnabled: false,
              labelText: "Chat ticket",
              icon: Icons.sd_card_sharp,
              type: TextInputType.name,
              controller: TicketFormCubit.get(context).chatTicketIdController,
              validator: "Please enter your ticket ID",
            ),
            SizedBox(height: 25),
            CustomTextFormField(
              labelText: "Chat Topic",
              icon: Icons.message,
              type: TextInputType.text,
              controller: TicketFormCubit.get(context).chatTopicController,
              validator: "please enter your chat's main topic",
            ),
            SizedBox(height: 25),
            Row(
              children: [
                Text("Category Selection", style: AppFonts.textStyleRegular16),
                Spacer(
                  flex: 1,
                )
              ],
            ),
            TicketFormDropDownButton(),
            SizedBox(height: 25),
            CustomTextFormField(
              maxLines: null,
              labelText: "Message",
              icon: Icons.message,
              type: TextInputType.multiline,
              controller: TicketFormCubit.get(context).messageController,
              validator: "please inform us of your feedback",
            ),
            SizedBox(height: 25),
            TicketFormViewConsumer(
              chatId: chatID,
            )
          ],
        ),
      ),
    );
  }
}
