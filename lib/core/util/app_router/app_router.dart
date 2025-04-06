import 'package:customer_service_realtime_chat/features/login_view_feature/presentation/views/login_view.dart';
import 'package:customer_service_realtime_chat/features/register_view_feature/presentation/views/register_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kRegisterView = '/register-view';
  static final routers = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: kRegisterView,
        builder: (context, state) => const RegisterView(),
      ),
    ],
  );
}
