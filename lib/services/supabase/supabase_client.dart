import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../utils/api_response.dart';

//SUPABASE KEYS
const SUPABASE_URL = "https://hacrfjmcnabemfdoytgr.supabase.co";
const ANON_KEY =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhhY3Jmam1jbmFiZW1mZG95dGdyIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzMwNDI3MjQsImV4cCI6MTk4ODYxODcyNH0.rXz5MwEhBaUUi7vBuEyBBp3EgiZTuL49yC6QBeYtAO8";

class SupabaseClient {
  static final supabaseInstance = Supabase.instance.client;

  static Stream<AuthState?> getAuthSession() {
    return supabaseInstance.auth.onAuthStateChange;
  }

  static void signIn() async {
    await supabaseInstance.auth
        .signInWithOAuth(Provider.google, redirectTo: "www.moviebooking.ac.sd");
  }

  static Session? authSession() => supabaseInstance.auth.currentSession;

  static Future<ApiResponse<dynamic>> bookTicket(
      int? showId, List<String> seatingArrangement) async {
    for (String i in seatingArrangement) {
      // try {
      final res = await supabaseInstance
          .from("schedule")
          .select(i)
          .match({"pid": showId});
      if (res[0][i].toString().toLowerCase() == "null")
        // ignore: curly_braces_in_flow_control_structures
        await supabaseInstance
            .from("schedule")
            .update({i: authSession()?.user.id}).match({"pid": showId});
      else {
        return ApiResponse.error("Seat $i is already booked!");
      }
    }
    return ApiResponse.success(dynamic);
  }
}
