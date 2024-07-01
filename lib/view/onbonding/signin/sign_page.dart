import 'package:cenem/view/onbonding/signup/Register.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  final bool sign;

  const SignUp({super.key, required this.sign});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: const Color.fromARGB(255, 33, 19, 36)),
      home: Register(sign: sign),
    );
  }
}
