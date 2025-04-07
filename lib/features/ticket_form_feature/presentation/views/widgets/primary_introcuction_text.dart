import 'package:customer_service_realtime_chat/core/util/app_fonts/app_fonts.dart';
import 'package:flutter/material.dart';

class PrimaryIntrocuctionText extends StatelessWidget {
  const PrimaryIntrocuctionText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Customer Service \n Chat",
      style: AppFonts.textStyleMostBold18,
    );
  }
}
