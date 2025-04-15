import 'package:customer_service_realtime_chat/core/util/app_router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TicketRouterActionButton extends StatelessWidget {
  const TicketRouterActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          GoRouter.of(context).pushReplacement(AppRouter.kTicketFormView);
        },
        icon: const Icon(Icons.send));
  }
}
