import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_booking_app/core/router.gr.dart';
import 'package:movie_booking_app/ui/widgets/gradiant_button.dart';
import 'package:movie_booking_app/utils/show_snackbar_etx.dart';

import '../services/supabase/auth_state.dart';
import '../services/supabase/supabase_client.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends AuthState<AuthScreen> {
  @override
  void initState() {
    initAuthSubscription();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: GradiantButton(
        onPressed: () {
          SupabaseClient.signIn();
        },
        borderRadius: BorderRadius.circular(10),
        child: Text("Google Signup"),
      )),
    );
  }

  @override
  void dispose() {
    disposeAuthSubscription();
    super.dispose();
  }

  @override
  void onAuthFailure() {
    // Do nothing,
  }

  @override
  void onAuthSuccess() async {
    disposeAuthSubscription();
    context.showSnackBar(message: "User Auth Completed");
    await Future.delayed(const Duration(seconds: 5));
    AutoRouter.of(context).replace(const MainRouter());
  }
}
