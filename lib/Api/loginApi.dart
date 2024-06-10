import 'dart:convert';
import 'package:http/http.dart' as http;

Future<bool> loginUser(String email, String password, bool rememberMe) async {
  final String url =
      'http://154.38.171.253:8080/api/Account/login'; // Your proxy server login endpoint
  final Map<String, String> headers = {'Content-Type': 'application/json'};
  final Map<String, dynamic> body = {
    'email': email,
    'password': password,
    'rememberMe': rememberMe, // Convert rememberMe to string
  };
  print(body);

  try {
    final http.Response response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      // Successful login
      print('Login successful!');
      return true;
      // Navigate to next screen or perform desired action
    } else {
      // Failed login
      print('Failed to login. Status code: ${response.statusCode}');
      return false;
      // Handle error appropriately
    }
  } catch (e) {
    // Handle network errors or other exceptions
    print('Error during login: $e');
  }
  return false;
}

// void main() async {
//   // Example usage: logging in
//   await loginUser("maishelbayeh@icloud.com", "123456mA!", true);
// }
