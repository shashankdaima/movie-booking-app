import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_booking_app/core/router.gr.dart';
import 'package:movie_booking_app/ui/widgets/gradiant_button.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: GradiantButton(
        onPressed: () {
          AutoRouter.of(context).pushAndPopUntil(
            MainRouter(),
            predicate: (route) => false,
          );
        },
        borderRadius: BorderRadius.circular(10),
        child: Text("Google Signup"),
      )),
    );
  }
}
