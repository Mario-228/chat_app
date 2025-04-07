import 'package:customer_service_realtime_chat/core/util/app_fonts/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

class CategorySelectionRadioButton extends StatelessWidget {
  const CategorySelectionRadioButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final GroupButtonController controller = GroupButtonController();
    controller.selectIndex(3);
    return Column(
      children: [
        GroupButton(
          controller: controller,
          buttonBuilder: (selected, value, context) {
            return Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: CircleAvatar(
                      backgroundColor: selected ? Colors.blue : Colors.white,
                      radius: 12.0,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 6.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  flex: 4,
                  child: Text(
                    value,
                    style: AppFonts.textStyleBold20,
                  ),
                )
              ],
            );
          },
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
    );
  }
}
