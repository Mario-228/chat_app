import 'package:customer_service_realtime_chat/core/util/app_fonts/app_fonts.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar(
      {super.key, required this.title, this.actions = const <Widget>[]});
  final String title;
  final List<Widget> actions;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: actions,
      elevation: 5.0,
      title: Text(title, style: AppFonts.textStyleBold22),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
