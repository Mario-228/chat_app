import 'dart:developer';
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

  static void createChannelChattingRoom(String tableName) {
    RealtimeChannel channel =
        supabase.channel("public:$tableName").onPostgresChanges(
              event: PostgresChangeEvent.all,
              schema: 'public',
              table: tableName,
              callback: (payload) {
                log('🔥 Message received: ${payload.newRecord['Content']}');
                log("old content =>${payload.oldRecord['Content']}");
              },
            )..subscribe();
  }

  static void getChannels(String tableName, Object primaryKey) {
    supabase.from(tableName).stream(primaryKey: ['$primaryKey']).listen(
      (List<Map<String, dynamic>> data) => log(
        data.toString(),
      ),
    );
  }
}
