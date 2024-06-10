import 'package:flutter/material.dart';

class SignUpTextField extends StatelessWidget {
  final IconData icon;
  final String labelText;
  final bool isPassword;
  final TextEditingController controller;

  const SignUpTextField({
    Key? key,
    required this.icon,
    required this.labelText,
    this.isPassword = false,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: TextFormField(
        controller: controller,
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        obscureText: isPassword,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(icon, size: 30),
          labelText: labelText,
          labelStyle: TextStyle(
            fontSize: 18,
            color: Colors.grey[400],
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
