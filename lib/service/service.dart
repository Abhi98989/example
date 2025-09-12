import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../model/example1.dart';
import '../model/example2.dart';

class ApiService {
  static const String _baseUrl =
      "https://developer.expoexpressnp.com/v1/AssignedServiceType";
  static const String _apiKey = "e8d9fa85-1b77-4b98-92f0-2c097af03ed7";
  static const String url2 =
      "https://developer.expoexpressnp.com/v1/CoveredAreas/baglung";
  static const Map<String, String> _headers = {
    "Content-Type": "application/json",
  };
  static Future<Example1?> fetchServiceTypes() async {
    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: _headers,
        body: jsonEncode({"APIKEY": _apiKey}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return Example1.fromJson(data);
      } else {
        throw Exception("Failed to load data: ${response.statusCode}");
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  //example 2
  static Future<http.Response?> fetchCoveredAreas() async {
    try {
      final response = await http.get(Uri.parse(url2));
      log(response.body); 
      return response;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
