import 'package:customer_service_realtime_chat/features/chat_feature/presentation/views/chat_view.dart';
import 'package:customer_service_realtime_chat/features/email_verification_feature/presentation/views/email_verification_view.dart';
import 'package:customer_service_realtime_chat/features/email_verification_feature/presentation/views_models/verification_cubit/verification_cubit.dart';
import 'package:customer_service_realtime_chat/features/forget_password_feature/presentation/views/forget_password_view.dart';
import 'package:customer_service_realtime_chat/features/login_view_feature/presentation/views/login_view.dart';
import 'package:customer_service_realtime_chat/features/login_view_feature/presentation/views_models/login_cubit/login_cubit.dart';
import 'package:customer_service_realtime_chat/features/register_view_feature/presentation/views/register_view.dart';
import 'package:customer_service_realtime_chat/features/register_view_feature/presentation/views_models/register_cubit/register_cubit.dart';
import 'package:customer_service_realtime_chat/features/reset_password_feature/presentation/views/reset_password_view.dart';
import 'package:customer_service_realtime_chat/features/category_form_feature/presentation/views/category_form_view.dart';
import 'package:customer_service_realtime_chat/resauble_variables.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String kforgetPasswordView = "/forgetPasswordView";
  static const String kRegisterView = '/register-view';
  static const String kResetPasswordView = '/reset-password-view';
  static const String kchatView = "/chat_view";
  static const String kCategoryFormView = "/category-form-view";
  static const String kEmailVerificationView = "/email-verification-view";

  static final routers = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => BlocProvider(
        create: (context) => LoginCubit(),
        child: const LoginView(),
      ),
    ),
    GoRoute(
      path: kforgetPasswordView,
      builder: (context, state) => const ForgetPasswordView(),
    ),
    GoRoute(
      path: kRegisterView,
      builder: (context, state) => BlocProvider(
        create: (context) => RegisterCubit(),
        child: const RegisterView(),
      ),
    ),
    GoRoute(
      path: kResetPasswordView,
      builder: (context, state) => const ResetPasswordView(),
    ),
    GoRoute(
      path: kchatView,
      builder: (context, state) => const ChatView(),
    ),
    GoRoute(
      path: kCategoryFormView,
      builder: (context, state) => const CategoryFormView(),
    ),
    GoRoute(
      path: kEmailVerificationView,
      builder: (context, state) => BlocProvider(
        create: (context) => VerificationCubit()
          ..sendVerification(email: ResaubleVariables.email),
        child: EmailVerificationView(email: ResaubleVariables.email),
      ),
    ),
  ]);
}
//GoRoute.of(cont).push(AppRouter.kforgetPasswordView);
