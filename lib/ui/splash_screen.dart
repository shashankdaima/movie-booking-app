import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_booking_app/core/router.gr.dart';

import '../services/supabase/auth_state.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends AuthState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    redirect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Book your show. "),
      ),
    );
  }

  @override
  void onAuthFailure() {
    AutoRouter.of(context).replace(const AuthRoute());
  }

  @override
  void onAuthSuccess() {
    AutoRouter.of(context).replace(const MainRouter());
  }
}
