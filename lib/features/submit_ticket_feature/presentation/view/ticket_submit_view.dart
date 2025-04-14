import 'package:customer_service_realtime_chat/core/widgets/custom_appbar.dart';
import 'package:customer_service_realtime_chat/core/widgets/custom_text_form_field.dart';
import 'package:customer_service_realtime_chat/features/submit_ticket_feature/presentation/view_model/ticket_form_cubit/ticket_form_cubit.dart';
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
          child: Column(
            children: [
              CustomTextFormField(
                labelText: "Name",
                icon: Icons.person,
                type: TextInputType.name,
                controller: TicketFormCubit.get(context).nameController,
                validator: "please enter your full name",
              ),
              CustomTextFormField(
                labelText: "Email",
                icon: Icons.email,
                type: TextInputType.emailAddress,
                controller: TicketFormCubit.get(context).emailController,
                validator: "please enter your email",
              ),
              CustomTextFormField(
                labelText: "Service",
                icon: Icons.phone,
                type: TextInputType.number,
                controller: TicketFormCubit.get(context).phoneController,
                validator: "please enter your phone number",
              ),
              DropdownButton(
                value: TicketFormCubit.get(context).dropDownValue,
                isExpanded: true,
                items: [
                  DropdownMenuItem(
                    value: "Customer Service",
                    child: Text("Customer Service"),
                  ),
                  DropdownMenuItem(
                    value: "Call Center",
                    child: Text("Call Center"),
                  ),
                  DropdownMenuItem(
                    value: "Billing issue",
                    child: Text("Billing issue"),
                  ),
                  DropdownMenuItem(
                    value: "Other",
                    child: Text("Other"),
                  ),
                ],
                onChanged: (selectedValue) {
                  TicketFormCubit.get(context).dropDownValue = selectedValue!;
                },
                iconSize: 40,
              ),
              CustomTextFormField(
                labelText: "Message",
                icon: Icons.message,
                type: TextInputType.multiline,
                controller: TicketFormCubit.get(context).messageController,
                validator: "please inform us of your feedback",
              ),
            ],
          ),
        ));
  }
}
