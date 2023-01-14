//SUPABASE KEYS
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseRealtimeService {
  static init() async {
    final supabaseClient = Supabase.instance.client;
    // final channel = supabaseClient.channel("randomString");
    // channel.on(
    //     RealtimeListenTypes.postgresChanges,
    //     ChannelFilter(
    //         event: "ALL",
    //         schema: "public",
    //         table: "schedule",
    //         filter: "true"), (payload, [ref]) {
    //   print(payload+" "+ref);

    // }).subscribe((str, [listOfObject]) {
    //   debugPrint(str);
    //   debugPrint(listOfObject.toString());
    // });
    // channel.subscribe([])
    final result = supabaseClient
        .from("schedule")
        .stream(primaryKey: ['id']).eq('id', '779344');
    result.listen((event) {
      print(event[0]["type"].toString());
    });
  }
}
