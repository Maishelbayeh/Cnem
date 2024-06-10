import 'dart:convert';
import 'dart:html';

import 'package:cenem/res/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<bool> loginUser(String email, String password, bool rememberMe) async {
  final String url = '${baseurl}/Account/login';

  final String proxyUrl = 'https://cors-anywhere.herokuapp.com/$url';

  // Headers for the HTTP request
  final Map<String, String> headers = {'Content-Type': 'application/json'};

  // Body of the HTTP request
  final Map<String, dynamic> body = {
    'email': email,
    'password': password,
    'rememberMe': rememberMe, // No need to convert boolean to string
  };

  print(body);

  try {
    // Sending the HTTP POST request
    final http.Response response = await http.post(
      Uri.parse(proxyUrl),
      headers: headers,
      body: jsonEncode(body),
    );

    // Handling the response
    if (response.statusCode == 200) {
      // Successful login
      print('Login successful!');
      return true;
    } else {
      // Failed login
      print('Failed to login. Status code: ${response.statusCode}');

      return false;
    }
  } catch (e) {
    // Handling network errors or other exceptions
    print('Error during login: $e');
    showErrorDialog('Error during login: $e');
    return false;
  }
}

void showErrorDialog(String errorMessage) {
  window.alert(errorMessage);
}

// void main() async {
//   // Ensure Flutter binding is initialized
//   WidgetsFlutterBinding.ensureInitialized();

//   // Load the configuration
//   config = await Config.loadFromAsset();

//   // Example usage: logging in
//   bool loginSuccess =
//       await loginUser("maishelbayeh@icloud.com", "123456mA!", true);
//   if (loginSuccess) {
//     print("Login was successful");
//   } else {
//     print("Login failed");
//   }
// }
