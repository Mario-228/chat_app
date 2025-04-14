import 'package:customer_service_realtime_chat/features/submit_ticket_feature/presentation/view_model/ticket_form_cubit/ticket_form_cubit.dart';
import 'package:customer_service_realtime_chat/features/submit_ticket_feature/presentation/view_model/ticket_form_cubit/ticket_form_cubit_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TicketFormDropDownButton extends StatelessWidget {
  const TicketFormDropDownButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TicketFormCubit, TicketFormCubitStates>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade500),
              borderRadius: BorderRadius.circular(5.0)),
          child: DropdownButton(
            value: TicketFormCubit.get(context).dropDownValue,
            isExpanded: true, underline: SizedBox(),
            // hint: Text("chose service"),
            items: [
              DropdownMenuItem(
                value: 1,
                child: Text("  Customer Service"),
              ),
              DropdownMenuItem(
                value: 2,
                child: Text("  Call Center"),
              ),
              DropdownMenuItem(
                value: 3,
                child: Text("  Billing issue"),
              ),
              DropdownMenuItem(
                value: 4,
                child: Text("  Other"),
              ),
            ],
            onChanged: (selectedValue) {
              TicketFormCubit.get(context).changeDropDownValue(selectedValue);

              //print(selectedValue);
            },
            iconSize: 40,
          ),
        );
      },
    );
  }
}
