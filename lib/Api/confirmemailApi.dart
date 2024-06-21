import 'package:cenem/res/constants.dart';
import 'package:http/http.dart' as http;

Future<bool> confirmEmail(String code, String email) async {
  final url = Uri.parse(
      'http://$proxyurl/Account/confirm-email?code=$code&email=$email');
  final headers = {'Content-Type': 'application/json'};

  try {
    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      print('Request successful: ${response.body}');

      return true;
    } else {
      print('Request failed: ${response.statusCode}');
      print('Error response: ${response.body}');
      return false;
    }
  } catch (e) {
    print('Error: $e');
    return false;
  }
}
