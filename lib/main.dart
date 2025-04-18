import 'package:customer_service_realtime_chat/core/util/app_router/app_router.dart';
import 'package:customer_service_realtime_chat/core/util/cache_helper/cache_helper.dart';
import 'package:customer_service_realtime_chat/core/util/supabase_chatting_service/supabase_chatting_service.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseChattingService.initSupabase();
  await CacheHelper.initHive();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.routers,
      debugShowCheckedModeBanner: false,
      title: 'Customer Service Realtime Chat',
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xff3b2747),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xff3b2747),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.dark,
    );
  }
}
