import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_booking_app/services/supabase/supabase_client.dart';
import 'package:movie_booking_app/utils/show_snackbar_etx.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

abstract class AuthState<T extends StatefulWidget> extends State<T> {
  bool _redirectCalled = false;
  late final StreamSubscription<supabase.AuthState?> _authStateSubscription;

  //For One-time get authSessions
  Future<void> redirect() async {
    await Future.delayed(Duration.zero);
    if (_redirectCalled || !mounted) {
      return;
    }
    _redirectCalled = true;
    final session = SupabaseClient.authSession();
    if (session != null) {
      onAuthSuccess();
    } else {
      onAuthFailure();
      // context.showErrorSnackBar(message: "Session is Null");
    }
  }

  //For Stream Subscription of Auth Sessions
  initAuthSubscription() {
    _authStateSubscription = SupabaseClient.getAuthSession().listen((event) {
      if (_redirectCalled) return;
      final session = event!.session;
      if (session != null && !_redirectCalled) {
        _redirectCalled = true;
        onAuthSuccess();
      } else {
        onAuthFailure();
      }
    });
  }

  disposeAuthSubscription() {
    _authStateSubscription.cancel();
  }

  void onAuthSuccess();
  void onAuthFailure();
}
