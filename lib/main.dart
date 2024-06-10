import 'package:cenem/Api/loginApi.dart';
import 'package:cenem/view/about%20us/AboutUs.dart';
import 'package:cenem/view/splash/splash_view.dart';

import 'package:flutter/material.dart';
import 'package:cenem/res/constants.dart';

import 'package:google_fonts/google_fonts.dart';

void main() {
  // listUsers();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          scaffoldBackgroundColor: bgColor,
          useMaterial3: true,
          textTheme:
              GoogleFonts.openSansTextTheme(Theme.of(context).textTheme).apply(
            bodyColor: const Color.fromARGB(255, 7, 7, 7),
          ),
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          }),
        ),
        home: const SplashView());
  }
}
