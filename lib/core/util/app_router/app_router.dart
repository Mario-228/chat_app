import 'package:customer_service_realtime_chat/features/forget_password_feature/presentation/views/forget_password_view.dart';
import 'package:customer_service_realtime_chat/features/login_view_feature/presentation/views/login_view.dart';
import 'package:customer_service_realtime_chat/features/register_view_feature/presentation/views/register_view.dart';
import 'package:customer_service_realtime_chat/features/reset_password_feature/presentation/views/reset_password_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String kforgetPasswordView = "/forgetPasswordView";
  static const String kRegisterView = '/register-view';
  static const String kResetPasswordView = '/reset-password-view';
  static final routers = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: kforgetPasswordView,
      builder: (context, state) => const ForgetPasswordView(),
    ),
    GoRoute(
      path: kRegisterView,
      builder: (context, state) => const RegisterView(),
    ),
    GoRoute(
      path: kResetPasswordView,
      builder: (context, state) => const ResetPasswordView(),
    ),
  ]);
}
