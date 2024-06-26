import 'package:cenem/Api/config.dart';

import 'package:cenem/view/home/home.dart';
import 'package:cenem/view/splash/splash_view.dart';

import 'package:flutter/material.dart';
import 'package:cenem/res/constants.dart';

import 'package:google_fonts/google_fonts.dart';

// Declare a global variable for the configuration
late Config config;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load the configuration
  config = await Config.loadFromAsset();
  print(config.apiBaseUrl);
  print(config.apiProxyUrl);
  baseurl = config.apiBaseUrl;
  proxyurl = config.apiProxyUrl;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
