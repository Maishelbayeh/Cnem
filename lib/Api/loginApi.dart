import 'dart:convert';
import 'dart:html';

import 'package:cenem/res/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
Future<String> loginUser(String email, String password, bool rememberMe) async {
  final String proxyUrl = 'http://${proxyurl}/Account/login';

  final Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  final Map<String, dynamic> body = {
    'email': email,
    'password': password,
    'rememberMe': rememberMe,
  };

  print(body);

  try {
    final http.Response response = await http.post(
      Uri.parse(proxyUrl),
      headers: headers,
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      print('Login successful!');
      return 'success';
    } else {
      print('Failed to login. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.body.contains('email does not exist')) {
        return 'email-not-exist';
      } else if (response.body.contains('incorrect password')) {
        return 'incorrect-password';
      } else {
        return 'login-failed';
      }
    }
  } catch (e) {
    print('Error during login: $e');
    showErrorDialog('Error during login: $e');
    return 'error';
  }
}


void showErrorDialog(String errorMessage) {
  window.alert(errorMessage);
}

// void main() async {
//   bool loginSuccess =
//       await loginUser("maishelbayeh@icloud.com", "123456mA!", true);
//   if (loginSuccess) {
//     print("Login was successful");
//   } else {
//     print("Login failed");
//   }
// }
