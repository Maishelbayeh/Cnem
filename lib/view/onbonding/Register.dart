import 'package:cenem/view/onbonding/register_form.dart';
import 'package:cenem/view/onbonding/sign_in_page_form.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final bool sign;

  const Register({super.key, required this.sign});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: widget.sign
            ? const RegisterForm()
            : const SignInPage(), 
      ),
    );
  }
}
