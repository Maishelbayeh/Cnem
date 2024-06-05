import 'dart:async';
import 'dart:convert';
import 'dart:io' as io;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

Future<String> listUsers() async {
  final String url = 'https://www.cnem.online/api/Administration/ListUsers';
  final Map<String, String> headers = {
    'accept': 'text/plain',
  };

  if (kIsWeb) {
    // For web, use default HTTP client without ignoring SSL errors
    try {
      final http.Response response = await http.get(
        Uri.parse(url),
        headers: headers,
      );

      if (response.statusCode == 200) {
        return 'Response body: ${response.body}';
      } else {
        return 'Failed to fetch users. Status code: ${response.statusCode}';
      }
    } catch (e) {
      return 'Error fetching users: $e';
    }
  } else {
    // For mobile, create an HttpClient that ignores SSL errors
    final io.HttpClient httpClient = io.HttpClient()
      ..badCertificateCallback =
          (io.X509Certificate cert, String host, int port) => true;

    // Create an IOClient using the above HttpClient
    final IOClient ioClient = IOClient(httpClient);

    try {
      final http.Response response = await ioClient.get(
        Uri.parse(url),
        headers: headers,
      );

      if (response.statusCode == 200) {
        return 'Response body: ${response.body}';
      } else {
        return 'Failed to fetch users. Status code: ${response.statusCode}';
      }
    } catch (e) {
      return 'Error fetching users: $e';
    } finally {
      ioClient.close(); // Make sure to close the client to free up resources
    }
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter HTTP Test with Completer'),
        ),
        body: Center(
          child: FetchUsersWidget(),
        ),
      ),
    );
  }
}

class FetchUsersWidget extends StatefulWidget {
  @override
  _FetchUsersWidgetState createState() => _FetchUsersWidgetState();
}

class _FetchUsersWidgetState extends State<FetchUsersWidget> {
  String _message = 'Press the button to fetch the users';

  Future<void> _fetchUsers() async {
    setState(() {
      _message = 'Fetching users...';
    });

    try {
      final String result = await listUsers();
      setState(() {
        _message = result;
      });
    } catch (e) {
      setState(() {
        _message = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(_message),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: _fetchUsers,
          child: Text('Fetch Users'),
        ),
      ],
    );
  }
}
