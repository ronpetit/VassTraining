import 'dart:convert';
import 'package:capacitacion_vass/models/json_placeholder.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class APIClient {
  static const baseUrl = "https://jsonplaceholder.typicode.com";
  final http.Client httpClient;

  APIClient({required this.httpClient});

  Future<JsonPlaceholder> getPlaceholder() async {
    final url = "$baseUrl/todos/1";
    final response = await this.httpClient.get(
          Uri.parse(url),
        );
    if (response.statusCode != 200) {
      throw Exception('Error getting json placeholder');
    }
    final responseJson = jsonDecode(response.body);
    return JsonPlaceholder.fromJson(responseJson);
  }
}
