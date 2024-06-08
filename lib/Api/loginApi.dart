import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> listUsers() async {
  final String url = 'https://www.cnem.online/api/Administration/ListUsers';
  final Map<String, String> headers = {
    'Accept': 'application/json',
  };

  try {
    final http.Response response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    if (response.statusCode == 200) {
      // Successful request
      final List<dynamic> users = jsonDecode(response.body);
      print('List of users: $users');
    } else {
      // Failed request
      print('Failed to fetch users. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  } catch (e) {
    // Handle network errors or other exceptions
    print('Error fetching users: $e');
  }
}

void main() async {
  await listUsers();
}
