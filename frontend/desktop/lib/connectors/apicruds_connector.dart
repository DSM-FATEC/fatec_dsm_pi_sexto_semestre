import 'package:desktop/mappings/map.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class ApiCrudsConnector<T> {
  static const String baseUrl =
      'https://guia-me-apicruds-ol5sqokdfa-ue.a.run.app/api';
  static Map<String, String> headers = {
    'Authorization': 'Basic ${base64.encode(utf8.encode('admin:admin'))}',
  };

  Future<List<T>> get(String uri, Mapping<T> mapping) async {
    final endpoint = Uri.parse('$baseUrl/$uri');
    final response = await http.get(endpoint, headers: headers);
    final list = List<Map<String, dynamic>>.from(json.decode(response.body));
    final entityTypes = list.map((e) => mapping.fromMap(e)).toList();

    return entityTypes;
  }
}
