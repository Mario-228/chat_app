import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

class TicketFormRadioButtonListView extends StatelessWidget {
  const TicketFormRadioButtonListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          GroupButton(
            buttons: [
              "Customer Service",
              "Call Center",
              "Billing issue",
              "Other"
            ],
            onSelected: (value, index, isSelected) => print(value),
            isRadio: true,
          )
        ],
      ),
    );
  }
}
