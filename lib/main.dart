import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_booking_app/core/router.gr.dart';
import 'package:movie_booking_app/services/supabase/supabase_realtime_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'services/supabase/supabase_client.dart';

void main() async {
  await Supabase.initialize(url: SUPABASE_URL, anonKey: ANON_KEY);
  WidgetsFlutterBinding.ensureInitialized();
  SupabaseRealtimeService.init();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final AppRouter _router;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _router = AppRouter();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      darkTheme: ThemeData(
          textTheme: textTheme,
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Color(0xFF1C1A29)),
      themeMode: ThemeMode.dark,
      routerDelegate: _router.delegate(),
      routeInformationParser: _router.defaultRouteParser(),
    );
  }

  final TextTheme textTheme = TextTheme(
    headline1: GoogleFonts.openSans(
        fontSize: 97, fontWeight: FontWeight.w300, letterSpacing: -1.5),
    headline2: GoogleFonts.openSans(
        fontSize: 61, fontWeight: FontWeight.w300, letterSpacing: -0.5),
    headline3: GoogleFonts.openSans(fontSize: 48, fontWeight: FontWeight.w400),
    headline4: GoogleFonts.openSans(
        fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: 0.25),
    headline5: GoogleFonts.openSans(fontSize: 24, fontWeight: FontWeight.w400),
    headline6: GoogleFonts.openSans(
        fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15),
    subtitle1: GoogleFonts.openSans(
        fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
    subtitle2: GoogleFonts.openSans(
        fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
    bodyText1: GoogleFonts.openSans(
        fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
    bodyText2: GoogleFonts.openSans(
        fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
    button: GoogleFonts.openSans(
        fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
    caption: GoogleFonts.openSans(
        fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
    overline: GoogleFonts.openSans(
        fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
  );
}
