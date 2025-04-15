import 'package:customer_service_realtime_chat/core/util/app_fonts/app_fonts.dart';
import 'package:flutter/material.dart';

class SecoundaryIntrocuctionText extends StatelessWidget {
  const SecoundaryIntrocuctionText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        "Choose a catagory to contact with a live agent",
        style: AppFonts.textStyleSemiBold20,
      ),
    );
  }
}
