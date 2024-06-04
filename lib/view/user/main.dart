import 'package:cenem/controllers/navigation_controller.dart';
import 'package:cenem/res/constants.dart';
import 'package:cenem/view/user/layout.dart';
import 'package:cenem/view/user/main/mainViwe.dart';

import 'package:flutter/material.dart';

import 'package:cenem/controllers/menu_controller.dart' as menu_controller;

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'routing/routes.dart';

void main() {
  Get.put(menu_controller.MenuController());
  Get.put(NavigationController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
            bodyColor: Colors.white,
          ),
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          }),
        ),
        home: MainViewMember(
          pages: [SiteLayout()],
        ));
  }
}
