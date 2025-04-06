import 'package:customer_service_realtime_chat/features/forget_password_feature/presentation/views/forget_password_view.dart';
import 'package:customer_service_realtime_chat/features/login_view_feature/presentation/views/login_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String kforgetPasswordView = "/forgetPasswordView";
  static final routers = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: kforgetPasswordView,
        builder: (context, state) => const ForgetPasswordView(),
      ),
    ],
  );
}
