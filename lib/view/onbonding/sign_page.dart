import 'package:cenem/view/onbonding/Register.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  final bool sign;

  const SignUp({super.key, required this.sign});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.purple),
      home: Register(sign:sign),
    );
  }
}
