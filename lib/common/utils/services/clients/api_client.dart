import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {

  static Future<http.Response> get(
    String url, {
    Map<String, String>? headers,
  }) async {
    return http.get(
      Uri.parse(url),
      headers: headers ?? {},
    );
  }

  static Future<http.Response> post(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    return http.post(
      Uri.parse(url),
      headers: headers ?? {},
      body: json.encode(body),
    );
  }

  static Future<http.Response> put(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    return http.put(
      Uri.parse(url),
      headers: headers ?? {},
      body: json.encode(body),
    );
  }

  static Future<http.Response> delete(
    String url, {
    Map<String, String>? headers,
  }) async {
    return http.delete(
      Uri.parse(url),
      headers: headers ?? {},
    );
  }
}
