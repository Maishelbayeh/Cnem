import 'dart:convert';
import 'package:flutter/services.dart';

class Config {
  final String apiBaseUrl;

  Config({required this.apiBaseUrl});

  factory Config.fromJson(Map<String, dynamic> json) {
    return Config(
      apiBaseUrl: json['apiBaseUrl'],
    );
  }

  static Future<Config> loadFromAsset() async {
    final jsonString = await rootBundle.loadString('assets/config.json');
    final jsonResponse = json.decode(jsonString);
    return Config.fromJson(jsonResponse);
  }
}
