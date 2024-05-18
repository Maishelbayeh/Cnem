import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cenem/res/constants.dart';
import 'package:cenem/view/home/home.dart';
import 'package:cenem/view/intro/components/Icon.dart';
import 'package:cenem/view/splash/componenets/animated_loading_text.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedImageContainer(
              width: 150,
              height: 200,
            ),
            SizedBox(
              height: defaultPadding,
            ),
            AnimatedLoadingText(),
          ],
        ),
      ),
    );
  }
}
