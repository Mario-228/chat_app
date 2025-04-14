import 'package:customer_service_realtime_chat/core/util/supabase_chatting_service/supabase_constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SupabaseChattingService {
  static SupabaseClient supabase = Supabase.instance.client;
  static Future<void> initSupabase() async {
    await Supabase.initialize(
      url: SupabaseConstants.baseUrl,
      anonKey: SupabaseConstants.anonKey,
    );
  }

  static SupabaseStreamFilterBuilder messagesStream(
          String tableName, Object primaryKey) =>
      supabase.from(tableName).stream(primaryKey: ['$primaryKey']);
}
