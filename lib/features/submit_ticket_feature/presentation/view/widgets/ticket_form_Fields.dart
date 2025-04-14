import 'package:customer_service_realtime_chat/core/util/app_fonts/app_fonts.dart';
import 'package:customer_service_realtime_chat/core/widgets/custom_material_button.dart';
import 'package:customer_service_realtime_chat/core/widgets/custom_text_form_field.dart';
import 'package:customer_service_realtime_chat/features/submit_ticket_feature/presentation/view/widgets/ticket_form_scrooldown_button.dart';
import 'package:customer_service_realtime_chat/features/submit_ticket_feature/presentation/view/widgets/ticket_form_view_consumer.dart';
import 'package:customer_service_realtime_chat/features/submit_ticket_feature/presentation/view_model/ticket_form_cubit/ticket_form_cubit.dart';
import 'package:flutter/material.dart';

class TicketSubmitFormFields extends StatelessWidget {
  const TicketSubmitFormFields({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: TicketFormCubit.get(context).formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            CustomTextFormField(
              labelText: "Name",
              icon: Icons.person,
              type: TextInputType.name,
              controller: TicketFormCubit.get(context).nameController,
              validator: "please enter your full name",
            ),
            SizedBox(height: 25),
            CustomTextFormField(
              labelText: "Email",
              icon: Icons.email,
              type: TextInputType.emailAddress,
              controller: TicketFormCubit.get(context).emailController,
              validator: "please enter your email",
            ),
            SizedBox(height: 25),
            CustomTextFormField(
              labelText: "Service",
              icon: Icons.phone,
              type: TextInputType.number,
              controller: TicketFormCubit.get(context).phoneController,
              validator: "please enter your phone number",
            ),
            SizedBox(height: 25),
            Row(
              children: [
                Text("Category", style: AppFonts.textStyleRegular16),
                Spacer(
                  flex: 1,
                )
              ],
            ),
            TicketFormDropDownButton(),
            SizedBox(height: 25),
            CustomTextFormField(
              labelText: "Message",
              icon: Icons.message,
              type: TextInputType.multiline,
              controller: TicketFormCubit.get(context).messageController,
              validator: "please inform us of your feedback",
            ),
            SizedBox(height: 25),
            TicketFormViewConsumer()
          ],
        ),
      ),
    );
  }
}
